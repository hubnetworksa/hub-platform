import polokwane from '../../sites/polokwane.json';
import pretoria from '../../sites/pretoria.json';
import capetown from '../../sites/capetown.json';

// Duplicated shape from src/site.ts rather than imported — Pages Functions
// are bundled separately from the Astro app (no shared Vite graph), and this
// file only needs the fields functions actually read.
export interface SiteTheme {
  bg: string;
  bgSubtle: string;
  bgCard: string;
  border: string;
  text: string;
  textMuted: string;
  accent: string;
  accentRgb: string;
  accentContrast: string;
  navy: string;
  navyRgb: string;
}

export interface Site {
  slug: string;
  siteName: string;
  cityLabel: string;
  domain: string;
  domainLive: boolean;
  pagesDevHost: string;
  r2Bucket: string;
  contactEmail: string;
  bannerImage: string;
  theme: SiteTheme;
  /** Registered trading details for invoices — null until the owner supplies
   *  them (see functions/_lib/invoicing.ts). An invoice is still valid and
   *  professional without these; they just don't appear until set. */
  invoicing?: {
    registeredAddress: string | null;
    vatNumber: string | null;
    registrationNumber: string | null;
  };
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
  // Includes the "dev." branch-preview alias (dev.<project>.pages.dev, used
  // by the hosted dev environment — see deploy-dev.yml) alongside the bare
  // pagesDevHost (the project's default/production preview alias) — without
  // this, browsing the dev preview directly sends a Referer that matches
  // neither the real domain nor the bare pages.dev host, so this hotlink
  // guard 403s every logo-icon.png/hero-skyline.jpg/media request (visible
  // as a missing logo image, broken banner, etc. only on the dev preview).
  return [site.domain, `www.${site.domain}`, site.pagesDevHost, `dev.${site.pagesDevHost}`];
}
