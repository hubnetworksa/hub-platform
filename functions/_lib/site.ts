import polokwane from '../../sites/polokwane.json';
import pretoria from '../../sites/pretoria.json';
import capetown from '../../sites/capetown.json';

// Duplicated shape from src/site.ts rather than imported — Pages Functions
// are bundled separately from the Astro app (no shared Vite graph), and this
// file only needs the fields functions actually read.
export interface Site {
  slug: string;
  siteName: string;
  domain: string;
  pagesDevHost: string;
  r2Bucket: string;
  contactEmail: string;
}

const SITES: Record<string, Site> = { polokwane, pretoria, capetown };

// Cloudflare Pages Functions read env per-request via context.env, not
// process.env — set SITE as an environment variable on each Pages project
// (Settings → Environment variables), separately for Production/Preview.
export function getSite(slug: string | undefined): Site {
  if (!slug || !(slug in SITES)) {
    throw new Error(`Unknown or missing SITE env var: "${slug}". Known sites: ${Object.keys(SITES).join(', ')}`);
  }
  return SITES[slug];
}

export function allowedHostsFor(site: Site): string[] {
  return [site.domain, `www.${site.domain}`, site.pagesDevHost];
}
