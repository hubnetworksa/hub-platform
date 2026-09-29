// @ts-check
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import { readFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { NOINDEX_PATH_PREFIXES } from './scripts/noindex-paths.mjs';
import { isThinListing } from './scripts/thin-listings.mjs';

const slug = process.env.SITE;
if (!slug) {
  throw new Error('SITE env var is not set. Run with e.g. `SITE=polokwane npm run dev`.');
}
const sitesDir = fileURLToPath(new URL('./sites/', import.meta.url));
const site = JSON.parse(readFileSync(`${sitesDir}${slug}.json`, 'utf8'));

// Category pages with 0 businesses get a `noindex` meta tag (see
// BaseLayout.astro + src/pages/category/[slug]/index.astro) so Google
// doesn't crawl/index a thin page. They must also be left out of the
// sitemap, or we'd be inviting Google to crawl exactly the pages we just
// told it not to index. Computed straight from the same prebuilt JSON
// src/data/*.json (produced by `npm run fetch-data`, which always runs
// before `astro build` — see package.json) rather than importing
// src/lib/data.ts, to keep this file plain Node/JSON with no
// TS-in-config surprises.
function emptyCategorySlugs() {
  try {
    /** @type {{ id: number, slug: string }[]} */
    const categories = JSON.parse(readFileSync('src/data/categories.json', 'utf8'));
    /** @type {{ category_id: number }[]} */
    const links = JSON.parse(readFileSync('src/data/business-categories.json', 'utf8'));
    const withBusinesses = new Set(links.map((l) => l.category_id));
    return new Set(categories.filter((c) => !withBusinesses.has(c.id)).map((c) => c.slug));
  } catch {
    // src/data/*.json not fetched yet (e.g. config loaded outside a real
    // build) — fall back to excluding nothing rather than failing the build.
    return new Set();
  }
}

const EMPTY_CATEGORIES = emptyCategorySlugs();

// Business pages that carry `noindex` for being thin (see
// scripts/thin-listings.mjs) must stay out of the sitemap too, for the same
// reason as the empty categories above.
function thinBusinessSlugs() {
  try {
    /** @type {{ id: number, slug: string }[]} */
    const businesses = JSON.parse(readFileSync('src/data/businesses.json', 'utf8'));
    /** @type {{ business_id: number }[]} */
    let reviews = [];
    try {
      reviews = JSON.parse(readFileSync('src/data/reviews.json', 'utf8'));
    } catch {
      reviews = [];
    }
    /** @type {Map<number, number>} */
    const reviewCounts = new Map();
    for (const r of reviews) reviewCounts.set(r.business_id, (reviewCounts.get(r.business_id) ?? 0) + 1);
    return new Set(businesses.filter((b) => isThinListing(b, reviewCounts.get(b.id) ?? 0)).map((b) => b.slug));
  } catch {
    return new Set();
  }
}

const THIN_BUSINESSES = thinBusinessSlugs();

// https://astro.build/config
export default defineConfig({
  site: `https://${site.domain}`,
  integrations: [
    sitemap({
      filter: (page) => {
        const path = new URL(page).pathname;
        if (NOINDEX_PATH_PREFIXES.some((prefix) => path.startsWith(prefix))) return false;
        if (path === '/tourism/' && !site.features?.tourism) return false;
        const match = path.match(/^\/category\/([^/]+)\/?$/);
        if (match && EMPTY_CATEGORIES.has(match[1])) return false;
        const biz = path.match(/^\/business\/([^/]+)\/?$/);
        if (biz && THIN_BUSINESSES.has(biz[1])) return false;
        return true;
      },
    }),
  ],
});
