#!/usr/bin/env node
// Research step for the content upgrade. Zero Claude web-search/fetch calls:
// plain HTTP fetches only. Deep multi-pass: own pages, search (Brave primary, Bing, DuckDuckGo
// fallbacks), then relevant result pages (Facebook pages always opened). Uses only the data in the
// chunk file (no phone numbers or addresses from the live site).
//   node scripts/content-upgrade/research.mjs <city> <chunk>
// Reads content-upgrade/<city>/chunk-NNN.json, writes
// content-upgrade/research/<city>/chunk-NNN.json (gitignored).
import fs from 'node:fs';
import path from 'node:path';
import { startCrawler, crawlerGet, stopCrawler } from './crawler-client.mjs';

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
const PAGE_CAP = 1500, MAX_BYTES = 300 * 1024, TIMEOUT = 10000, CONC = 8, MAX_PAGES = 7, OWN_ENOUGH = 600;
const HUB_HOSTS = /(^|\.)(pretoriahub|thecapetownhub|polokwanehub)\.com$/i;
const DIRECTORIES = /(snupit|procompare|yellowpages|cylex|brabys|hotfrog|africabizinfo|sayellow|infoisinfo|medpages|hellopeter|yep\.co|localsearch|findit|leaderr|showme)/i;
const FACEBOOK = /(^|\.)facebook\.com$/i;
const SKIP = /(openstreetmap|google\.|youtube|tiktok|pinterest|wikipedia|bing\.com|duckduckgo|microsoft\.com)/i;
const STOP = new Set(['the', 'and', 'pty', 'ltd', 'cc', 'of', 'in', 'at', 'a', 'an', 'for', 'to', 'inc', 'co', 'sa', 'za']);

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));
const jitter = (lo = 100, hi = 500) => sleep(lo + Math.random() * (hi - lo));

// Fetches via scripts/content-upgrade/crawler.py (a persistent headless-
// Chromium process, driven by Crawl4AI). A real rendered browser gets past
// the blocking that plain HTTP requests hit (Brave HTTP 429 under
// concurrency, Facebook HTTP 400 without a full browser fingerprint).
async function get(url, { ua = UA, retry403 = true } = {}) {
  const uaTag = ua === GBOT ? 'googlebot' : 'chrome';
  try {
    return await crawlerGet(url, { ua: uaTag, timeoutMs: TIMEOUT + 15000 });
  } catch (e) {
    if (e.status === 403 && retry403 && uaTag !== 'googlebot') {
      return await crawlerGet(url, { ua: 'googlebot', timeoutMs: TIMEOUT + 15000 }).catch(() => { throw e; });
    }
    throw e;
  }
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
const stats = { fb: { req: 0, ok: 0 }, brave: { req: 0, ok: 0 }, bing: { req: 0, ok: 0 }, ddg: { req: 0, ok: 0 }, lite: { req: 0, ok: 0 }, blocks: 0 };
let blockedUntil = 0;
const BLOCK = /(captcha|unusual traffic|are you a robot|verify you are|solve the challenge|anomaly-modal|Please complete the)/i;

function parseBrave(html) {
  const out = [];
  const parts = html.split(/<div class="snippet[^"]*"[^>]*data-type="web"[^>]*>/i).slice(1);
  for (const part of parts) {
    if (out.length >= 10) break;
    const a = part.match(/<a href="(https?:[^"]+)"[^>]*>/i);
    if (!a) continue;
    const t = part.match(/<div class="title[^"]*"[^>]*>([\s\S]*?)<\/div>/i);
    const d = part.match(/<div class="(?:generic-snippet|snippet-description)[^"]*"[\s\S]*?<div class="content[^"]*"[^>]*>([\s\S]*?)<\/div>/i)
      || part.match(/<div class="content[^"]*"[^>]*>([\s\S]*?)<\/div>/i);
    out.push({ title: strip(t ? t[1] : '').slice(0, 160), url: decode(a[1]), snippet: strip(d ? d[1] : '').slice(0, 300) });
  }
  return out;
}
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
let braveNext = 0, braveBlockedUntil = 0, braveFails = 0, braveDead = false;
// Confirmed (2026-10-04): this is a sustained IP-level block, not per-request
// pacing — still HTTP 429 on a single fresh request after 90s+ idle, through
// a real rendered browser. So give up after ONE fail per run instead of
// rediscovering a 4-in-a-row wall every chunk (that cost ~2min/chunk wasted
// across up to 190 chunks). Still probed once per run in case it lifts later.
const BRAVE_FAIL_LIMIT = 1;
async function engine(name, url, parse, q) {
  const brave = name === 'brave';
  const bo = brave ? 30000 : 20000;
  if (brave) {
    // serialise Brave requests globally with 500-1200 ms jitter between them
    const at = Math.max(Date.now(), braveNext, braveBlockedUntil);
    braveNext = at + 500 + Math.random() * 700;
    await sleep(at - Date.now());
  } else {
    const wait = blockedUntil - Date.now();
    if (wait > 0) await sleep(wait);
    await jitter(150, 400);
  }
  stats[name].req++;
  let html;
  try { ({ html } = await get(url + encodeURIComponent(q), brave ? { retry403: false, lang: 'en-ZA,en;q=0.9' } : { retry403: false })); }
  catch (e) {
    if (e.status === 429 || e.status === 403) {
      stats.blocks++;
      if (brave) {
        braveBlockedUntil = Date.now() + bo;
        braveFails++;
        if (braveFails >= BRAVE_FAIL_LIMIT && !braveDead) {
          braveDead = true;
          console.error(`  brave blocked ${braveFails}x in a row (HTTP ${e.status}); treating as a hard WAF wall and disabling brave for the rest of this run`);
        } else {
          console.error(`  brave blocked (HTTP ${e.status}), backing off ${bo / 1000}s`);
        }
      } else {
        blockedUntil = Math.max(blockedUntil, Date.now() + bo);
        console.error(`  ${name} blocked (HTTP ${e.status}), backing off ${bo / 1000}s`);
      }
    }
    throw e;
  }
  const res = parse(html);
  if (!res.length && BLOCK.test(html)) {
    stats.blocks++;
    if (brave) {
      braveBlockedUntil = Date.now() + bo; braveFails++;
      if (braveFails >= BRAVE_FAIL_LIMIT && !braveDead) { braveDead = true; console.error(`  brave captcha/block ${braveFails}x in a row; disabling brave for the rest of this run`); }
      else console.error(`  brave captcha/block page, backing off ${bo / 1000}s`);
    } else {
      blockedUntil = Math.max(blockedUntil, Date.now() + bo);
      console.error(`  ${name} captcha/block page, backing off ${bo / 1000}s`);
    }
    throw new Error('blocked');
  }
  if (res.length) { stats[name].ok++; if (brave) braveFails = 0; }
  return res;
}
const ENGINES = [
  ['brave', 'https://search.brave.com/search?q=', parseBrave],
  ['bing', 'https://www.bing.com/search?setlang=en&q=', parseBing],
  ['ddg', 'https://duckduckgo.com/html/?q=', parseDdg],
  ['lite', 'https://lite.duckduckgo.com/lite/?q=', parseLite],
];
// q is { base, bing }: `base` is the unquoted query (used by Brave/DDG, per the task's
// query plan); `bing` quotes the business name, since Bing HTML ignores exact-phrase
// quotes for junk results on some names but does measurably better WITH quotes than
// fully unquoted free text on most small-business names (verified: quoted gave 134/135
// parsed vs 124/180 unquoted on the same chunk).
async function search(q, errs) {
  for (const [name, url, parse] of ENGINES) {
    if (name === 'brave' && braveDead) continue; // hard WAF wall hit earlier; stop wasting 30s backoffs on it
    // skip a fallback engine once it has been probed enough and never parsed
    if (name !== 'brave' && name !== 'bing' && stats[name].req >= 6 && stats[name].ok === 0) continue;
    const qstr = name === 'bing' ? q.bing : q.base;
    try { const r = await engine(name, url, parse, qstr); if (r.length) return r; }
    catch (e) {
      errs.push(`${name}: ${e.message}`);
      if (!(name === 'brave' && braveDead) && (e.message === 'blocked' || e.status === 429)) {
        const until = name === 'brave' ? braveBlockedUntil : blockedUntil;
        await sleep(Math.max(0, until - Date.now()));
        if (!(name === 'brave' && braveDead)) { try { const r = await engine(name, url, parse, qstr); if (r.length) return r; } catch {} }
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

const WEAK = /(mall|shopping-?centre|centre\.co\.za|plaza|store-?(directory|locator|finder)|\/stores?\/|opening-?(hours|times)|trading-?hours|storehours|openinghours|head-?office|corporate|investor)/i;
const WEAK_TEXT = /(store directory|shop directory|store locator|opening hours for|trading hours for|head office|corporate office|all stores|find a store|\bmall\b)/i;
const fbRoot = (u) => {
  try {
    const x = new URL(u); const seg = x.pathname.split('/').filter(Boolean);
    if (!seg.length || /^(groups|marketplace|watch|sharer|share|events|photo|photos|reel|hashtag|login|public|policies|help|story\.php)$/i.test(seg[0])) return null;
    if (/^(pages|p)$/i.test(seg[0])) return 'https://www.facebook.com/' + seg.slice(0, seg[0] === 'pages' ? 3 : 2).join('/') + '/';
    if (seg[0] === 'profile.php') return 'https://www.facebook.com/profile.php' + x.search;
    return 'https://www.facebook.com/' + seg[0] + '/';
  } catch { return null; }
};
function extractFb(html) {
  const mt = (prop) => meta(html, new RegExp(`<meta[^>]+(?:property|name)=["']${prop}["'][^>]*content=["']([^"']*)["']`, 'i')) ||
    meta(html, new RegExp(`<meta[^>]+content=["']([^"']*)["'][^>]+(?:property|name)=["']${prop}["']`, 'i'));
  const ogTitle = mt('og:title'), ogDesc = mt('og:description'), mDesc = mt('description');
  const bits = [ogDesc, mDesc && mDesc !== ogDesc ? mDesc : ''].filter(Boolean);
  for (const m of html.matchAll(/<script[^>]+application\/ld\+json[^>]*>([\s\S]*?)<\/script>/gi)) {
    try { const j = JSON.parse(m[1]); const d = j.description || j.about; if (typeof d === 'string') bits.push(d); } catch {}
  }
  for (const m of html.matchAll(/"(?:intro_text|about_text)":\{?"?(?:text":)?"([^"]{40,500})"/g)) {
    try { bits.push(JSON.parse('"' + m[1] + '"')); } catch {}
    if (bits.length > 5) break;
  }
  const fol = (ogDesc + ' ' + mDesc).match(/(\d[\d.,]*\s?[KkMm]?)\s+(?:followers|likes)/i);
  const text = [...new Set(bits.map((b) => b.replace(/\s+/g, ' ').trim()).filter(Boolean))].join(' | ');
  return { title: ogTitle.slice(0, 200), description: (ogDesc || mDesc).replace(/\s+/g, ' ').slice(0, 400), text: text.slice(0, PAGE_CAP), bullets: [], followers: fol ? fol[1].trim() : undefined };
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
  const fbOpened = new Set();
  const openFacebook = async (root) => {
    for (const u of [root, root.replace(/\/$/, '') + '/about']) {
      await jitter();
      try {
        stats.fb.req++;
        const { html, finalUrl } = await get(u, { retry403: false });
        const x = extractFb(html);
        if (!(x.description || x.title)) continue;
        stats.fb.ok++;
        rec.pages.push({ url: finalUrl.split('#')[0], ...x, via: 'facebook' });
        if (x.description.length >= 60 && matches(`${x.title} ${x.description}`)) return;
      } catch (e) { errs.push(`facebook: ${e.message}`); return; }
    }
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

  // Pass 2: search (Brave primary, Bing fallback), then Pass 3: open relevant results
  const isFb = (r) => FACEBOOK.test(host(r.url));
  const enough = () => rec.search.filter(relevant).length >= 2 || rec.search.some((r) => relevant(r) && (isFb(r) || ownHosts.has(host(r.url))));
  if (ownText() < OWN_ENOUGH) {
    const kw = (l.category || '').split(/[&,/]/)[0].trim();
    const norm = (s) => s.replace(/\s+/g, ' ').trim();
    const mkq = (rest) => ({ base: norm(`${l.name} ${rest}`), bing: norm(`"${l.name}" ${rest}`) });
    const queries = [
      mkq(l.suburb || ''), mkq(cityLabel), { base: `"${l.name}" facebook`, bing: `"${l.name}" facebook` },
      { base: norm(`site:facebook.com ${l.name} ${cityLabel}`), bing: norm(`site:facebook.com "${l.name}" ${cityLabel}`) },
      kw && mkq(`${kw} ${cityLabel}`), street && mkq(street),
    ].filter(Boolean);
    const seen = new Set();
    for (const q of queries) {
      if (enough()) break;
      const res = await search(q, errs);
      for (const r of res) if (good(r.url) && !seen.has(r.url) && !HUB_HOSTS.test(host(r.url))) { seen.add(r.url); rec.search.push(r); }
    }
    rec.search = rec.search.slice(0, 16);

    const rank = (r) => ownHosts.has(host(r.url)) ? 0 : isFb(r) ? 1 : DIRECTORIES.test(host(r.url)) ? 2 : 3;
    const cands = rec.search.filter((r) => relevant(r) && !SKIP.test(r.url)).sort((a, b) => rank(a) - rank(b));
    let openedOther = 0, openedFb = 0;
    for (const r of cands) {
      if (isFb(r)) {
        if (openedFb >= 2) continue;
        const root = fbRoot(r.url);
        if (!root || fbOpened.has(root)) continue;
        fbOpened.add(root); openedFb++;
        await openFacebook(root);
      } else {
        if (openedOther >= 2 || rec.pages.length >= MAX_PAGES) continue;
        openedOther++;
        const p = await tryPage(r.url);
        if (p) p.via = DIRECTORIES.test(host(r.url)) ? 'directory' : 'search';
      }
    }
  }

  // Confidence. strong = at least one page that names the business AND has >=150 chars of
  // real content (beyond name/address/phone) and is not a weak source (mall store directory,
  // hours aggregator, chain head office). Weak pages are recorded but only give medium.
  const esc = (x) => x.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  const nameRe = new RegExp(tk.map(esc).join('|'), 'gi');
  for (const p of rec.pages) {
    const own = ownHosts.has(host(p.url));
    const blob = `${p.title} ${p.description} ${p.text}`;
    const hay = ' ' + (blob + (own ? ' ' + host(p.url) : '')).toLowerCase() + ' ';
    const named = tk.filter((w) => hay.includes(w)).length >= need;
    let rest = blob.replace(nameRe, ' ');
    if (l.address) for (const part of String(l.address).split(',')) if (part.trim().length > 3) rest = rest.split(new RegExp(esc(part.trim()), 'i')).join(' ');
    rest = rest.replace(/(?:\+27|\b0)[\s-]?\d{2}[\s-]?\d{3}[\s-]?\d{4}\b/g, ' ').replace(/\s+/g, ' ').trim();
    p.named = named; p.content_chars = rest.length;
    p.weak = WEAK.test(p.url) || WEAK_TEXT.test(`${p.title} ${p.description}`);
    if (p.weak) p.weak = true; else delete p.weak;
    p.strong = named && !p.weak && (p.via === 'facebook' ? rest.length >= 60 : rest.length >= 150);
  }
  rec.confidence = rec.pages.some((p) => p.strong) ? 'strong'
    : (rec.search.some(relevant) || rec.pages.some((p) => p.named || p.weak)) ? 'medium' : 'none';
  rec.facts = extractFacts(rec);
  rec.search.sort((a, b) => Number(relevant(b)) - Number(relevant(a)));
  rec.search = rec.search.slice(0, 8);
  if (!rec.pages.length && !rec.search.length) rec.note = 'nothing found: ' + (errs.join('; ') || 'no sources or results');
  else if (errs.length) rec.note = 'partial: ' + errs.join('; ').slice(0, 300);
  let budget = 6000;
  for (const p of rec.pages) { p.text = p.text.slice(0, Math.max(0, budget)); budget -= p.text.length; }
  return rec;
}

await startCrawler();
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
stopCrawler();

fs.mkdirSync(path.dirname(outFile), { recursive: true });
fs.writeFileSync(outFile, JSON.stringify({ city, chunk: chunk.chunk ?? parseInt(NNN, 10), generated_at: new Date().toISOString(), listings: results }, null, 1));
const count = (c) => results.filter((r) => r.confidence === c).length;
console.log(`${city} chunk ${NNN}: ${results.length} listings | strong: ${count('strong')} | medium: ${count('medium')} | none: ${count('none')}`);
const none = results.filter((r) => r.confidence === 'none').map((r) => r.slug);
if (none.length) console.log('none (review these): ' + none.join(', '));
console.log(`facebook pages read: ${results.filter((r) => r.pages.some((p) => p.via === 'facebook')).length} (requests ${stats.fb.req}, parsed ${stats.fb.ok}); brave ${stats.brave.req}/${stats.brave.ok}`);
console.log(`engines (requests/parsed): bing ${stats.bing.req}/${stats.bing.ok}, ddg-html ${stats.ddg.req}/${stats.ddg.ok}, ddg-lite ${stats.lite.req}/${stats.lite.ok}; blocks/backoffs: ${stats.blocks}`);
console.log(`wrote ${path.relative(root, outFile)} (${(fs.statSync(outFile).size / 1024).toFixed(0)} KB) in ${((Date.now() - t0) / 1000).toFixed(0)}s`);
