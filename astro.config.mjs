// @ts-check
import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import { readFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';

const slug = process.env.SITE;
if (!slug) {
  throw new Error('SITE env var is not set. Run with e.g. `SITE=polokwane npm run dev`.');
}
const sitesDir = fileURLToPath(new URL('./sites/', import.meta.url));
const site = JSON.parse(readFileSync(`${sitesDir}${slug}.json`, 'utf8'));

// https://astro.build/config
export default defineConfig({
  site: `https://${site.domain}`,
  integrations: [sitemap()],
});
