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

// A hostname allowed to hotlink this site's media (real domain, or any
// Cloudflare Pages preview of this project). Cloudflare hands out a new
// subdomain of pagesDevHost for every kind of preview — the hosted dev
// environment (dev.<host>), a branch alias (ethan-orjd.<host>), and a
// fresh one per deployment (<commit-hash>.<host>) — so this matches ANY
// subdomain of pagesDevHost rather than keeping a fixed list of the ones
// seen so far. Getting this wrong 403s every logo-icon.png/hero-skyline.jpg/
// media request when browsed from a preview URL not on the list — visible
// as a missing logo, a broken banner, or a broken image icon in place of a
// real photo, confirmed live on the Ethan branch preview (21 September).
export function isAllowedMediaHost(site: Site, hostname: string): boolean {
  return (
    hostname === site.domain ||
    hostname === `www.${site.domain}` ||
    hostname === site.pagesDevHost ||
    hostname.endsWith(`.${site.pagesDevHost}`)
  );
}
