#!/usr/bin/env node
// Diffs two snapshots written by scripts/db-rowcounts.mjs --json and fails
// if any table lost rows — the one thing a launch test, migration or cleanup
// must never do by accident.
//
//   node scripts/compare-rowcounts.mjs before.json after.json [--allow-decrease sessions,rate_limits]
//
// Exit 1 when a table shrank (or disappeared) and is not on the allow-list.

import { readFileSync } from 'node:fs';

function usage(code) {
  console.error('Usage: node scripts/compare-rowcounts.mjs before.json after.json [--allow-decrease table1,table2]');
  process.exit(code);
}

const positional = [];
const allow = new Set();
for (let i = 2; i < process.argv.length; i++) {
  const a = process.argv[i];
  if (a === '--allow-decrease') {
    for (const t of (process.argv[++i] ?? '').split(',')) if (t.trim()) allow.add(t.trim());
  } else if (a === '--help' || a === '-h') usage(0);
  else if (a.startsWith('--')) {
    console.error(`Unknown argument: ${a}`);
    usage(2);
  } else positional.push(a);
}
if (positional.length !== 2) usage(2);

function load(file) {
  let data;
  try {
    data = JSON.parse(readFileSync(file, 'utf8'));
  } catch (err) {
    console.error(`Could not read ${file}: ${err.message}`);
    process.exit(2);
  }
  if (!data || typeof data.counts !== 'object') {
    console.error(`${file} is not a db-rowcounts snapshot (no "counts" object).`);
    process.exit(2);
  }
  return data;
}

const before = load(positional[0]);
const after = load(positional[1]);
if (before.site && after.site && before.site !== after.site) {
  console.error(`Snapshots are from different sites (${before.site} vs ${after.site}).`);
  process.exit(2);
}

const tables = [...new Set([...Object.keys(before.counts), ...Object.keys(after.counts)])].sort();
const width = Math.max(5, ...tables.map((t) => t.length)) + 2;
const fmt = (n) => (n === undefined ? '-' : String(n));

console.log(`${before.site ?? ''} ${before.at ?? ''} → ${after.at ?? ''}`.trim());
console.log(`${'table'.padEnd(width)} ${'before'.padStart(8)} ${'after'.padStart(8)} ${'delta'.padStart(8)}  note`);
let violations = 0;
for (const t of tables) {
  const b = before.counts[t];
  const a = after.counts[t];
  let note = '';
  let delta = '';
  if (b === undefined) note = 'new table';
  else if (a === undefined) {
    note = allow.has(t) ? 'table gone (allowed)' : 'TABLE GONE';
    if (!allow.has(t)) violations++;
  } else {
    const d = a - b;
    delta = d > 0 ? `+${d}` : String(d);
    if (d < 0) {
      note = allow.has(t) ? 'decrease allowed' : 'DECREASED';
      if (!allow.has(t)) violations++;
    }
  }
  console.log(`${t.padEnd(width)} ${fmt(b).padStart(8)} ${fmt(a).padStart(8)} ${delta.padStart(8)}  ${note}`);
}

if (violations) {
  console.log(`\nFAIL: ${violations} table(s) lost rows that were not allow-listed (use --allow-decrease to accept an expected drop).`);
  process.exit(1);
}
console.log('\nOK: no table lost rows.');
