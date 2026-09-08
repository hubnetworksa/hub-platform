#!/usr/bin/env node
// Historical one-off tool from PretoriaHub, carried over as-is — hardcoded
// to the pretoriahub-db database name below; adjust that before running
// against another site's database.
// One-time conversion: fuel stations were imported into shopping_centers
// (see 0007) to disambiguate co-located branches (Steers-at-an-Engen is
// common in SA), but per direct correction they shouldn't be a "shopping
// centre"/category concept at all — they belong in the directory as
// ordinary businesses. This inserts each into `businesses` under the new
// fuel-stations category, unlinks anything that pointed to it as a
// shopping_center_id, then removes the fuel_station rows from
// shopping_centers entirely.
//
// OSM usually tags these with just the brand ("Engen"), not a specific
// station name — appending suburb (and street address where we have it)
// is the most honest way to make each one distinct without inventing a
// name that isn't in the source data.

import { execFileSync } from 'node:child_process';
import { writeFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import path from 'node:path';

const WRANGLER_JS = path.join(path.dirname(fileURLToPath(import.meta.url)), '..', 'node_modules', 'wrangler', 'bin', 'wrangler.js');

function d1Query(sql) {
  const args = [WRANGLER_JS, 'd1', 'execute', 'pretoriahub-db', '--remote', '--json', '--command', sql];
  const raw = execFileSync(process.execPath, args, { encoding: 'utf8', maxBuffer: 64 * 1024 * 1024 });
  return JSON.parse(raw.slice(raw.indexOf('[')))[0]?.results ?? [];
}

function slugify(s) {
  return s.toLowerCase().trim().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '').slice(0, 80);
}

function sqlEscape(v) {
  if (v === null || v === undefined) return 'NULL';
  return `'${String(v).replace(/'/g, "''")}'`;
}

async function main() {
  const stations = d1Query("SELECT id, slug, name, suburb_id, address, lat, lng, source_urls FROM shopping_centers WHERE type = 'fuel_station';");
  const suburbs = d1Query('SELECT id, slug, name FROM suburbs;');
  const suburbById = new Map(suburbs.map((s) => [s.id, s]));
  const category = d1Query("SELECT id FROM categories WHERE slug = 'fuel-stations';")[0];
  const existingSlugs = new Set(d1Query('SELECT slug FROM businesses;').map((r) => r.slug));

  console.error(`${stations.length} fuel stations to convert.`);

  const statements = [];
  for (const st of stations) {
    const suburb = suburbById.get(st.suburb_id);
    const qualifier = st.address || suburb?.name || '';
    const fullName = qualifier ? `${st.name} ${qualifier}` : st.name;

    let slug = `${slugify(fullName)}`;
    let attempt = 0;
    while (existingSlugs.has(slug)) {
      attempt++;
      slug = `${slugify(fullName)}-${attempt + 1}`;
    }
    existingSlugs.add(slug);

    const description = `${st.name} fuel station${suburb ? ` in ${suburb.name}` : ''}.`;
    const sourceUrls = st.source_urls || '[]';

    statements.push(`INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  ${sqlEscape(slug)}, ${sqlEscape(fullName)}, ${st.suburb_id ?? 'NULL'},
  ${sqlEscape(st.address)}, ${st.lat ?? 'NULL'}, ${st.lng ?? 'NULL'},
  ${sqlEscape(description)}, ${sqlEscape(sourceUrls)}, 'published', 'seed_import'
);`);
    statements.push(`INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = ${sqlEscape(slug)}), ${category.id}, 1);`);
  }

  // Unlink anything pointing at a fuel_station center, then remove those
  // centers from shopping_centers entirely — they're not a "shopping
  // centre" concept per the correction.
  statements.push("UPDATE businesses SET shopping_center_id = NULL WHERE shopping_center_id IN (SELECT id FROM shopping_centers WHERE type = 'fuel_station');");
  statements.push("DELETE FROM shopping_centers WHERE type = 'fuel_station';");

  writeFileSync('db/seed-data/fuel-stations-conversion.sql', statements.join('\n\n') + '\n');
  console.error(`Wrote db/seed-data/fuel-stations-conversion.sql (${stations.length} businesses + cleanup).`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
