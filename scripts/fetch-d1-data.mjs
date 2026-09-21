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
// Every site's D1 database is shared between its production build and its
// hosted dev preview — a test business used to verify a dev-only feature is
// a real row in the same database production reads from. Its `status`
// alone can't tell "show on dev" apart from "show on production," since
// both builds run this identical query. is_test does: only the dev
// preview's deploy workflow sets INCLUDE_TEST_DATA=true, so a test
// business never reaches a production build regardless of its status.
const INCLUDE_TEST_DATA = process.env.INCLUDE_TEST_DATA === 'true';
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
    `SELECT id, slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, shopping_center_id, description_enriched_at, hours, owner_user_id, subscription_tier, subscription_status, subscription_expires_at, social_instagram, social_facebook, social_linkedin, social_youtube
     FROM businesses WHERE status = 'published' AND closed_at IS NULL${INCLUDE_TEST_DATA ? '' : ' AND is_test = 0'} ORDER BY name;`
  );
  const businessCategories = query('SELECT business_id, category_id, is_primary FROM business_categories;');
  const shoppingCenters = query('SELECT id, slug, name, suburb_id, address, lat, lng, type, description FROM shopping_centers ORDER BY name;');
  // Only Featured-tier businesses' photos are ever rendered (see
  // business/[slug].astro), but it's simplest to just pull everyone's and
  // let the page decide — a downgraded business's photos stay in this
  // file too, harmless since the page gates on current tier, not on
  // whether a photos array is present.
  const businessPhotos = query('SELECT id, business_id, r2_key, sort_order, caption FROM business_photos ORDER BY business_id, sort_order;');
  // Active exclusive sponsorship slots (category/suburb/homepage banner/
  // shopping-centre) — a build-time snapshot, same pattern as everything
  // else here: changes only take effect on the next admin-triggered
  // rebuild, not live. See functions/_lib/pricing.ts for product types.
  // Admin-editable prices (see functions/_lib/pricing.ts) — the public
  // Pricing page and the plan picker on list-your-business.astro both
  // read from this snapshot rather than hardcoding a price.
  const siteSettings = query('SELECT key, value FROM site_settings;');
  const sponsorships = query(
    `SELECT s.id, s.product_type, s.product_target, s.business_id, b.name AS business_name, b.slug AS business_slug, s.current_period_end
     FROM subscriptions s JOIN businesses b ON b.id = s.business_id
     WHERE s.product_type != 'tier' AND s.status = 'active';`
  );
  // Events (mockup's new "Events" screen) — admin-added plus whatever the
  // weekly discovery agent has auto-published since the last rebuild.
  const events = query(
    `SELECT id, slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
            image_url, image_credit, organiser, organiser_note, doors, ages, parking, traders, lineup_json, tiers_json,
            description, featured, event_owner_user_id
     FROM events ORDER BY event_date ASC;`
  );

  // Local news (daily news agent + admin). Tolerant of a database that
  // hasn't had the news migration applied yet — the site just has no news.
  let news = [];
  try {
    news = query(
      `SELECT id, slug, title, category, published_date, source_name, source_url, summary, body, image_url, image_credit, verification_json
       FROM news ORDER BY published_date DESC, id DESC;`
    );
  } catch {
    process.stderr.write(`[${SITE}] news table not available yet — building without news.
`);
  }

  let fuelPrices = [];
  try {
    fuelPrices = query('SELECT period, region, grade, price_cents, change_cents, source_url FROM fuel_prices ORDER BY period DESC, grade;');
  } catch {
    process.stderr.write(`[${SITE}] fuel_prices table not available yet — building without fuel prices.\n`);
  }

  await writeFile(`${OUT_DIR}/suburbs.json`, JSON.stringify(suburbs, null, 2));
  await writeFile(`${OUT_DIR}/categories.json`, JSON.stringify(categories, null, 2));
  await writeFile(`${OUT_DIR}/businesses.json`, JSON.stringify(businesses, null, 2));
  await writeFile(`${OUT_DIR}/business-categories.json`, JSON.stringify(businessCategories, null, 2));
  await writeFile(`${OUT_DIR}/shopping-centers.json`, JSON.stringify(shoppingCenters, null, 2));
  await writeFile(`${OUT_DIR}/business-photos.json`, JSON.stringify(businessPhotos, null, 2));
  await writeFile(`${OUT_DIR}/sponsorships.json`, JSON.stringify(sponsorships, null, 2));
  await writeFile(`${OUT_DIR}/site-settings.json`, JSON.stringify(siteSettings, null, 2));
  await writeFile(`${OUT_DIR}/events.json`, JSON.stringify(events, null, 2));
  await writeFile(`${OUT_DIR}/news.json`, JSON.stringify(news, null, 2));
  await writeFile(`${OUT_DIR}/fuel-prices.json`, JSON.stringify(fuelPrices, null, 2));

  process.stderr.write(
    `[${SITE}] Fetched ${suburbs.length} suburbs, ${categories.length} categories, ` +
    `${businesses.length} businesses, ${businessCategories.length} business-category links, ` +
    `${shoppingCenters.length} shopping centres, ${events.length} events, ${news.length} news articles ` +
    `(${REMOTE ? 'remote' : 'local'}).\n`
  );
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
