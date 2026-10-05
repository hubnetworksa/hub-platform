#!/usr/bin/env node
// Pilot: find candidate NEW businesses for thin category/suburb pages.
// Zero Claude web-search/fetch calls — reuses the same crawler.py (Crawl4AI)
// transport as research.mjs, so it stays off the 200-call Claude budget.
//   node scripts/content-upgrade/discover-businesses.mjs <combos.json> <out.json>
// combos.json: [{ category, catLabel, suburb, subLabel, cityLabel, need, existingNames }]
import fs from 'node:fs';
import { startCrawler, crawlerGet, stopCrawler } from './crawler-client.mjs';

const [combosFile, outFile] = process.argv.slice(2);
if (!combosFile || !outFile) {
  console.error('usage: node scripts/content-upgrade/discover-businesses.mjs <combos.json> <out.json>');
  process.exit(1);
}
const combos = JSON.parse(fs.readFileSync(combosFile, 'utf8'));

const UA = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36';
const HUB_HOSTS = /(^|\.)(pretoriahub|thecapetownhub|polokwanehub)\.com$/i;
const DIRECTORIES = /(snupit|procompare|yellowpages|cylex|brabys|hotfrog|africabizinfo|sayellow|infoisinfo|medpages|yep\.co|localsearch|findit|leaderr|showme)/i;
const FACEBOOK = /(^|\.)facebook\.com$/i;
const SKIP = /(openstreetmap|google\.|youtube|tiktok|pinterest|wikipedia|bing\.com|duckduckgo|microsoft\.com|instagram\.com)/i;

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));
const jitter = (lo = 150, hi = 450) => sleep(lo + Math.random() * (hi - lo));

async function get(url, { ua = UA } = {}) {
  return crawlerGet(url, { ua: 'chrome', timeoutMs: 25000 });
}

const ENT = { amp: '&', lt: '<', gt: '>', quot: '"', apos: "'", nbsp: ' ', rsquo: "'", lsquo: "'", ndash: '-', mdash: '-', hellip: '...', bull: '-', middot: '-' };
const decode = (s) => s
  .replace(/&#(\d+);/g, (_, n) => { try { return String.fromCodePoint(+n); } catch { return ' '; } })
  .replace(/&#x([0-9a-f]+);/gi, (_, n) => { try { return String.fromCodePoint(parseInt(n, 16)); } catch { return ' '; } })
  .replace(/&([a-z]+);/gi, (m, n) => ENT[n.toLowerCase()] ?? m);
const strip = (h) => decode(h.replace(/<(script|style|noscript|svg|nav|footer|header|form|iframe)\b[\s\S]*?<\/\1>/gi, ' ')
  .replace(/<!--[\s\S]*?-->/g, ' ').replace(/<[^>]+>/g, ' ')).replace(/\s+/g, ' ').trim();
const meta = (html, re) => { const m = html.match(re); return m ? decode(m[1]).replace(/\s+/g, ' ').trim() : ''; };
const host = (u) => { try { return new URL(u).hostname.replace(/^www\./, '').replace(/^m\./, ''); } catch { return ''; } };
const good = (u) => /^https?:/i.test(u || '') && host(u);

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
    if (out.length >= 10) break;
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
function parseLite(html) {
  const out = [];
  const re = /<a[^>]+href=["']([^"']+)["'][^>]*class=["']result-link["'][^>]*>([\s\S]*?)<\/a>[\s\S]*?(?:class=["']result-snippet["'][^>]*>([\s\S]*?)<\/td>)?/gi;
  let m;
  while ((m = re.exec(html)) && out.length < 10) {
    let u = decode(m[1]); const g = u.match(/[?&]uddg=([^&]+)/); if (g) u = decodeURIComponent(g[1]);
    out.push({ title: strip(m[2]).slice(0, 160), url: u.startsWith('//') ? 'https:' + u : u, snippet: strip(m[3] || '').slice(0, 300) });
  }
  return out;
}
// Brave started hard-blocking this environment (HTTP 429, anti-bot) once
// enough parallel discover-fill batches were hitting it at once, and Bing's
// scrape was frequently serving generic/irrelevant top results for small-
// suburb queries instead of falling through. lite.duckduckgo first turned
// out far more reliable for these hyperlocal queries; Brave dropped
// entirely rather than kept as a fallback that just eats a timeout.
const ENGINES = [
  ['lite', 'https://lite.duckduckgo.com/lite/?q=', parseLite],
  ['bing', 'https://www.bing.com/search?setlang=en&q=', parseBing],
];

async function search(q) {
  for (const [, url, parse] of ENGINES) {
    await jitter(300, 700);
    try {
      const { html } = await get(url + encodeURIComponent(q));
      const res = parse(html);
      if (res.length) return res;
    } catch { /* try next engine */ }
  }
  return [];
}

function extract(html) {
  const title = meta(html, /<title[^>]*>([\s\S]*?)<\/title>/i);
  const d1 = meta(html, /<meta[^>]+name=["']description["'][^>]*content=["']([^"']*)["']/i);
  const d2 = meta(html, /<meta[^>]+property=["']og:description["'][^>]*content=["']([^"']*)["']/i);
  const description = [d1, d2 && d2 !== d1 ? d2 : ''].filter(Boolean).join(' | ').slice(0, 400);
  const body = (html.match(/<body[\s\S]*$/i) || [html])[0];
  const text = strip(body).slice(0, 1200);
  return { title: title.slice(0, 200), description, text };
}

const PHONE_RE = /(?:\+27|\b0)[\s-]?\d{2}[\s-]?\d{3}[\s-]?\d{4}\b/;
const normName = (s) => String(s || '').toLowerCase().replace(/[^a-z0-9]+/g, ' ').trim();

// Fuzzy "is this the same business we already have" check. Exact-string
// matching misses obvious dupes like "A M Carrim & Attorneys" vs "Carrim
// Attorneys in Annadale Polokwane" (same business, candidate's title just
// has extra location words and dropped initials). Token-overlap instead:
// strip common legal/stop words, then compare what's left.
const NAME_STOP = new Set([
  'the', 'and', 'pty', 'ltd', 'cc', 'of', 'in', 'at', 'a', 'an', 'for', 'to',
  'inc', 'co', 'sa', 'za', 'incorporated', 'company', 'services', 'service',
  'store', 'shop', 'group', 'trading', 'south', 'africa',
]);
const nameTokens = (s, extraStop) => [...new Set(normName(s).split(/\s+/)
  .filter((t) => t.length > 1 && !NAME_STOP.has(t) && !extraStop.has(t)))];
// isSameBusiness(candidateName, existingName, combo): strips the combo's own
// location words (suburb, city, category) too, since a directory candidate
// title is often "<name> in <suburb>, <city>" or "<category> <name>" — those
// words would otherwise dilute every comparison toward "no overlap".
function isSameBusiness(candidateName, existingName, combo) {
  const locStop = new Set(
    `${combo.subLabel} ${combo.cityLabel} ${combo.catLabel}`.toLowerCase().split(/[^a-z0-9]+/).filter(Boolean)
  );
  const a = nameTokens(candidateName, locStop), b = nameTokens(existingName, locStop);
  if (!a.length || !b.length) return normName(candidateName) === normName(existingName);
  const shared = a.filter((t) => b.includes(t)).length;
  const overlap = shared / Math.min(a.length, b.length);
  return overlap >= 0.5;
}

async function discoverOne(combo) {
  const { catLabel, subLabel, cityLabel = 'Polokwane', existingNames = [] } = combo;
  const queries = [
    `${catLabel} in ${subLabel}, ${cityLabel}`,
    `${catLabel} ${subLabel} ${cityLabel} contact`,
    `site:facebook.com ${catLabel} ${subLabel} ${cityLabel}`,
  ];
  const seen = new Map(); // url -> result
  for (const q of queries) {
    const res = await search(q);
    for (const r of res) {
      if (!good(r.url) || seen.has(r.url) || HUB_HOSTS.test(host(r.url)) || SKIP.test(r.url)) continue;
      seen.set(r.url, r);
    }
    if (seen.size >= 8) break;
  }
  const rank = (r) => (DIRECTORIES.test(host(r.url)) ? 0 : FACEBOOK.test(host(r.url)) ? 1 : 2);
  const cands = [...seen.values()].sort((a, b) => rank(a) - rank(b)).slice(0, 6);

  const out = [];
  for (const r of cands) {
    if (out.length >= 4) break;
    await jitter();
    let page = null;
    try { const { html } = await get(r.url); page = extract(html); } catch { /* skip */ }
    const blob = `${r.title} ${r.snippet} ${page?.title || ''} ${page?.description || ''}`;
    const guessedName = (page?.title || r.title || '').split(/[|–-]/)[0].trim();
    if (!guessedName) continue;
    if (existingNames.some((n) => isSameBusiness(guessedName, n, combo))) continue;
    if (out.some((o) => isSameBusiness(guessedName, o.guessed_name, combo))) continue;
    // crude relevance check: suburb or category keyword should appear somewhere
    const hay = blob.toLowerCase();
    const relevant = hay.includes(subLabel.toLowerCase()) || hay.includes(catLabel.toLowerCase().split(' ')[0]);
    const phone = (blob.match(PHONE_RE) || [])[0] || (page?.text.match(PHONE_RE) || [])[0] || null;
    out.push({
      guessed_name: guessedName,
      source_url: r.url,
      source_host: host(r.url),
      relevant,
      title: r.title,
      snippet: r.snippet || page?.description || '',
      phone,
    });
  }
  return out;
}

async function main() {
  await startCrawler();
  // Resume support: if outFile already has partial results (from an interrupted
  // run), skip combos already done instead of re-crawling from scratch.
  let out = [];
  if (fs.existsSync(outFile)) {
    try { out = JSON.parse(fs.readFileSync(outFile, 'utf8')); } catch { out = []; }
  }
  const doneKey = (c) => `${c.category}::${c.suburb}`;
  const doneSet = new Set(out.map(doneKey));
  for (const combo of combos) {
    if (doneSet.has(doneKey(combo))) continue;
    console.error(`-> ${combo.catLabel} in ${combo.subLabel}`);
    let candidates = [];
    try { candidates = await discoverOne(combo); }
    catch (e) { console.error(`   failed: ${e.message}`); }
    console.error(`   ${candidates.length} candidate(s)`);
    out.push({ ...combo, candidates });
    // Write after every combo, not just at the end, so a killed/interrupted
    // run never loses progress — re-running the same command resumes instead
    // of starting over.
    fs.writeFileSync(outFile, JSON.stringify(out, null, 2));
  }
  stopCrawler();
  console.log(`wrote ${outFile} (${out.length} combos)`);
}
main().catch((e) => { console.error(e); process.exit(1); });
