#!/usr/bin/env node
// Finds every category/suburb combo with fewer than 3 businesses (the
// "thin" category-in-suburb pages) from the live snapshot, and writes:
//   - a flat combos.json (one entry per thin combo), the input format
//     scripts/content-upgrade/discover-businesses.mjs already expects
//   - batch files grouping combos by suburb, balanced by how many new
//     businesses each suburb still needs, for splitting across agents
//
//   node scripts/content-upgrade/thin-combos.mjs <city> <outDir> [--batches N]
import fs from 'node:fs';
import path from 'node:path';

const [city, outDir] = process.argv.slice(2).filter((a) => !a.startsWith('--'));
const batchFlag = process.argv.find((a) => a.startsWith('--batches='));
const NUM_BATCHES = batchFlag ? Number(batchFlag.split('=')[1]) : 14;
if (!city || !outDir) {
  console.error('usage: node scripts/content-upgrade/thin-combos.mjs <city> <outDir> [--batches=N]');
  process.exit(1);
}

const snap = JSON.parse(fs.readFileSync(`status/${city}/db-snapshot.json`, 'utf8'));
const cityCfg = JSON.parse(fs.readFileSync(`routines/cities/${city}.json`, 'utf8'));
const cityLabel = cityCfg.cityLabel;

const catLabelOf = new Map(snap.categories.map((c) => [c.slug, c.name]));
const subLabelOf = new Map(snap.suburbs.map((s) => [s.slug, s.name]));

const groups = new Map(); // "category::suburb" -> business[]
for (const b of snap.businesses) {
  const k = `${b.category_slug}::${b.suburb_slug}`;
  if (!groups.has(k)) groups.set(k, []);
  groups.get(k).push(b);
}

const combos = [];
for (const [k, list] of groups) {
  if (list.length >= 3) continue;
  const [category, suburb] = k.split('::');
  combos.push({
    category,
    catLabel: catLabelOf.get(category) ?? category,
    suburb,
    subLabel: subLabelOf.get(suburb) ?? suburb,
    cityLabel,
    need: 3 - list.length,
    existingNames: list.map((b) => b.name),
  });
}
combos.sort((a, b) => a.suburb.localeCompare(b.suburb) || a.category.localeCompare(b.category));

fs.mkdirSync(outDir, { recursive: true });
fs.writeFileSync(path.join(outDir, 'combos.json'), JSON.stringify(combos, null, 2));

// ---- group by suburb, then balance into NUM_BATCHES by total `need` ----
const bySuburb = new Map();
for (const c of combos) {
  if (!bySuburb.has(c.suburb)) bySuburb.set(c.suburb, { suburb: c.suburb, subLabel: c.subLabel, need: 0, combos: [] });
  const g = bySuburb.get(c.suburb);
  g.need += c.need;
  g.combos.push(c);
}
const suburbGroups = [...bySuburb.values()].sort((a, b) => b.need - a.need);

const batches = Array.from({ length: NUM_BATCHES }, () => ({ suburbs: [], need: 0 }));
for (const g of suburbGroups) {
  // greedy: always add to the currently-lightest batch
  batches.sort((a, b) => a.need - b.need);
  batches[0].suburbs.push(g);
  batches[0].need += g.need;
}

const nonEmpty = batches.filter((b) => b.suburbs.length);
nonEmpty.forEach((b, i) => {
  const n = String(i + 1).padStart(2, '0');
  fs.writeFileSync(path.join(outDir, `batch-${n}.json`), JSON.stringify({
    city, cityLabel, batch: i + 1, totalNeed: b.need,
    suburbs: b.suburbs.map((s) => ({ suburb: s.suburb, subLabel: s.subLabel, need: s.need, combos: s.combos })),
  }, null, 2));
  // Flattened, ready to feed straight into discover-businesses.mjs as its combos.json input.
  const flat = b.suburbs.flatMap((s) => s.combos);
  fs.writeFileSync(path.join(outDir, `batch-${n}.combos.json`), JSON.stringify(flat, null, 2));
});

console.log(`${combos.length} thin combos, ${combos.reduce((n, c) => n + c.need, 0)} businesses needed, across ${suburbGroups.length} suburbs`);
console.log(`wrote ${nonEmpty.length} batch files to ${outDir} (target ${NUM_BATCHES})`);
nonEmpty.forEach((b, i) => console.log(`  batch-${String(i + 1).padStart(2, '0')}: ${b.suburbs.length} suburb(s), need ${b.need}`));
