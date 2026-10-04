#!/usr/bin/env node
// One-off backfill: adds a plain `hours` field (the business's own raw
// trading-hours text, already stored on the listing) to each chunk file, so
// the research/writing step can work it naturally into the description.
// This is OUR OWN stored data for the business's own listing (what the
// listing page already shows), not a live-site lookup used to shortcut
// research — it's added here as a plain fact alongside name/category/address.
//
//   node scripts/content-upgrade/add-hours.mjs <city> <chunk|all> [--data <path to businesses.json>]
import fs from 'node:fs';
import path from 'node:path';

const args = process.argv.slice(2);
const city = args[0];
const which = args[1];
const dataIdx = args.indexOf('--data');
const dataPath = dataIdx !== -1 ? args[dataIdx + 1] : path.join('..', 'hub-platform', 'src', 'data', 'businesses.json');

if (!['pretoria', 'capetown', 'polokwane'].includes(city) || !which) {
  console.error('usage: node scripts/content-upgrade/add-hours.mjs <pretoria|capetown|polokwane> <chunk number|all> [--data <businesses.json>]');
  process.exit(2);
}

let byId;
try {
  const businesses = JSON.parse(fs.readFileSync(dataPath, 'utf8'));
  byId = new Map(businesses.map((b) => [b.slug, b.hours]));
  console.log(`loaded ${businesses.length} businesses from ${dataPath} (${businesses.filter((b) => b.hours).length} with hours)`);
} catch (e) {
  console.error(`can't read ${dataPath}: ${e.message}\nNo local snapshot for ${city} — hours can't be backfilled from here.`);
  process.exit(1);
}

const dir = path.join('content-upgrade', city);
const files = which === 'all'
  ? fs.readdirSync(dir).filter((f) => /^chunk-\d+\.json$/.test(f))
  : [`chunk-${String(Number(which)).padStart(3, '0')}.json`];

let totalAdded = 0, totalListings = 0;
for (const f of files) {
  const file = path.join(dir, f);
  const chunk = JSON.parse(fs.readFileSync(file, 'utf8'));
  let added = 0;
  for (const l of chunk.listings) {
    totalListings++;
    const h = byId.get(l.slug);
    if (h && String(h).trim() && l.hours !== h) { l.hours = String(h).trim(); added++; }
  }
  if (added) fs.writeFileSync(file, JSON.stringify(chunk, null, 1) + '\n');
  totalAdded += added;
  if (which === 'all') console.log(`  ${f}: ${added}/${chunk.listings.length} got hours`);
}
console.log(`${city}: added hours to ${totalAdded}/${totalListings} listings across ${files.length} chunk file(s)`);
