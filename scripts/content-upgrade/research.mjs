#!/usr/bin/env node
// Research step for the content upgrade. Zero Claude web-search/fetch calls:
// plain HTTP fetches only.
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
const CITY_LABEL = { pretoria: 'Pretoria', capetown: 'Cape Town', polokwane: 'Polokwane' };
const cityLabel = CITY_LABEL[city] || city;
const PAGE_CAP = 1500, MAX_BYTES = 300 * 1024, TIMEOUT = 10000, CONC = 8;
const HUB_HOSTS = /(^|\.)(pretoriahub|thecapetownhub|polokwanehub)\.com$/i;
const AGGREGATORS = /(yellowpages|cylex|brabys|yep\.co|hotfrog|localsearch|findit|medpages|procompare|leaderr|showme|infoisinfo)/i;
const WALLS = /(facebook|instagram|linkedin|twitter|x)\.com$/i;

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));
const jitter = () => sleep(100 + Math.random() * 400);

async function get(url) {
  const ctrl = new AbortController();
  const t = setTimeout(() => ctrl.abort(), TIMEOUT);
  try {
    const res = await fetch(url, {
      redirect: 'follow', signal: ctrl.signal,
      headers: { 'User-Agent': UA, Accept: 'text/html,application/xhtml+xml', 'Accept-Language': 'en-ZA,en;q=0.9' },
    });
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
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
  return { title: title.slice(0, 200), description, text: text.slice(0, PAGE_CAP) };
}

async function fetchPage(url) {
  const { html, finalUrl } = await get(url);
  return { url: finalUrl.split('#')[0], ...extract(html) };
}

const host = (u) => { try { return new URL(u).hostname.replace(/^www\./, ''); } catch { return ''; } };
const good = (u) => /^https?:/i.test(u || '') && host(u);

async function ddg(q) {
  const { html } = await get('https://html.duckduckgo.com/html/?q=' + encodeURIComponent(q));
  const out = [];
  const re = /<a[^>]+class="result__a"[^>]+href="([^"]+)"[^>]*>([\s\S]*?)<\/a>[\s\S]*?(?:class="result__snippet"[^>]*>([\s\S]*?)<\/a>)?/gi;
  let m;
  while ((m = re.exec(html)) && out.length < 6) {
    let u = decode(m[1]);
    const g = u.match(/[?&]uddg=([^&]+)/); if (g) u = decodeURIComponent(g[1]);
    if (u.startsWith('//')) u = 'https:' + u;
    out.push({ title: strip(m[2]).slice(0, 160), url: u, snippet: strip(m[3] || '').slice(0, 300) });
  }
  return out;
}
async function bing(q) {
  const { html } = await get('https://www.bing.com/search?q=' + encodeURIComponent(q) + '&setlang=en');
  const out = [];
  for (const li of html.match(/<li class="b_algo"[\s\S]*?<\/li>/gi) || []) {
    if (out.length >= 6) break;
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

async function research(l) {
  const rec = { slug: l.slug, name: l.name, pages: [], search: [], note: '' };
  const errs = [];
  const urls = [];
  for (const u of [l.website, ...(l.existing_sources || [])]) {
    if (good(u) && !/openstreetmap\.org/i.test(u) && !urls.includes(u.split('#')[0])) urls.push(u.split('#')[0]);
  }
  const tryPage = async (u) => {
    await jitter();
    try { const p = await fetchPage(u); rec.pages.push(p); return p; }
    catch (e) { errs.push(`${host(u)}: ${e.message}`); return null; }
  };
  for (const u of urls) await tryPage(u);

  // thin home page -> try about/services pages (max 2)
  const site = good(l.website) ? l.website : null;
  const homeText = rec.pages.find((p) => site && host(p.url) === host(site))?.text.length ?? 0;
  if (site && homeText < 300) {
    const base = new URL(site).origin;
    let extra = 0;
    for (const p of ['/about', '/about-us', '/services']) {
      if (extra >= 2) break;
      extra++;
      const pg = await tryPage(base + p);
      if (pg && pg.text.length >= 300) break;
    }
  }

  const haveText = () => rec.pages.some((p) => p.text.length > 100 || p.description.length > 60);
  if (!haveText() || !urls.length) {
    const q = `"${l.name}" ${l.suburb || ''} ${cityLabel}`.replace(/\s+/g, ' ');
    let res = [];
    try { await jitter(); res = await ddg(q); } catch (e) { errs.push('ddg: ' + e.message); }
    if (!res.length) { try { await jitter(); res = await bing(q); } catch (e) { errs.push('bing: ' + e.message); } }
    rec.search = res;
    if (!haveText()) {
      const ok = res.filter((r) => good(r.url) && !HUB_HOSTS.test(host(r.url)));
      const best = ok.find((r) => !AGGREGATORS.test(host(r.url)) && !WALLS.test(host(r.url)))
        || ok.find((r) => !AGGREGATORS.test(host(r.url))) || ok[0];
      if (best && !urls.includes(best.url)) await tryPage(best.url);
    }
  }
  rec.pages = rec.pages.filter((p) => p.text || p.description || p.title);
  if (!rec.pages.length && !rec.search.length) rec.note = 'fetch failed: ' + (errs.join('; ') || 'no sources or results');
  else if (errs.length) rec.note = 'partial: ' + errs.join('; ');
  // total text budget per listing (~6 KB)
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
    catch (e) { results[i] = { slug: listings[i].slug, name: listings[i].name, pages: [], search: [], note: 'fetch failed: ' + e.message }; }
    if (++done % 10 === 0) console.error(`  ${done}/${listings.length}`);
  }
}
await Promise.all(Array.from({ length: CONC }, worker));

fs.mkdirSync(path.dirname(outFile), { recursive: true });
fs.writeFileSync(outFile, JSON.stringify({ city, chunk: chunk.chunk ?? parseInt(NNN, 10), generated_at: new Date().toISOString(), listings: results }, null, 1));
const withText = results.filter((r) => r.pages.some((p) => p.text.length > 100)).length;
const snippetsOnly = results.filter((r) => !r.pages.some((p) => p.text.length > 100) && r.search.length).length;
const nothing = results.length - withText - snippetsOnly;
console.log(`${city} chunk ${NNN}: ${results.length} listings | page text: ${withText} | snippets only: ${snippetsOnly} | nothing: ${nothing}`);
console.log(`wrote ${path.relative(root, outFile)} (${(fs.statSync(outFile).size / 1024).toFixed(0)} KB) in ${((Date.now() - t0) / 1000).toFixed(0)}s`);
