#!/usr/bin/env node
// One-off, PRETORIA ONLY: permanently delete free, unclaimed business
// listings whose description is generic: a one-line description under 140
// characters, with no trading hours to add anything. Having no website is
// NOT a reason on its own; a listing with a real description stays.
//
// Never touched, whatever their content:
//   - any paid listing (subscription_tier >= 1)
//   - any claimed listing (owner_user_id set)
//   - any listing with a claim, subscription (and so any payment), photo or review row
//
// Usage (from the repo root, Git Bash):
//   node scripts/delete-thin-pretoria.mjs              # dry run: backup + counts, deletes nothing
//   node scripts/delete-thin-pretoria.mjs --confirm    # backup + counts + DELETE
//
// Every run first exports the whole live Pretoria database to
// db/backups/pretoria-before-thin-delete-<timestamp>.sql, so the deleted
// rows can be restored from that file if needed.

import { execFileSync } from 'node:child_process';
import { mkdirSync } from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = path.join(path.dirname(fileURLToPath(import.meta.url)), '..');
const WRANGLER = path.join(ROOT, 'node_modules', 'wrangler', 'bin', 'wrangler.js');
const CONFIG = path.join(ROOT, 'wrangler.pretoria.jsonc');
const DB = 'pretoriahub-db';
const CONFIRM = process.argv.includes('--confirm');

const NO_WEBSITE = `(b.website IS NULL OR trim(b.website) = '')`;
const THIN = `(length(trim(coalesce(b.description, ''))) < 140 AND (b.hours IS NULL OR trim(b.hours) = ''))`;
// The reviews table only exists once the reviews migration has run on this
// database; before that there are no reviews to protect.
const HAS_REVIEWS = query(`SELECT count(*) AS n FROM sqlite_master WHERE type = 'table' AND name = 'reviews'`)[0].n > 0;
const REVIEWS_GUARD = HAS_REVIEWS ? 'AND NOT EXISTS (SELECT 1 FROM reviews x WHERE x.business_id = b.id)' : '';
const PROTECTED = `
  coalesce(b.subscription_tier, 0) = 0
  AND b.owner_user_id IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims x WHERE x.business_id = b.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions x WHERE x.business_id = b.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos x WHERE x.business_id = b.id)
  ${REVIEWS_GUARD}`;
const TARGET = `SELECT b.id FROM businesses b WHERE ${PROTECTED} AND ${THIN}`;

function wrangler(args) {
  return execFileSync(process.execPath, [WRANGLER, ...args, '--config', CONFIG], { cwd: ROOT, encoding: 'utf8', maxBuffer: 1 << 28 });
}
function query(sql) {
  const out = wrangler(['d1', 'execute', DB, '--remote', '--json', '--command', sql]);
  return JSON.parse(out.slice(out.indexOf('[')))[0].results;
}

// 1. Backup.
const stamp = new Date().toISOString().replace(/[:.]/g, '-').slice(0, 19);
mkdirSync(path.join(ROOT, 'db', 'backups'), { recursive: true });
const backup = path.join('db', 'backups', `pretoria-before-thin-delete-${stamp}.sql`);
console.log(`Backing up the live Pretoria database to ${backup} ...`);
wrangler(['d1', 'export', DB, '--remote', '--output', backup]);

// 2. Counts.
const [c] = query(`SELECT
  (SELECT count(*) FROM businesses) AS total,
  (SELECT count(*) FROM businesses b WHERE ${PROTECTED} AND ${THIN} AND ${NO_WEBSITE}) AS thin_no_website,
  (SELECT count(*) FROM (${TARGET})) AS to_delete`);
console.log(`\nPretoria businesses:            ${c.total}`);
console.log(`  TO DELETE (generic description): ${c.to_delete}`);
console.log(`    of which also have no website:  ${c.thin_no_website}`);
console.log(`  would remain:                 ${c.total - c.to_delete}`);
console.log('\nSample of listings that would be deleted:');
for (const r of query(`SELECT b.slug, b.name FROM businesses b WHERE b.id IN (${TARGET}) ORDER BY random() LIMIT 10`)) {
  console.log(`  - ${r.name} (${r.slug})`);
}

if (!CONFIRM) {
  console.log('\nDry run only, nothing deleted. Re-run with --confirm to delete.');
  process.exit(0);
}

// 3. Delete. Categories, stats and reviews go with it via ON DELETE CASCADE;
// the business_categories delete is explicit too in case foreign keys are off.
console.log('\nDeleting ...');
wrangler(['d1', 'execute', DB, '--remote', '--command',
  `DELETE FROM business_categories WHERE business_id IN (${TARGET}); DELETE FROM business_stats WHERE business_id IN (${TARGET}); DELETE FROM businesses WHERE id IN (${TARGET});`]);
const [after] = query('SELECT count(*) AS total FROM businesses');
console.log(`Done. Pretoria now has ${after.total} businesses. Backup: ${backup}`);
console.log('The next deploy of main rebuilds the site without the deleted pages.');
