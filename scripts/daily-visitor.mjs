#!/usr/bin/env node
// Daily visitor: once a day, at a random time, opens a handful of real pages
// on each live site in a real browser, through a different outgoing IP each
// day, and fails when a page doesn't load. It is a reachability check from
// the outside world (different networks see different CDN edges and caches),
// not a fake audience:
//
//   - it says what it is: the User-Agent ends in "HubDailyVisitor/1.0";
//   - it never loads Google Analytics, AdSense or any other ad/analytics
//     script, and never calls /api/track-view or /api/app-event, so it can't
//     show up in Analytics, earn an ad impression (which AdSense treats as
//     invalid traffic) or add a "Profile view" to an owner's dashboard;
//   - it also carries the hub_admin=1 cookie the site already uses to keep
//     its own people out of Analytics.
//
//   node scripts/daily-visitor.mjs                      all sites, right now
//   node scripts/daily-visitor.mjs --site capetown      one site
//   node scripts/daily-visitor.mjs --due                only sites whose random
//                                                       hour today is this hour
//   node scripts/daily-visitor.mjs --due --list         print the due sites only
//
// Each site's random time comes from the date and the site name, so it is a
// different hour every day but the same all day long - the hourly workflow
// (.github/workflows/daily-visitor.yml) can ask "is it this site's hour yet?"
// and get one visit per site per day. Within that hour the visit waits a
// random number of minutes (skip with --no-wait).
//
// Different IP each time: set VISITOR_PROXIES to one proxy URL per line
// (http://user:pass@host:port or socks5://host:port). Each site gets a
// different proxy, and the assignment moves along by one every day, so no
// site is visited from the same address two days running. Without proxies
// the visit goes out from the machine's own address (on GitHub Actions that
// is a shared runner address that usually changes from run to run, but
// isn't guaranteed to).

import { readFileSync, readdirSync } from 'node:fs';
import { createHash } from 'node:crypto';

const argv = process.argv.slice(2);
const opts = { due: false, list: false, wait: true, site: null };
for (let i = 0; i < argv.length; i++) {
  const a = argv[i];
  if (a === '--due') opts.due = true;
  else if (a === '--list') opts.list = true;
  else if (a === '--no-wait') opts.wait = false;
  else if (a === '--site') opts.site = argv[++i];
  else {
    console.error(`Unknown option ${a}`);
    process.exit(2);
  }
}

const PAGES_PER_VISIT = 4;
const USER_AGENT_SUFFIX = 'HubDailyVisitor/1.0 (+https://github.com/hubnetworksa/hub-platform)';
// Requests the visitor never makes: analytics, ads and the site's own
// first-party counters.
const BLOCKED = [
  /googletagmanager\.com/, /google-analytics\.com/, /googlesyndication\.com/, /doubleclick\.net/,
  /adservice\.google\./, /googleadservices\.com/, /fundingchoicesmessages\.google\.com/,
  /static\.cloudflareinsights\.com/, /\/api\/track-view/, /\/api\/app-event/,
];

const sites = readdirSync(new URL('../sites/', import.meta.url))
  .filter((f) => f.endsWith('.json'))
  .map((f) => ({ name: f.replace(/\.json$/, ''), ...JSON.parse(readFileSync(new URL(`../sites/${f}`, import.meta.url), 'utf8')) }))
  .filter((s) => s.domain && (!opts.site || s.name === opts.site));
if (!sites.length) {
  console.error(opts.site ? `No site called ${opts.site}` : 'No sites found in sites/');
  process.exit(2);
}

const now = new Date();
const today = now.toISOString().slice(0, 10);
const dayNumber = Math.floor(now.getTime() / 86_400_000);
const seeded = (key) => createHash('sha256').update(key).digest().readUInt32BE(0);
const visitHour = (site) => seeded(`${today}:${site.name}`) % 24;

const due = opts.due ? sites.filter((s) => visitHour(s) === now.getUTCHours()) : sites;
if (opts.list) {
  console.log(due.map((s) => s.name).join(' '));
  process.exit(0);
}
if (!due.length) {
  console.log(`No site is due at ${now.getUTCHours()}:00 UTC. Today's hours: ${sites.map((s) => `${s.name} ${visitHour(s)}:00`).join(', ')}`);
  process.exit(0);
}

const proxies = (process.env.VISITOR_PROXIES || '').split(/\r?\n/).map((l) => l.trim()).filter((l) => l && !l.startsWith('#'));

let chromium;
try {
  ({ chromium } = await import('playwright'));
} catch {
  console.error('Playwright is not installed. Run `npm i` (then `npx playwright install chromium`) and try again.');
  process.exit(2);
}

const random = (n) => Math.floor(Math.random() * n);
const pause = (ms) => new Promise((r) => setTimeout(r, ms));

// Playwright wants the proxy's credentials apart from its address.
function playwrightProxy(url) {
  const u = new URL(url);
  const proxy = { server: `${u.protocol}//${u.host}` };
  if (u.username) proxy.username = decodeURIComponent(u.username);
  if (u.password) proxy.password = decodeURIComponent(u.password);
  return proxy;
}

async function pagesToVisit(base, request) {
  let paths = [];
  try {
    const res = await request.get(`${base}/sitemap-0.xml`, { timeout: 30_000 });
    if (res.ok()) paths = [...(await res.text()).matchAll(/<loc>([^<]+)<\/loc>/g)].map((m) => new URL(m[1]).pathname);
  } catch {}
  const picked = ['/'];
  while (picked.length < PAGES_PER_VISIT && paths.length) picked.push(paths.splice(random(paths.length), 1)[0]);
  return [...new Set(picked)];
}

if (opts.wait && opts.due) {
  const minutes = random(50);
  console.log(`Waiting ${minutes} minutes before visiting ${due.map((s) => s.name).join(', ')}`);
  await pause(minutes * 60_000);
}

const browser = await chromium.launch();
const defaultUA = (await (await browser.newPage()).evaluate(() => navigator.userAgent)).replace('HeadlessChrome', 'Chrome');
let failures = 0;

for (const site of due) {
  const index = sites.findIndex((s) => s.name === site.name);
  const proxyUrl = proxies.length ? proxies[(dayNumber + index) % proxies.length] : null;
  const base = `https://${site.domain}`;
  const context = await browser.newContext({
    userAgent: `${defaultUA} ${USER_AGENT_SUFFIX}`,
    proxy: proxyUrl ? playwrightProxy(proxyUrl) : undefined,
    viewport: Math.random() < 0.5 ? { width: 1366, height: 820 } : { width: 390, height: 844 },
  });
  await context.addCookies([{ name: 'hub_admin', value: '1', domain: site.domain, path: '/' }]);
  await context.route('**/*', (route) => (BLOCKED.some((re) => re.test(route.request().url())) ? route.abort() : route.continue()));

  let ip = 'unknown';
  try {
    ip = (await (await context.request.get('https://api.ipify.org', { timeout: 20_000 })).text()).trim();
  } catch {}
  console.log(`\n${site.name} (${base}) from ${ip}${proxyUrl ? ` via proxy ${new URL(proxyUrl).host}` : ' (no proxy)'}`);

  const page = await context.newPage();
  for (const path of await pagesToVisit(base, context.request)) {
    const started = Date.now();
    try {
      const res = await page.goto(base + path, { waitUntil: 'domcontentloaded', timeout: 45_000 });
      const status = res?.status() ?? 0;
      const ok = status > 0 && status < 400;
      if (!ok) failures++;
      console.log(`  ${ok ? 'ok  ' : 'FAIL'} ${status} ${path} (${Date.now() - started} ms)`);
    } catch (err) {
      failures++;
      console.log(`  FAIL ${path}: ${err.message.split('\n')[0]}`);
    }
    await pause(3_000 + random(12_000));
  }
  await context.close();
}

await browser.close();
if (failures) {
  console.error(`\n${failures} page(s) failed to load.`);
  process.exit(1);
}
