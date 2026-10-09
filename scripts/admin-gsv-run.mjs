#!/usr/bin/env node
// Triggers Hub Admin's Google Visibility run (admin-app/functions/api/gsv/run.ts),
// run every ~3 hours by .github/workflows/admin-gsv.yml. That endpoint
// discovers newly published business URLs on Pretoria and Polokwane and
// works through the due list with Search Console's URL Inspection API,
// batched and time-boxed so nothing is lost across runs.
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

const res = await fetch(`${adminUrl}/api/gsv/run`, { method: 'POST', headers: { 'X-Hub-Admin': '1', 'X-Notify-Key': key, 'Content-Type': 'application/json' } });
const out = await res.json().catch(() => ({}));
if (!res.ok) throw new Error(`Hub Admin returned ${res.status}: ${JSON.stringify(out).slice(0, 300)}`);

if (out.skipped) {
  console.log(`Skipped: ${out.reason}.`);
} else {
  for (const [slug, s] of Object.entries(out.sites ?? {})) {
    if (s.error) {
      console.log(`${slug}: error — ${s.error}`);
      continue;
    }
    console.log(`${slug}: discovered ${s.discovered}, due ${s.due}, checked ${s.checked} (${s.calls} call(s))${s.stoppedEarly ? ' — stopped early (quota/rate)' : ''}.`);
  }
  console.log(`Pruned ${out.pruned ?? 0} old check(s).`);
}
