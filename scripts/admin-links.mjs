#!/usr/bin/env node
// Weekly broken-links report for Hub Admin's Health screen, run by
// .github/workflows/admin-weekly.yml. For each city site:
//   1. every page in the live sitemap is fetched; any that doesn't answer 200
//      is broken, and every internal link on those pages that isn't in the
//      sitemap is checked too;
//   2. every published business's own website (from the database, read with
//      the Cloudflare API) is opened: a website that no longer exists often
//      means the business has closed.
// The result goes to Hub Admin (/api/notify/report?kind=links) with the same
// key as the 5-minute notifier (settings 'notify_key', never printed).
import { readFileSync } from 'node:fs';

const { CLOUDFLARE_API_TOKEN: token, CLOUDFLARE_ACCOUNT_ID: account, ADMIN_URL: adminUrl = 'https://hub-admin-b4x.pages.dev' } = process.env;
if (!token || !account) throw new Error('CLOUDFLARE_API_TOKEN and CLOUDFLARE_ACCOUNT_ID are required.');
const CITIES = ['pretoria', 'polokwane', 'capetown'];
const MAX_PAGES = Number(process.env.MAX_PAGES || 8000);
const UA = 'Mozilla/5.0 (compatible; HubLinkCheck/1.0; +https://hub-admin-b4x.pages.dev)';
const base = `https://api.cloudflare.com/client/v4/accounts/${account}/d1/database`;
const cfHeaders = { Authorization: `Bearer ${token}`, 'Content-Type': 'application/json' };

async function cf(url, init) {
  const res = await fetch(url, { ...init, headers: cfHeaders });
  const body = await res.json().catch(() => ({}));
  if (!res.ok || body.success === false) throw new Error(`Cloudflare API ${res.status}: ${JSON.stringify(body.errors ?? []).slice(0, 300)}`);
  return body.result;
}
const dbs = (await cf(`${base}?per_page=100`)) ?? [];
const dbId = (name) => dbs.find((d) => d.name === name)?.uuid;
const query = async (name, sql) => (await cf(`${base}/${dbId(name)}/query`, { method: 'POST', body: JSON.stringify({ sql }) }))?.[0]?.results ?? [];

async function probe(url, { method = 'GET', timeout = 20000 } = {}) {
  const ctrl = new AbortController();
  const t = setTimeout(() => ctrl.abort(), timeout);
  try {
    const res = await fetch(url, { method, redirect: 'follow', signal: ctrl.signal, headers: { 'User-Agent': UA, Accept: 'text/html,*/*' } });
    const text = method === 'GET' && (res.headers.get('content-type') ?? '').includes('text/html') ? await res.text() : '';
    if (method === 'GET' && !text) await res.body?.cancel().catch(() => {});
    return { status: res.status, text, finalUrl: res.url };
  } catch (e) {
    const code = e?.cause?.code ?? (e?.name === 'AbortError' ? 'TIMEOUT' : 'ERROR');
    return { status: 0, error: code };
  } finally {
    clearTimeout(t);
  }
}

async function pool(items, n, fn) {
  const out = new Array(items.length);
  let i = 0;
  await Promise.all(Array.from({ length: n }, async () => {
    while (i < items.length) {
      const k = i++;
      out[k] = await fn(items[k], k);
    }
  }));
  return out;
}

const locs = (xml) => [...xml.matchAll(/<loc>\s*([^<\s]+)\s*<\/loc>/g)].map((m) => m[1].replace(/&amp;/g, '&'));

async function crawlSite(site) {
  const origin = `https://${site.domain}`;
  const index = await probe(`${origin}/sitemap-index.xml`);
  if (index.status !== 200) return { pages: 0, broken: [{ url: `${origin}/sitemap-index.xml`, status: index.status, error: index.error ?? null, found_on: null }] };
  const maps = locs((await (await fetch(`${origin}/sitemap-index.xml`, { headers: { 'User-Agent': UA } })).text()));
  const urls = new Set();
  for (const m of maps) {
    const r = await fetch(m, { headers: { 'User-Agent': UA } });
    if (!r.ok) continue;
    for (const u of locs(await r.text())) urls.add(u.split('#')[0]);
  }
  const pages = [...urls].slice(0, MAX_PAGES);
  const broken = [];
  const extra = new Map(); // internal link not in the sitemap -> first page it was found on
  await pool(pages, 10, async (url) => {
    const r = await probe(url);
    if (r.status !== 200) broken.push({ url, status: r.status, error: r.error ?? null, found_on: 'sitemap' });
    for (const m of (r.text ?? '').matchAll(/href="([^"#]+)/g)) {
      let u;
      try {
        u = new URL(m[1].replace(/&amp;/g, '&'), url);
      } catch {
        continue;
      }
      if (u.host !== site.domain || u.pathname.startsWith('/api/') || u.pathname.startsWith('/cdn-cgi/')) continue;
      u.hash = '';
      const s = u.toString();
      if (!urls.has(s) && !extra.has(s)) extra.set(s, url);
    }
  });
  await pool([...extra.keys()].slice(0, 3000), 10, async (url) => {
    const r = await probe(url, { method: 'HEAD' });
    // Some function routes don't answer HEAD; confirm with GET before calling it broken.
    const final = r.status === 405 || r.status === 0 ? await probe(url) : r;
    if (final.status >= 400 || final.status === 0) broken.push({ url, status: final.status, error: final.error ?? null, found_on: extra.get(url) });
  });
  return { pages: pages.length, internal_links_checked: extra.size, broken: broken.slice(0, 300) };
}

async function checkWebsites(site) {
  const list = await query(site.dbName, `SELECT slug, name, website FROM businesses WHERE status = 'published' AND website IS NOT NULL AND website != '' ORDER BY id`);
  const dead = [];
  await pool(list, 12, async (b) => {
    let url = b.website.trim();
    if (!/^https?:\/\//i.test(url)) url = `https://${url}`;
    let r = await probe(url, { timeout: 15000 });
    if (r.status === 0 && url.startsWith('https://')) r = await probe(url.replace('https://', 'http://'), { timeout: 15000 });
    // 401/403/429/503 usually mean a bot wall, not a dead site: not reported.
    const gone = r.status === 0 || r.status === 404 || r.status === 410 || (r.status >= 500 && r.status !== 503);
    if (gone) dead.push({ slug: b.slug, name: b.name, website: b.website, status: r.status, error: r.error ?? null, url: `https://${site.domain}/business/${b.slug}/` });
  });
  return { checked: list.length, dead: dead.sort((a, b) => a.name.localeCompare(b.name)).slice(0, 500) };
}

const report = { checked_at: new Date().toISOString(), sites: {} };
for (const slug of CITIES) {
  const site = JSON.parse(readFileSync(`sites/${slug}.json`, 'utf8'));
  console.log(`${slug}: crawling ${site.domain}…`);
  const pages = await crawlSite(site);
  console.log(`${slug}: ${pages.pages} pages, ${pages.broken.length} broken. Checking business websites…`);
  const websites = await checkWebsites(site).catch((e) => ({ checked: 0, dead: [], error: e.message }));
  console.log(`${slug}: ${websites.checked} websites, ${websites.dead.length} not answering.`);
  report.sites[slug] = { ...pages, websites };
}

await cf(`${base}/${dbId('hub-admin-db')}/query`, { method: 'POST', body: JSON.stringify({ sql: `INSERT OR IGNORE INTO settings (key, value) VALUES ('notify_key', lower(hex(randomblob(32))))` }) });
const key = (await query('hub-admin-db', `SELECT value FROM settings WHERE key = 'notify_key'`))[0]?.value;
if (!key) throw new Error('Could not read the notify key.');
if (process.env.GITHUB_ACTIONS) console.log(`::add-mask::${key}`);
const res = await fetch(`${adminUrl}/api/notify/report?kind=links`, { method: 'POST', headers: { 'X-Hub-Admin': '1', 'X-Notify-Key': key, 'Content-Type': 'application/json' }, body: JSON.stringify(report) });
if (!res.ok) throw new Error(`Hub Admin returned ${res.status}`);
console.log('Report sent to Hub Admin.');
