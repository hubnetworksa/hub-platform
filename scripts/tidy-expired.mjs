#!/usr/bin/env node
// Daily clean-up of content that has gone stale (ROUTINES-PLAN.md, "Tidy expired content").
//
//   node scripts/tidy-expired.mjs --site <capetown|pretoria|polokwane> [--dry-run]
//
// Removes, from that site's live D1 database:
//   - events that finished more than EVENT_GRACE_DAYS ago, except any event that an ownership
//     claim or an event payment still points at (those rows are the audit trail for money and
//     ownership, so the event stays);
//   - news articles published more than NEWS_KEEP_DAYS ago.
// The events page already hides past events in the browser; this keeps the database, the
// sitemap and the static build free of them too. Prints what it removed; exits 0 either way,
// and prints REBUILD_NEEDED=1 when anything was removed so the workflow can redeploy.
// Needs Cloudflare credentials (CLOUDFLARE_API_TOKEN in CI, or a local wrangler login).
import { execFileSync } from 'node:child_process';
import path from 'node:path';

const EVENT_GRACE_DAYS = 14;
const NEWS_KEEP_DAYS = 90;

const SITES = { capetown: 'thecapetownhub-db', pretoria: 'pretoriahub-db', polokwane: 'polokwanehub-db' };
const arg = (name) => { const i = process.argv.indexOf(`--${name}`); return i >= 0 ? process.argv[i + 1] : undefined; };
const site = arg('site');
const dryRun = process.argv.includes('--dry-run');
if (!SITES[site]) {
  console.error('Usage: node scripts/tidy-expired.mjs --site <capetown|pretoria|polokwane> [--dry-run]');
  process.exit(2);
}
const WRANGLER = path.join(process.cwd(), 'node_modules', 'wrangler', 'bin', 'wrangler.js');
function d1(sql) {
  const out = execFileSync(process.execPath, [WRANGLER, 'd1', 'execute', SITES[site], '--config', `wrangler.${site}.jsonc`, '--remote', '--json', '--command', sql], { encoding: 'utf8', maxBuffer: 32 * 1024 * 1024 });
  return JSON.parse(out.slice(out.indexOf('[')));
}
const rows = (sql) => d1(sql)[0]?.results ?? [];
const tableExists = (t) => rows(`SELECT count(*) AS n FROM sqlite_master WHERE type = 'table' AND name = '${t}'`)[0]?.n > 0;

const guards = ['event_claims', 'event_payments']
  .filter(tableExists)
  .map((t) => `AND NOT EXISTS (SELECT 1 FROM ${t} x WHERE x.event_id = e.id)`)
  .join(' ');
const pastEvents = `SELECT e.id FROM events e WHERE e.event_date < date('now', '-${EVENT_GRACE_DAYS} days') ${guards}`;
const oldNews = `SELECT n.id FROM news n WHERE n.published_date < date('now', '-${NEWS_KEEP_DAYS} days')`;
const hasNews = tableExists('news');

const events = rows(`SELECT e.slug, e.event_date FROM events e WHERE e.id IN (${pastEvents}) ORDER BY e.event_date`);
const news = hasNews ? rows(`SELECT n.slug, n.published_date FROM news n WHERE n.id IN (${oldNews}) ORDER BY n.published_date`) : [];
console.log(`${site}: ${events.length} event(s) ended more than ${EVENT_GRACE_DAYS} days ago, ${news.length} news article(s) older than ${NEWS_KEEP_DAYS} days.`);
for (const e of events) console.log(`  event ${e.event_date} ${e.slug}`);
for (const n of news) console.log(`  news  ${n.published_date} ${n.slug}`);

if (dryRun) {
  console.log('Dry run: nothing removed.');
  process.exit(0);
}
if (events.length + news.length === 0) process.exit(0);
const statements = [];
if (events.length) statements.push(`DELETE FROM events WHERE id IN (${pastEvents.replace(/\be\./g, 'e.')});`);
if (news.length) statements.push(`DELETE FROM news WHERE id IN (${oldNews});`);
d1(statements.join(' '));
console.log(`${site}: removed ${events.length} event(s) and ${news.length} news article(s).`);
console.log('REBUILD_NEEDED=1');
