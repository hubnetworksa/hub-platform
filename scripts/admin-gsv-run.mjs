#!/usr/bin/env node
// Triggers Hub Admin's Google Visibility run (admin-app/functions/api/gsv/run.ts),
// run every ~3 hours by .github/workflows/admin-gsv.yml. That endpoint
// discovers newly published business URLs on Pretoria and Polokwane and
// works through the due list with Search Console's URL Inspection API.
//
// Each call to the endpoint only advances the queue a little (Cloudflare
// Pages Functions can't sustain a multi-minute request), so this script
// calls it repeatedly — each call fast and individually timed-out — until
// every site reports nothing more due this run, a quota/rate limit was hit,
// or a safety cap on iterations is reached.
//
// The trigger key is the same one the 5-minute notifier uses (Hub Admin's
// own database, settings 'notify_key'): read here with the Cloudflare API
// and sent in a header. It is never printed, and GitHub masks it in case
// anything ever echoes it.

const { CLOUDFLARE_API_TOKEN: token, CLOUDFLARE_ACCOUNT_ID: account, ADMIN_URL: adminUrl = 'https://hub-admin-b4x.pages.dev' } = process.env;
if (!token || !account) throw new Error('CLOUDFLARE_API_TOKEN and CLOUDFLARE_ACCOUNT_ID are required.');
const base = `https://api.cloudflare.com/client/v4/accounts/${account}/d1/database`;
const headers = { Authorization: `Bearer ${token}`, 'Content-Type': 'application/json' };

async function cf(url, init) {
  const res = await fetch(url, { ...init, headers });
  const body = await res.json().catch(() => ({}));
  if (!res.ok || body.success === false) throw new Error(`Cloudflare API ${res.status}: ${JSON.stringify(body.errors ?? []).slice(0, 300)}`);
  return body.result;
}

const allDbs = (await cf(`${base}?per_page=100`)) ?? [];
const db = allDbs.find((d) => d.name === 'hub-admin-db');
if (!db) throw new Error('hub-admin-db not found (run the Deploy Hub Admin workflow first).');
const query = (sql, params = []) => cf(`${base}/${db.uuid}/query`, { method: 'POST', body: JSON.stringify({ sql, params }) });

await query(`INSERT OR IGNORE INTO settings (key, value) VALUES ('notify_key', lower(hex(randomblob(32))))`);
const key = (await query(`SELECT value FROM settings WHERE key = 'notify_key'`))?.[0]?.results?.[0]?.value;
if (!key) throw new Error('Could not read the notify key.');
if (process.env.GITHUB_ACTIONS) console.log(`::add-mask::${key}`);

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));
// The server does at most 3 checks per site per call, across 3 sites (up to
// 9 total), each with one retry and a 12s timeout (see
// admin-app/functions/_lib/gsv.ts) — worst case a little under 4 minutes for
// a call; 5 minutes leaves real headroom. One slow/aborted call must not
// take down the whole scheduled run, so it's caught below, not thrown.
const CALL_TIMEOUT_MS = 300_000;
// High enough that a run can actually reach the configured batchSizePerSite
// (up to 500) in typical conditions — the real backstop against a run
// dragging on is the job's own 30-minute timeout in admin-gsv.yml, not this
// number; a cancelled run loses nothing (every check commits immediately)
// and the next scheduled trigger just continues from where it left off.
const MAX_ITERATIONS = 200;

async function runOnce() {
  const controller = new AbortController();
  const t = setTimeout(() => controller.abort(), CALL_TIMEOUT_MS);
  try {
    const res = await fetch(`${adminUrl}/api/gsv/run`, {
      method: 'POST',
      headers: { 'X-Hub-Admin': '1', 'X-Notify-Key': key, 'Content-Type': 'application/json' },
      signal: controller.signal,
    });
    const out = await res.json().catch(() => ({}));
    if (!res.ok) throw new Error(`Hub Admin returned ${res.status}: ${JSON.stringify(out).slice(0, 300)}`);
    return out;
  } finally {
    clearTimeout(t);
  }
}

const totals = {};
let pruned = 0;
let iterations = 0;
let totalChecked = 0;
let more = true;
while (more && iterations < MAX_ITERATIONS) {
  iterations++;
  let out;
  try {
    out = await runOnce();
  } catch (e) {
    // A single call timing out (or any other transport failure) shouldn't
    // fail the whole job if earlier calls already made progress — the next
    // scheduled run picks up exactly where this one left off either way.
    console.log(`Call ${iterations} failed: ${e.message || e}. Stopping for this run.`);
    break;
  }
  if (out.skipped) {
    console.log(`Skipped: ${out.reason}.`);
    break;
  }
  more = false;
  for (const [slug, s] of Object.entries(out.sites ?? {})) {
    if (s.error) {
      console.log(`${slug}: error — ${s.error}`);
      continue;
    }
    const t = (totals[slug] ??= { discovered: s.discovered, checked: 0, calls: 0, due: s.due, stoppedEarly: false });
    t.checked += s.checked;
    t.calls += s.calls;
    t.stoppedEarly = s.stoppedEarly;
    totalChecked += s.checked;
    if (s.moreWork) more = true;
  }
  pruned = out.pruned ?? pruned;
  if (more) await sleep(1500);
}

for (const [slug, t] of Object.entries(totals)) {
  console.log(`${slug}: discovered ${t.discovered}, due ${t.due}, checked ${t.checked} (${t.calls} call(s))${t.stoppedEarly ? ' — stopped early (quota/rate)' : ''}.`);
}
console.log(`Pruned ${pruned} old check(s) across ${iterations} request(s).`);

// Only fail the Action loudly when nothing at all happened (e.g. the very
// first call never got through) — anything checked counts as a real run.
if (iterations === 0 || (totalChecked === 0 && Object.keys(totals).length === 0)) {
  process.exitCode = 1;
}
