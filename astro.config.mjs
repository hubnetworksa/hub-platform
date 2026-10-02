// @ts-check
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import { existsSync, readFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { NOINDEX_PATH_PREFIXES } from './scripts/noindex-paths.mjs';

const slug = process.env.SITE;
if (!slug) {
  throw new Error('SITE env var is not set. Run with e.g. `SITE=polokwane npm run dev`.');
}
const sitesDir = fileURLToPath(new URL('./sites/', import.meta.url));
const site = JSON.parse(readFileSync(`${sitesDir}${slug}.json`, 'utf8'));

// Which URLs go in the sitemap, which child sitemap each lands in, and its
// <lastmod> are decided in src/lib/sitemap.ts from the same build data the
// pages are generated from (src/lib/data.ts): thin category x suburb pages
// and empty categories are left out (the pages still build, without
// noindex), form pages like /events/add/ are left out, and the rest is
// split by page type under /sitemap-index.xml (the URL robots.txt names).
// It needs src/data/*.json, which `npm run fetch-data` writes before every
// build; without it (config loaded outside a build) only the path filter
// below applies.
/** @type {typeof import('./src/lib/sitemap') | null} */
const rules = existsSync('src/data/businesses.json') ? await import('./src/lib/sitemap.ts') : null;

/** @param {string} url */
const entryFor = (url) => rules?.sitemapEntryFor(new URL(url).pathname) ?? null;

// https://astro.build/config
export default defineConfig({
  site: `https://${site.domain}`,
  integrations: [
    sitemap({
      filter: (page) => {
        const path = new URL(page).pathname;
        if (NOINDEX_PATH_PREFIXES.some((prefix) => path.startsWith(prefix))) return false;
        if (path === '/tourism/' && !site.features?.tourism) return false;
        return !rules || entryFor(page) !== null;
      },
      serialize: (item) => {
        const lastmod = entryFor(item.url)?.lastmod;
        return lastmod ? { ...item, lastmod } : item;
      },
      // One child sitemap per page type (sitemap-business-0.xml, ...) so
      // Search Console reports indexing per type. Anything unclaimed (home,
      // about, legal pages) lands in sitemap-pages-0.xml.
      chunks: rules
        ? Object.fromEntries(
            rules.SITEMAP_CHUNKS.map((name) => [
              name,
              (/** @type {{ url: string }} */ item) => (entryFor(item.url)?.chunk === name ? item : undefined),
            ])
          )
        : undefined,
    }),
  ],
});
