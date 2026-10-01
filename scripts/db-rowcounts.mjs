#!/usr/bin/env node
// Read-only row count of every table in one city's D1 database — take one
// before a risky change (a migration, a launch test, a cleanup) and one
// after, then diff them with scripts/compare-rowcounts.mjs.
//
//   node scripts/db-rowcounts.mjs --site polokwane [--json before.json] [--local]
//
// One wrangler call lists the tables from sqlite_master (skipping SQLite's
// own, Cloudflare's _cf_* and the d1_migrations ledger); the counts then go
// in UNION ALL batches sized to what D1's compound-SELECT limit allows, so a
// typical site is a handful of calls in all. Only SELECTs are ever sent.

import { readFileSync, writeFileSync } from 'node:fs';
import { execFileSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
import path from 'node:path';

const ROOT = path.join(path.dirname(fileURLToPath(import.meta.url)), '..');

function usage(code) {
  console.error('Usage: node scripts/db-rowcounts.mjs --site <capetown|pretoria|polokwane> [--json out.json] [--local]');
  process.exit(code);
}

const args = { local: false };
for (let i = 2; i < process.argv.length; i++) {
  const a = process.argv[i];
  if (a === '--site') args.site = process.argv[++i];
  else if (a === '--json') args.json = process.argv[++i];
  else if (a === '--local') args.local = true;
  else if (a === '--help' || a === '-h') usage(0);
  else {
    console.error(`Unknown argument: ${a}`);
    usage(2);
  }
}
if (!args.site) usage(2);

let site;
try {
  site = JSON.parse(readFileSync(path.join(ROOT, 'sites', `${args.site}.json`), 'utf8'));
} catch {
  console.error(`No sites/${args.site}.json`);
  process.exit(2);
}

const WRANGLER_JS = path.join(ROOT, 'node_modules', 'wrangler', 'bin', 'wrangler.js');
const WRANGLER_CONFIG = path.join(ROOT, `wrangler.${args.site}.jsonc`);

// Same invocation scripts/fetch-d1-data.mjs uses: node + wrangler.js directly
// (no npx), --json, and the result sliced from the first '[' because wrangler
// may print a notice before the JSON.
function query(sql) {
  if (!/^\s*SELECT\b/i.test(sql)) throw new Error('db-rowcounts only runs SELECT statements');
  const cmd = [WRANGLER_JS, 'd1', 'execute', site.dbName, '--config', WRANGLER_CONFIG, args.local ? '--local' : '--remote', '--json', '--command', sql];
  // The Cloudflare API call behind wrangler occasionally drops ("fetch
  // failed"); a read-only query is safe to simply send again.
  for (let attempt = 1; ; attempt++) {
    try {
      const raw = execFileSync(process.execPath, cmd, { encoding: 'utf8', maxBuffer: 64 * 1024 * 1024, stdio: ['ignore', 'pipe', 'pipe'] });
      const start = raw.indexOf('[');
      if (start < 0) throw new Error(`wrangler returned no JSON:\n${raw}`);
      const parsed = JSON.parse(raw.slice(start));
      return parsed[0]?.results ?? [];
    } catch (err) {
      const output = `${err.stdout ?? ''}${err.message ?? ''}`;
      if (attempt < 3 && /fetch failed|ECONNRESET|ETIMEDOUT|socket hang up/i.test(output)) {
        console.error(`wrangler: transient failure, retrying (${attempt}/3)…`);
        Atomics.wait(new Int32Array(new SharedArrayBuffer(4)), 0, 0, 1500 * attempt);
        continue;
      }
      throw err;
    }
  }
}

const tables = query(
  `SELECT name FROM sqlite_master WHERE type = 'table' AND name NOT LIKE 'sqlite\\_%' ESCAPE '\\' AND name NOT LIKE '\\_cf\\_%' ESCAPE '\\' AND name != 'd1_migrations' ORDER BY name`
).map((r) => r.name);

if (tables.length === 0) {
  console.error('No tables found.');
  process.exit(1);
}

// D1 caps the number of terms in a compound SELECT ("too many terms in
// compound SELECT", seen at 20), and the cap isn't documented, so the counts
// go in UNION ALL batches that halve whenever D1 refuses one.
const quote = (name) => `"${name.replace(/"/g, '""')}"`;
const counts = {};
let batchSize = 16;
for (let i = 0; i < tables.length; ) {
  const batch = tables.slice(i, i + batchSize);
  let rows;
  try {
    rows = query(batch.map((t) => `SELECT '${t.replace(/'/g, "''")}' AS t, COUNT(*) AS n FROM ${quote(t)}`).join(' UNION ALL '));
  } catch (err) {
    const output = `${err.stdout ?? ''}${err.message ?? ''}`;
    if (/too many terms in compound SELECT/i.test(output) && batchSize > 1) {
      batchSize = Math.max(1, Math.floor(batchSize / 2));
      continue;
    }
    throw err;
  }
  for (const row of rows) counts[row.t] = Number(row.n);
  i += batch.length;
}

const width = Math.max(...tables.map((t) => t.length)) + 2;
console.log(`${args.site} (${site.dbName}, ${args.local ? 'local' : 'remote'}) — ${tables.length} tables`);
let total = 0;
for (const t of tables) {
  const n = counts[t] ?? 0;
  total += n;
  console.log(`${t.padEnd(width)} ${String(n).padStart(8)}`);
}
console.log(`${'total rows'.padEnd(width)} ${String(total).padStart(8)}`);

if (args.json) {
  writeFileSync(args.json, JSON.stringify({ site: args.site, at: new Date().toISOString(), counts }, null, 2) + '\n');
  console.log(`Wrote ${args.json}`);
}
