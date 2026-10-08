#!/usr/bin/env node
// Weekly Google Search Console indexing report for every site in sites/*.json.
//
// For each live domain (property sc-domain:<domain>) it collects:
//   - search analytics: last 28 days vs the 28 days before (totals, pages
//     with impressions per page type, top queries, top pages) plus a 90-day
//     pages-with-impressions count;
//   - submitted sitemaps (and the children of a sitemap index);
//   - a URL Inspection sample: up to N URLs per child sitemap of the live
//     https://<domain>/sitemap-index.xml, plus /, /category/, /suburb/ and
//     /about/, tallied by coverageState;
//   - AdSense site state, policy issues and alerts (adsense v2).
//
// Writes status/seo/report.md, status/seo/<YYYY-MM-DD>.json and
// status/seo/latest.json. The previous latest.json (if any) is used for the
// week-on-week comparison of the inspection sample.
// Also writes status/seo/pages-with-impressions.<slug>.json per site: every
// page path with Google impressions in the last 90 days, used by the index
// gate to protect those pages from an automatic noindex (not written if the
// 90-day fetch failed, so a good list is never clobbered).
//
// Credentials: GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET, GOOGLE_REFRESH_TOKEN,
// or, when those aren't set, <secrets>/google-client.json (installed.*) and
// <secrets>/google-token.json (refresh_token). The OAuth scopes needed are
// webmasters (or webmasters.readonly) and adsense.readonly.
//
// Usage:
//   node scripts/search-console-report.mjs [--secrets .secrets] [--sample 8]
//        [--site pretoria] [--out status/seo] [--no-inspect]

import { readFileSync, writeFileSync, mkdirSync, readdirSync, existsSync } from 'node:fs';
import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = join(dirname(fileURLToPath(import.meta.url)), '..');

// ---------- args ----------
const argv = process.argv.slice(2);
const arg = (name, def) => {
  const i = argv.indexOf(`--${name}`);
  return i >= 0 && argv[i + 1] && !argv[i + 1].startsWith('--') ? argv[i + 1] : def;
};
const SECRETS_DIR = arg('secrets', '.secrets');
const SAMPLE = Math.max(0, parseInt(arg('sample', '8'), 10) || 0);
const ONLY_SITE = arg('site', null);
const OUT_DIR = join(ROOT, arg('out', 'status/seo'));
const INSPECT = !argv.includes('--no-inspect');
const ALWAYS_INSPECT = ['/', '/category/', '/suburb/', '/about/'];

// ---------- credentials ----------
function loadCreds() {
  let { GOOGLE_CLIENT_ID: id, GOOGLE_CLIENT_SECRET: secret, GOOGLE_REFRESH_TOKEN: refresh } = process.env;
  let tokenUri = 'https://oauth2.googleapis.com/token';
  if (!id || !secret || !refresh) {
    const dir = join(process.cwd(), SECRETS_DIR);
    try {
      const c = JSON.parse(readFileSync(join(dir, 'google-client.json'), 'utf8'));
      const cc = c.installed || c.web || c;
      id ||= cc.client_id;
      secret ||= cc.client_secret;
      tokenUri = cc.token_uri || tokenUri;
    } catch {}
    try {
      const t = JSON.parse(readFileSync(join(dir, 'google-token.json'), 'utf8'));
      refresh ||= t.refresh_token;
    } catch {}
  }
  if (!id || !secret || !refresh) {
    console.error(
      'Missing Google credentials: set GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET and GOOGLE_REFRESH_TOKEN, ' +
        `or provide ${SECRETS_DIR}/google-client.json and ${SECRETS_DIR}/google-token.json.`,
    );
    process.exit(1);
  }
  return { id, secret, refresh, tokenUri };
}

let accessToken = null;
async function getToken(creds) {
  const res = await fetch(creds.tokenUri, {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({
      client_id: creds.id,
      client_secret: creds.secret,
      refresh_token: creds.refresh,
      grant_type: 'refresh_token',
    }),
  });
  const j = await res.json();
  if (!j.access_token) throw new Error(`Token refresh failed: ${JSON.stringify(j)}`);
  return j.access_token;
}

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

// GET/POST a Google API with a couple of retries on 429/5xx.
async function g(url, body) {
  for (let attempt = 0; ; attempt++) {
    const res = await fetch(url, {
      method: body ? 'POST' : 'GET',
      headers: { Authorization: `Bearer ${accessToken}`, 'Content-Type': 'application/json' },
      body: body ? JSON.stringify(body) : undefined,
    });
    const text = await res.text();
    let j;
    try { j = JSON.parse(text); } catch { j = { error: { message: text.slice(0, 300) } }; }
    if ((res.status === 429 || res.status >= 500) && attempt < 3) {
      await sleep(2000 * (attempt + 1) ** 2);
      continue;
    }
    if (!res.ok) j.error ||= { message: `HTTP ${res.status}` };
    return j;
  }
}

// ---------- helpers ----------
const day = (offset) => new Date(Date.now() - offset * 864e5).toISOString().slice(0, 10);
const TODAY = day(0);
// Search Console data lags ~2-3 days; end the windows 3 days ago so both
// 28-day windows are complete.
const LAG = 3;
const CUR = { startDate: day(LAG + 27), endDate: day(LAG) };
const PREV = { startDate: day(LAG + 55), endDate: day(LAG + 28) };
const D90 = { startDate: day(LAG + 89), endDate: day(LAG) };

const PAGE_TYPES = [
  'home', 'business', 'category', 'category-suburb', 'suburb', 'shopping-center',
  'section', 'events', 'news', 'guides', 'tourism', 'other',
];
function pageType(url) {
  let segs;
  try { segs = new URL(url).pathname.split('/').filter(Boolean); } catch { return 'other'; }
  if (!segs.length) return 'home';
  const s = segs[0];
  if (s === 'category' && segs.length >= 3) return 'category-suburb';
  return PAGE_TYPES.includes(s) ? s : 'other';
}

const fmtN = (n) => (n == null ? '-' : Math.round(n).toLocaleString('en-US'));
const fmtPct = (n) => (n == null ? '-' : `${(n * 100).toFixed(2)}%`);
const fmtPos = (n) => (n == null ? '-' : n.toFixed(1));
function delta(cur, prev, { pct = false, invert = false } = {}) {
  if (cur == null || prev == null) return '';
  const d = cur - prev;
  if (Math.abs(d) < 1e-9) return ' (=)';
  const sign = d > 0 ? '+' : '-';
  if (pct) return ` (${sign}${(Math.abs(d) * 100).toFixed(2)}pp)`;
  if (invert) return ` (${sign}${Math.abs(d).toFixed(1)})`;
  const rel = prev ? ` / ${sign}${Math.round((Math.abs(d) / prev) * 100)}%` : '';
  return ` (${sign}${fmtN(Math.abs(d))}${rel})`;
}
const mdCell = (s) => String(s ?? '').replace(/\|/g, '\\|').replace(/\n/g, ' ');

// ---------- search analytics ----------
// Page URL -> decoded pathname with a trailing slash (file-like paths with a
// dot in the last segment are left alone). Returns null for unparseable URLs.
function normalisePath(u) {
  try {
    let p = decodeURIComponent(new URL(u).pathname);
    if (!p.endsWith('/') && !p.split('/').pop().includes('.')) p += '/';
    return p;
  } catch {
    return null;
  }
}
function uniqueSortedPaths(rows) {
  const set = new Set();
  for (const r of rows || []) {
    const p = normalisePath(r?.keys?.[0]);
    if (p) set.add(p);
  }
  return [...set].sort();
}

async function searchAnalytics(prop) {
  const base = `https://www.googleapis.com/webmasters/v3/sites/${encodeURIComponent(prop)}/searchAnalytics/query`;
  const totals = async (w) => {
    const r = await g(base, { ...w, dataState: 'final' });
    if (r.error) return { error: r.error.message };
    const t = r.rows?.[0] || {};
    return { clicks: t.clicks || 0, impressions: t.impressions || 0, ctr: t.ctr || 0, position: t.position ?? null };
  };
  const pages = async (w) => {
    const rows = [];
    for (let startRow = 0; ; startRow += 25000) {
      const r = await g(base, { ...w, dimensions: ['page'], rowLimit: 25000, startRow });
      if (r.error) return { error: r.error.message, rows };
      rows.push(...(r.rows || []));
      if (!r.rows || r.rows.length < 25000) break;
    }
    return { rows };
  };
  const byType = (rows) => {
    const out = {};
    for (const r of rows) {
      const t = pageType(r.keys[0]);
      out[t] ||= { pages: 0, clicks: 0, impressions: 0 };
      out[t].pages++;
      out[t].clicks += r.clicks;
      out[t].impressions += r.impressions;
    }
    return out;
  };

  const [curT, prevT, curP, prevP, p90, q] = await Promise.all([
    totals(CUR), totals(PREV), pages(CUR), pages(PREV), pages(D90),
    g(base, { ...CUR, dimensions: ['query'], rowLimit: 15 }),
  ]);
  const topPages = [...(curP.rows || [])]
    .sort((a, b) => b.clicks - a.clicks || b.impressions - a.impressions)
    .slice(0, 15)
    .map((r) => ({ page: r.keys[0], clicks: r.clicks, impressions: r.impressions, ctr: r.ctr, position: r.position }));
  return {
    windows: { current: CUR, previous: PREV, d90: D90 },
    totals: { current: curT, previous: prevT },
    pagesWithImpressions: {
      current: curP.rows?.length ?? 0,
      previous: prevP.rows?.length ?? 0,
      d90: p90.rows?.length ?? 0,
    },
    byType: { current: byType(curP.rows || []), previous: byType(prevP.rows || []), d90: byType(p90.rows || []) },
    topQueries: (q.rows || []).map((r) => ({ query: r.keys[0], clicks: r.clicks, impressions: r.impressions, ctr: r.ctr, position: r.position })),
    topPages,
    // Full 90-day list of page paths with impressions (null when the fetch
    // failed). main() writes it to its own file and strips it from the entry.
    protectedPaths: p90.error ? null : uniqueSortedPaths(p90.rows),
    errors: [curT.error, prevT.error, curP.error, prevP.error, p90.error, q.error?.message].filter(Boolean),
  };
}

// ---------- sitemaps ----------
async function sitemaps(prop) {
  const base = `https://www.googleapis.com/webmasters/v3/sites/${encodeURIComponent(prop)}/sitemaps`;
  const r = await g(base);
  if (r.error) return { error: r.error.message, sitemaps: [] };
  const pick = (s) => ({
    path: s.path,
    isIndex: !!s.isSitemapsIndex,
    isPending: !!s.isPending,
    lastSubmitted: s.lastSubmitted || null,
    lastDownloaded: s.lastDownloaded || null,
    errors: Number(s.errors || 0),
    warnings: Number(s.warnings || 0),
    submitted: (s.contents || []).reduce((a, c) => a + Number(c.submitted || 0), 0),
    indexed: (s.contents || []).some((c) => c.indexed != null)
      ? (s.contents || []).reduce((a, c) => a + Number(c.indexed || 0), 0)
      : null,
  });
  const out = [];
  for (const s of r.sitemap || []) {
    const row = pick(s);
    if (row.isIndex) {
      const c = await g(`${base}?sitemapIndex=${encodeURIComponent(s.path)}`);
      row.children = (c.sitemap || []).map(pick);
      if (c.error) row.childrenError = c.error.message;
    }
    out.push(row);
  }
  return { sitemaps: out };
}

// ---------- URL inspection ----------
async function fetchText(url) {
  try {
    const res = await fetch(url, { headers: { 'User-Agent': 'hub-platform-seo-report' } });
    if (!res.ok) return null;
    return await res.text();
  } catch { return null; }
}
const locs = (xml) => [...(xml || '').matchAll(/<loc>\s*([^<\s]+)\s*<\/loc>/g)].map((m) => m[1].replace(/&amp;/g, '&'));

function sampleOf(arr, n) {
  const a = [...arr];
  for (let i = a.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1));
    [a[i], a[j]] = [a[j], a[i]];
  }
  return a.slice(0, n);
}

// Page URL -> sample group by path (the sitemap is one file, so the type
// comes from the URL), e.g. /category/plumbers/hatfield/ -> category-suburb.
function groupFromUrl(u) {
  const [section, slug, sub] = new URL(u).pathname.split('/').filter(Boolean);
  switch (section) {
    case 'business': return 'business';
    case 'category': return sub ? 'category-suburb' : 'category';
    case 'section': return 'category';
    case 'suburb': return slug === 'map' ? 'pages' : 'suburb';
    case 'shopping-center': return 'shopping-centre';
    case 'events': case 'news': case 'guides': case 'tourism': return section;
    default: return 'pages';
  }
}

let lastInspect = 0;
async function inspect(url, prop) {
  // <=5 requests/second (quota is 600/min and 2,000/day per property).
  const wait = lastInspect + 200 - Date.now();
  if (wait > 0) await sleep(wait);
  lastInspect = Date.now();
  const r = await g('https://searchconsole.googleapis.com/v1/urlInspection/index:inspect', {
    inspectionUrl: url,
    siteUrl: prop,
    languageCode: 'en-US',
  });
  if (r.error) return { url, error: r.error.message, coverageState: `Error: ${r.error.message.slice(0, 60)}` };
  const s = r.inspectionResult?.indexStatusResult || {};
  return {
    url,
    verdict: s.verdict || null,
    coverageState: s.coverageState || 'Unknown',
    indexingState: s.indexingState || null,
    robotsTxtState: s.robotsTxtState || null,
    pageFetchState: s.pageFetchState || null,
    lastCrawlTime: s.lastCrawlTime || null,
    googleCanonical: s.googleCanonical || null,
    userCanonical: s.userCanonical || null,
  };
}

async function inspectionSample(domain, prop) {
  const origin = `https://${domain}`;
  const index = await fetchText(`${origin}/sitemap-index.xml`);
  const groups = {};
  const childErrors = [];
  for (const child of locs(index)) {
    const urls = locs(await fetchText(child));
    if (!urls.length) childErrors.push(child);
    for (const u of urls) {
      const grp = groupFromUrl(u);
      groups[grp] ||= { total: 0, urls: [] };
      groups[grp].total++;
      groups[grp].urls.push(u);
    }
  }
  const fixed = ALWAYS_INSPECT.map((p) => origin + p);
  const plan = [{ group: 'key-pages', urls: fixed }];
  for (const [grp, v] of Object.entries(groups)) {
    plan.push({ group: grp, urls: sampleOf(v.urls.filter((u) => !fixed.includes(u)), SAMPLE) });
  }
  const results = [];
  for (const p of plan) {
    for (const u of p.urls) results.push({ group: p.group, ...(await inspect(u, prop)) });
  }
  const tally = {};
  for (const r of results) {
    tally[r.group] ||= { sampled: 0, indexed: 0, states: {} };
    const t = tally[r.group];
    t.sampled++;
    if (r.verdict === 'PASS' || /indexed/i.test(r.coverageState) && !/not indexed/i.test(r.coverageState)) t.indexed++;
    t.states[r.coverageState] = (t.states[r.coverageState] || 0) + 1;
  }
  return {
    sitemapIndexFound: !!index,
    sitemapUrlCounts: Object.fromEntries(Object.entries(groups).map(([k, v]) => [k, v.total])),
    emptyOrMissingChildSitemaps: childErrors,
    tally,
    results,
  };
}

// ---------- AdSense ----------
async function adsense() {
  const base = 'https://adsense.googleapis.com/v2';
  const accts = await g(`${base}/accounts`);
  if (accts.error) return { error: accts.error.message };
  const out = [];
  for (const a of accts.accounts || []) {
    const [sites, issues, alerts] = await Promise.all([
      g(`${base}/${a.name}/sites?pageSize=100`),
      g(`${base}/${a.name}/policyIssues?pageSize=100`),
      g(`${base}/${a.name}/alerts`),
    ]);
    out.push({
      account: a.name,
      state: a.state || null,
      sites: (sites.sites || []).map((s) => ({ domain: s.domain, state: s.state, autoAdsEnabled: !!s.autoAdsEnabled })),
      policyIssues: (issues.policyIssues || []).map((p) => ({
        site: p.site, uri: p.uri, action: p.action, entityType: p.entityType,
        topics: (p.policyTopics || []).map((t) => t.topic), firstDetected: p.firstDetectedDate, lastDetected: p.lastDetectedDate,
      })),
      alerts: (alerts.alerts || []).map((x) => ({ severity: x.severity, type: x.type, message: x.message })),
      errors: [sites.error?.message, issues.error?.message, alerts.error?.message].filter(Boolean),
    });
  }
  return { accounts: out };
}

// ---------- report ----------
const isIndexedState = (s) => /^Submitted and indexed$|^Indexed/i.test(s) && !/not indexed/i.test(s);

function summarise(site, prevSite) {
  const lines = [];
  const sa = site.searchAnalytics;
  const c = sa.totals.current, p = sa.totals.previous;
  if (c && p && !c.error) {
    const dir = (a, b) => (a > b ? 'up' : a < b ? 'down' : 'flat');
    lines.push(
      `**${site.name}**: ${fmtN(c.clicks)} clicks (${dir(c.clicks, p.clicks)} from ${fmtN(p.clicks)}), ` +
        `${fmtN(c.impressions)} impressions (${dir(c.impressions, p.impressions)} from ${fmtN(p.impressions)}), ` +
        `${fmtN(sa.pagesWithImpressions.current)} pages with impressions (was ${fmtN(sa.pagesWithImpressions.previous)}) over 28 days vs the 28 before.`,
    );
  }
  if (prevSite?.searchAnalytics) {
    const pc = prevSite.searchAnalytics.pagesWithImpressions?.current;
    if (pc != null) lines.push(`  Since last report (${prevSite.generatedDate || 'previous run'}): pages with impressions (28d) ${fmtN(pc)} -> ${fmtN(sa.pagesWithImpressions.current)}.`);
  }
  const weak = [];
  for (const [grp, t] of Object.entries(site.inspection?.tally || {})) {
    if (grp === 'key-pages' || t.sampled < 2) continue;
    const share = t.indexed / t.sampled;
    if (share < 0.5) {
      const top = Object.entries(t.states).sort((a, b) => b[1] - a[1])[0];
      weak.push(`${grp} (${t.indexed}/${t.sampled} indexed; mostly "${top[0]}")`);
    }
  }
  if (weak.length) lines.push(`  Mostly not indexed in the sample: ${weak.join(', ')}.`);
  else if (site.inspection) lines.push('  Every sampled page type is at least half indexed.');
  const keyBad = (site.inspection?.results || []).filter((r) => r.group === 'key-pages' && !isIndexedState(r.coverageState));
  if (keyBad.length) lines.push(`  Key pages not indexed: ${keyBad.map((r) => `${new URL(r.url).pathname} ("${r.coverageState}")`).join(', ')}.`);
  return lines;
}

function actions(sites) {
  const acts = new Set();
  for (const s of sites) {
    for (const [grp, t] of Object.entries(s.inspection?.tally || {})) {
      if (grp === 'key-pages') continue;
      const st = t.states;
      const n = (k) => Object.entries(st).filter(([s2]) => s2.toLowerCase().includes(k)).reduce((a, [, v]) => a + v, 0);
      if (n('unknown to google') >= t.sampled / 2) acts.add(`${s.name}: most sampled **${grp}** URLs are unknown to Google — make sure they are linked internally (hub/listing pages) and in the submitted sitemap index; consider requesting indexing for a few key ones.`);
      if (n('discovered - currently not indexed') >= t.sampled / 2) acts.add(`${s.name}: **${grp}** pages are discovered but not crawled — crawl budget/priority issue; strengthen internal links to them and trim thin or near-duplicate pages of that type.`);
      if (n('crawled - currently not indexed') >= t.sampled / 2) acts.add(`${s.name}: **${grp}** pages are crawled but not indexed — Google sees them as low value; add unique content (descriptions, photos, reviews) or noindex the thinnest ones.`);
      if (n('noindex') > 0 && grp !== 'pages') acts.add(`${s.name}: some sampled **${grp}** URLs in the sitemap are noindexed — remove noindexed URLs from the sitemap.`);
      if (n('duplicate') > 0) acts.add(`${s.name}: **${grp}** has duplicate/canonical issues — check canonical tags.`);
    }
    for (const sm of s.sitemaps?.sitemaps || []) {
      if (sm.errors > 0) acts.add(`${s.name}: sitemap ${sm.path} reports ${sm.errors} error(s) — check it in Search Console.`);
    }
    const idx = (s.sitemaps?.sitemaps || []).some((x) => /sitemap-index\.xml$/.test(x.path));
    if (s.sitemaps && !s.sitemaps.error && !idx) acts.add(`${s.name}: sitemap-index.xml is not submitted in Search Console — submit https://${s.domain}/sitemap-index.xml.`);
  }
  return [...acts];
}

function renderReport(data, prev) {
  const L = [];
  L.push('# Search Console indexing report', '');
  L.push(`Generated ${data.generatedAt} by \`scripts/search-console-report.mjs\`. ` +
    `Search windows: last 28 days ${CUR.startDate} to ${CUR.endDate} vs previous ${PREV.startDate} to ${PREV.endDate} (data lags about 3 days). ` +
    `URL Inspection samples up to ${data.samplePerType} URLs per sitemap type.`, '');
  L.push('## Summary', '');
  for (const s of data.sites) {
    const prevSite = prev?.sites?.find((x) => x.slug === s.slug);
    if (prevSite) prevSite.generatedDate = prev.date;
    L.push(...summarise(s, prevSite).map((l) => (l.startsWith('  ') ? `  - ${l.trim()}` : `- ${l}`)));
  }
  const acts = actions(data.sites);
  if (data.adsense?.accounts) {
    for (const a of data.adsense.accounts) {
      for (const st of a.sites) if (st.state !== 'READY') acts.push(`AdSense: ${st.domain} is ${st.state} — check the Sites page in AdSense.`);
      if (a.policyIssues.length) acts.push(`AdSense: ${a.policyIssues.length} policy issue(s) open — see the AdSense section.`);
    }
  }
  L.push('', '**Suggested actions**', '');
  L.push(...(acts.length ? acts.map((a) => `- ${a}`) : ['- Nothing urgent. Keep publishing and linking new pages.']));
  L.push('');

  for (const s of data.sites) {
    const sa = s.searchAnalytics;
    L.push(`## ${s.name} (${s.domain})`, '');
    if (sa.errors?.length) L.push(`> Search analytics errors: ${sa.errors.join('; ')}`, '');
    const c = sa.totals.current, p = sa.totals.previous;
    L.push('### Search performance (28 days vs previous 28)', '');
    L.push('| Metric | Last 28d | Previous 28d |', '|---|---:|---:|');
    L.push(`| Clicks | ${fmtN(c.clicks)}${delta(c.clicks, p.clicks)} | ${fmtN(p.clicks)} |`);
    L.push(`| Impressions | ${fmtN(c.impressions)}${delta(c.impressions, p.impressions)} | ${fmtN(p.impressions)} |`);
    L.push(`| CTR | ${fmtPct(c.ctr)}${delta(c.ctr, p.ctr, { pct: true })} | ${fmtPct(p.ctr)} |`);
    L.push(`| Avg position | ${fmtPos(c.position)}${delta(c.position, p.position, { invert: true })} | ${fmtPos(p.position)} |`);
    L.push(`| Pages with impressions | ${fmtN(sa.pagesWithImpressions.current)}${delta(sa.pagesWithImpressions.current, sa.pagesWithImpressions.previous)} | ${fmtN(sa.pagesWithImpressions.previous)} |`);
    L.push('', `Pages with impressions over 90 days: **${fmtN(sa.pagesWithImpressions.d90)}**.`, '');

    L.push('### Pages with impressions by type', '');
    L.push('| Type | Sitemap URLs | Pages 28d | Prev 28d | Pages 90d | Clicks 28d | Impr. 28d |', '|---|---:|---:|---:|---:|---:|---:|');
    const smCounts = s.inspection?.sitemapUrlCounts || {};
    const smFor = (t) => {
      const map = { 'shopping-center': 'shopping-centre', home: null, section: null, other: null };
      const k = t in map ? map[t] : t;
      return k && smCounts[k] != null ? fmtN(smCounts[k]) : '-';
    };
    for (const t of PAGE_TYPES) {
      const cur = sa.byType.current[t], prv = sa.byType.previous[t], d90 = sa.byType.d90[t];
      if (!cur && !prv && !d90 && smFor(t) === '-') continue;
      L.push(`| ${t} | ${smFor(t)} | ${fmtN(cur?.pages || 0)} | ${fmtN(prv?.pages || 0)} | ${fmtN(d90?.pages || 0)} | ${fmtN(cur?.clicks || 0)} | ${fmtN(cur?.impressions || 0)} |`);
    }
    L.push('');

    if (s.inspection) {
      const ins = s.inspection;
      L.push('### URL Inspection sample', '');
      if (!ins.sitemapIndexFound) L.push('> Could not fetch the live sitemap-index.xml.', '');
      const states = [...new Set(Object.values(ins.tally).flatMap((t) => Object.keys(t.states)))].sort();
      L.push(`| Group | Sampled | Indexed | ${states.map(mdCell).join(' | ')} |`);
      L.push(`|---|---:|---:|${states.map(() => '---:').join('|')}|`);
      for (const [grp, t] of Object.entries(ins.tally)) {
        L.push(`| ${grp} | ${t.sampled} | ${t.indexed} | ${states.map((st) => t.states[st] || '').join(' | ')} |`);
      }
      const prevTally = prev?.sites?.find((x) => x.slug === s.slug)?.inspection?.tally;
      if (prevTally) {
        const tot = (tl) => Object.values(tl).reduce((a, t) => [a[0] + t.indexed, a[1] + t.sampled], [0, 0]);
        const [ci, cs] = tot(ins.tally), [pi, ps] = tot(prevTally);
        L.push('', `Sample indexed rate: ${cs ? Math.round((ci / cs) * 100) : 0}% (${ci}/${cs}); last report ${ps ? Math.round((pi / ps) * 100) : 0}% (${pi}/${ps}).`);
      }
      L.push('', '<details><summary>Key pages</summary>', '');
      for (const r of ins.results.filter((x) => x.group === 'key-pages')) {
        L.push(`- ${new URL(r.url).pathname}: ${r.coverageState}${r.lastCrawlTime ? ` (last crawl ${r.lastCrawlTime.slice(0, 10)})` : ''}`);
      }
      L.push('', '</details>', '');
    }

    L.push('### Sitemaps', '');
    if (s.sitemaps.error) L.push(`> ${s.sitemaps.error}`, '');
    else if (!s.sitemaps.sitemaps.length) L.push('No sitemaps submitted.', '');
    else {
      L.push('| Sitemap | Last downloaded | Errors | Warnings | Submitted | Pending |', '|---|---|---:|---:|---:|---|');
      for (const sm of s.sitemaps.sitemaps) {
        L.push(`| ${sm.path}${sm.isIndex ? ' (index)' : ''} | ${sm.lastDownloaded?.slice(0, 10) || 'never'} | ${sm.errors} | ${sm.warnings} | ${fmtN(sm.submitted)} | ${sm.isPending ? 'yes' : ''} |`);
        for (const ch of sm.children || []) {
          L.push(`| &nbsp;&nbsp;└ ${ch.path} | ${ch.lastDownloaded?.slice(0, 10) || 'never'} | ${ch.errors} | ${ch.warnings} | ${fmtN(ch.submitted)} | ${ch.isPending ? 'yes' : ''} |`);
        }
      }
      L.push('');
    }

    L.push('### Top queries (28 days)', '');
    if (!sa.topQueries.length) L.push('No queries.', '');
    else {
      L.push('| Query | Clicks | Impressions | CTR | Position |', '|---|---:|---:|---:|---:|');
      for (const q of sa.topQueries) L.push(`| ${mdCell(q.query)} | ${fmtN(q.clicks)} | ${fmtN(q.impressions)} | ${fmtPct(q.ctr)} | ${fmtPos(q.position)} |`);
      L.push('');
    }
    L.push('### Top pages (28 days)', '');
    if (!sa.topPages.length) L.push('No pages.', '');
    else {
      L.push('| Page | Clicks | Impressions | CTR | Position |', '|---|---:|---:|---:|---:|');
      for (const q of sa.topPages) {
        let path = q.page;
        try { path = decodeURIComponent(new URL(q.page).pathname); } catch {}
        L.push(`| ${mdCell(path)} | ${fmtN(q.clicks)} | ${fmtN(q.impressions)} | ${fmtPct(q.ctr)} | ${fmtPos(q.position)} |`);
      }
      L.push('');
    }
  }

  L.push('## AdSense', '');
  if (data.adsense?.error) L.push(`> ${data.adsense.error}`, '');
  for (const a of data.adsense?.accounts || []) {
    L.push(`Account ${a.account}${a.state ? ` (${a.state})` : ''}.`, '');
    if (a.errors.length) L.push(`> ${a.errors.join('; ')}`, '');
    L.push('| Site | State | Auto ads |', '|---|---|---|');
    for (const s of a.sites) L.push(`| ${s.domain} | ${s.state} | ${s.autoAdsEnabled ? 'on' : 'off'} |`);
    L.push('');
    L.push(a.policyIssues.length
      ? `Policy issues:\n\n${a.policyIssues.map((p) => `- ${p.site || p.uri}: ${p.action} (${p.topics.join(', ')}), last detected ${JSON.stringify(p.lastDetected)}`).join('\n')}`
      : 'No policy issues.');
    L.push('');
    L.push(a.alerts.length ? `Alerts:\n\n${a.alerts.map((x) => `- [${x.severity}] ${x.type}: ${x.message}`).join('\n')}` : 'No alerts.');
    L.push('');
  }
  return L.join('\n');
}

// ---------- main ----------
async function main() {
  const creds = loadCreds();
  accessToken = await getToken(creds);

  const siteFiles = readdirSync(join(ROOT, 'sites')).filter((f) => f.endsWith('.json'));
  const sites = siteFiles
    .map((f) => JSON.parse(readFileSync(join(ROOT, 'sites', f), 'utf8')))
    .filter((s) => s.domain && s.domainLive !== false)
    .filter((s) => !ONLY_SITE || s.slug === ONLY_SITE)
    .sort((a, b) => a.slug.localeCompare(b.slug));

  let prev = null;
  const latestPath = join(OUT_DIR, 'latest.json');
  if (existsSync(latestPath)) {
    try { prev = JSON.parse(readFileSync(latestPath, 'utf8')); } catch {}
    if (prev?.date === TODAY) prev = null; // re-run on the same day: no self-comparison
  }

  const data = {
    date: TODAY,
    generatedAt: new Date().toISOString(),
    samplePerType: SAMPLE,
    windows: { current: CUR, previous: PREV, d90: D90 },
    sites: [],
  };
  for (const s of sites) {
    const prop = `sc-domain:${s.domain}`;
    console.error(`== ${s.slug} (${prop})`);
    const entry = { slug: s.slug, name: s.siteName || s.slug, domain: s.domain, property: prop };
    entry.searchAnalytics = await searchAnalytics(prop);
    console.error(`   search analytics: ${entry.searchAnalytics.pagesWithImpressions.d90} pages with impressions (90d)`);
    if (Array.isArray(entry.searchAnalytics.protectedPaths)) {
      mkdirSync(OUT_DIR, { recursive: true });
      writeFileSync(
        join(OUT_DIR, `pages-with-impressions.${s.slug}.json`),
        JSON.stringify({ generatedAt: new Date().toISOString(), window: D90, paths: entry.searchAnalytics.protectedPaths }, null, 2) + '\n',
      );
      console.error(`   wrote pages-with-impressions.${s.slug}.json (${entry.searchAnalytics.protectedPaths.length} paths)`);
    } else {
      console.error(`   WARNING: 90-day page fetch failed; pages-with-impressions.${s.slug}.json not updated`);
    }
    delete entry.searchAnalytics.protectedPaths;
    entry.sitemaps = await sitemaps(prop);
    console.error(`   sitemaps: ${entry.sitemaps.error || entry.sitemaps.sitemaps.length}`);
    if (INSPECT) {
      entry.inspection = await inspectionSample(s.domain, prop);
      console.error(`   inspected ${entry.inspection.results.length} URLs`);
    }
    data.sites.push(entry);
  }
  data.adsense = await adsense();

  mkdirSync(OUT_DIR, { recursive: true });
  const json = JSON.stringify(data, null, 2) + '\n';
  writeFileSync(join(OUT_DIR, `${TODAY}.json`), json);
  writeFileSync(latestPath, json);
  const md = renderReport(data, prev);
  writeFileSync(join(OUT_DIR, 'report.md'), md + '\n');
  // Short summary (for CI logs / step summary).
  const summaryEnd = md.indexOf('\n## ', md.indexOf('## Summary') + 5);
  console.log(md.slice(0, summaryEnd > 0 ? summaryEnd : undefined));
}

main().catch((e) => {
  console.error(e);
  process.exit(1);
});
