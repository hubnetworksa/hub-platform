#!/usr/bin/env node
// Research step for the content upgrade. Zero Claude web-search/fetch calls:
// plain HTTP fetches only. Deep multi-pass: own pages, search (Bing, DuckDuckGo
// fallbacks), then up to 3 relevant result pages. Uses only the data in the
// chunk file (no phone numbers or addresses from the live site).
//   node scripts/content-upgrade/research.mjs <city> <chunk>
// Reads content-upgrade/<city>/chunk-NNN.json, writes
// content-upgrade/research/<city>/chunk-NNN.json (gitignored).
import fs from 'node:fs';
import path from 'node:path';

const [city, chunkArg] = process.argv.slice(2);
if (!city || !chunkArg) {
  console.error('usage: node scripts/content-upgrade/research.mjs <city> <chunk>');
  process.exit(1);
}
const NNN = String(parseInt(chunkArg, 10)).padStart(3, '0');
const root = process.cwd();
const inFile = path.join(root, 'content-upgrade', city, `chunk-${NNN}.json`);
const outFile = path.join(root, 'content-upgrade', 'research', city, `chunk-${NNN}.json`);
const chunk = JSON.parse(fs.readFileSync(inFile, 'utf8'));

const UA = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36';
const GBOT = 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)';
const CITY_LABEL = { pretoria: 'Pretoria', capetown: 'Cape Town', polokwane: 'Polokwane' };
const cityLabel = CITY_LABEL[city] || city;
const PAGE_CAP = 1500, MAX_BYTES = 300 * 1024, TIMEOUT = 10000, CONC = 8, MAX_PAGES = 4, OWN_ENOUGH = 600;
const HUB_HOSTS = /(^|\.)(pretoriahub|thecapetownhub|polokwanehub)\.com$/i;
const DIRECTORIES = /(snupit|procompare|yellowpages|cylex|brabys|hotfrog|africabizinfo|sayellow|infoisinfo|medpages|hellopeter|yep\.co|localsearch|findit|leaderr|showme)/i;
const FACEBOOK = /(^|\.)facebook\.com$/i;
const SKIP = /(openstreetmap|google\.|youtube|tiktok|pinterest|wikipedia|bing\.com|duckduckgo|microsoft\.com)/i;
const STOP = new Set(['the', 'and', 'pty', 'ltd', 'cc', 'of', 'in', 'at', 'a', 'an', 'for', 'to', 'inc', 'co', 'sa', 'za']);

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));
const jitter = (lo = 100, hi = 500) => sleep(lo + Math.random() * (hi - lo));

async function get(url, { ua = UA, lang = 'en-ZA,en;q=0.9', retry403 = true } = {}) {
  const ctrl = new AbortController();
  const t = setTimeout(() => ctrl.abort(), TIMEOUT);
  try {
    const res = await fetch(url, {
      redirect: 'follow', signal: ctrl.signal,
      headers: { 'User-Agent': ua, Accept: 'text/html,application/xhtml+xml', 'Accept-Language': lang },
    });
    if (!res.ok) {
      if (res.status === 403 && retry403 && ua !== GBOT) {
        clearTimeout(t);
        return await get(url, { ua: GBOT, lang: 'en-US,en;q=0.8', retry403: false });
      }
      const err = new Error(`HTTP ${res.status}`); err.status = res.status; throw err;
    }
    const ct = res.headers.get('content-type') || '';
    if (ct && !/html|xml|text/i.test(ct)) throw new Error(`content-type ${ct}`);
    const reader = res.body.getReader();
    const chunks = []; let n = 0;
    while (n < MAX_BYTES) {
      const { done, value } = await reader.read();
      if (done) break;
      chunks.push(value); n += value.length;
    }
    try { await reader.cancel(); } catch {}
    return { html: Buffer.concat(chunks).toString('utf8'), finalUrl: res.url || url };
  } catch (e) {
    if (e.status) throw e;
    throw new Error(e.name === 'AbortError' ? 'timeout' : (e.cause?.code || e.message));
  } finally { clearTimeout(t); }
}

const ENT = { amp: '&', lt: '<', gt: '>', quot: '"', apos: "'", nbsp: ' ', rsquo: "'", lsquo: "'", ndash: '-', mdash: '-', hellip: '...', bull: '-', middot: '-', copy: '(c)' };
const decode = (s) => s
  .replace(/&#(\d+);/g, (_, n) => { try { return String.fromCodePoint(+n); } catch { return ' '; } })
  .replace(/&#x([0-9a-f]+);/gi, (_, n) => { try { return String.fromCodePoint(parseInt(n, 16)); } catch { return ' '; } })
  .replace(/&([a-z]+);/gi, (m, n) => ENT[n.toLowerCase()] ?? m);
const strip = (h) => decode(h.replace(/<(script|style|noscript|svg|nav|footer|header|form|iframe)\b[\s\S]*?<\/\1>/gi, ' ')
  .replace(/<!--[\s\S]*?-->/g, ' ').replace(/<[^>]+>/g, ' ')).replace(/\s+/g, ' ').trim();
const meta = (html, re) => { const m = html.match(re); return m ? decode(m[1]).replace(/\s+/g, ' ').trim() : ''; };

function extract(html) {
  const title = meta(html, /<title[^>]*>([\s\S]*?)<\/title>/i);
  const tag = (attr, val) => new RegExp(`<meta[^>]+${attr}=["']${val}["'][^>]*content=["']([^"']*)["']|<meta[^>]+content=["']([^"']*)["'][^>]+${attr}=["']${val}["']`, 'i');
  const m1 = html.match(tag('name', 'description')), m2 = html.match(tag('property', 'og:description'));
  const d1 = m1 ? decode(m1[1] || m1[2] || '').trim() : '';
  const d2 = m2 ? decode(m2[1] || m2[2] || '').trim() : '';
  const description = [d1, d2 && d2 !== d1 ? d2 : ''].filter(Boolean).join(' | ').slice(0, 400);
  const body = (html.match(/<body[\s\S]*$/i) || [html])[0];
  let text = '';
  const blocks = body.match(/<(main|article|section)\b[\s\S]*?<\/\1>/gi) || [];
  const picked = blocks.map(strip).filter((t) => t.length > 60 && /\b(about|services?|we|our|welcome|specialis)/i.test(t));
  if (picked.length) text = [...new Set(picked)].join(' ');
  if (text.length < 200) text = strip(body);
  const bullets = [];
  for (const m of body.matchAll(/<li\b[^>]*>([\s\S]*?)<\/li>/gi)) {
    const t = strip(m[1]);
    if (t.length >= 4 && t.length <= 80 && !bullets.includes(t)) bullets.push(t);
    if (bullets.length >= 14) break;
  }
  return { title: title.slice(0, 200), description, text: text.slice(0, PAGE_CAP), bullets };
}

const host = (u) => { try { return new URL(u).hostname.replace(/^www\./, '').replace(/^m\./, ''); } catch { return ''; } };
const good = (u) => /^https?:/i.test(u || '') && host(u);
const tokens = (name) => [...new Set(String(name || '').toLowerCase().replace(/&/g, ' ').match(/[a-z0-9]+/g) || [])].filter((t) => t.length > 1 && !STOP.has(t));

// ---- Bing / DuckDuckGo ----------------------------------------------------
const stats = { bing: { req: 0, ok: 0 }, ddg: { req: 0, ok: 0 }, lite: { req: 0, ok: 0 }, blocks: 0 };
let blockedUntil = 0;
const BLOCK = /(captcha|unusual traffic|are you a robot|verify you are|solve the challenge|anomaly-modal|Please complete the)/i;

function parseBing(html) {
  const out = [];
  for (const li of html.match(/<li class="b_algo"[\s\S]*?<\/li>/gi) || []) {
    if (out.length >= 8) break;
    const a = li.match(/<h2[^>]*>\s*<a[^>]+href="([^"]+)"[^>]*>([\s\S]*?)<\/a>/i);
    if (!a) continue;
    const p = li.match(/<p[^>]*>([\s\S]*?)<\/p>/i);
    let u = decode(a[1]);
    const b = u.match(/[?&]u=a1([A-Za-z0-9_-]+)/);
    if (b) { try { u = Buffer.from(b[1], 'base64url').toString('utf8'); } catch {} }
    out.push({ title: strip(a[2]).slice(0, 160), url: u, snippet: strip(p ? p[1] : '').slice(0, 300) });
  }
  return out;
}
const ddgUrl = (raw) => {
  let u = decode(raw);
  const g = u.match(/[?&]uddg=([^&]+)/); if (g) u = decodeURIComponent(g[1]);
  return u.startsWith('//') ? 'https:' + u : u;
};
function parseDdg(html) {
  const out = [];
  const re = /<a[^>]+class="result__a"[^>]+href="([^"]+)"[^>]*>([\s\S]*?)<\/a>[\s\S]*?(?:class="result__snippet"[^>]*>([\s\S]*?)<\/a>)?/gi;
  let m;
  while ((m = re.exec(html)) && out.length < 8) out.push({ title: strip(m[2]).slice(0, 160), url: ddgUrl(m[1]), snippet: strip(m[3] || '').slice(0, 300) });
  return out;
}
function parseLite(html) {
  const out = [];
  const re = /<a[^>]+href=["']([^"']+)["'][^>]*class=["']result-link["'][^>]*>([\s\S]*?)<\/a>[\s\S]*?(?:class=["']result-snippet["'][^>]*>([\s\S]*?)<\/td>)?/gi;
  let m;
  while ((m = re.exec(html)) && out.length < 8) out.push({ title: strip(m[2]).slice(0, 160), url: ddgUrl(m[1]), snippet: strip(m[3] || '').slice(0, 300) });
  return out;
}
async function engine(name, url, parse, q) {
  const wait = blockedUntil - Date.now();
  if (wait > 0) await sleep(wait);
  stats[name].req++;
  let html;
  try { ({ html } = await get(url + encodeURIComponent(q), { retry403: false })); }
  catch (e) {
    if (e.status === 429 || e.status === 403) { blockedUntil = Math.max(blockedUntil, Date.now() + 20000); stats.blocks++; console.error(`  ${name} blocked (HTTP ${e.status}), backing off 20s`); }
    throw e;
  }
  const res = parse(html);
  if (!res.length && BLOCK.test(html)) {
    blockedUntil = Math.max(blockedUntil, Date.now() + 20000); stats.blocks++;
    console.error(`  ${name} captcha/block page, backing off 20s`);
    throw new Error('blocked');
  }
  if (res.length) stats[name].ok++;
  return res;
}
const ENGINES = [
  ['bing', 'https://www.bing.com/search?setlang=en&q=', parseBing],
  ['ddg', 'https://duckduckgo.com/html/?q=', parseDdg],
  ['lite', 'https://lite.duckduckgo.com/lite/?q=', parseLite],
];
async function search(q, errs) {
  await jitter(300, 800);
  for (const [name, url, parse] of ENGINES) {
    // skip a fallback engine once it has been probed enough and never parsed
    if (name !== 'bing' && stats[name].req >= 6 && stats[name].ok === 0) continue;
    try { const r = await engine(name, url, parse, q); if (r.length) return r; }
    catch (e) {
      errs.push(`${name}: ${e.message}`);
      if (e.message === 'blocked' || e.status === 429) {
        await sleep(Math.max(0, blockedUntil - Date.now()));
        try { const r = await engine(name, url, parse, q); if (r.length) return r; } catch {}
      }
    }
  }
  return [];
}

// ---- facts -----------------------------------------------------------------
function extractFacts(rec) {
  const facts = { years: [], phones: [], hours: [], services: [] };
  const blobs = [...rec.pages.map((p) => [p.title, p.description, p.text, ...(p.bullets || [])].join('. ')), ...rec.search.map((s) => `${s.title}. ${s.snippet}`)];
  const all = blobs.join('\n');
  for (const m of all.matchAll(/\b(?:since|established(?: in)?|est\.?|founded(?: in)?|in business since|trading since)\s*(?:in\s*)?(?:19|20)\d{2}\b|\b\d{1,2}\+?\s*years?\s*(?:of\s+)?(?:experience|in business|trading)/gi)) facts.years.push(m[0].trim());
  for (const m of all.matchAll(/(?:\+27|\b0)[\s-]?\d{2}[\s-]?\d{3}[\s-]?\d{4}\b/g)) facts.phones.push(m[0].trim());
  for (const sent of all.split(/(?<=[.!?])\s+|\n/)) {
    if (sent.length < 200 && /\b(open|opening hours|trading hours|mon(day)?\s*[-–to]+\s*(fri|sat|sun)|24\s*hours?)\b/i.test(sent)) facts.hours.push(sent.trim());
  }
  for (const p of rec.pages) for (const b of p.bullets || []) if (!/^(home|about|contact|menu|login|cart|search)/i.test(b)) facts.services.push(b);
  for (const k of Object.keys(facts)) facts[k] = [...new Set(facts[k])].slice(0, k === 'services' ? 12 : 4);
  return facts;
}

async function research(l) {
  const rec = { slug: l.slug, name: l.name, pages: [], search: [], facts: {}, confidence: 'none', note: '' };
  const errs = [];
  const tk = tokens(l.name);
  const need = Math.max(1, Math.ceil(tk.length * 0.6));
  // street from the chunk's own address, e.g. "171 Robert Sobukwe Street" -> "robert sobukwe"
  const street = String(l.address || '').split(',')[0].replace(/^.*?\b\d+[a-z]?\s+/i, '').replace(/\b(street|st|road|rd|avenue|ave|drive|dr)\b\.?/gi, '').trim().toLowerCase();
  const matches = (text) => {
    const t = ' ' + text.toLowerCase() + ' ';
    if (tk.filter((w) => t.includes(w)).length >= need) return true;
    if (street.length >= 5 && t.includes(street)) return true;
    return false;
  };
  const relevant = (r) => matches(`${r.title} ${r.snippet} ${r.url}`);

  const siteUrl = good(l.website) ? l.website : null;
  const ownHosts = new Set();
  if (siteUrl) ownHosts.add(host(siteUrl));
  const tried = new Set();
  const tryPage = async (u, opts = {}) => {
    const key = u.split('#')[0];
    if (tried.has(key) || rec.pages.length >= MAX_PAGES) return null;
    tried.add(key);
    await jitter();
    try {
      const { html, finalUrl } = await get(key, opts);
      const p = { url: finalUrl.split('#')[0], ...extract(html) };
      if (!(p.text || p.description || p.title)) return null;
      rec.pages.push(p); return p;
    } catch (e) { errs.push(`${host(u)}: ${e.message}`); return null; }
  };
  const ownText = () => rec.pages.filter((p) => ownHosts.has(host(p.url))).reduce((n, p) => n + p.text.length + p.description.length, 0);

  // Pass 1: own pages (max 3)
  if (siteUrl) {
    const base = new URL(siteUrl).origin;
    for (const u of [siteUrl, base + '/about', base + '/about-us', base + '/services', base + '/contact']) {
      if (ownText() >= OWN_ENOUGH || rec.pages.length >= 3) break;
      await tryPage(u);
    }
  }
  for (const u of l.existing_sources || []) {
    if (!good(u) || /openstreetmap\.org/i.test(u) || HUB_HOSTS.test(host(u)) || rec.pages.length >= 3) continue;
    ownHosts.add(host(u));
    if (ownText() >= OWN_ENOUGH) break;
    await tryPage(u);
  }

  // Pass 2: search, then Pass 3: open up to 3 relevant results
  const enough = () => rec.search.filter(relevant).length >= 2;
  if (ownText() < OWN_ENOUGH) {
    const kw = (l.category || '').split(/[&,/]/)[0].trim();
    const queries = [
      `"${l.name}" ${l.suburb || ''}`, `"${l.name}" ${cityLabel}`, kw && `"${l.name}" ${kw}`,
      `"${l.name}" facebook`, street && `${l.name} ${street}`,
    ].filter(Boolean).map((q) => q.replace(/\s+/g, ' ').trim());
    const seen = new Set();
    for (const q of queries) {
      if (enough()) break;
      const res = await search(q, errs);
      for (const r of res) if (good(r.url) && !seen.has(r.url) && !HUB_HOSTS.test(host(r.url))) { seen.add(r.url); rec.search.push(r); }
    }
    rec.search = rec.search.slice(0, 12);

    const rank = (r) => ownHosts.has(host(r.url)) ? 0 : FACEBOOK.test(host(r.url)) ? 1 : DIRECTORIES.test(host(r.url)) ? 2 : 3;
    const cands = rec.search.filter((r) => relevant(r) && !SKIP.test(r.url)).sort((a, b) => rank(a) - rank(b));
    let opened = 0;
    for (const r of cands) {
      if (opened >= 3 || rec.pages.length >= MAX_PAGES) break;
      let u = r.url;
      const fb = FACEBOOK.test(host(u));
      if (fb) { try { const x = new URL(u); x.hostname = 'm.facebook.com'; u = x.href; } catch {} }
      opened++;
      const p = await tryPage(u, fb ? { retry403: false } : {});
      if (p) p.via = fb ? 'facebook' : DIRECTORIES.test(host(u)) ? 'directory' : 'search';
    }
  }

  // Confidence: strong = own site / owner-written directory or facebook text
  const strongPage = rec.pages.some((p) => {
    const len = p.text.length + p.description.length;
    const own = ownHosts.has(host(p.url));
    const dir = DIRECTORIES.test(host(p.url)) || FACEBOOK.test(host(p.url));
    return len >= 150 && (own || (dir && matches(`${p.title} ${p.description} ${p.text}`)));
  });
  rec.confidence = strongPage ? 'strong'
    : (rec.search.some(relevant) || rec.pages.some((p) => matches(`${p.title} ${p.description} ${p.text}`))) ? 'medium' : 'none';
  rec.facts = extractFacts(rec);
  rec.search.sort((a, b) => Number(relevant(b)) - Number(relevant(a)));
  rec.search = rec.search.slice(0, 8);
  if (!rec.pages.length && !rec.search.length) rec.note = 'nothing found: ' + (errs.join('; ') || 'no sources or results');
  else if (errs.length) rec.note = 'partial: ' + errs.join('; ').slice(0, 300);
  let budget = 6000;
  for (const p of rec.pages) { p.text = p.text.slice(0, Math.max(0, budget)); budget -= p.text.length; }
  return rec;
}

const t0 = Date.now();
const listings = chunk.listings;
const results = new Array(listings.length);
let next = 0, done = 0;
async function worker() {
  while (next < listings.length) {
    const i = next++;
    try { results[i] = await research(listings[i]); }
    catch (e) { results[i] = { slug: listings[i].slug, name: listings[i].name, pages: [], search: [], facts: {}, confidence: 'none', note: 'research failed: ' + e.message }; }
    if (++done % 10 === 0) console.error(`  ${done}/${listings.length}`);
  }
}
await Promise.all(Array.from({ length: CONC }, worker));

fs.mkdirSync(path.dirname(outFile), { recursive: true });
fs.writeFileSync(outFile, JSON.stringify({ city, chunk: chunk.chunk ?? parseInt(NNN, 10), generated_at: new Date().toISOString(), listings: results }, null, 1));
const count = (c) => results.filter((r) => r.confidence === c).length;
console.log(`${city} chunk ${NNN}: ${results.length} listings | strong: ${count('strong')} | medium: ${count('medium')} | none: ${count('none')}`);
const none = results.filter((r) => r.confidence === 'none').map((r) => r.slug);
if (none.length) console.log('none (review these): ' + none.join(', '));
console.log(`engines (requests/parsed): bing ${stats.bing.req}/${stats.bing.ok}, ddg-html ${stats.ddg.req}/${stats.ddg.ok}, ddg-lite ${stats.lite.req}/${stats.lite.ok}; blocks/backoffs: ${stats.blocks}`);
console.log(`wrote ${path.relative(root, outFile)} (${(fs.statSync(outFile).size / 1024).toFixed(0)} KB) in ${((Date.now() - t0) / 1000).toFixed(0)}s`);
