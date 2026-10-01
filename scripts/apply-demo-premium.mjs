// PREVIEW-ONLY demo data. When DEMO_PREMIUM=true (set only in
// .github/workflows/deploy-ethan-preview.yml) this overlays fake premium
// state onto the build-time JSON snapshot in src/data/ so every premium spot
// on the site can be seen in the dev preview: Featured and Verified listings,
// every category / suburb / shopping-centre / homepage-banner / guide /
// tourism sponsorship slot, and Featured events. It never touches the
// database, and production builds (deploy.yml) never set the flag, so real
// visitors never see any of it.
//
// Every premium spot is demoed with its OWN dedicated fake business (never
// a real business renamed or re-tiered) so it's obvious on sight which slot
// is being demoed — see makeFakeBusiness() below. Fake businesses get ids
// well above any real id (9,000,000+) and a name like "DEMO SPONSOR —
// Category: Plumbers", so an owner looking at a real listing next to one
// never has to guess whether it's real. Real businesses are never touched:
// no renaming, no re-tiering, no re-categorising.
//
// Runs after fetch-d1-data and before the build: `npm run prebuild`.

import { readFileSync, writeFileSync } from 'node:fs';

if (process.env.DEMO_PREMIUM !== 'true') process.exit(0);

const SITE = process.env.SITE ?? '';

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

// Businesses with the most complete listing first (looks best when used as a
// donor for realistic address/phone/hours) — used only to pick which REAL
// business a fake one borrows its realism from, never mutated itself.
const score = (b) => (b.description ? 2 : 0) + (b.phone ? 1 : 0) + (b.website ? 1 : 0) + (b.hours ? 1 : 0);
const ranked = [...businesses].sort((a, b) => score(b) - score(a) || a.id - b.id);

const bizIdsByCategory = new Map();
for (const l of links) {
  if (!bizIdsByCategory.has(l.category_id)) bizIdsByCategory.set(l.category_id, []);
  bizIdsByCategory.get(l.category_id).push(l.business_id);
}
const bizById = new Map(businesses.map((b) => [b.id, b]));

/** This donor's own primary category id (its is_primary link, or its first
 *  link if none is flagged primary), or undefined if it has none. */
function primaryCategoryId(business) {
  if (!business) return undefined;
  const ls = links.filter((l) => l.business_id === business.id);
  return (ls.find((l) => l.is_primary) ?? ls[0])?.category_id;
}

// --- Fake business factory ---------------------------------------------
//
// Every demo premium spot (sponsor slot, Featured listing, Verified
// listing) gets its OWN fake business — never a real one relabelled — so
// the name alone says exactly what it's demoing. Ids start at 9,000,000,
// far above any real snapshot id (highest real id here is well under
// 1,000), and every slug is prefixed so it can never collide with a real
// business's slug either.

let nextBusinessId = 9_000_000;
const usedSlugs = new Set(businesses.map((b) => b.slug));
function uniqueSlug(base) {
  let slug = base;
  let n = 2;
  while (usedSlugs.has(slug)) slug = `${base}-${n++}`;
  usedSlugs.add(slug);
  return slug;
}

const fakeBusinesses = [];
const fakeLinks = [];

/** Creates a dedicated fake business for one demo premium spot, borrowing
 *  believable address/phone/hours/location from a real `donor` business so
 *  its own page and the category/suburb pages it appears on look right,
 *  while its name makes clear it's a demo. `categoryId`, if given, links it
 *  into that category (business-categories.json) so categoriesFor()/
 *  businessesInCategory() pick it up like any other business. */
function makeFakeBusiness({ name, slugBase, donor, categoryId, suburbId, shoppingCenterId }) {
  const id = nextBusinessId++;
  const slug = uniqueSlug(slugBase);
  const business = {
    id,
    slug,
    name,
    suburb_id: suburbId ?? donor?.suburb_id ?? businesses[0].suburb_id,
    address: donor?.address ?? null,
    phone: donor?.phone ?? null,
    website: null,
    email: null,
    description: `Preview-only demo business. Not a real listing — created to show what this premium spot looks like live (see scripts/apply-demo-premium.mjs).`,
    lat: donor?.lat ?? null,
    lng: donor?.lng ?? null,
    source_urls: '[]',
    shopping_center_id: shoppingCenterId ?? donor?.shopping_center_id ?? null,
    description_enriched_at: null,
    hours: donor?.hours ?? null,
    owner_user_id: null,
    subscription_tier: 0,
    subscription_status: null,
    subscription_expires_at: null,
    social_instagram: null,
    social_facebook: null,
    social_linkedin: null,
    social_youtube: null,
    logo_key: null,
    whatsapp: null,
  };
  fakeBusinesses.push(business);
  const catId = categoryId ?? primaryCategoryId(donor);
  if (catId != null) fakeLinks.push({ business_id: id, category_id: catId, is_primary: 1 });
  return business;
}

// --- Featured / Verified listings ---------------------------------------
//
// One dedicated "DEMO FEATURED BUSINESS — <suburb>" and one "DEMO VERIFIED
// BUSINESS — <suburb>" per suburb that has at least one real business, so
// every suburb/category page a visitor lands on has an obvious, clearly
// labelled example of each paid tier. Real businesses' subscription_tier is
// never touched.

const bizIdsBySuburb = new Map();
for (const b of businesses) {
  if (!bizIdsBySuburb.has(b.suburb_id)) bizIdsBySuburb.set(b.suburb_id, []);
  bizIdsBySuburb.get(b.suburb_id).push(b.id);
}
const rankedBySuburb = new Map();
for (const b of ranked) {
  if (!rankedBySuburb.has(b.suburb_id)) rankedBySuburb.set(b.suburb_id, []);
  rankedBySuburb.get(b.suburb_id).push(b);
}

const DEMO_SOCIALS = {
  social_instagram: 'https://www.instagram.com/instagram/',
  social_facebook: 'https://www.facebook.com/facebook/',
  social_linkedin: 'https://www.linkedin.com/company/linkedin/',
  social_youtube: 'https://www.youtube.com/@YouTube',
};

// Sample logos (assets/demo/, copied into public/ by select-site-assets.mjs
// only when DEMO_PREMIUM is set). A logo_key starting with "/" is used as a
// site path by logoFor() in src/lib/data.ts instead of a /media/ R2 key. One
// square mark and one wide wordmark, so both shapes can be checked in every
// logo spot.
const DEMO_LOGO_SQUARE = '/demo-logo.png';
const DEMO_LOGO_WIDE = '/demo-logo-wide.png';
// Sample WhatsApp number (Featured perk). The Verified demo gets it too, to
// show the button stays hidden below Featured (whatsappFor in data.ts).
const DEMO_WHATSAPP = '082 123 4567';

let featuredCount = 0;
let verifiedCount = 0;
for (const s of suburbs) {
  const donors = rankedBySuburb.get(s.id) ?? [];
  if (donors.length === 0) continue;

  const featuredDonor = donors[0];
  const featured = makeFakeBusiness({
    name: `DEMO FEATURED BUSINESS — ${s.name}`,
    slugBase: `demo-featured-business-${s.slug}`,
    donor: featuredDonor,
    suburbId: s.id,
  });
  featured.subscription_tier = 2;
  featured.subscription_status = 'active';
  featured.subscription_expires_at = expires;
  featured.logo_key = DEMO_LOGO_SQUARE;
  Object.assign(featured, DEMO_SOCIALS);
  featured.whatsapp = DEMO_WHATSAPP;
  featuredCount++;

  const verifiedDonor = donors[1] ?? donors[0];
  const verified = makeFakeBusiness({
    name: `DEMO VERIFIED BUSINESS — ${s.name}`,
    slugBase: `demo-verified-business-${s.slug}`,
    donor: verifiedDonor,
    suburbId: s.id,
  });
  verified.subscription_tier = 1;
  verified.subscription_status = 'active';
  verified.subscription_expires_at = expires;
  verified.logo_key = DEMO_LOGO_WIDE;
  verified.whatsapp = DEMO_WHATSAPP;
  verifiedCount++;
}

// --- Sponsors -------------------------------------------------------------

const sponsorships = [];
let nextSponsorshipId = 9000;
// Logos come with the Verified plan, so a demo sponsor is shown as also
// holding Verified — that's what lets its sponsor card carry a logo.
const addSponsor = (product_type, product_target, business) => {
  business.subscription_tier = 1;
  business.subscription_status = 'active';
  business.subscription_expires_at = expires;
  business.logo_key = DEMO_LOGO_SQUARE;
  sponsorships.push({
    id: nextSponsorshipId++,
    product_type,
    product_target,
    business_id: business.id,
    business_name: business.name,
    business_slug: business.slug,
    current_period_end: expires,
  });
};

// Category sponsors: every category in the snapshot, not just the busiest.
let categorySponsorCount = 0;
for (const c of categories) {
  const ids = bizIdsByCategory.get(c.id) ?? [];
  const donor = (ids.length ? bizById.get(ids[0]) : undefined) ?? ranked[0];
  const fake = makeFakeBusiness({
    name: `DEMO SPONSOR — Category: ${c.name}`,
    slugBase: `demo-sponsor-category-sponsor-${c.slug}`,
    donor,
    categoryId: c.id,
  });
  addSponsor('category_sponsor', c.slug, fake);
  categorySponsorCount++;
}

// Suburb sponsors: every suburb that has at least one real business.
let suburbSponsorCount = 0;
for (const s of suburbs) {
  const ids = bizIdsBySuburb.get(s.id) ?? [];
  if (ids.length === 0) continue;
  const donor = bizById.get(ids[0]);
  const fake = makeFakeBusiness({
    name: `DEMO SPONSOR — Suburb: ${s.name}`,
    slugBase: `demo-sponsor-suburb-sponsor-${s.slug}`,
    donor,
    suburbId: s.id,
  });
  addSponsor('suburb_sponsor', s.slug, fake);
  suburbSponsorCount++;
}

// Shopping-centre sponsors: every centre that has at least one real business
// (a centre with none doesn't get its own page — see
// shopping-center/[slug].astro's getStaticPaths — so there'd be nowhere for
// the sponsor banner to render anyway).
const bizIdsByCentre = new Map();
for (const b of businesses) {
  if (b.shopping_center_id == null) continue;
  if (!bizIdsByCentre.has(b.shopping_center_id)) bizIdsByCentre.set(b.shopping_center_id, []);
  bizIdsByCentre.get(b.shopping_center_id).push(b.id);
}
let centreSponsorCount = 0;
for (const c of centres) {
  const ids = bizIdsByCentre.get(c.id) ?? [];
  if (ids.length === 0) continue;
  const donor = bizById.get(ids[0]);
  const fake = makeFakeBusiness({
    name: `DEMO SPONSOR — Shopping Centre: ${c.name}`,
    slugBase: `demo-sponsor-centre-sponsor-${c.slug}`,
    donor,
    suburbId: c.suburb_id ?? donor?.suburb_id,
    shoppingCenterId: c.id,
  });
  addSponsor('centre_sponsor', c.slug, fake);
  centreSponsorCount++;
}

// Homepage banner: there's only ever one slot.
{
  const donor = ranked[0];
  const fake = makeFakeBusiness({
    name: 'DEMO SPONSOR — Homepage Banner',
    slugBase: 'demo-sponsor-homepage-banner',
    donor,
  });
  addSponsor('homepage_banner', null, fake);
}

// Guide sponsors: every published guide for this site (src/lib/guides.ts is
// a TS module, not JSON, so its content is pulled out with regexes scoped to
// this site's own `const <site>: Guide[] = [...]` block, rather than
// imported — a city with no guides file/block yet is guarded the same way
// a missing file would be).
let guideSponsorCount = 0;
try {
  const guidesSrc = readFileSync('src/lib/guides.ts', 'utf8');
  const siteMarkers = [...guidesSrc.matchAll(/\nconst (\w+): Guide\[\] = \[/g)];
  const idx = siteMarkers.findIndex((m) => m[1] === SITE);
  if (idx !== -1) {
    const start = siteMarkers[idx].index;
    const endMarker = guidesSrc.indexOf('\nexport const GUIDES', start);
    const end = idx + 1 < siteMarkers.length ? siteMarkers[idx + 1].index : endMarker !== -1 ? endMarker : guidesSrc.length;
    const block = guidesSrc.slice(start, end);
    const slugs = [...block.matchAll(/\n {4}slug: '([^']+)',/g)].map((m) => m[1]);
    const titles = [...block.matchAll(/\n {4}title: '([^']+)',/g)].map((m) => m[1]);
    const categorySlugs = [...block.matchAll(/\n {4}categorySlug: '([^']+)',/g)].map((m) => m[1]);
    for (let i = 0; i < slugs.length; i++) {
      const guideSlug = slugs[i];
      const title = titles[i] ?? guideSlug;
      const category = categories.find((c) => c.slug === categorySlugs[i]);
      const ids = category ? bizIdsByCategory.get(category.id) ?? [] : [];
      const donor = (ids.length ? bizById.get(ids[0]) : undefined) ?? ranked[0];
      const fake = makeFakeBusiness({
        name: `DEMO SPONSOR — Guide: ${title}`,
        slugBase: `demo-sponsor-guide-sponsor-${guideSlug}`,
        donor,
        categoryId: category?.id,
      });
      addSponsor('guide_sponsor', guideSlug, fake);
      guideSponsorCount++;
    }
  }
} catch {
  // No guides file yet — nothing to sponsor.
}

// Tourism sponsors: every "Things to do" pick that has its own detail page,
// for this site (src/site-content/tourism.ts is also a TS module — same
// regex-on-raw-source approach, scoped to this site's own block in the
// TOURISM record, guarded the same way for a city with no tourism picks).
let tourismSponsorCount = 0;
try {
  const tourismSrc = readFileSync('src/site-content/tourism.ts', 'utf8');
  const siteMarkers = [...tourismSrc.matchAll(/\n {2}(\w+): \{/g)];
  const idx = siteMarkers.findIndex((m) => m[1] === SITE);
  if (idx !== -1) {
    const start = siteMarkers[idx].index;
    const end = idx + 1 < siteMarkers.length ? siteMarkers[idx + 1].index : tourismSrc.length;
    const block = tourismSrc.slice(start, end);
    // Only TourPick objects (never an itinerary/stop, which share `name`
    // and `slug` but never `cat`) — each pick is written on a single line.
    const picks = [...block.matchAll(/\{\s*name: '([^']+)', cat: '([^']+)',[^}]*?suburb: '([^']*)'[^}]*?slug: '([^']+)'\s*\}/g)]
      .map((m) => ({ name: m[1], cat: m[2], suburbLabel: m[3], slug: m[4] }));
    for (const pick of picks) {
      const matchedSuburb = suburbs.find((s) => s.name.toLowerCase() === pick.suburbLabel.toLowerCase());
      const suburbDonors = matchedSuburb ? bizIdsBySuburb.get(matchedSuburb.id) ?? [] : [];
      const donor = (suburbDonors.length ? bizById.get(suburbDonors[0]) : undefined) ?? ranked[0];
      const fake = makeFakeBusiness({
        name: `DEMO SPONSOR — Things To Do: ${pick.name}`,
        slugBase: `demo-sponsor-tourism-sponsor-${pick.slug}`,
        donor,
      });
      addSponsor('tourism_sponsor', pick.slug, fake);
      tourismSponsorCount++;
    }
  }
} catch {
  // No tourism content for this site — nothing to sponsor.
}

// Featured events (unaffected by the fake-business rework above — events
// aren't businesses, and toggling `featured` on a couple of real upcoming
// events doesn't create the same "is this real?" ambiguity a renamed
// business would).
events.slice(0, 2).forEach((e) => {
  e.featured = 1;
});

write('businesses', [...businesses, ...fakeBusinesses]);
write('business-categories', [...links, ...fakeLinks]);
write('sponsorships', sponsorships);
write('events', events);

console.log(
  `[demo-premium] PREVIEW ONLY (${SITE || 'unknown site'}): ${fakeBusinesses.length} dedicated demo businesses added ` +
    `(${featuredCount} Featured, ${verifiedCount} Verified, ${sponsorships.length} sponsor slots: ` +
    `${categorySponsorCount} category, ${suburbSponsorCount} suburb, ${centreSponsorCount} centre, ${guideSponsorCount} guide, ` +
    `${tourismSponsorCount} tourism, 1 homepage banner), ${Math.min(2, events.length)} Featured events. ` +
    `No real business was renamed, re-tiered or re-categorised.`,
);
