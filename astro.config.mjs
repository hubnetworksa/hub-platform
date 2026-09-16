// @ts-check
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import { readFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { NOINDEX_PATH_PREFIXES } from './scripts/noindex-paths.mjs';

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

// https://astro.build/config
export default defineConfig({
  site: `https://${site.domain}`,
  integrations: [
    sitemap({
      filter: (page) => {
        const path = new URL(page).pathname;
        if (NOINDEX_PATH_PREFIXES.some((prefix) => path.startsWith(prefix))) return false;
        const match = path.match(/^\/category\/([^/]+)\/?$/);
        if (match && EMPTY_CATEGORIES.has(match[1])) return false;
        return true;
      },
    }),
  ],
});
