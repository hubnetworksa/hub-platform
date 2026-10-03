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

// Which URLs go in the sitemap and their <lastmod> are decided in
// src/lib/sitemap.ts from the same build data the pages are generated from
// (src/lib/data.ts): every public page goes in, and only noindex pages
// (account/form pages, empty categories) are left out. All of them land in
// one file, sitemap-0.xml, under /sitemap-index.xml (the URL robots.txt
// names) — the owner wants every page in a single sitemap.
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
    }),
  ],
});
