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
//               up to 150 pages a day per site (5 minutes each),
//               never-checked and oldest-checked first
//   analytics   GA4 sessions, users and page views per day, top pages (Data API)
//   adsense     estimated earnings, page views and clicks per day and site
//
// Same credentials as the weekly report (GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET,
// GOOGLE_REFRESH_TOKEN with the webmasters, adsense.readonly and analytics.readonly scopes).
import { readFileSync } from 'node:fs';
import { join, dirname } from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = join(dirname(fileURLToPath(import.meta.url)), '..');
const { CLOUDFLARE_API_TOKEN: cfToken, CLOUDFLARE_ACCOUNT_ID: account, ADMIN_URL: adminUrl = 'https://hub-admin-b4x.pages.dev' } = process.env;
if (!cfToken || !account) throw new Error('CLOUDFLARE_API_TOKEN and CLOUDFLARE_ACCOUNT_ID are required.');
const CITIES = ['pretoria', 'polokwane', 'capetown'];
const INSPECT_PER_DAY = Number(process.env.INSPECT_PER_DAY || 150);
const INSPECT_MINUTES = Number(process.env.INSPECT_MINUTES || 5);
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
  // Google answers each inspection slowly (several seconds), so five run at
  // once and each site gets at most INSPECT_MINUTES; whatever isn't reached
  // today is first in line tomorrow.
  const todo = queue.filter((u) => map[u]?.t !== TODAY).slice(0, INSPECT_PER_DAY);
  const deadline = Date.now() + INSPECT_MINUTES * 60_000;
  let n = 0;
  let stop = false;
  await Promise.all(
    Array.from({ length: 5 }, async () => {
      while (todo.length && !stop && Date.now() < deadline) {
        const u = todo.shift();
        const r = await g('https://searchconsole.googleapis.com/v1/urlInspection/index:inspect', { inspectionUrl: u, siteUrl: prop, languageCode: 'en-US' });
        if (r.error) {
          if (/quota|rate/i.test(r.error.message)) stop = true;
          continue;
        }
        const st = r.inspectionResult?.indexStatusResult ?? {};
        map[u] = { s: st.coverageState ?? 'Unknown', v: st.verdict ?? null, c: st.lastCrawlTime ?? null, t: TODAY };
        n++;
      }
    })
  );
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

// Same page-type grouping as admin-app/functions/api/google.ts (copied, not imported).
const kindOf = (path) => {
  const [section, , sub] = String(path).split('/').filter(Boolean);
  if (!section) return 'Home';
  if (section === 'business') return 'Business';
  if (section === 'category') return sub ? 'Category in suburb' : 'Category';
  if (section === 'suburb') return 'Suburb';
  if (section === 'shopping-center') return 'Shopping centre';
  return section[0].toUpperCase() + section.slice(1);
};

// Open PageRank: one call for every live domain. Returns { domain: {score, rank, checkedAt} }.
async function openPageRank(domains) {
  const key = process.env.OPENPAGERANK_API_KEY;
  if (!key) {
    console.log('Open PageRank: no OPENPAGERANK_API_KEY, skipped');
    return {};
  }
  try {
    const res = await fetch(`https://openpagerank.com/api/v1.0/getPageRank?${domains.map((d) => `domains[]=${encodeURIComponent(d)}`).join('&')}`, { headers: { 'API-OPR': key } });
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    const j = await res.json();
    const checkedAt = new Date().toISOString();
    const o = {};
    for (const r of j.response ?? []) if (r.status_code === 200) o[r.domain] = { score: Number(r.page_rank_decimal), rank: r.rank ? Number(r.rank) : null, checkedAt };
    console.log(`Open PageRank: ${Object.keys(o).length} of ${domains.length} domains`);
    return o;
  } catch (e) {
    console.warn(`Open PageRank failed: ${String(e?.message ?? e).slice(0, 120)}`);
    return {};
  }
}

// GA4 traffic (Analytics Data API). Never throws: a missing scope or access
// shows up as { propertyId, error } so the rest of the report still goes out.
async function ga4(propertyId) {
  try {
    const url = `https://analyticsdata.googleapis.com/v1beta/properties/${propertyId}:runReport`;
    const [a, b] = await Promise.all([
      g(url, { dateRanges: [{ startDate: '90daysAgo', endDate: 'yesterday' }], dimensions: [{ name: 'date' }], metrics: [{ name: 'sessions' }, { name: 'activeUsers' }, { name: 'screenPageViews' }], orderBys: [{ dimension: { dimensionName: 'date' } }], limit: 100 }),
      g(url, { dateRanges: [{ startDate: '28daysAgo', endDate: 'yesterday' }], dimensions: [{ name: 'pagePath' }], metrics: [{ name: 'screenPageViews' }, { name: 'activeUsers' }], orderBys: [{ metric: { metricName: 'screenPageViews' }, desc: true }], limit: 25 }),
    ]);
    const bad = a.error || b.error;
    if (bad) return { propertyId, error: `${bad.code ?? ''} ${String(bad.message ?? 'error').slice(0, 120)}`.trim() };
    const n = (r, i) => Number(r.metricValues?.[i]?.value ?? 0);
    const daily = (a.rows ?? []).map((r) => {
      const d = r.dimensionValues[0].value;
      return { date: `${d.slice(0, 4)}-${d.slice(4, 6)}-${d.slice(6, 8)}`, sessions: n(r, 0), users: n(r, 1), pageviews: n(r, 2) };
    });
    const total = (rows) => ({ sessions: rows.reduce((x, r) => x + r.sessions, 0), users: rows.reduce((x, r) => x + r.users, 0), pageviews: rows.reduce((x, r) => x + r.pageviews, 0) });
    const topPages = (b.rows ?? []).map((r) => ({ path: r.dimensionValues[0].value, pageviews: n(r, 0), users: n(r, 1) }));
    const out = { propertyId, daily, topPages, totals7: total(daily.slice(-7)), totals28: total(daily.slice(-28)), prev7: total(daily.slice(-14, -7)) };
    const errors = {};
    const R28 = [{ startDate: '28daysAgo', endDate: 'yesterday' }];
    const P28 = [{ startDate: '56daysAgo', endDate: '29daysAgo' }];
    const run = async (name, body, map) => {
      try {
        const r = await g(url, { dateRanges: R28, ...body });
        if (r.error) throw new Error(`${r.error.code ?? ''} ${r.error.message ?? 'error'}`.trim());
        out[name] = map(r.rows ?? []);
      } catch (e) {
        errors[name] = String(e?.message ?? e).slice(0, 120);
      }
    };
    const dim = (r, i) => r.dimensionValues?.[i]?.value ?? '';
    const bySessions = { metric: { metricName: 'sessions' }, desc: true };
    await run('channels', { dimensions: [{ name: 'sessionDefaultChannelGroup' }], metrics: [{ name: 'sessions' }, { name: 'activeUsers' }], orderBys: [bySessions], limit: 15 }, (rows) => rows.map((r) => ({ name: dim(r, 0), sessions: n(r, 0), users: n(r, 1) })));
    await run('sources', { dimensions: [{ name: 'sessionSource' }, { name: 'sessionMedium' }], metrics: [{ name: 'sessions' }], orderBys: [bySessions], limit: 10 }, (rows) => rows.map((r) => ({ name: `${dim(r, 0)} / ${dim(r, 1)}`, sessions: n(r, 0) })));
    await run('devices', { dimensions: [{ name: 'deviceCategory' }], metrics: [{ name: 'sessions' }], orderBys: [bySessions], limit: 10 }, (rows) => rows.map((r) => ({ name: dim(r, 0), sessions: n(r, 0) })));
    await run('cities', { dimensions: [{ name: 'city' }], metrics: [{ name: 'sessions' }], dimensionFilter: { filter: { fieldName: 'country', stringFilter: { matchType: 'EXACT', value: 'South Africa' } } }, orderBys: [bySessions], limit: 15 }, (rows) => rows.map((r) => ({ name: dim(r, 0), sessions: n(r, 0) })));
    await run('landing', { dimensions: [{ name: 'landingPage' }], metrics: [{ name: 'sessions' }], orderBys: [bySessions], limit: 40 }, (rows) => rows.map((r) => ({ path: dim(r, 0), sessions: n(r, 0), type: kindOf(dim(r, 0)) })));
    await run('newVsReturning', { dimensions: [{ name: 'newVsReturning' }], metrics: [{ name: 'activeUsers' }], limit: 5 }, (rows) => {
      const o = { new: 0, returning: 0 };
      for (const r of rows) {
        const k = dim(r, 0);
        if (k === 'new') o.new += n(r, 0);
        else if (k === 'returning') o.returning += n(r, 0);
      }
      return o;
    });
    try {
      const metrics = ['engagementRate', 'averageSessionDuration', 'bounceRate', 'sessions', 'activeUsers'].map((name) => ({ name }));
      const r = await g(url, { dateRanges: [...R28, ...P28], metrics });
      if (r.error) throw new Error(`${r.error.code ?? ''} ${r.error.message ?? 'error'}`.trim());
      // With two date ranges GA adds a "dateRange" dimension to every row.
      const pick = (i) => {
        const row = (r.rows ?? []).find((x) => dim(x, 0) === `date_range_${i}`) ?? (r.rows ?? [])[i] ?? {};
        return { engagementRate: n(row, 0), averageSessionDuration: n(row, 1), bounceRate: n(row, 2), sessions: n(row, 3), users: n(row, 4) };
      };
      out.engagement = { cur: pick(0), prev: pick(1) };
    } catch (e) {
      errors.engagement = String(e?.message ?? e).slice(0, 120);
    }
    await run('byHour', { dimensions: [{ name: 'hour' }], metrics: [{ name: 'sessions' }], limit: 24 }, (rows) => {
      const v = Array(24).fill(0);
      for (const r of rows) if (Number(dim(r, 0)) < 24) v[Number(dim(r, 0))] = n(r, 0);
      return v.map((sessions, hour) => ({ hour, sessions }));
    });
    await run('byWeekday', { dimensions: [{ name: 'dayOfWeek' }], metrics: [{ name: 'sessions' }], limit: 7 }, (rows) => {
      const v = Array(7).fill(0);
      for (const r of rows) if (Number(dim(r, 0)) < 7) v[Number(dim(r, 0))] = n(r, 0);
      return v.map((sessions, day) => ({ day, sessions }));
    });
    await run('events', { dimensions: [{ name: 'eventName' }], metrics: [{ name: 'eventCount' }], orderBys: [{ metric: { metricName: 'eventCount' }, desc: true }], limit: 15 }, (rows) => rows.map((r) => ({ name: dim(r, 0), count: n(r, 0) })));
    if (Object.keys(errors).length) out.errors = errors;
    return out;
  } catch (e) {
    return { propertyId, error: String(e?.message ?? e).slice(0, 120) };
  }
}

const out = { generatedAt: new Date().toISOString(), sites: {}, adsense: null };
const liveDomains = CITIES.map((slug) => JSON.parse(readFileSync(join(ROOT, 'sites', `${slug}.json`), 'utf8'))).filter((x) => x.domainLive).map((x) => x.domain);
const opr = await openPageRank(liveDomains);
for (const slug of CITIES) {
  const site = JSON.parse(readFileSync(join(ROOT, 'sites', `${slug}.json`), 'utf8'));
  if (!site.domainLive) continue;
  const prop = `sc-domain:${site.domain}`;
  const old = prev.sites?.[slug];
  console.log(`${slug}: search analytics…`);
  const a = await analytics(prop, old);
  console.log(`${slug}: ${a.daily.length} days, ${a.pagesSeen.length} days of pages seen.`);
  // The last days in the log, so a drop can be checked without opening Hub Admin.
  if (a.error) console.log(`${slug}: Search Console error: ${a.error}`);
  console.log(`${slug}: data from ${a.daily[0]?.date ?? '-'} to ${a.daily.at(-1)?.date ?? '-'}; last 10 days (date clicks/impressions/pages seen):`);
  const seenOn = new Map(a.pagesSeen.map((p) => [p.date, p.pages]));
  for (const r of a.daily.slice(-10)) console.log(`  ${r.date} ${r.clicks}/${r.impressions}/${seenOn.get(r.date) ?? '-'}`);
  console.log(`${slug}: inspecting pages…`);
  const ins = await inspections(site, prop, old?.inspections);
  console.log(`${slug}: inspected ${ins.inspectedToday ?? 0} pages today (${Object.keys(ins.map).length} of ${ins.sitemapUrls} known).`);
  out.sites[slug] = { property: prop, ...a, sitemapUrls: ins.sitemapUrls, inspections: ins.map, authority: opr[site.domain] ? { openPageRank: opr[site.domain] } : null };
  if (site.googleAnalyticsPropertyId) {
    const ga = await ga4(site.googleAnalyticsPropertyId);
    if (ga.error) console.warn(`${slug}: Google Analytics error: ${ga.error}`);
    else console.log(`${slug}: Google Analytics ${ga.daily.length} days, ${ga.totals7.sessions} sessions in the last 7.`);
    out.sites[slug].analytics = ga;
  }
}
out.adsense = await adsense();
console.log(`AdSense: ${out.adsense.error ?? `${out.adsense.daily.length} rows`}`);
const body = JSON.stringify(out);
console.log(`Report size: ${Math.round(body.length / 1024)} KB`);
const res = await report('POST', out);
if (!res.ok) throw new Error(`Hub Admin returned ${res.status}`);
console.log('Sent to Hub Admin.');
