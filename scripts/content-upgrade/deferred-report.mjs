#!/usr/bin/env node
// Collects every deferred listing (no usable sources) for the site owner, who
// has offered to write those descriptions himself.
//   node scripts/content-upgrade/deferred-report.mjs [pretoria|polokwane|capetown|all]
// Writes status/content-upgrade-deferred.md (what we know + a blank
// "Description:" line per listing) and, per city, creates or merges
// content-upgrade/owner/<city>.json ({ "<slug>": "" }); filled text is never
// overwritten. Then owner-sql.mjs turns the filled text into guarded SQL.
import { readFileSync, writeFileSync, readdirSync, mkdirSync, existsSync } from 'node:fs';

const CITIES = { pretoria: 'pretoriahub.com', polokwane: 'polokwanehub.com', capetown: 'thecapetownhub.com' };
const arg = process.argv[2] ?? 'all';
if (arg !== 'all' && !CITIES[arg]) {
  console.error('Usage: node scripts/content-upgrade/deferred-report.mjs [pretoria|polokwane|capetown|all]');
  process.exit(2);
}
const readJson = (f, fallback) => { try { return JSON.parse(readFileSync(f, 'utf8')); } catch { return fallback; } };
const nn = (s) => String(s ?? '').replace(/\s+/g, ' ').trim();

const lines = [];
const summary = [];
let total = 0;
const blocks = [];
for (const city of arg === 'all' ? Object.keys(CITIES) : [arg]) {
  const dir = `content-upgrade/${city}`;
  const files = readdirSync(dir);
  const chunkInfo = new Map();
  for (const f of files.filter((f) => /^chunk-\d+\.json$/.test(f))) {
    for (const l of readJson(`${dir}/${f}`, { listings: [] }).listings ?? []) chunkInfo.set(l.slug, l);
  }
  const researched = new Set();
  const deferred = [];
  for (const f of files.filter((f) => /^done-\d+\.json$/.test(f)).sort()) {
    for (const it of readJson(`${dir}/${f}`, { items: [] }).items ?? []) {
      if (it.status === 'researched') researched.add(it.slug);
      else if (it.status === 'deferred') deferred.push(it);
    }
  }
  const ownerDone = readJson(`content-upgrade/owner/${city}.done.json`, {});
  const todo = deferred.filter((d) => !researched.has(d.slug) && !(d.slug in ownerDone));
  const ownerFile = `content-upgrade/owner/${city}.json`;
  const existing = readJson(ownerFile, {});
  const merged = { ...existing };
  let added = 0;
  for (const d of todo) if (!(d.slug in merged)) { merged[d.slug] = ''; added++; }
  mkdirSync('content-upgrade/owner', { recursive: true });
  if (added || !existsSync(ownerFile)) writeFileSync(ownerFile, JSON.stringify(merged, null, 2) + '\n');
  const filled = Object.values(merged).filter((v) => String(v).trim()).length;

  total += todo.length;
  summary.push(`- ${city}: ${todo.length}`);
  const b = [`## ${city} (${todo.length})`, ''];
  for (const d of todo) {
    const l = chunkInfo.get(d.slug) ?? {};
    const know = [l.category, l.suburb, l.address, l.website].map(nn).filter(Boolean).join(' · ');
    b.push(`### ${nn(l.name) || d.slug}`, know || '(no details on file)', `Reason: ${nn(d.reason)}`,
      `Listing: https://${CITIES[city]}/business/${d.slug}/`, `Slug: ${d.slug}`, 'Description:', '');
  }
  blocks.push(b.join('\n'));
  console.log(`${city}: ${todo.length} deferred needing an owner description (${added} new in ${ownerFile}, ${filled} already filled)`);
}
lines.push('# Deferred listings: descriptions needed from the owner', '',
  'No usable sources were found for these. Write 100-250 words each in `content-upgrade/owner/<city>.json` (slug -> text); see content-upgrade/README.md.', '',
  `Total: ${total}`, ...summary, '', blocks.join('\n'));
mkdirSync('status', { recursive: true });
writeFileSync('status/content-upgrade-deferred.md', lines.join('\n') + '\n');
console.log(`total: ${total}; wrote status/content-upgrade-deferred.md`);
