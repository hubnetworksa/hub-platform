import polokwane from '../sites/polokwane.json';
import pretoria from '../sites/pretoria.json';
import capetown from '../sites/capetown.json';

export interface SiteTheme {
  bg: string;
  bgSubtle: string;
  bgCard: string;
  border: string;
  text: string;
  textMuted: string;
  accent: string;
  accentRgb: string;
  accentHover: string;
  accentContrast: string;
  navy: string;
  navyRgb: string;
  gradientFrom: string;
  danger: string;
  warning: string;
  brandRowBg: string;
  brandRowFg: string;
  brandRowAccent: string;
  brandRowMuted: string;
}

export interface SiteFeatures {
  tourism: boolean;
}

export interface Site {
  slug: string;
  siteName: string;
  cityLabel: string;
  domain: string;
  pagesProjectName: string;
  pagesDevHost: string;
  dbName: string;
  r2Bucket: string;
  r2MediaPrefix: string;
  contactEmail: string;
  bannerImage: string;
  tagline: string;
  footerTagline: string;
  googleSiteVerification: string | null;
  adsensePublisherId: string | null;
  features: SiteFeatures;
  theme: SiteTheme;
}

export const SITES: Record<string, Site> = { polokwane, pretoria, capetown };

// Astro exposes build-time env both via `process.env` (Node context, used by
// astro.config.mjs and prebuild scripts) and `import.meta.env` (Vite context,
// used inside .astro/.ts source) — check both so this works from either.
const slug =
  (typeof process !== 'undefined' ? process.env.SITE : undefined) ??
  (import.meta as any).env?.SITE;

if (!slug) {
  throw new Error(
    'SITE env var is not set. Run with e.g. `SITE=polokwane npm run dev` — see package.json scripts.'
  );
}

const site = SITES[slug];
if (!site) {
  throw new Error(`Unknown SITE "${slug}". Known sites: ${Object.keys(SITES).join(', ')}`);
}

export default site as Site;
