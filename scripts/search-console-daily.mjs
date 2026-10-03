#!/usr/bin/env node
// Daily Google data for Hub Admin's Google screen, run every morning by
// .github/workflows/admin-google.yml. The result is stored in Hub Admin's own
// database (/api/notify/report?kind=google, same key as the 5-minute
// notifier), and the previous copy is read back from there to keep history:
//
//   daily       clicks, impressions, CTR and position per day (last 90 days)
//   pagesSeen   how many different pages got at least one Google impression
//               each day: the closest thing Google's API offers to an
//               "indexed pages" trend (the coverage report itself isn't in it)
//   gaps        searches where the site shows up but below the first page
//   inspections Google's own verdict for the site's pages (URL Inspection),
//               about 120 pages a day per site, oldest-checked first, so
//               every sitemap page is re-checked every few weeks
//   adsense     estimated earnings, page views and clicks per day and site
//
// Same credentials as the weekly report (GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET,
// GOOGLE_REFRESH_TOKEN with the webmasters and adsense.readonly scopes).
import { readFileSync } from 'node:fs';
import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = join(dirname(fileURLToPath(import.meta.url)), '..');
const { CLOUDFLARE_API_TOKEN: cfToken, CLOUDFLARE_ACCOUNT_ID: account, ADMIN_URL: adminUrl = 'https://hub-admin-b4x.pages.dev' } = process.env;
if (!cfToken || !account) throw new Error('CLOUDFLARE_API_TOKEN and CLOUDFLARE_ACCOUNT_ID are required.');
const CITIES = ['pretoria', 'polokwane', 'capetown'];
const INSPECT_PER_DAY = Number(process.env.INSPECT_PER_DAY || 120);
const KEY_PAGES = ['/', '/category/', '/suburb/', '/events/', '/news/', '/search/'];

const { GOOGLE_CLIENT_ID: id, GOOGLE_CLIENT_SECRET: secret, GOOGLE_REFRESH_TOKEN: refresh } = process.env;
if (!id || !secret || !refresh) throw new Error('GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET and GOOGLE_REFRESH_TOKEN are required.');
const tok = await (await fetch('https://oauth2.googleapis.com/token', { method: 'POST', headers: { 'Content-Type': 'application/x-www-form-urlencoded' }, body: new URLSearchParams({ client_id: id, client_secret: secret, refresh_token: refresh, grant_type: 'refresh_token' }) })).json();
if (!tok.access_token) throw new Error('Google token refresh failed.');
const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

async function g(url, body) {
  for (let attempt = 0; ; attempt++) {
    const res = await fetch(url, { method: body ? 'POST' : 'GET', headers: { Authorization: `Bearer ${tok.access_token}`, 'Content-Type': 'application/json' }, body: body ? JSON.stringify(body) : undefined });
    const j = await res.json().catch(() => ({ error: { message: `HTTP ${res.status}` } }));
    if ((res.status === 429 || res.status >= 500) && attempt < 3) {
      await sleep(2000 * (attempt + 1) ** 2);
      continue;
    }
    if (!res.ok) j.error ||= { message: `HTTP ${res.status}` };
    return j;
  }
}

const day = (offset) => new Date(Date.now() - offset * 864e5).toISOString().slice(0, 10);
const TODAY = day(0);
// Hub Admin's notify key, read from its database with the Cloudflare API.
async function notifyKey() {
  const base = `https://api.cloudflare.com/client/v4/accounts/${account}/d1/database`;
  const headers = { Authorization: `Bearer ${cfToken}`, 'Content-Type': 'application/json' };
  const list = await (await fetch(`${base}?name=hub-admin-db`, { headers })).json();
  const db = (list.result ?? []).find((d) => d.name === 'hub-admin-db');
  if (!db) throw new Error('hub-admin-db not found.');
  const q = await (await fetch(`${base}/${db.uuid}/query`, { method: 'POST', headers, body: JSON.stringify({ sql: `SELECT value FROM settings WHERE key = 'notify_key'` }) })).json();
  const key = q.result?.[0]?.results?.[0]?.value;
  if (!key) throw new Error('Could not read the notify key (has the 5-minute notifier run yet?).');
  if (process.env.GITHUB_ACTIONS) console.log(`::add-mask::${key}`);
  return key;
}
const KEY = await notifyKey();
const report = (method, body) =>
  fetch(`${adminUrl}/api/notify/report?kind=google`, { method, headers: { 'X-Hub-Admin': '1', 'X-Notify-Key': KEY, 'Content-Type': 'application/json' }, body: body ? JSON.stringify(body) : undefined });
let prev = {};
{
  const r = await report('GET');
  if (r.ok) prev = (await r.json()).data ?? {};
}

async function analytics(prop, old) {
  const base = `https://www.googleapis.com/webmasters/v3/sites/${encodeURIComponent(prop)}/searchAnalytics/query`;
  const range = { startDate: day(92), endDate: day(1) };
  const byDate = await g(base, { ...range, dimensions: ['date'], rowLimit: 200 });
  const daily = (byDate.rows ?? []).map((r) => ({ date: r.keys[0], clicks: r.clicks, impressions: r.impressions, ctr: Math.round(r.ctr * 10000) / 10000, position: Math.round(r.position * 10) / 10 }));

  // Pages with impressions per day. Recent days keep changing (Google's data
  // lags 2-3 days), so the last 5 are always re-counted; older ones are kept.
  const keep = (old?.pagesSeen ?? []).filter((p) => p.date < day(6));
  const have = new Set(keep.map((p) => p.date));
  const from = [...Array(90).keys()].map((i) => day(i + 1)).filter((d) => !have.has(d)).sort()[0];
  const counts = {};
  if (from) {
    for (let startRow = 0; startRow < 1_000_000; startRow += 25000) {
      const r = await g(base, { startDate: from, endDate: day(1), dimensions: ['date', 'page'], rowLimit: 25000, startRow });
      if (r.error) break;
      for (const row of r.rows ?? []) counts[row.keys[0]] = (counts[row.keys[0]] ?? 0) + 1;
      if (!r.rows || r.rows.length < 25000) break;
    }
  }
  const pagesSeen = [...keep, ...Object.entries(counts).filter(([d]) => !have.has(d)).map(([date, pages]) => ({ date, pages }))].sort((a, b) => a.date.localeCompare(b.date)).slice(-400);

  // Search gaps: queries with real impressions where the site averages below position 10.
  const q = await g(base, { startDate: day(30), endDate: day(2), dimensions: ['query'], rowLimit: 1000 });
  const gaps = (q.rows ?? [])
    .filter((r) => r.position > 10 && r.impressions >= 20)
    .sort((a, b) => b.impressions - a.impressions)
    .slice(0, 40)
    .map((r) => ({ query: r.keys[0], impressions: r.impressions, clicks: r.clicks, position: Math.round(r.position * 10) / 10 }));
  const top = (q.rows ?? []).slice(0, 25).map((r) => ({ query: r.keys[0], impressions: r.impressions, clicks: r.clicks, position: Math.round(r.position * 10) / 10 }));
  return { daily, pagesSeen, gaps, top, error: byDate.error?.message ?? null };
}

const locs = (xml) => [...(xml || '').matchAll(/<loc>\s*([^<\s]+)\s*<\/loc>/g)].map((m) => m[1].replace(/&amp;/g, '&'));
async function text(url) {
  try {
    const r = await fetch(url, { headers: { 'User-Agent': 'hub-platform-seo-daily' } });
    return r.ok ? r.text() : '';
  } catch {
    return '';
  }
}

async function inspections(site, prop, old) {
  const origin = `https://${site.domain}`;
  const urls = [];
  for (const child of locs(await text(`${origin}/sitemap-index.xml`))) urls.push(...locs(await text(child)));
  if (!urls.length) return { map: old ?? {}, sitemapUrls: 0, inspectedToday: 0 };
  const inSitemap = new Set(urls);
  // Stored compactly by path: [coverage state, verdict, last crawl, checked on].
  const map = Object.fromEntries(
    Object.entries(old ?? {})
      .filter(([p]) => inSitemap.has(origin + p) || KEY_PAGES.includes(p))
      .map(([p, v]) => [origin + p, { s: v[0], v: v[1], c: v[2], t: v[3] }])
  );
  const keyUrls = KEY_PAGES.map((p) => origin + p);
  // Never-checked pages first (non-business pages before business pages),
  // then the longest-ago checked.
  const order = (u) => (map[u] ? 2 : u.includes('/business/') ? 1 : 0);
  const queue = [...new Set([...keyUrls, ...urls])].sort((a, b) => order(a) - order(b) || (map[a]?.t ?? '').localeCompare(map[b]?.t ?? ''));
  let n = 0;
  for (const u of queue) {
    if (n >= INSPECT_PER_DAY) break;
    if (map[u]?.t === TODAY) continue;
    await sleep(220);
    const r = await g('https://searchconsole.googleapis.com/v1/urlInspection/index:inspect', { inspectionUrl: u, siteUrl: prop, languageCode: 'en-US' });
    if (r.error) {
      if (/quota|rate/i.test(r.error.message)) break;
      continue;
    }
    const s = r.inspectionResult?.indexStatusResult ?? {};
    map[u] = { s: s.coverageState ?? 'Unknown', v: s.verdict ?? null, c: s.lastCrawlTime ?? null, t: TODAY };
    n++;
  }
  const compact = Object.fromEntries(Object.entries(map).map(([u, v]) => [u.slice(origin.length) || '/', [v.s, v.v, v.c ? v.c.slice(0, 10) : null, v.t]]));
  return { map: compact, sitemapUrls: urls.length, inspectedToday: n };
}

async function adsense() {
  const base = 'https://adsense.googleapis.com/v2';
  const accts = await g(`${base}/accounts`);
  if (accts.error) return { error: accts.error.message };
  const account = accts.accounts?.[0]?.name;
  if (!account) return { error: 'No AdSense account found.' };
  const params = new URLSearchParams([
    ['dateRange', 'CUSTOM'],
    ['startDate.year', day(90).slice(0, 4)], ['startDate.month', String(Number(day(90).slice(5, 7)))], ['startDate.day', String(Number(day(90).slice(8, 10)))],
    ['endDate.year', TODAY.slice(0, 4)], ['endDate.month', String(Number(TODAY.slice(5, 7)))], ['endDate.day', String(Number(TODAY.slice(8, 10)))],
    ['dimensions', 'DATE'], ['dimensions', 'DOMAIN_NAME'],
    ['metrics', 'ESTIMATED_EARNINGS'], ['metrics', 'PAGE_VIEWS'], ['metrics', 'CLICKS'], ['metrics', 'IMPRESSIONS'],
  ]);
  const r = await g(`${base}/${account}/reports:generate?${params}`);
  if (r.error) return { error: r.error.message };
  const heads = (r.headers ?? []).map((h) => h.name);
  const at = (row, name) => row.cells?.[heads.indexOf(name)]?.value;
  return {
    currency: r.headers?.find((h) => h.name === 'ESTIMATED_EARNINGS')?.currencyCode ?? null,
    daily: (r.rows ?? []).map((row) => ({ date: at(row, 'DATE'), domain: at(row, 'DOMAIN_NAME'), earnings: Number(at(row, 'ESTIMATED_EARNINGS') ?? 0), pageViews: Number(at(row, 'PAGE_VIEWS') ?? 0), clicks: Number(at(row, 'CLICKS') ?? 0), impressions: Number(at(row, 'IMPRESSIONS') ?? 0) })),
  };
}

const out = { generatedAt: new Date().toISOString(), sites: {}, adsense: null };
for (const slug of CITIES) {
  const site = JSON.parse(readFileSync(join(ROOT, 'sites', `${slug}.json`), 'utf8'));
  if (!site.domainLive) continue;
  const prop = `sc-domain:${site.domain}`;
  const old = prev.sites?.[slug];
  console.log(`${slug}: search analytics…`);
  const a = await analytics(prop, old);
  console.log(`${slug}: ${a.daily.length} days, ${a.pagesSeen.length} days of pages seen. Inspecting pages…`);
  const ins = await inspections(site, prop, old?.inspections);
  console.log(`${slug}: inspected ${ins.inspectedToday ?? 0} pages today (${Object.keys(ins.map).length} of ${ins.sitemapUrls} known).`);
  out.sites[slug] = { property: prop, ...a, sitemapUrls: ins.sitemapUrls, inspections: ins.map };
}
out.adsense = await adsense();
console.log(`AdSense: ${out.adsense.error ?? `${out.adsense.daily.length} rows`}`);
const body = JSON.stringify(out);
console.log(`Report size: ${Math.round(body.length / 1024)} KB`);
const res = await report('POST', out);
if (!res.ok) throw new Error(`Hub Admin returned ${res.status}`);
console.log('Sent to Hub Admin.');
