#!/usr/bin/env node
// Run after fetch-d1-data.mjs (reuses its src/data/*.json output). Writes a
// single trimmed status/<site>/db-snapshot.json that the hourly research
// routine reads from its git checkout — the routine has no Cloudflare
// credentials and never touches D1 directly, so this committed snapshot is
// how it knows current state (what's already published, what's missing
// address/phone).

import { readFileSync, writeFileSync, mkdirSync, existsSync } from 'node:fs';
import { execFileSync } from 'node:child_process';
import path from 'node:path';

const SITE = process.env.SITE;
if (!SITE) {
  throw new Error('SITE env var is not set. Run with e.g. `SITE=polokwane node scripts/write-db-snapshot.mjs`.');
}

// Businesses an admin hid (status != 'published') or deleted (tombstones in
// suppressed_businesses) — src/data only holds published ones, so these come
// straight from D1, same wrangler-exec pattern as fetch-d1-data.mjs. The
// routines put them in their packets as `doNotAdd` and validate.mjs rejects
// any INSERT that matches one. If D1 can't be read (no credentials locally,
// table not migrated yet) the previous snapshot's list is kept rather than
// silently emptied.
function d1Query(sql) {
  const site = JSON.parse(readFileSync(`sites/${SITE}.json`, 'utf8'));
  const args = [path.join('node_modules', 'wrangler', 'bin', 'wrangler.js'), 'd1', 'execute', site.dbName, '--config', `wrangler.${SITE}.jsonc`, '--remote', '--json', '--command', sql];
  const raw = execFileSync(process.execPath, args, { encoding: 'utf8', maxBuffer: 64 * 1024 * 1024, stdio: ['ignore', 'pipe', 'pipe'] });
  return JSON.parse(raw.slice(raw.indexOf('[')))[0]?.results ?? [];
}
const last9 = (p) => String(p ?? '').replace(/\D/g, '').slice(-9) || null;
function loadSuppressed() {
  const previous = () => {
    try {
      const file = `status/${SITE}/db-snapshot.json`;
      return existsSync(file) ? JSON.parse(readFileSync(file, 'utf8')).suppressed ?? [] : [];
    } catch {
      return [];
    }
  };
  let hidden;
  try {
    hidden = d1Query(
      `SELECT b.name, b.slug, s.slug AS suburb, b.phone, b.website FROM businesses b LEFT JOIN suburbs s ON s.id = b.suburb_id WHERE b.status != 'published';`
    ).map((b) => ({ name: b.name, slug: b.slug, suburb: b.suburb, phoneDigits: last9(b.phone), website: b.website ?? null, reason: 'hidden' }));
  } catch {
    process.stderr.write(`[${SITE}] Could not read hidden businesses from D1; keeping the previous snapshot's suppressed list.\n`);
    return previous();
  }
  let deleted = [];
  try {
    deleted = d1Query('SELECT name, slug, suburb_slug, phone_digits, website FROM suppressed_businesses;').map((r) => ({
      name: r.name, slug: r.slug, suburb: r.suburb_slug, phoneDigits: r.phone_digits || null, website: r.website ?? null, reason: 'deleted',
    }));
  } catch {
    process.stderr.write(`[${SITE}] suppressed_businesses table not available yet; only hidden businesses are suppressed.\n`);
  }
  return [...hidden, ...deleted];
}

const suburbs = JSON.parse(readFileSync('src/data/suburbs.json', 'utf8'));
const categories = JSON.parse(readFileSync('src/data/categories.json', 'utf8'));
const businesses = JSON.parse(readFileSync('src/data/businesses.json', 'utf8'));
const businessCategories = JSON.parse(readFileSync('src/data/business-categories.json', 'utf8'));
const shoppingCenters = JSON.parse(readFileSync('src/data/shopping-centers.json', 'utf8'));
const events = JSON.parse(readFileSync('src/data/events.json', 'utf8'));
const news = JSON.parse(readFileSync('src/data/news.json', 'utf8'));
const fuel = JSON.parse(readFileSync('src/data/fuel-prices.json', 'utf8'));

const suburbById = new Map(suburbs.map((s) => [s.id, s]));
const categoryById = new Map(categories.map((c) => [c.id, c]));
const shoppingCenterById = new Map(shoppingCenters.map((sc) => [sc.id, sc]));
const primaryCategoryByBusinessId = new Map();
for (const link of businessCategories) {
  if (link.is_primary && !primaryCategoryByBusinessId.has(link.business_id)) {
    primaryCategoryByBusinessId.set(link.business_id, categoryById.get(link.category_id)?.slug ?? null);
  }
}

const snapshot = {
  generated_at: new Date().toISOString(),
  suburbs: suburbs.map((s) => ({ slug: s.slug, name: s.name, region: s.region })),
  categories: categories.map((c) => ({ slug: c.slug, name: c.name })),
  shopping_centers: shoppingCenters
    .filter((sc) => sc.type === 'mall')
    .map((sc) => ({
      slug: sc.slug,
      name: sc.name,
      suburb_slug: suburbById.get(sc.suburb_id)?.slug ?? null,
      address: sc.address,
    })),
  businesses: businesses.map((b) => ({
    slug: b.slug,
    name: b.name,
    suburb_slug: suburbById.get(b.suburb_id)?.slug ?? null,
    category_slug: primaryCategoryByBusinessId.get(b.id) ?? null,
    address: b.address,
    phone: b.phone,
    shopping_center_slug: shoppingCenterById.get(b.shopping_center_id)?.slug ?? null,
    source_urls: b.source_urls,
    description_enriched_at: b.description_enriched_at,
    hours: b.hours,
    // Used by the split routines: website to research from, and whether an email is already on file (the address itself stays out of the snapshot).
    website: b.website ?? null,
    has_email: Boolean(b.email),
    // Owned, owner-submitted or paid: the listing belongs to its owner and no routine may
    // change it (next.mjs leaves it out of every work batch, validate.mjs rejects UPDATEs on it).
    owner_managed: b.owner_user_id != null || b.origin === 'owner_submitted' || Number(b.subscription_tier ?? 0) >= 1,
  })),
  // Read by the weekly events research routine (ROUTINE.events.<slug>.md)
  // to know what's already listed, purely for dedup — it has no other
  // state file of its own, unlike the hourly business routine's
  // routine-state.json (no suburb rotation/index to track here).
  events: events.map((e) => ({ slug: e.slug, title: e.title, event_date: e.event_date, type: e.type })),
  // Read by the daily news routine (ROUTINE.news.<slug>.md) so it doesn't re-publish a story.
  // Read by the news routine's monthly fuel-price update (previous prices -> change_cents).
  fuel_prices: fuel.map((f) => ({ period: f.period, region: f.region, grade: f.grade, price_cents: f.price_cents })),
  news: news.map((n) => ({ slug: n.slug, title: n.title, published_date: n.published_date, source_url: n.source_url })),
  // Hidden or deleted by an admin: the research routines must never re-add these.
  suppressed: loadSuppressed(),
};

// Compact (no pretty-print indentation) since the hourly research routine
// reads this whole file as LLM context every run -- indentation and
// repeated field names cost real tokens with zero information value.
// `description` is omitted for the same reason: no routine reads it, and none
// may change it (job 4, the enrichment pass, is disabled; see DISABLED_ROUTINES
// in scripts/routines/lib.mjs). D1 remains the source of truth for it.
mkdirSync(`status/${SITE}`, { recursive: true });
writeFileSync(`status/${SITE}/db-snapshot.json`, JSON.stringify(snapshot));
process.stderr.write(
  `[${SITE}] Wrote status/${SITE}/db-snapshot.json (${snapshot.businesses.length} businesses, ` +
  `${snapshot.shopping_centers.length} shopping centres, ${snapshot.events.length} events, ${snapshot.suppressed.length} suppressed).\n`
);
