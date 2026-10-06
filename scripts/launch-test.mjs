#!/usr/bin/env node
// Launch test: drives every Pages Function under functions/api/** on a LIVE
// deployment (preview or production) the way the site's own pages do, and
// cleans up after itself.
//
//   node scripts/launch-test.mjs --base https://ethan-kp7p.polokwanehub-49u.pages.dev \
//     [--admin-email admin@admin.com --admin-password ...] [--admin-session <token>] \
//     [--cron-secret ...] [--keep] [--json out.json] [--allow-production]
//
// What it does, in order:
//   1. Enumerates every route file under functions/api/** so the coverage
//      table at the end can prove nothing was missed.
//   2. Static/meta routes (search-index, sitemap, robots, manifest, service
//      worker), weather, track-view, the public search endpoints.
//   3. One disposable account (launch-test-<ts>@example.invalid): register,
//      /api/me, logout, re-login, forgot-password, reset-password refusal.
//   4. Public forms with legitimate anti-spam fields (honeypot empty,
//      loadedAt old enough): contact, report-listing, request-removal, a
//      "LAUNCH TEST BUSINESS <ts>" submission, two "LAUNCH TEST EVENT"
//      submissions. Every created row is named LAUNCH TEST so it can be
//      found again.
//   5. Owner endpoints that need nothing created yet (403/400/401 paths).
//   6. With admin credentials: every admin GET, approval of the test
//      submission (via /api/confirm-listing, the same token-based step the
//      admin dashboard uses), claim + review-claim, review moderation,
//      owner edits, photo gating, PayFast checkout (asserting the redirect
//      host + signature only, never following it), hide/unhide, event
//      approve/reject, message close/delete, report resolve.
//   7. Cleanup (unless --keep) through the admin delete endpoints, then a
//      check that nothing named LAUNCH TEST is left behind.
//
// Dependency-free: Node 24's global fetch and a small cookie jar. Nothing
// here follows a PayFast redirect, forges an ITN, or touches the database
// directly. Cookies and passwords are never printed.
//
// Exit code 1 on any failure (a 5xx is always a failure, a 429 means the
// per-IP rate limit was hit — wait an hour and run again).

import { readdirSync, readFileSync } from 'node:fs';
import { writeFile } from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = path.join(path.dirname(fileURLToPath(import.meta.url)), '..');
const PAYFAST_HOSTS = new Set(['sandbox.payfast.co.za', 'www.payfast.co.za']);
const TEST_PREFIX = 'LAUNCH TEST';

// ---------------------------------------------------------------- arguments

function usage(code) {
  console.error(
    'Usage: node scripts/launch-test.mjs --base <url> [--admin-email X --admin-password Y | --admin-session <token>]\n' +
      '           [--cron-secret S] [--keep] [--json out.json] [--allow-production]'
  );
  process.exit(code);
}

function parseArgs(argv) {
  const out = { keep: false, allowProduction: false };
  for (let i = 0; i < argv.length; i++) {
    const a = argv[i];
    const next = () => {
      if (i + 1 >= argv.length) usage(2);
      return argv[++i];
    };
    if (a === '--base') out.base = next();
    else if (a === '--admin-email') out.adminEmail = next();
    else if (a === '--admin-password') out.adminPassword = next();
    else if (a === '--admin-session') out.adminSession = next();
    else if (a === '--cron-secret') out.cronSecret = next();
    else if (a === '--keep') out.keep = true;
    else if (a === '--json') out.json = next();
    else if (a === '--allow-production') out.allowProduction = true;
    else if (a === '--help' || a === '-h') usage(0);
    else {
      console.error(`Unknown argument: ${a}`);
      usage(2);
    }
  }
  if (!out.base || !/^https?:\/\//.test(out.base)) usage(2);
  out.base = out.base.replace(/\/+$/, '');
  return out;
}

const args = parseArgs(process.argv.slice(2));
const base = args.base;
const baseHost = new URL(base).hostname;

// Refuse a production domain unless explicitly allowed: the run creates
// rows (hidden from the public site, but real) and sends real emails to the
// site's contact address.
{
  const sitesDir = path.join(ROOT, 'sites');
  const prodHosts = new Set();
  for (const f of readdirSync(sitesDir)) {
    if (!f.endsWith('.json')) continue;
    const s = JSON.parse(readFileSync(path.join(sitesDir, f), 'utf8'));
    if (s.domain) {
      prodHosts.add(s.domain);
      prodHosts.add(`www.${s.domain}`);
    }
  }
  if (prodHosts.has(baseHost) && !args.allowProduction) {
    console.error(`${baseHost} is a production domain. Re-run with --allow-production if you really mean it.`);
    process.exit(2);
  }
}

// ---------------------------------------------------------------- coverage

function enumerateRoutes() {
  const routes = [];
  (function walk(dir, prefix) {
    for (const e of readdirSync(dir, { withFileTypes: true }).sort((a, b) => a.name.localeCompare(b.name))) {
      if (e.isDirectory()) walk(path.join(dir, e.name), `${prefix}/${e.name}`);
      else if (e.name.endsWith('.ts') && !e.name.startsWith('_')) {
        routes.push(`${prefix}/${e.name.replace(/\.ts$/, '').replace(/^\[\[?(.+?)\]?\]$/, '*')}`);
      }
    }
  })(path.join(ROOT, 'functions', 'api'), '/api');
  return routes;
}

const coverage = new Map(enumerateRoutes().map((r) => [r, { state: 'untested', note: '' }]));

function routeOf(pathname) {
  return pathname.split('?')[0];
}

function markTested(pathname, note) {
  const route = routeOf(pathname);
  const c = coverage.get(route);
  if (!c) return;
  if (c.state !== 'tested') {
    c.state = 'tested';
    c.note = note ?? '';
  } else if (note && !c.note) c.note = note;
}

function markSkipped(route, reason) {
  const c = coverage.get(route);
  if (c && c.state === 'untested') {
    c.state = 'skipped';
    c.note = reason;
  }
}

// ---------------------------------------------------------------- http

class CookieJar {
  #cookies = new Map();

  absorb(res) {
    const list = typeof res.headers.getSetCookie === 'function' ? res.headers.getSetCookie() : [];
    for (const raw of list) {
      const [pair, ...attrs] = raw.split(';');
      const eq = pair.indexOf('=');
      if (eq < 0) continue;
      const name = pair.slice(0, eq).trim();
      const value = pair.slice(eq + 1).trim();
      const maxAge = attrs.map((s) => s.trim().toLowerCase()).find((s) => s.startsWith('max-age='));
      if (value === '' || (maxAge && Number(maxAge.slice(8)) <= 0)) this.#cookies.delete(name);
      else this.#cookies.set(name, value);
    }
  }

  set(name, value) {
    this.#cookies.set(name, value);
  }

  has(name) {
    return this.#cookies.has(name);
  }

  header() {
    return [...this.#cookies].map(([k, v]) => `${k}=${v}`).join('; ');
  }

  clear() {
    this.#cookies.clear();
  }
}

async function hit(jar, method, pathname, opts = {}) {
  const headers = { ...(opts.headers ?? {}) };
  let body;
  if (opts.json !== undefined) {
    headers['Content-Type'] = 'application/json';
    body = JSON.stringify(opts.json);
  } else if (opts.form) {
    body = new URLSearchParams(opts.form);
  } else if (opts.multipart) {
    body = opts.multipart;
  } else if (opts.body !== undefined) {
    body = opts.body;
  }
  const cookie = jar?.header();
  if (cookie) headers.Cookie = cookie;

  const t0 = performance.now();
  let res;
  let text = '';
  try {
    res = await fetch(base + pathname, {
      method,
      headers,
      body,
      redirect: opts.redirect ?? 'follow',
      signal: AbortSignal.timeout(opts.timeoutMs ?? 60_000),
    });
    text = await res.text();
  } catch (err) {
    return { method, path: pathname, status: 0, ms: Math.round(performance.now() - t0), text: '', error: String(err?.message ?? err), headers: new Headers(), contentType: '' };
  }
  jar?.absorb(res);
  const contentType = res.headers.get('content-type') ?? '';
  let json;
  if (/json/i.test(contentType)) {
    try {
      json = JSON.parse(text);
    } catch {
      json = undefined;
    }
  }
  return { method, path: pathname, status: res.status, ms: Math.round(performance.now() - t0), text, json, headers: res.headers, contentType };
}

// ---------------------------------------------------------------- bookkeeping

const results = [];
let passed = 0;
let failed = 0;
let skipped = 0;
const created = { email: null, businessName: null, businessId: null, businessSlug: null, submissionId: null, eventSlug: null, eventId: null, eventTitles: [] };
const leftovers = []; // things the run could not remove, with the SQL to do it by hand

function trunc(s, n = 90) {
  s = String(s ?? '').replace(/\s+/g, ' ').trim();
  return s.length > n ? s.slice(0, n - 1) + '…' : s;
}

function logLine(method, pathname, status, ms, pass, note) {
  console.log(`${method.padEnd(6)} ${pathname} → ${status} (${ms}ms) ${pass ? '✓' : '✗'}${note ? ' ' + note : ''}`);
}

/**
 * Perform one request and judge it. `judge(r)` returns true, a failure
 * reason string, or {pass, note}. A 5xx or a failed request is always a
 * failure, except a status listed in `opts.tolerate` (a 503 "not
 * configured" that the judge wants to explain). Every call logs exactly one line.
 */
async function step(jar, method, pathname, opts, judge, label) {
  const r = await hit(jar, method, pathname, opts);
  let pass;
  let note;
  if (r.status === 0) {
    pass = false;
    note = `request failed: ${r.error}`;
  } else if (r.status >= 500 && !(opts.tolerate ?? []).includes(r.status)) {
    pass = false;
    note = `server error ${r.status}: ${trunc(r.json?.error ?? r.text, 80)}`;
  } else if (r.status === 429) {
    pass = false;
    note = `rate limited — ${trunc(r.json?.error ?? 'per-IP limit hit; wait an hour and run again')}`;
  } else {
    let verdict;
    try {
      verdict = judge ? judge(r) : true;
    } catch (err) {
      verdict = `judge threw: ${err?.message ?? err}`;
    }
    if (verdict === true) {
      pass = true;
      note = label ?? (r.json?.error ? `"${trunc(r.json.error, 70)}"` : '');
    } else if (typeof verdict === 'string') {
      pass = false;
      note = verdict + (r.json?.error ? ` — "${trunc(r.json.error, 70)}"` : '');
    } else {
      pass = Boolean(verdict?.pass);
      note = verdict?.note ?? '';
    }
  }
  if (pass) passed++;
  else failed++;
  logLine(method, pathname, r.status, r.ms, pass, note);
  results.push({ method, path: pathname, status: r.status, ms: r.ms, pass, note });
  markTested(pathname, pass ? '' : 'FAILED: ' + trunc(note, 60));
  return r;
}

function skip(route, reason) {
  skipped++;
  console.log(`SKIP   ${route} — ${reason}`);
  markSkipped(route, reason);
  results.push({ method: 'SKIP', path: route, status: null, ms: 0, pass: null, note: reason });
}

function fail(what, reason) {
  failed++;
  console.log(`FAIL   ${what} ✗ ${reason}`);
  results.push({ method: 'CHECK', path: what, status: null, ms: 0, pass: false, note: reason });
}

function ok(what, note = '') {
  passed++;
  console.log(`CHECK  ${what} ✓ ${note}`);
  results.push({ method: 'CHECK', path: what, status: null, ms: 0, pass: true, note });
}

function heading(title) {
  console.log(`\n== ${title}`);
}

async function section(title, fn) {
  heading(title);
  try {
    await fn();
  } catch (err) {
    fail(title, `aborted: ${err?.stack ?? err}`);
  }
}

// Judges.
const status = (want, extra) => (r) => {
  const wanted = Array.isArray(want) ? want : [want];
  if (!wanted.includes(r.status)) return `expected ${wanted.join('/')}, got ${r.status}`;
  return extra ? extra(r) : true;
};
const okJson = (extra) => (r) => {
  if (r.status !== 200) return `expected 200, got ${r.status}`;
  if (!r.json || r.json.ok !== true) return 'expected JSON {ok:true}';
  return extra ? extra(r) : true;
};
const refused = (want) => (r) => {
  const wanted = Array.isArray(want) ? want : [want];
  if (!wanted.includes(r.status)) return `expected ${wanted.join('/')}, got ${r.status}`;
  if (r.json && r.json.ok !== false) return 'expected JSON {ok:false}';
  return true;
};
const contentTypeIs = (re) => (r) => {
  if (r.status !== 200) return `expected 200, got ${r.status}`;
  if (!re.test(r.contentType)) return `unexpected content-type "${r.contentType}"`;
  return true;
};
const htmlSaying = (re) => (r) => {
  if (r.status !== 200) return `expected 200, got ${r.status}`;
  if (!/text\/html/.test(r.contentType)) return `expected HTML, got "${r.contentType}"`;
  if (!re.test(r.text)) return `page did not say ${re}`;
  return true;
};
const payfastRedirect = (r) => {
  if (r.status !== 200 || !r.json?.ok || !r.json.redirectUrl) return 'expected {ok:true, redirectUrl}';
  let u;
  try {
    u = new URL(r.json.redirectUrl);
  } catch {
    return 'redirectUrl is not a URL';
  }
  if (!PAYFAST_HOSTS.has(u.hostname)) return `unexpected PayFast host ${u.hostname}`;
  if (!u.searchParams.get('signature')) return 'no signature field in the PayFast redirect';
  if (!u.searchParams.get('m_payment_id')) return 'no m_payment_id in the PayFast redirect';
  return { pass: true, note: `PayFast ${u.hostname}, amount R${u.searchParams.get('amount')}, signature present` };
};

// ---------------------------------------------------------------- the run

const ts = Date.now();
const testEmail = `launch-test-${ts}@example.invalid`;
const testPassword = `Lt-${crypto.randomUUID()}`;
const testBusinessName = `${TEST_PREFIX} BUSINESS ${ts}`;
const testEventTitle = `${TEST_PREFIX} EVENT ${ts}`;
const testEventRejectTitle = `${TEST_PREFIX} EVENT reject ${ts}`;
created.email = testEmail;
created.businessName = testBusinessName;
created.eventTitles = [testEventTitle, testEventRejectTitle];

const anon = new CookieJar(); // never logs in
const user = new CookieJar(); // the disposable account
const admin = new CookieJar(); // the admin, when credentials were given
const haveAdminCreds = Boolean((args.adminEmail && args.adminPassword) || args.adminSession);
let adminReady = false;

// Site data discovered from the public build.
const site = { anyBiz: null, bizId: null, categorySlug: null, suburbSlug: null, suburbName: null };
// loadedAt is what the real form sends (when the page was opened); two
// minutes ago keeps it comfortably past the server's 2–3 s minimum even if
// this machine's clock is a little ahead of Cloudflare's.
const spamOk = () => ({ company_url: '', loadedAt: Date.now() - 120_000 });
const futureDate = (days) => new Date(Date.now() + days * 86_400_000).toISOString().slice(0, 10);

console.log(`Launch test against ${base}`);
console.log(`Disposable account: ${testEmail}`);
console.log(`Admin flows: ${haveAdminCreds ? 'yes' : 'no (pass --admin-email/--admin-password or --admin-session)'}`);
console.log(`Cleanup: ${args.keep ? 'OFF (--keep)' : 'on'}`);

await section('Static and meta routes', async () => {
  // The index is content-hashed (/search-index.<hash>.json); its URL is the
  // preload link on the search page. Packed: { d: rows (n, s, si), s: suburbs }.
  const searchPage = await step(anon, 'GET', '/search/', {}, contentTypeIs(/text\/html/), 'search page');
  const idxUrl = searchPage.text?.match(/href="(\/search-index\.[0-9a-f]+\.json)"/)?.[1];
  if (!idxUrl) fail('search index url', 'no search-index preload link on /search/');
  const idx = idxUrl ? await step(anon, 'GET', idxUrl, {}, contentTypeIs(/json/), 'search index') : { json: null };
  if (Array.isArray(idx.json?.d) && idx.json.d.length) {
    const rows = idx.json.d;
    const withSuburb = rows.find((b) => idx.json.s[b.si]?.s && b.s) ?? rows[0];
    const sub = idx.json.s[withSuburb.si];
    site.anyBiz = withSuburb;
    site.suburbSlug = sub?.s || null;
    site.suburbName = sub?.n || null;
    ok('search-index', `${rows.length} businesses; using "${withSuburb.n}" (${withSuburb.s}) as a real listing`);
  } else {
    fail('search-index', 'empty or not a packed index — later steps need a real business slug');
  }
  const claimIdx = await step(anon, 'GET', '/claim-index.json', {}, contentTypeIs(/json/), 'claim index');
  if (claimIdx.json?.b?.length && site.anyBiz) {
    const row = claimIdx.json.b.find((b) => b.s === site.anyBiz.s) ?? claimIdx.json.b[0];
    site.bizId = row?.id ?? null;
  }
  const cat = await step(anon, 'GET', '/category/', {}, contentTypeIs(/text\/html/), 'category index page');
  const catSlugs = [...new Set([...cat.text.matchAll(/href="\/category\/([a-z0-9-]+)\/"/g)].map((m) => m[1]))];
  if (catSlugs.length) {
    site.categorySlug = catSlugs[0];
    ok('category slug discovery', `${catSlugs.length} categories; using "${site.categorySlug}"`);
  } else fail('category slug discovery', 'no /category/<slug>/ links on /category/');
  if (!site.suburbSlug) {
    const sub = await step(anon, 'GET', '/suburb/', {}, contentTypeIs(/text\/html/), 'suburb index page');
    const m = sub.text.match(/href="\/suburb\/([a-z0-9-]+)\/"/);
    if (m && m[1] !== 'map') site.suburbSlug = m[1];
  }
  if (!site.suburbSlug) fail('suburb slug discovery', 'no suburb slug found');

  await step(anon, 'GET', '/sitemap-index.xml', {}, contentTypeIs(/xml/), 'sitemap index');
  await step(anon, 'GET', '/sitemap-0.xml', {}, contentTypeIs(/xml/), 'sitemap');
  await step(anon, 'GET', '/robots.txt', {}, contentTypeIs(/text\/plain/), 'robots');
  await step(anon, 'GET', '/manifest.webmanifest', {}, contentTypeIs(/manifest|json/), 'web app manifest');
  await step(anon, 'GET', '/service-worker.js', {}, contentTypeIs(/javascript/), 'service worker');
  await step(anon, 'GET', '/this-page-does-not-exist-launch-test/', {}, status(404), 'custom 404');
});

await section('Public read-only APIs', async () => {
  await step(anon, 'GET', '/api/weather?lat=-23.90&lon=29.45', {}, okJson((r) => (r.json.now && Array.isArray(r.json.days) ? true : 'missing now/days')), 'forecast');
  await step(anon, 'GET', '/api/weather?lat=51.5&lon=-0.1', {}, refused(400), 'outside South Africa refused');
  await step(anon, 'GET', '/api/search-businesses?q=aa', {}, okJson((r) => (Array.isArray(r.json.results) ? true : 'no results array')), 'results array');
  await step(anon, 'GET', '/api/search-events?q=aa', {}, okJson((r) => (Array.isArray(r.json.results) ? true : 'no results array')), 'results array');
  if (site.categorySlug) {
    await step(anon, 'GET', `/api/sponsor-slot?type=category_sponsor&target=${site.categorySlug}`, {}, okJson((r) => (r.json.valid === true ? true : 'slot not valid')), 'live slot availability');
  }
  await step(anon, 'GET', '/api/sponsor-slot?type=bogus', {}, refused(400), 'unknown product refused');
  if (site.anyBiz) {
    await step(anon, 'POST', '/api/track-view', { json: { event: 'view', businessSlug: site.anyBiz.s } }, status(204), 'view beacon accepted');
  }
  await step(anon, 'POST', '/api/track-view', { json: { event: 'nope' } }, status(204), 'unknown event ignored');
  await step(anon, 'POST', '/api/track-view', { body: 'not json', headers: { 'Content-Type': 'application/json' } }, status(204), 'garbage body ignored');
});

await section('Account: register, me, logout, login, password reset', async () => {
  await step(user, 'POST', '/api/register', { json: { email: testEmail, password: testPassword } }, okJson(() => (user.has('session') ? true : 'no session cookie set')), 'account created, session cookie set');
  await step(user, 'GET', '/api/me', {}, okJson((r) => (r.json.email === testEmail && r.json.isAdmin === false ? true : 'wrong identity')), 'identity matches, not admin');
  await step(anon, 'POST', '/api/register', { json: { email: testEmail, password: testPassword } }, refused(400), 'duplicate refused');
  await step(anon, 'POST', '/api/register', { json: { email: 'hubnetworksa@gmail.com', password: testPassword } }, refused(400), 'admin address refused');
  await step(anon, 'POST', '/api/register', { body: '{', headers: { 'Content-Type': 'application/json' } }, refused(400), 'bad JSON refused');
  await step(user, 'POST', '/api/logout', {}, okJson(() => (user.has('session') ? 'session cookie not cleared' : true)), 'session cleared');
  await step(user, 'GET', '/api/me', {}, status(401), 'logged out');
  await step(user, 'POST', '/api/login', { json: { email: testEmail, password: 'wrong-password-' + ts } }, refused(401), 'wrong password refused');
  await step(user, 'POST', '/api/login', { json: { email: testEmail, password: testPassword } }, okJson(() => (user.has('session') ? true : 'no session cookie')), 're-login ok');
  await step(user, 'GET', '/api/me', {}, okJson((r) => (r.json.email === testEmail ? true : 'wrong identity')), 'session valid again');
  await step(anon, 'POST', '/api/forgot-password', { json: { email: testEmail } }, okJson(), 'reset link issued (email delivery not asserted)');
  await step(anon, 'POST', '/api/forgot-password', { json: { email: 'not-an-email' } }, refused(400), 'invalid address refused');
  await step(anon, 'POST', '/api/reset-password', { json: { token: 'a'.repeat(64), password: testPassword } }, refused(400), 'unknown token refused');
  await step(anon, 'POST', '/api/reset-password', { json: { token: 'short', password: testPassword } }, refused(400), 'malformed token refused');
  await step(
    anon,
    'GET',
    '/api/auth/google/start',
    { redirect: 'manual', tolerate: [503] },
    (r) => {
      // 503 is the endpoint's own "GOOGLE_OAUTH_CLIENT_ID not set" answer —
      // expected on a preview deploy, worth a look on production.
      if (r.status === 503) return { pass: true, note: 'Google sign-in not configured on this deployment (503) — fine on preview, check on production' };
      if (r.status !== 302) return `expected 302 or 503, got ${r.status}`;
      const loc = r.headers.get('location') ?? '';
      if (!loc.startsWith('https://accounts.google.com/')) return `unexpected redirect ${trunc(loc, 60)}`;
      return { pass: true, note: 'redirects to accounts.google.com' };
    }
  );
  await step(anon, 'GET', '/api/auth/google/callback', { redirect: 'manual' }, (r) => (r.status >= 400 && r.status < 500) || r.status === 302 ? true : `expected 4xx/302, got ${r.status}`, 'no code/state handled');
});

await section('Public forms (honeypot empty, loadedAt old enough)', async () => {
  await step(
    anon,
    'POST',
    '/api/contact',
    { json: { ...spamOk(), name: 'Launch Test', email: testEmail, topic: 'Launch test', message: `${TEST_PREFIX} contact message ${ts} — automated, safe to delete.` } },
    okJson(),
    'message saved'
  );
  await step(anon, 'POST', '/api/contact', { json: { ...spamOk(), company_url: 'http://spam.example', message: 'spam spam spam' } }, refused(400), 'honeypot catches bots');
  // A loadedAt in the future is "younger than 2 s" whatever the clock skew.
  await step(anon, 'POST', '/api/contact', { json: { company_url: '', loadedAt: Date.now() + 60_000, message: 'too fast too fast' } }, refused(400), 'instant submit refused');
  if (site.anyBiz) {
    await step(
      anon,
      'POST',
      '/api/report-listing',
      { json: { ...spamOk(), businessSlug: site.anyBiz.s, businessName: site.anyBiz.n, issue: `${TEST_PREFIX} report ${ts} — automated, please resolve.`, reporterEmail: testEmail } },
      okJson(),
      'report recorded'
    );
    await step(
      anon,
      'POST',
      '/api/request-removal',
      {
        json: {
          ...spamOk(),
          businessSlug: site.anyBiz.s,
          businessName: site.anyBiz.n,
          reason: `${TEST_PREFIX} removal request ${ts} — automated, please resolve. Do NOT remove the listing.`,
          relationship: 'Automated launch test',
          requesterEmail: testEmail,
        },
      },
      okJson(),
      'removal request recorded'
    );
    // Enquiries email the business's own inbox, so they are only ever sent
    // to the test business (after it exists and has a paid plan). Against a
    // real free listing the API must refuse — that also proves the gate.
    const tier = Number(site.anyBiz.t ?? 0);
    if (tier === 0) {
      await step(anon, 'POST', '/api/enquiry', { json: { ...spamOk(), businessSlug: site.anyBiz.s, name: 'Launch Test', contact: testEmail, message: 'launch test enquiry' } }, refused(403), 'free listing refuses enquiries');
    }
  }
  await step(anon, 'POST', '/api/enquiry', { json: { ...spamOk(), businessSlug: `no-such-business-${ts}`, name: 'Launch Test', contact: testEmail, message: 'launch test enquiry' } }, refused(404), 'unknown listing');

  if (site.categorySlug && site.suburbSlug) {
    // Submitted logged OUT and with no email on purpose: approval then
    // publishes immediately with no owner, so the claim flow can be tested
    // on it afterwards.
    await step(
      anon,
      'POST',
      '/api/submit-business',
      {
        json: {
          ...spamOk(),
          name: testBusinessName,
          category: site.categorySlug,
          suburb: site.suburbSlug,
          phone: '015 000 0000',
          description: 'Automated launch test listing — safe to delete.',
          hours: 'Mon-Fri 08:00-17:00',
          chosenTier: 0,
        },
      },
      okJson((r) => (r.json.redirectUrl ? 'free tier should not redirect to PayFast' : true)),
      'sent for review (pending_submissions)'
    );
    // Every call below the honeypot/timing check counts against the 5-an-hour
    // per-IP limit, so only one negative case is sent.
    await step(anon, 'POST', '/api/submit-business', { json: { ...spamOk(), name: 'Launch test bogus', category: 'no-such-category', suburb: site.suburbSlug } }, refused(400), 'unknown category refused');
  } else {
    fail('submit-business', 'no category/suburb slug discovered');
  }

  await step(anon, 'POST', '/api/submit-event', { json: { ...spamOk(), title: testEventTitle, eventDate: futureDate(30), venue: 'Launch test venue' } }, refused(401), 'login required');
  const eventBody = (title) => ({
    ...spamOk(),
    title,
    type: 'Other',
    eventDate: futureDate(30),
    eventTime: '10:00',
    venue: 'Launch test venue',
    suburb: site.suburbName ?? '',
    price: 'Free',
    description: 'Automated launch test event — safe to delete.',
    contactName: 'Launch Test',
    contactEmail: testEmail,
    contactPhone: '015 000 0000',
  });
  await step(user, 'POST', '/api/submit-event', { json: eventBody(testEventTitle) }, okJson(), 'event submission 1 (to approve)');
  await step(user, 'POST', '/api/submit-event', { json: eventBody(testEventRejectTitle) }, okJson(), 'event submission 2 (to reject)');
  await step(user, 'POST', '/api/submit-event', { json: { ...eventBody('Launch test instant'), loadedAt: Date.now() + 60_000 } }, refused(400), 'instant submit refused (before the rate limit)');
  const fd = new FormData();
  fd.append('note', 'no file attached');
  await step(user, 'POST', '/api/submit-event-image', { multipart: fd }, refused(400), 'missing file refused (no upload made)');
  await step(anon, 'POST', '/api/submit-event-image', { multipart: new FormData() }, refused(401), 'login required');
});

await section('Owner endpoints before anything is owned', async () => {
  await step(user, 'GET', '/api/my-businesses', {}, okJson((r) => (Array.isArray(r.json.owned) && Array.isArray(r.json.pending) ? true : 'missing owned/pending')), 'owned + pending lists');
  await step(anon, 'GET', '/api/my-businesses', {}, status(401), 'login required');
  await step(user, 'GET', '/api/my-events', {}, okJson((r) => (Array.isArray(r.json.owned) ? true : 'missing owned')), 'owned + pending lists');
  await step(user, 'GET', '/api/update-business?id=0', {}, refused(400), 'missing id');
  if (site.bizId) {
    await step(user, 'GET', `/api/update-business?id=${site.bizId}`, {}, refused(403), 'not the owner');
    await step(user, 'POST', '/api/update-business', { json: { businessId: site.bizId, phone: '0' } }, refused(403), 'not the owner');
    await step(user, 'GET', `/api/business-photos?businessId=${site.bizId}`, {}, refused(403), 'not the owner');
    await step(user, 'POST', '/api/subscribe/start', { json: { businessId: site.bizId, tier: 1 } }, refused([403, 503]), 'not the owner');
    await step(user, 'POST', '/api/subscribe/cancel', { json: { businessId: site.bizId } }, refused([403, 503]), 'not the owner');
  }
  await step(anon, 'POST', '/api/subscribe/start', { json: { businessId: 1, tier: 1 } }, refused([401, 503]), 'login required');
  await step(user, 'DELETE', '/api/business-photos?photoId=999999999', {}, refused(404), 'unknown photo');
  await step(user, 'GET', '/api/invoice', {}, status(400), 'missing paymentId');
  await step(user, 'GET', '/api/invoice?paymentId=999999999', {}, status(404), 'unknown invoice');
  await step(user, 'GET', '/api/invoice?eventPaymentId=999999999', {}, status(404), 'unknown event invoice');
  await step(anon, 'GET', '/api/invoice?paymentId=1', {}, status(401), 'login required');
  // claim-* count every call against a 5-an-hour per-IP limit, so one negative case each.
  await step(user, 'POST', '/api/claim-business', { json: { businessId: 0 } }, refused(400), 'no business chosen');
  await step(user, 'POST', '/api/claim-event', { json: { eventId: 999999999, contactName: 'x', contactPhone: '1', contactEmail: testEmail, confirmed: true } }, refused(404), 'unknown event');
  await step(user, 'GET', '/api/update-event?id=999999999', {}, refused(403), 'unknown/unowned event');
  await step(user, 'POST', '/api/update-event', { json: { eventId: 999999999, venue: 'x' } }, refused(403), 'unknown/unowned event');
  await step(user, 'POST', '/api/events/feature-start', { json: { eventId: 0 } }, refused([400, 503]), 'missing event');
  await step(user, 'POST', '/api/events/feature-start', { json: { eventId: 999999999 } }, refused([403, 503]), 'unknown/unowned event');
  await step(user, 'POST', '/api/review', { json: { ...spamOk(), businessSlug: `no-such-business-${ts}`, rating: 5, authorName: 'Launch Test', comment: 'launch test review' } }, refused(404), 'unknown listing');
  await step(anon, 'POST', '/api/review', { json: { ...spamOk(), businessSlug: 'x', rating: 5, authorName: 'x', comment: 'xxxxx' } }, refused(401), 'login required');
  await step(user, 'POST', '/api/review-reply', { json: { reviewId: 999999999, reply: 'x' } }, refused(403), 'unknown review');
  await step(user, 'POST', '/api/flag-review', { json: { reviewId: 999999999 } }, refused(403), 'unknown review');
});

await section('ITN hardening and token-link endpoints with bogus input', async () => {
  await step(anon, 'POST', '/api/subscribe/notify', { form: { m_payment_id: 'bogus', payment_status: 'COMPLETE', amount_gross: '1.00', signature: 'deadbeef' } }, (r) => (r.status >= 400 && r.status < 500 ? true : `expected 4xx, got ${r.status}`), 'bogus ITN rejected');
  await step(anon, 'POST', '/api/subscribe/notify', { body: '', headers: { 'Content-Type': 'application/x-www-form-urlencoded' } }, (r) => (r.status >= 400 && r.status < 500 ? true : `expected 4xx, got ${r.status}`), 'empty ITN rejected');
  await step(anon, 'POST', '/api/confirm-listing', { form: { token: `bogus-${ts}`, action: 'approve' } }, htmlSaying(/Already handled/i), 'unknown token → no action');
  await step(anon, 'POST', '/api/owner-confirm-listing', { form: { token: `bogus-${ts}`, action: 'confirm' } }, htmlSaying(/Already handled/i), 'unknown token → no action');
  await step(anon, 'POST', '/api/review-claim', { form: { token: `bogus-${ts}`, action: 'approve' } }, htmlSaying(/Already handled/i), 'unknown token → no action');
  await step(anon, 'POST', '/api/review-event-claim', { form: { token: `bogus-${ts}`, action: 'approve' } }, htmlSaying(/Already handled/i), 'unknown token → no action');
  await step(anon, 'POST', '/api/verify-claim', { form: { token: `bogus-${ts}`, action: 'confirm' } }, htmlSaying(/Nothing to confirm/i), 'unknown token → no action');
});

await section('Cron-secret endpoints', async () => {
  const cron = ['/api/admin/flush-rebuild', '/api/admin/process-expired-subscriptions', '/api/admin/process-owner-reminders'];
  for (const route of cron) {
    await step(anon, 'POST', route, { json: {}, headers: { Authorization: `Bearer wrong-${ts}` } }, refused(401), 'wrong secret refused');
  }
  if (args.cronSecret) {
    const auth = { Authorization: `Bearer ${args.cronSecret}` };
    await step(anon, 'POST', '/api/admin/flush-rebuild', { json: { dispatch: false }, headers: auth }, okJson(), 'owed rebuild marked covered (no dispatch)');
    await step(anon, 'POST', '/api/admin/process-expired-subscriptions', { json: {}, headers: auth }, okJson((r) => (typeof r.json.downgraded === 'number' ? true : 'missing counts')), 'daily sweep ran');
    await step(anon, 'POST', '/api/admin/process-owner-reminders', { json: {}, headers: auth }, okJson((r) => (typeof r.json.reminded === 'number' ? true : 'missing counts')), 'daily sweep ran');
  } else {
    console.log('       (pass --cron-secret to run the three sweeps for real; the 401 checks above still count as tested)');
  }
});

// ---------------------------------------------------------------- admin

await section('Admin login', async () => {
  if (!haveAdminCreds) {
    console.log('       no admin credentials — admin flows, approval, claim and cleanup are skipped');
    return;
  }
  if (args.adminSession) {
    admin.set('session', args.adminSession);
    const me = await step(admin, 'GET', '/api/me', {}, okJson((r) => (r.json.isAdmin === true ? true : 'session is not an admin')), 'admin session valid');
    adminReady = me.status === 200 && me.json?.isAdmin === true;
    return;
  }
  const login = await step(admin, 'POST', '/api/login', { json: { email: args.adminEmail, password: args.adminPassword } }, okJson((r) => (r.json.isAdmin === true ? true : 'login ok but isAdmin is false')), 'admin login');
  adminReady = login.status === 200 && login.json?.isAdmin === true;
  if (adminReady) await step(admin, 'GET', '/api/me', {}, okJson((r) => (r.json.isAdmin === true ? true : 'not admin')), 'admin identity');
  await step(user, 'GET', '/api/admin/overview', {}, refused(403), 'ordinary user refused');
});

const findSubmission = (overview) => (overview.json?.submissions ?? []).find((s) => s.name === testBusinessName) ?? null;
let review = null; // {id} of the review posted on the test business

await section('Admin: read-only endpoints', async () => {
  if (!adminReady) return;
  const gets = [
    ['/api/admin/overview', (r) => (r.json.stats && r.json.revenue ? true : 'missing stats/revenue')],
    ['/api/admin/activity', (r) => (Array.isArray(r.json.activity) ? true : 'missing activity')],
    ['/api/admin/analytics', (r) => (r.json.totals ? true : 'missing totals')],
    ['/api/admin/listings?limit=5', (r) => (Array.isArray(r.json.results) && typeof r.json.total === 'number' ? true : 'missing results/total')],
    ['/api/admin/messages', (r) => (Array.isArray(r.json.messages) ? true : 'missing messages')],
    ['/api/admin/news', (r) => (Array.isArray(r.json.news) ? true : 'missing news')],
    ['/api/admin/payments', (r) => (Array.isArray(r.json.invoices) ? true : 'missing invoices')],
    ['/api/admin/reviews', (r) => (Array.isArray(r.json.reviews) ? true : 'missing reviews')],
    ['/api/admin/site-settings', (r) => (Array.isArray(r.json.settings) ? true : 'missing settings')],
    ['/api/admin/sponsorships', (r) => (Array.isArray(r.json.sponsorships) ? true : 'missing sponsorships')],
    ['/api/admin/subscriptions', (r) => (Array.isArray(r.json.subscriptions) ? true : 'missing subscriptions')],
    ['/api/admin/users', (r) => ((r.json.users ?? []).some((u) => u.email === testEmail) ? true : 'test account not listed')],
    ['/api/admin/events', (r) => (Array.isArray(r.json.events) && Array.isArray(r.json.submissions) ? true : 'missing events/submissions')],
    ['/api/admin/event-claims', (r) => (Array.isArray(r.json.claims) ? true : 'missing claims')],
    ['/api/admin/search-businesses?q=aa', (r) => (Array.isArray(r.json.results) ? true : 'missing results')],
  ];
  for (const [route, judge] of gets) await step(admin, 'GET', route, {}, okJson(judge), '200 JSON');
  await step(anon, 'GET', '/api/admin/overview', {}, refused(403), 'anonymous refused');
});

await section('Admin: approve the test submission, claim it, moderate, edit, pay, hide', async () => {
  if (!adminReady) return;
  const ov = await step(admin, 'GET', '/api/admin/overview', {}, okJson((r) => (findSubmission(r) ? true : `submission "${testBusinessName}" not in overview`)), 'test submission is pending');
  const sub = findSubmission(ov);
  if (!sub) return;
  created.submissionId = sub.id;
  // The admin dashboard approves through the same token the review email
  // carries; overview exposes it for exactly this purpose.
  const approved = await step(anon, 'POST', '/api/confirm-listing', { form: { token: sub.token, action: 'approve' } }, htmlSaying(/Published/i), 'approved → published immediately (no owner email)');
  if (approved.status !== 200) return;
  created.submissionId = null;

  const found = await step(admin, 'GET', `/api/admin/search-businesses?q=${encodeURIComponent(testBusinessName)}`, {}, okJson((r) => (r.json.results.some((b) => b.name === testBusinessName) ? true : 'business not found after approval')), 'business row exists');
  const biz = (found.json?.results ?? []).find((b) => b.name === testBusinessName);
  if (!biz) return;
  created.businessId = biz.id;
  const listing = await step(admin, 'GET', `/api/admin/listings?id=${biz.id}`, {}, okJson((r) => (r.json.listing?.slug ? true : 'no listing.slug')), 'listing detail');
  created.businessSlug = listing.json?.listing?.slug ?? null;
  // There is no way for the approval path to set is_test=1 (see
  // src/lib/business-submission.ts insertApprovedBusiness) — flagged in the
  // summary; the row is deleted in cleanup instead.
  leftovers.push({ note: 'approved test business is created with is_test=0 (no endpoint sets is_test) — deleted in cleanup' });

  await step(user, 'GET', '/api/my-businesses', {}, okJson((r) => (r.json.owned.some((b) => b.id === biz.id) ? 'already owned before claiming?' : true)), 'not owned yet');

  // Claim it as the test account, then approve the claim through the same
  // tokened step the dashboard uses.
  await step(
    user,
    'POST',
    '/api/claim-business',
    { json: { businessId: biz.id, contactName: 'Launch Test', contactPhone: '015 000 0000', contactEmail: testEmail, roleNote: 'Automated launch test', verifyMethod: 'phone', confirmed: true } },
    okJson((r) => (r.json.verification === 'manual' ? true : `expected manual verification, got ${r.json.verification}`)),
    'claim filed (manual review — no business email on file)'
  );
  const ov2 = await step(admin, 'GET', '/api/admin/overview', {}, okJson((r) => (r.json.claims.some((c) => c.businessName === testBusinessName) ? true : 'claim not listed')), 'claim is pending');
  const claim = (ov2.json?.claims ?? []).find((c) => c.businessName === testBusinessName);
  if (claim) {
    await step(anon, 'POST', '/api/review-claim', { form: { token: claim.reviewToken, action: 'approve' } }, htmlSaying(/Claim approved/i), 'claim approved');
  }
  await step(user, 'GET', '/api/my-businesses', {}, okJson((r) => (r.json.owned.some((b) => b.id === biz.id) ? true : 'test business not under owned')), 'now owned by the test account');
  await step(admin, 'POST', '/api/admin/set-business-owner', { json: { businessId: biz.id, userEmail: testEmail } }, okJson(), 'owner re-linked by admin (idempotent)');
  await step(admin, 'POST', '/api/admin/set-business-owner', { json: { businessId: biz.id, userEmail: `nobody-${ts}@example.invalid` } }, refused(404), 'unknown account refused');

  // Owner dashboard + edits.
  await step(user, 'GET', `/api/update-business?id=${biz.id}`, {}, okJson((r) => (r.json.business?.id === biz.id && r.json.statsLocked === true ? true : 'wrong business or stats not locked on free plan')), 'owner dashboard (stats locked on Basic)');
  await step(
    user,
    'POST',
    '/api/update-business',
    { json: { businessId: biz.id, phone: '015 000 0001', description: 'Automated launch test listing (edited by owner) — safe to delete.', hours: 'Mon-Fri 09:00-16:00', email: '' } },
    okJson(),
    'owner edit saved'
  );
  await step(user, 'POST', '/api/update-business', { json: { businessId: biz.id, email: 'not-an-email' } }, refused(400), 'bad email refused');
  await step(user, 'GET', `/api/business-photos?businessId=${biz.id}`, {}, okJson((r) => (r.json.cap === 0 ? true : `expected cap 0 on Basic, got ${r.json.cap}`)), 'photo cap 0 on Basic');
  const photoForm = new FormData();
  photoForm.append('businessId', String(biz.id));
  await step(user, 'POST', '/api/business-photos', { multipart: photoForm }, refused(403), 'upload refused on the free plan');

  // Reviews: post one as the test account, moderate it as admin, reply and flag as the owner.
  await step(user, 'POST', '/api/review', { json: { ...spamOk(), businessSlug: created.businessSlug, rating: 5, authorName: 'Launch Test', comment: `${TEST_PREFIX} review ${ts} — automated.` } }, okJson(), 'review submitted (pending)');
  await step(user, 'POST', '/api/review', { json: { ...spamOk(), businessSlug: created.businessSlug, rating: 4, authorName: 'Launch Test', comment: 'second review from the same account' } }, refused(400), 'one review per account enforced');
  const revs = await step(admin, 'GET', '/api/admin/reviews', {}, okJson((r) => (r.json.reviews.some((x) => x.business_slug === created.businessSlug) ? true : 'review not in queue')), 'review in moderation queue');
  review = (revs.json?.reviews ?? []).find((x) => x.business_slug === created.businessSlug) ?? null;
  if (review) {
    await step(user, 'POST', '/api/review-reply', { json: { reviewId: review.id, reply: 'thanks' } }, refused(400), 'cannot reply before approval');
    await step(admin, 'POST', '/api/admin/reviews', { json: { id: review.id, action: 'approve' } }, okJson(), 'review approved');
    await step(user, 'POST', '/api/review-reply', { json: { reviewId: review.id, reply: 'Automated launch test reply.' } }, okJson(), 'owner reply saved');
    await step(user, 'POST', '/api/flag-review', { json: { reviewId: review.id, reason: 'launch test flag' } }, okJson(), 'review flagged');
    await step(admin, 'POST', '/api/admin/reviews', { json: { id: review.id, action: 'reject' } }, okJson(), 'review rejected (removed from public view)');
    await step(admin, 'POST', '/api/admin/reviews', { json: { id: review.id, action: 'bogus' } }, refused(400), 'unknown action refused');
  }

  // Comp a paid plan so the paid-only paths can be exercised against the
  // test business only, then take it away again.
  await step(admin, 'POST', '/api/admin/subscriptions', { json: { businessId: biz.id, tier: 1 } }, okJson(), 'comped to Verified');
  await step(user, 'GET', `/api/business-photos?businessId=${biz.id}`, {}, okJson((r) => (r.json.cap === 4 ? true : `expected cap 4 on Verified, got ${r.json.cap}`)), 'photo cap 4 on Verified');
  await step(user, 'GET', `/api/update-business?id=${biz.id}`, {}, okJson((r) => (r.json.statsLocked === false && r.json.stats ? true : 'stats still locked on a paid plan')), 'stats unlocked on Verified');
  await step(
    anon,
    'POST',
    '/api/enquiry',
    { json: { ...spamOk(), businessSlug: created.businessSlug, name: 'Launch Test', contact: testEmail, message: `${TEST_PREFIX} enquiry ${ts} — automated, safe to delete.` } },
    okJson(),
    'enquiry saved (goes to the site inbox — the test business has no email)'
  );
  await step(user, 'GET', `/api/update-business?id=${biz.id}`, {}, okJson((r) => (r.json.enquiriesTotal >= 1 ? true : 'enquiry not visible to the owner')), 'owner sees the enquiry');
  await step(admin, 'POST', '/api/admin/subscriptions', { json: { businessId: biz.id, tier: 0 } }, okJson(), 'comp removed (back to Basic)');
  await step(admin, 'POST', '/api/admin/subscriptions', { json: { businessId: biz.id, tier: 9 } }, refused(400), 'invalid tier refused');

  // PayFast checkout: assert the redirect only. This leaves a 'pending'
  // subscriptions row (what any abandoned checkout leaves).
  await step(user, 'POST', '/api/subscribe/start', { json: { businessId: biz.id, tier: 1 } }, (r) => (r.status === 503 ? 'PayFast is not configured on this deployment' : payfastRedirect(r)));
  await step(user, 'POST', '/api/subscribe/start', { json: { businessId: biz.id, tier: 1 } }, (r) => (r.status === 503 ? 'PayFast is not configured on this deployment' : payfastRedirect(r)), 'second click reuses the same unpaid checkout');
  await step(user, 'POST', '/api/subscribe/start', { json: { businessId: biz.id, productType: 'bogus_sponsor' } }, refused([400, 503]), 'unknown sponsorship refused');
  await step(user, 'POST', '/api/subscribe/cancel', { json: { businessId: biz.id } }, refused([400, 503]), 'nothing active to cancel');

  // Admin listing edit, search, hide/unhide.
  await step(
    admin,
    'POST',
    '/api/admin/listings',
    { json: { id: biz.id, name: testBusinessName, category: site.categorySlug, suburb: site.suburbSlug, phone: '015 000 0002', description: 'Automated launch test listing (edited by admin) — safe to delete.', plan: 'basic' } },
    okJson(),
    'admin edit saved'
  );
  await step(admin, 'POST', '/api/admin/listings', { json: { id: biz.id, name: testBusinessName, category: 'no-such-category', suburb: site.suburbSlug, description: 'x' } }, refused(400), 'unknown category refused');
  await step(admin, 'POST', '/api/admin/toggle-business-status', { json: { businessId: biz.id, status: 'rejected' } }, okJson(), 'hidden');
  await step(admin, 'GET', `/api/admin/listings?status=hidden&q=${encodeURIComponent(testBusinessName)}`, {}, okJson((r) => (r.json.results.some((b) => b.id === biz.id) ? true : 'not listed as hidden')), 'shows under hidden');
  await step(user, 'GET', `/api/update-business?id=${biz.id}`, {}, okJson((r) => (r.json.business.visible === false && r.json.business.hidden_reason === 'admin_hidden' ? true : 'owner not told it is hidden')), 'owner sees "hidden by admin"');
  await step(admin, 'POST', '/api/admin/toggle-business-status', { json: { businessId: biz.id, status: 'published' } }, okJson(), 'unhidden');
});

await section('Admin: events — approve one submission, reject the other, edit, delete', async () => {
  if (!adminReady) return;
  const ev = await step(admin, 'GET', '/api/admin/events', {}, okJson((r) => (r.json.submissions.filter((s) => created.eventTitles.includes(s.title)).length === 2 ? true : 'both test submissions should be pending')), 'both test submissions pending');
  const subs = (ev.json?.submissions ?? []).filter((s) => created.eventTitles.includes(s.title));
  const toApprove = subs.find((s) => s.title === testEventTitle);
  const toReject = subs.find((s) => s.title === testEventRejectTitle);
  if (toReject) await step(admin, 'POST', '/api/admin/events', { json: { action: 'reject-submission', id: toReject.id } }, okJson(), 'submission 2 rejected');
  if (toApprove) {
    const ap = await step(admin, 'POST', '/api/admin/events', { json: { action: 'approve-submission', id: toApprove.id } }, okJson((r) => (r.json.slug ? true : 'no slug returned')), 'submission 1 approved → events row');
    created.eventSlug = ap.json?.slug ?? null;
  }
  await step(admin, 'POST', '/api/admin/events', { json: { action: 'approve-submission', id: 999999999 } }, refused(404), 'unknown submission');
  await step(admin, 'POST', '/api/admin/events', { json: { action: 'bogus' } }, refused(400), 'unknown action');
  if (!created.eventSlug) return;
  const mine = await step(user, 'GET', '/api/my-events', {}, okJson((r) => (r.json.owned.some((e) => e.slug === created.eventSlug) ? true : 'approved event not under owned')), 'organiser owns the event');
  const owned = (mine.json?.owned ?? []).find((e) => e.slug === created.eventSlug);
  if (!owned) return;
  created.eventId = owned.id;
  await step(user, 'GET', `/api/update-event?id=${owned.id}`, {}, okJson((r) => (r.json.event?.slug === created.eventSlug ? true : 'wrong event')), 'organiser can read it');
  await step(user, 'POST', '/api/update-event', { json: { eventId: owned.id, venue: 'Launch test venue (edited)', price: 'Free', description: 'Automated launch test event (edited) — safe to delete.' } }, okJson(), 'organiser edit saved');
  await step(user, 'POST', '/api/update-event', { json: { eventId: owned.id, venue: 'x', ticketUrl: 'javascript:alert(1)' } }, refused(400), 'javascript: ticket link refused');
  await step(user, 'POST', '/api/claim-event', { json: { eventId: owned.id, contactName: 'Launch Test', contactPhone: '015 000 0000', contactEmail: testEmail, confirmed: true } }, refused(400), 'already-owned event cannot be claimed');
  // events/feature-start is deliberately NOT started for real: it inserts an
  // event_payments row that references the event without ON DELETE CASCADE,
  // which would stop admin/events delete from removing the test event. The
  // 400/403 paths were exercised above; the PayFast redirect shape is
  // asserted on subscribe/start, which builds it the same way.
  await step(admin, 'POST', '/api/admin/events', { json: { action: 'update', id: owned.id, title: testEventTitle, eventDate: futureDate(31), type: 'Other', venue: 'Launch test venue (admin edit)' } }, okJson(), 'admin edit saved');
  await step(admin, 'POST', '/api/admin/events', { json: { action: 'toggle-feature', id: owned.id } }, okJson(), 'featured on');
  await step(admin, 'POST', '/api/admin/events', { json: { action: 'toggle-feature', id: owned.id } }, okJson(), 'featured off');
  await step(admin, 'POST', '/api/admin/event-claims', { json: { id: 999999999, action: 'reject' } }, refused(404), 'unknown claim');
  await step(admin, 'POST', '/api/admin/event-claims', { json: { id: 1, action: 'bogus' } }, refused(400), 'unknown action');
});

await section('Admin: remaining write endpoints (validation paths only — nothing real is changed)', async () => {
  if (!adminReady) return;
  await step(admin, 'POST', '/api/admin/claims', { json: { id: 999999999, action: 'dismiss' } }, refused(404), 'unknown claim');
  await step(admin, 'POST', '/api/admin/news', { json: { action: 'delete', id: 0 } }, refused(400), 'missing id refused (no article touched)');
  await step(admin, 'POST', '/api/admin/site-settings', { json: { key: 'not_a_real_key', cents: 1 } }, refused(400), 'unknown key refused (no price changed)');
  await step(admin, 'POST', '/api/admin/sponsorships', { json: { action: 'clear', id: 999999999 } }, refused(404), 'unknown sponsorship');
  await step(admin, 'POST', '/api/admin/sponsorships', { json: { action: 'set', businessId: 0 } }, refused(400), 'invalid business refused');
  await step(admin, 'POST', '/api/admin/delete-business', { json: { businessId: 999999999 } }, refused(404), 'unknown business');
  await step(admin, 'POST', '/api/admin/resolve-report', { json: { reportId: 0 } }, refused(400), 'missing report id');
  await step(admin, 'POST', '/api/admin/messages', { json: { id: 0 } }, refused(400), 'missing message id');
  skip('/api/admin/rebuild', 'would dispatch a real GitHub deploy workflow');
});

await section('Cleanup', async () => {
  if (args.keep) {
    console.log('       --keep given: leaving every LAUNCH TEST row in place');
    return;
  }
  if (!adminReady) {
    console.log('       no admin session: cannot delete the test rows');
    leftovers.push({ note: `pending business submission "${testBusinessName}"`, sql: `DELETE FROM pending_submissions WHERE name = '${testBusinessName}';` });
    leftovers.push({ note: 'two pending event submissions', sql: `DELETE FROM event_submissions WHERE title LIKE '${TEST_PREFIX} EVENT%${ts}';` });
    leftovers.push({ note: 'contact message', sql: `DELETE FROM messages WHERE message LIKE '${TEST_PREFIX}%${ts}%';` });
    leftovers.push({ note: 'two open reports', sql: `DELETE FROM reports WHERE reason LIKE '${TEST_PREFIX}%${ts}%';` });
    return;
  }

  // Messages: resolve, reopen, delete.
  const msgs = await step(admin, 'GET', '/api/admin/messages', {}, okJson(), 'list');
  const mine = (msgs.json?.messages ?? []).filter((m) => typeof m.message === 'string' && m.message.includes(`${ts}`) && m.message.startsWith(TEST_PREFIX));
  if (mine.length === 0) fail('messages', 'no LAUNCH TEST message found to clean up');
  for (const [i, m] of mine.entries()) {
    if (i === 0) {
      await step(admin, 'POST', '/api/admin/messages', { json: { id: m.id, action: 'resolve' } }, okJson(), `${m.kind} closed`);
      await step(admin, 'POST', '/api/admin/messages', { json: { id: m.id, action: 'reopen' } }, okJson(), `${m.kind} reopened`);
    }
    await step(admin, 'POST', '/api/admin/messages', { json: { id: m.id, action: 'delete' } }, okJson(), `${m.kind} deleted`);
  }

  // Reports: there is no delete endpoint, so they are resolved.
  const ov = await step(admin, 'GET', '/api/admin/overview', {}, okJson(), 'open reports');
  const reports = (ov.json?.reports ?? []).filter((r) => typeof r.reason === 'string' && r.reason.startsWith(TEST_PREFIX) && r.reason.includes(`${ts}`));
  if (reports.length !== 2) fail('reports', `expected 2 open LAUNCH TEST reports, found ${reports.length}`);
  for (const r of reports) await step(admin, 'POST', '/api/admin/resolve-report', { json: { reportId: r.id } }, okJson(), `${r.kind} resolved`);
  if (reports.length) leftovers.push({ note: 'resolved reports stay in the table (no delete endpoint)', sql: `DELETE FROM reports WHERE reason LIKE '${TEST_PREFIX}%${ts}%';` });

  // Event: delete the approved one; the rejected one is already gone.
  if (created.eventId) {
    await step(admin, 'POST', '/api/admin/events', { json: { action: 'delete', id: created.eventId } }, okJson(), 'test event deleted');
  }
  // Any pending submission left (approval failed) — reject it through the token.
  const pending = findSubmission(ov);
  if (pending) await step(anon, 'POST', '/api/confirm-listing', { form: { token: pending.token, action: 'reject' } }, htmlSaying(/Rejected/i), 'pending submission rejected');

  // Business.
  if (created.businessId) {
    const del = await step(admin, 'POST', '/api/admin/delete-business', { json: { businessId: created.businessId } }, okJson(), 'test business deleted');
    if (del.status !== 200) {
      await step(admin, 'POST', '/api/admin/toggle-business-status', { json: { businessId: created.businessId, status: 'rejected' } }, okJson(), 'fallback: hidden instead');
      leftovers.push({
        note: `business #${created.businessId} "${testBusinessName}" could not be deleted (delete-business answered ${del.status}); it is hidden`,
        sql:
          `DELETE FROM business_claims WHERE business_id = ${created.businessId}; DELETE FROM subscriptions WHERE business_id = ${created.businessId}; ` +
          `DELETE FROM business_categories WHERE business_id = ${created.businessId}; DELETE FROM businesses WHERE id = ${created.businessId};`,
      });
    } else {
      leftovers.push({ note: `subscriptions/business_claims rows for deleted business #${created.businessId} stay as history`, sql: `DELETE FROM business_claims WHERE business_id = ${created.businessId}; DELETE FROM subscriptions WHERE business_id = ${created.businessId};` });
    }
  }

  // Nothing deletes an account through the API.
  leftovers.push({ note: `account ${testEmail} (no admin endpoint deletes users)`, sql: `DELETE FROM sessions WHERE user_id IN (SELECT id FROM users WHERE email = '${testEmail}'); DELETE FROM auth_tokens WHERE user_id IN (SELECT id FROM users WHERE email = '${testEmail}'); DELETE FROM users WHERE email = '${testEmail}';` });
});

await section('Verify nothing LAUNCH TEST remains', async () => {
  if (args.keep || !adminReady) return;
  await step(anon, 'GET', `/api/search-businesses?q=${encodeURIComponent(TEST_PREFIX)}`, {}, okJson((r) => (r.json.results.length === 0 ? true : `${r.json.results.length} LAUNCH TEST business(es) still public`)), 'public search clean');
  await step(admin, 'GET', `/api/admin/search-businesses?q=${encodeURIComponent(TEST_PREFIX)}`, {}, okJson((r) => (r.json.results.length === 0 ? true : `${r.json.results.length} LAUNCH TEST business(es) still in the database`)), 'admin search clean');
  await step(admin, 'GET', '/api/admin/events', {}, okJson((r) => {
    const left = [...r.json.events, ...r.json.submissions].filter((e) => String(e.title).startsWith(TEST_PREFIX));
    return left.length === 0 ? true : `${left.length} LAUNCH TEST event row(s) left`;
  }), 'events clean');
  await step(admin, 'GET', '/api/admin/messages', {}, okJson((r) => {
    const left = r.json.messages.filter((m) => String(m.message).startsWith(TEST_PREFIX));
    return left.length === 0 ? true : `${left.length} LAUNCH TEST message(s) left`;
  }), 'messages clean');
  await step(admin, 'GET', '/api/admin/overview', {}, okJson((r) => {
    const subs = r.json.submissions.filter((s) => String(s.name).startsWith(TEST_PREFIX)).length;
    const claims = r.json.claims.filter((c) => String(c.businessName).startsWith(TEST_PREFIX)).length;
    const reports = r.json.reports.filter((x) => String(x.reason).startsWith(TEST_PREFIX)).length;
    return subs + claims + reports === 0 ? true : `${subs} submission(s), ${claims} claim(s), ${reports} open report(s) left`;
  }), 'submissions/claims/open reports clean');
});

await section('Sign out', async () => {
  if (user.has('session')) await step(user, 'POST', '/api/logout', {}, okJson(), 'test account signed out');
  // A session passed in with --admin-session belongs to the person running
  // this, so it is left alone.
  if (admin.has('session') && !args.adminSession) await step(admin, 'POST', '/api/logout', {}, okJson(), 'admin signed out');
});

// ---------------------------------------------------------------- report

heading('Coverage of functions/api/**');
if (!adminReady) {
  for (const route of coverage.keys()) if (route.startsWith('/api/admin/')) markSkipped(route, 'needs --admin-email/--admin-password (only the 401/403 refusal was checked)');
}
const width = Math.max(...[...coverage.keys()].map((r) => r.length)) + 2;
const counts = { tested: 0, skipped: 0, untested: 0 };
for (const [route, c] of coverage) {
  counts[c.state]++;
  console.log(`${route.padEnd(width)} ${c.state.padEnd(9)} ${c.note}`);
}
console.log(`\n${coverage.size} routes: ${counts.tested} tested, ${counts.skipped} skipped, ${counts.untested} untested`);

if (leftovers.length) {
  heading('Rows this run could not remove through the API');
  for (const l of leftovers) {
    console.log(`- ${l.note}`);
    if (l.sql) console.log(`    ${l.sql}`);
  }
}

heading('Summary');
const verdict = failed === 0 && counts.untested === 0 ? 'PASS' : 'FAIL';
console.log(`${verdict}: ${passed} passed, ${failed} failed, ${skipped} skipped, ${counts.untested} route(s) untested`);

if (args.json) {
  await writeFile(
    args.json,
    JSON.stringify(
      {
        base,
        at: new Date().toISOString(),
        verdict,
        summary: { passed, failed, skipped, routes: coverage.size, ...counts },
        account: testEmail,
        created,
        results,
        coverage: Object.fromEntries(coverage),
        leftovers,
      },
      null,
      2
    )
  );
  console.log(`Wrote ${args.json}`);
}

process.exit(verdict === 'PASS' ? 0 : 1);
