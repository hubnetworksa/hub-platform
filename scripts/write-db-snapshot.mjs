#!/usr/bin/env node
// Run after fetch-d1-data.mjs (reuses its src/data/*.json output). Writes a
// single trimmed status/<site>/db-snapshot.json that the hourly research
// routine reads from its git checkout — the routine has no Cloudflare
// credentials and never touches D1 directly, so this committed snapshot is
// how it knows current state (what's already published, what's missing
// address/phone).

import { readFileSync, writeFileSync, mkdirSync } from 'node:fs';

const SITE = process.env.SITE;
if (!SITE) {
  throw new Error('SITE env var is not set. Run with e.g. `SITE=polokwane node scripts/write-db-snapshot.mjs`.');
}

const suburbs = JSON.parse(readFileSync('src/data/suburbs.json', 'utf8'));
const categories = JSON.parse(readFileSync('src/data/categories.json', 'utf8'));
const businesses = JSON.parse(readFileSync('src/data/businesses.json', 'utf8'));
const businessCategories = JSON.parse(readFileSync('src/data/business-categories.json', 'utf8'));
const shoppingCenters = JSON.parse(readFileSync('src/data/shopping-centers.json', 'utf8'));

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
  })),
};

// Compact (no pretty-print indentation) since the hourly research routine
// reads this whole file as LLM context every run -- indentation and
// repeated field names cost real tokens with zero information value.
// `description` is omitted for the same reason: job 4 (the only job that
// touches it) always replaces it wholesale keyed off `description_enriched_at`
// and never reads the old text; D1 remains the source of truth for it.
mkdirSync(`status/${SITE}`, { recursive: true });
writeFileSync(`status/${SITE}/db-snapshot.json`, JSON.stringify(snapshot));
process.stderr.write(
  `[${SITE}] Wrote status/${SITE}/db-snapshot.json (${snapshot.businesses.length} businesses, ` +
  `${snapshot.shopping_centers.length} shopping centres).\n`
);
