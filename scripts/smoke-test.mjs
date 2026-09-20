#!/usr/bin/env node
// Browser smoke test: opens the key pages of a running site at desktop and
// phone width and fails on a bad status, a JavaScript error, or sideways
// scrolling on the phone.
//
//   SITE=capetown npx astro build --outDir .build-check
//   npx --yes serve .build-check -l 4321        (in another terminal)
//   node scripts/smoke-test.mjs http://localhost:4321
//
// Needs Playwright in the environment (`npm i -D playwright` once, or run it from
// somewhere that has it). Works against a plain static server: failed /api/ calls
// (a static server answers them with HTML) are ignored; everything else counts.

const base = (process.argv[2] || '').replace(/\/$/, '');
if (!base) {
  console.error('Usage: node scripts/smoke-test.mjs <base-url>');
  process.exit(2);
}

let chromium;
try {
  ({ chromium } = await import('playwright'));
} catch {
  console.error('Playwright is not installed. Run `npm i -D playwright` (then `npx playwright install chromium`) and try again.');
  process.exit(2);
}

const ROUTES = [
  '/', '/search/', '/suburb/', '/suburb/map/', '/category/', '/shopping-center/', '/events/', '/events/add/', '/guides/',
  '/news/', '/pricing/', '/advertise/', '/about/', '/contact/', '/privacy/', '/terms/', '/404.html',
  '/list-your-business/', '/list-your-business/contact/', '/list-your-business/review/', '/list-your-business/checkout/',
  '/my-businesses/', '/my-businesses/claim/', '/my-businesses/edit/', '/report-listing/', '/request-removal/',
  '/admin/', '/admin/businesses/', '/admin/events/', '/admin/news/', '/admin/enquiries/', '/admin/settings/',
  '/admin/inventory/', '/admin/invoices/', '/admin/analytics/', '/admin/users/', '/admin/plans-pricing/', '/admin/ads-sponsors/',
  '/admin/submissions/', '/admin/claims/',
];

const browser = await chromium.launch();
let failures = 0;
for (const width of [1280, 390]) {
  for (const route of ROUTES) {
    const page = await browser.newPage({ viewport: { width, height: 900 } });
    const errors = [];
    page.on('pageerror', (e) => {
      if (!/is not valid JSON|Unexpected token '<'/.test(e.message)) errors.push(e.message);
    });
    const res = await page.goto(base + route, { waitUntil: 'load', timeout: 45000 }).catch(() => null);
    await page.waitForTimeout(250);
    const status = res ? res.status() : 'no response';
    const scrollWidth = await page.evaluate(() => document.documentElement.scrollWidth).catch(() => 0);
    const problems = [];
    if (route !== '/404.html' && status !== 200) problems.push(`status ${status}`);
    if (width === 390 && scrollWidth > 390) problems.push(`sideways scroll (${scrollWidth}px)`);
    if (errors.length) problems.push(`JS error: ${errors[0]}`);
    if (problems.length) {
      failures++;
      console.log(`FAIL ${width}px ${route}: ${problems.join('; ')}`);
    }
    await page.close();
  }
}
await browser.close();
console.log(failures ? `\n${failures} failure(s).` : `\nAll ${ROUTES.length} pages OK at 1280px and 390px.`);
process.exit(failures ? 1 : 0);
