#!/usr/bin/env node
// Deploy safety net, run by .github/workflows/deploy.yml right after each routine SQL file is
// applied to the remote D1 database:
//
//   node scripts/routines/verify-applied.mjs <file.sql> --site <site>
//
// For every events/news row the file tried to insert, checks that a row with that slug now
// exists. INSERT OR IGNORE silently skips rows that break a constraint (e.g. a NULL in a NOT
// NULL column) while wrangler still reports success, so a shortfall is printed as a GitHub
// ::warning:: annotation. Never fails the deploy: always exits 0.
import { execFileSync } from 'node:child_process';
import { readFileSync } from 'node:fs';
import { insertRows, splitStatements, stripComments } from './sql-rows.mjs';

const args = process.argv.slice(2);
const file = args.find((a) => a.endsWith('.sql'));
const site = args[args.indexOf('--site') + 1];

try {
  if (!file || !site || args.indexOf('--site') < 0) throw new Error('usage: verify-applied.mjs <file.sql> --site <site>');
  const { dbName } = JSON.parse(readFileSync(`sites/${site}.json`, 'utf8'));
  const statements = splitStatements(stripComments(readFileSync(file, 'utf8')));

  for (const table of ['events', 'news']) {
    const slugs = new Set();
    for (const s of statements) for (const { row } of insertRows(s, table) ?? []) if (row.slug) slugs.add(row.slug);
    if (!slugs.size) continue;

    const list = [...slugs].map((x) => `'${x.replace(/'/g, "''")}'`).join(', ');
    // Run wrangler's own entry point with this node (no shell, so the SQL needs no quoting).
    const out = execFileSync(process.execPath, ['node_modules/wrangler/bin/wrangler.js', 'd1', 'execute', dbName, '--config', `wrangler.${site}.jsonc`, '--remote', '--json',
      '--command', `SELECT slug FROM ${table} WHERE slug IN (${list})`], { encoding: 'utf8', stdio: ['ignore', 'pipe', 'pipe'] });
    const found = new Set(JSON.parse(out.slice(out.indexOf('[')))[0].results.map((r) => r.slug));
    const missing = [...slugs].filter((x) => !found.has(x));

    if (missing.length) {
      console.log(`::warning file=${file}::${file}: only ${found.size} of ${slugs.size} ${table} row(s) exist after applying; skipped by INSERT OR IGNORE (NULL in a NOT NULL column?): ${missing.join(', ')}`);
    } else {
      console.log(`Verified ${file}: all ${slugs.size} ${table} row(s) present.`);
    }
  }
} catch (err) {
  console.log(`::warning::Could not verify ${file ?? '(no file)'} was fully applied: ${String(err.message ?? err).split('\n')[0]}`);
}
process.exit(0);
