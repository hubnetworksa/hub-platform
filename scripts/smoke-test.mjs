#!/usr/bin/env node
// Browser smoke test: opens every kind of page the site has at desktop and
// phone width and fails on a bad status, a JavaScript error, or sideways
// scrolling on the phone.
//
//   SITE=capetown npx astro build --outDir .build-check
//   node scripts/serve-dir.mjs .build-check --port 4321      (in another terminal)
//   node scripts/smoke-test.mjs http://localhost:4321
//   node scripts/smoke-test.mjs https://ethan-kp7p.polokwanehub-49u.pages.dev \
//     --email owner@x --password ... --admin-email admin@admin.com --admin-password ...
//
// Needs Playwright in the environment (`npm i` then `npx playwright install
// chromium`). Works against a plain static server: failed /api/ calls (a
// static server answers them with HTML or a 404) are ignored; everything else
// counts. Pages are considered loaded at DOMContentLoaded (Astro's own scripts
// have run by then; slow third-party ad/analytics scripts are not waited for).
// Detail pages (one business, event, story, guide, suburb ...) are
// discovered from the site's own sitemap, falling back to the list pages.
// With --email/--password the account pages are opened again signed in, and
// with --admin-email/--admin-password every admin page is opened as the
// admin — that needs a live deployment with working /api/ routes.

const argv = process.argv.slice(2);
const opts = {};
const positional = [];
for (let i = 0; i < argv.length; i++) {
  const a = argv[i];
  if (a === '--email') opts.email = argv[++i];
  else if (a === '--password') opts.password = argv[++i];
  else if (a === '--admin-email') opts.adminEmail = argv[++i];
  else if (a === '--admin-password') opts.adminPassword = argv[++i];
  else if (a.startsWith('--')) {
    console.error(`Unknown option ${a}`);
    process.exit(2);
  } else positional.push(a);
}
const base = (positional[0] || '').replace(/\/$/, '');
if (!base) {
  console.error('Usage: node scripts/smoke-test.mjs <base-url> [--email X --password Y] [--admin-email A --admin-password B]');
  process.exit(2);
}

let chromium;
try {
  ({ chromium } = await import('playwright'));
} catch {
  console.error('Playwright is not installed. Run `npm i` (then `npx playwright install chromium`) and try again.');
  process.exit(2);
}

// Every static route the site has, grouped by who should see it.
const PUBLIC_ROUTES = [
  '/', '/search/', '/suburb/', '/category/', '/shopping-center/', '/events/', '/guides/', '/tourism/',
  '/news/', '/pricing/', '/advertise/', '/partners/', '/about/', '/contact/', '/privacy/', '/terms/', '/404.html',
  '/list-your-business/', '/list-your-business/contact/', '/list-your-business/review/', '/list-your-business/checkout/',
  '/report-listing/', '/request-removal/', '/login/', '/register/', '/forgot-password/', '/reset-password/',
];
// Pages that need an account to show their real content. They are opened
// signed out too (they must still render, with a sign-in prompt).
const ACCOUNT_ROUTES = [
  '/events/add/', '/my-businesses/', '/my-businesses/claim/', '/my-businesses/edit/', '/my-businesses/sponsor/',
  '/my-events/', '/my-events/claim/', '/my-events/edit/',
];
const ADMIN_ROUTES = [
  '/admin/', '/admin/activity/', '/admin/ads-sponsors/', '/admin/analytics/', '/admin/businesses/', '/admin/claims/',
  '/admin/enquiries/', '/admin/events/', '/admin/inventory/', '/admin/invoices/', '/admin/news/', '/admin/plans-pricing/',
  '/admin/reports/', '/admin/reviews/', '/admin/settings/', '/admin/submissions/', '/admin/users/',
];
// One detail page of each kind, found from the sitemap (or the list page).
const DETAIL_KINDS = [
  { prefix: '/business/', listPage: '/search/' },
  { prefix: '/events/', listPage: '/events/', skip: ['/events/add/'] },
  { prefix: '/news/', listPage: '/news/' },
  { prefix: '/guides/', listPage: '/guides/' },
  { prefix: '/tourism/', listPage: '/tourism/', skip: ['/tourism/itineraries/'] },
  { prefix: '/tourism/itineraries/', listPage: '/tourism/' },
  { prefix: '/suburb/', listPage: '/suburb/' },
  { prefix: '/category/', listPage: '/category/' },
  { prefix: '/shopping-center/', listPage: '/shopping-center/' },
  { prefix: '/section/', listPage: '/' },
];
const NOT_FOUND_ROUTE = '/this-page-does-not-exist-smoke-test/';

async function text(url) {
  try {
    const res = await fetch(url, { signal: AbortSignal.timeout(30000) });
    return res.ok ? await res.text() : '';
  } catch {
    return '';
  }
}

async function discoverDetailPages() {
  const found = [];
  const sitemap = await text(`${base}/sitemap-0.xml`);
  const sitemapPaths = [...sitemap.matchAll(/<loc>([^<]+)<\/loc>/g)].map((m) => {
    try {
      return new URL(m[1]).pathname;
    } catch {
      return '';
    }
  });
  for (const kind of DETAIL_KINDS) {
    const isDetail = (p) => p.startsWith(kind.prefix) && p.length > kind.prefix.length && !(kind.skip ?? []).some((s) => p.startsWith(s))
      // a detail page is exactly one segment deeper than its prefix
      && p.slice(kind.prefix.length).replace(/\/$/, '').split('/').length === 1;
    let pick = sitemapPaths.find(isDetail);
    if (!pick) {
      const html = await text(`${base}${kind.listPage}`);
      pick = [...html.matchAll(/href="(\/[^"#?]+\/)"/g)].map((m) => m[1]).find(isDetail);
    }
    if (pick) found.push(pick);
    else console.log(`note: no ${kind.prefix}<slug>/ page found (sitemap or ${kind.listPage}) — skipped`);
  }
  return found;
}

const detailRoutes = await discoverDetailPages();
const browser = await chromium.launch();
let failures = 0;
let checked = 0;

// Signs a fresh context in through the same API the login page uses. Returns
// null (and says why) when that is not possible, e.g. against a static server.
async function signedInContext(email, password, label) {
  const context = await browser.newContext();
  const res = await context.request.post(`${base}/api/login`, { data: { email, password } }).catch(() => null);
  let body = null;
  try {
    body = res ? await res.json() : null;
  } catch {
    body = null;
  }
  if (!res || !body?.ok) {
    console.log(`note: ${label} sign-in unavailable (${res ? `HTTP ${res.status}` : 'no response'}${body?.error ? `: ${body.error}` : ''}) — ${label} pages checked signed out only`);
    await context.close();
    return null;
  }
  return context;
}

async function check(context, route, width, { expectStatus = 200, label = '' } = {}) {
  // The viewport is set per page: context.newPage() takes no options.
  const page = await context.newPage();
  await page.setViewportSize({ width, height: 900 });
  const errors = [];
  page.on('pageerror', (e) => {
    if (!/is not valid JSON|Unexpected token '<'|Failed to fetch/.test(e.message)) errors.push(e.message);
  });
  const res = await page.goto(base + route, { waitUntil: 'domcontentloaded', timeout: 45000 }).catch(() => null);
  await page.waitForTimeout(500);
  const status = res ? res.status() : 'no response';
  const scrollWidth = await page.evaluate(() => document.documentElement.scrollWidth).catch(() => 0);
  const problems = [];
  if (expectStatus !== null && status !== expectStatus) problems.push(`status ${status}${expectStatus !== 200 ? ` (expected ${expectStatus})` : ''}`);
  if (width === 390 && scrollWidth > 390) problems.push(`sideways scroll (${scrollWidth}px)`);
  if (errors.length) problems.push(`JS error: ${errors[0]}`);
  checked++;
  if (checked % 25 === 0) console.log(`... ${checked} page loads done`);
  if (problems.length) {
    failures++;
    console.log(`FAIL ${width}px ${route}${label ? ` [${label}]` : ''}: ${problems.join('; ')}`);
  }
  await page.close();
}

const publicContext = await browser.newContext();
const ownerContext = opts.email && opts.password ? await signedInContext(opts.email, opts.password, 'owner') : null;
const adminContext = opts.adminEmail && opts.adminPassword ? await signedInContext(opts.adminEmail, opts.adminPassword, 'admin') : null;

for (const width of [1280, 390]) {
  for (const route of [...PUBLIC_ROUTES, ...detailRoutes, ...ACCOUNT_ROUTES, ...ADMIN_ROUTES]) {
    // /404.html is the error page itself; a host may serve it with either status.
    await check(publicContext, route, width, { expectStatus: route === '/404.html' ? null : 200 });
  }
  await check(publicContext, NOT_FOUND_ROUTE, width, { expectStatus: 404 });
  if (ownerContext) for (const route of ACCOUNT_ROUTES) await check(ownerContext, route, width, { label: 'signed in' });
  if (adminContext) for (const route of ADMIN_ROUTES) await check(adminContext, route, width, { label: 'admin' });
}

await browser.close();
console.log(failures ? `\n${failures} failure(s) in ${checked} page loads.` : `\nAll ${checked} page loads OK at 1280px and 390px.`);
process.exit(failures ? 1 : 0);
