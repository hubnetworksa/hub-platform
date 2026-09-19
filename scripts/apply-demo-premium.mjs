// PREVIEW-ONLY demo data. When DEMO_PREMIUM=true (set only in
// .github/workflows/deploy-ethan-preview.yml) this overlays fake premium
// state onto the build-time JSON snapshot in src/data/ so every premium spot
// on the site can be seen in the dev preview: Featured and Verified listings,
// category / suburb / shopping-centre / homepage-banner sponsors and Featured
// events. It never touches the database, and production builds (deploy.yml)
// never set the flag, so real visitors never see any of it.
//
// Runs after fetch-d1-data and before the build: `npm run prebuild`.

import { readFileSync, writeFileSync } from 'node:fs';

if (process.env.DEMO_PREMIUM !== 'true') process.exit(0);

const read = (f) => JSON.parse(readFileSync(`src/data/${f}.json`, 'utf8'));
const write = (f, v) => writeFileSync(`src/data/${f}.json`, JSON.stringify(v, null, 2));

const businesses = read('businesses');
const links = read('business-categories');
const categories = read('categories');
const suburbs = read('suburbs');
const centres = read('shopping-centers');
const events = read('events');

if (businesses.length === 0) {
  console.log('[demo-premium] no businesses in the snapshot — nothing to do.');
  process.exit(0);
}

const expires = new Date(Date.now() + 30 * 86400000).toISOString().slice(0, 19).replace('T', ' ');

// Businesses with the most complete listing first (looks best when featured),
// then by id so the choice is stable between builds.
const score = (b) => (b.description ? 2 : 0) + (b.phone ? 1 : 0) + (b.website ? 1 : 0) + (b.hours ? 1 : 0);
const ranked = [...businesses].sort((a, b) => score(b) - score(a) || a.id - b.id);

// Spread Featured/Verified across different suburbs.
const usedSuburbs = new Set();
const pick = (count, skip = new Set()) => {
  const out = [];
  for (const b of ranked) {
    if (out.length >= count) break;
    if (skip.has(b.id) || usedSuburbs.has(b.suburb_id)) continue;
    usedSuburbs.add(b.suburb_id);
    out.push(b);
  }
  return out;
};
const featured = pick(6);
const verified = pick(10, new Set(featured.map((b) => b.id)));

const setTier = (list, tier) => {
  for (const b of list) {
    const row = businesses.find((x) => x.id === b.id);
    row.subscription_tier = tier;
    row.subscription_status = 'active';
    row.subscription_expires_at = expires;
  }
};
setTier(featured, 2);
setTier(verified, 1);

// Sponsors.
const sponsorships = [];
let nextId = 9000;
const add = (product_type, product_target, b) =>
  sponsorships.push({ id: nextId++, product_type, product_target, business_id: b.id, business_name: b.name, business_slug: b.slug, current_period_end: expires });

const bizIdsByCategory = new Map();
for (const l of links) {
  if (!bizIdsByCategory.has(l.category_id)) bizIdsByCategory.set(l.category_id, []);
  bizIdsByCategory.get(l.category_id).push(l.business_id);
}
const bizById = new Map(businesses.map((b) => [b.id, b]));

// Category sponsors: the 4 biggest categories, sponsored by a business in them.
const topCategories = [...categories]
  .sort((a, b) => (bizIdsByCategory.get(b.id)?.length ?? 0) - (bizIdsByCategory.get(a.id)?.length ?? 0))
  .slice(0, 4);
for (const c of topCategories) {
  const ids = bizIdsByCategory.get(c.id) ?? [];
  const b = ranked.find((x) => ids.includes(x.id));
  if (b) add('category_sponsor', c.slug, b);
}

// Suburb sponsors: the 4 busiest suburbs.
const perSuburb = new Map();
for (const b of businesses) perSuburb.set(b.suburb_id, (perSuburb.get(b.suburb_id) ?? 0) + 1);
const topSuburbs = [...suburbs].sort((a, b) => (perSuburb.get(b.id) ?? 0) - (perSuburb.get(a.id) ?? 0)).slice(0, 4);
for (const s of topSuburbs) {
  const b = ranked.find((x) => x.suburb_id === s.id);
  if (b) add('suburb_sponsor', s.slug, b);
}

// Shopping-centre sponsors: 2 centres that have at least one business.
let centresDone = 0;
for (const c of centres) {
  if (centresDone >= 2) break;
  const b = ranked.find((x) => x.shopping_center_id === c.id);
  if (b) {
    add('centre_sponsor', c.slug, b);
    centresDone++;
  }
}

// Homepage banner.
add('homepage_banner', null, featured[0] ?? ranked[0]);

// Guide sponsor: the one published guide (src/lib/guides.ts is a TS module,
// not JSON, so its slug is pulled out with a regex rather than imported).
try {
  const guidesSrc = readFileSync('src/lib/guides.ts', 'utf8');
  const guideSlug = guidesSrc.match(/slug:\s*'([^']+)'/)?.[1];
  if (guideSlug) {
    const b = ranked.find((x) => x.id !== (sponsorships.find((s) => s.product_type === 'homepage_banner')?.business_id ?? -1));
    if (b) add('guide_sponsor', guideSlug, b);
  }
} catch {
  // No guides file yet — nothing to sponsor.
}

// Featured events.
events.slice(0, 2).forEach((e) => {
  e.featured = 1;
});

write('businesses', businesses);
write('sponsorships', sponsorships);
write('events', events);

const guideCount = sponsorships.filter((s) => s.product_type === 'guide_sponsor').length;
console.log(
  `[demo-premium] PREVIEW ONLY: ${featured.length} Featured, ${verified.length} Verified, ${sponsorships.length} sponsor slots ` +
    `(${topCategories.length} category, ${topSuburbs.length} suburb, ${centresDone} centre, ${guideCount} guide, 1 homepage banner), ${Math.min(2, events.length)} Featured events.`,
);
