#!/usr/bin/env node
// Prebuild step: pulls suburbs/categories/businesses out of D1 into JSON
// under src/data/, which Astro's getStaticPaths then reads to statically
// generate every suburb/category/business page at build time. Astro's
// static build has no live D1 binding available (that only exists inside
// the Workers runtime), so this is the bridge — same role devkit's
// hand-authored tools.ts plays, just generated instead of hand-written.

import { mkdir, writeFile, readFile } from 'node:fs/promises';
import { execFileSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
import path from 'node:path';

const SITE = process.env.SITE;
if (!SITE) {
  throw new Error('SITE env var is not set. Run with e.g. `SITE=polokwane npm run fetch-data`.');
}
const ROOT = path.join(path.dirname(fileURLToPath(import.meta.url)), '..');
const site = JSON.parse(await readFile(path.join(ROOT, 'sites', `${SITE}.json`), 'utf8'));

const DB_NAME = site.dbName;
const REMOTE = !process.argv.includes('--local');
const OUT_DIR = path.join(ROOT, 'src', 'data');
// --file mode uploads the file and only returns execution stats, not row
// data, so SELECTs have to go through --command instead. Invoking
// wrangler.js directly via `node` (rather than npx/npx.cmd) sidesteps
// PATH/shell resolution differences between local Windows dev and the
// Linux CI runner.
const WRANGLER_JS = path.join(ROOT, 'node_modules', 'wrangler', 'bin', 'wrangler.js');
const WRANGLER_CONFIG = path.join(ROOT, `wrangler.${SITE}.jsonc`);

function query(sql) {
  const args = [WRANGLER_JS, 'd1', 'execute', DB_NAME, '--config', WRANGLER_CONFIG, REMOTE ? '--remote' : '--local', '--json', '--command', sql];
  const raw = execFileSync(process.execPath, args, { encoding: 'utf8', maxBuffer: 64 * 1024 * 1024 });
  const jsonStart = raw.indexOf('[');
  const parsed = JSON.parse(raw.slice(jsonStart));
  return parsed[0]?.results ?? [];
}

async function main() {
  await mkdir(OUT_DIR, { recursive: true });

  const suburbs = query('SELECT id, slug, name, region, bio, landmarks, lat, lng, image_key FROM suburbs ORDER BY name;');
  const categories = query('SELECT id, slug, name FROM categories ORDER BY name;');
  const businesses = query(
    `SELECT id, slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, shopping_center_id, description_enriched_at, hours, owner_user_id
     FROM businesses WHERE status = 'published' ORDER BY name;`
  );
  const businessCategories = query('SELECT business_id, category_id, is_primary FROM business_categories;');
  const shoppingCenters = query('SELECT id, slug, name, suburb_id, address, lat, lng, type, description FROM shopping_centers ORDER BY name;');

  await writeFile(`${OUT_DIR}/suburbs.json`, JSON.stringify(suburbs, null, 2));
  await writeFile(`${OUT_DIR}/categories.json`, JSON.stringify(categories, null, 2));
  await writeFile(`${OUT_DIR}/businesses.json`, JSON.stringify(businesses, null, 2));
  await writeFile(`${OUT_DIR}/business-categories.json`, JSON.stringify(businessCategories, null, 2));
  await writeFile(`${OUT_DIR}/shopping-centers.json`, JSON.stringify(shoppingCenters, null, 2));

  process.stderr.write(
    `[${SITE}] Fetched ${suburbs.length} suburbs, ${categories.length} categories, ` +
    `${businesses.length} businesses, ${businessCategories.length} business-category links, ` +
    `${shoppingCenters.length} shopping centres ` +
    `(${REMOTE ? 'remote' : 'local'}).\n`
  );
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
