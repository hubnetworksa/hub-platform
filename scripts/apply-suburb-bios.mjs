#!/usr/bin/env node
// Historical one-off tool from PretoriaHub, carried over as-is — hardcoded
// to the pretoriahub-db database name below; adjust that before running
// against another site's database.
// One-off helper for the suburb-bio content project: takes a JSON file of
// { slug: bioText } and applies each as an UPDATE against remote D1 via
// wrangler, batched into one SQL file per run. Not part of the routine —
// this is Claude Code writing real, researched bios interactively, not an
// automated pipeline.
//
// Usage: node scripts/apply-suburb-bios.mjs path/to/batch.json

import { readFileSync, writeFileSync } from 'node:fs';
import { execFileSync } from 'node:child_process';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const WRANGLER_JS = path.join(path.dirname(fileURLToPath(import.meta.url)), '..', 'node_modules', 'wrangler', 'bin', 'wrangler.js');

const file = process.argv[2];
if (!file) {
  console.error('Usage: node scripts/apply-suburb-bios.mjs path/to/batch.json');
  process.exit(1);
}

const bios = JSON.parse(readFileSync(file, 'utf8'));
const entries = Object.entries(bios);

function sqlEscape(v) {
  return `'${String(v).replace(/'/g, "''")}'`;
}

const sql = entries
  .map(([slug, bio]) => `UPDATE suburbs SET bio = ${sqlEscape(bio)} WHERE slug = ${sqlEscape(slug)};`)
  .join('\n');

const outPath = 'scratch_bio_batch.sql';
writeFileSync(outPath, sql, 'utf8');

const args = [WRANGLER_JS, 'd1', 'execute', 'pretoriahub-db', '--remote', '--file', outPath];
let raw;
for (let attempt = 1; attempt <= 3; attempt++) {
  try {
    raw = execFileSync(process.execPath, args, { encoding: 'utf8' });
    break;
  } catch (err) {
    // Transient Cloudflare API auth blips happen occasionally — retry rather
    // than fail the whole batch.
    if (attempt === 3) throw err;
    console.error(`Attempt ${attempt} failed (transient auth blip?), retrying...`);
  }
}
const jsonStart = raw.indexOf('[');
const parsed = JSON.parse(raw.slice(jsonStart));
const changes = parsed[0]?.meta?.changes ?? parsed[0]?.results?.[0]?.changes;

console.log(`Applied ${entries.length} bios (${entries.map(([s]) => s).join(', ')})`);
console.log('D1 result:', JSON.stringify(parsed[0]?.meta ?? parsed[0], null, 2));
