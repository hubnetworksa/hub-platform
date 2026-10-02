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

/** The operator's identity, shown on About, Contact, the Privacy & POPIA
 *  notice and the Terms of use (POPIA s18, ECTA s43). The operator trades as
 *  "Hub Network SA" across all three sites; the only published contact is
 *  contactEmail. Any field may be null — the pages fall back to a truthful
 *  generic sentence ("the operator of <siteName>") and never render a
 *  placeholder. `legalForm` and `registrationNumber` are kept as records but
 *  are deliberately not rendered anywhere: the owner has asked that no page
 *  describe the operator's legal form or registration. */
export interface SiteLegal {
  /** Trading name, e.g. "Hub Network SA". */
  legalName: string | null;
  legalForm: 'private company' | 'sole proprietor' | null;
  /** The natural person's full name behind a sole proprietorship (ECTA
   *  s43(1)(a)); rendered only when set. */
  operatorName: string | null;
  /** CIPC registration number (private company only). */
  registrationNumber: string | null;
  /** false = not registered for VAT: prices are shown and charged without VAT. */
  vatRegistered: boolean;
  /** Public URL of the PAIA s51 manual once one is published. */
  paiaManualUrl: string | null;
}

/** Every place the site can show a Google AdSense display unit. Each one
 *  renders nothing unless sites/<city>.json names an ad-unit slot ID for it
 *  (see AdUnit.astro), so an unset placement is invisible — never a dashed
 *  placeholder box on the public site. */
export type AdPlacement =
  | 'businessSidebar'
  | 'businessInContent'
  | 'homeInContent'
  | 'searchInFeed'
  | 'suburbSidebar'
  | 'eventsSidebar'
  | 'eventSidebar'
  | 'tourismSidebar';

export interface Site {
  slug: string;
  siteName: string;
  cityLabel: string;
  /** Full province name (e.g. "Limpopo") — used for structured-data
   *  addressRegion so Pretoria/Cape Town business pages don't inherit
   *  Polokwane's province. Never abbreviate; schema.org addressRegion
   *  conventionally wants the full name, not a postal code. */
  province: string;
  domain: string;
  /** Whether `domain`'s DNS/nameservers actually point at this Cloudflare
   *  Pages project yet — gates the .pages.dev -> domain redirect in
   *  functions/_middleware.ts so a not-yet-cut-over site doesn't redirect
   *  visitors to a domain that isn't live here. */
  domainLive: boolean;
  /** Cloudflare zone ID for `domain`, used by the deploy workflow's cache
   *  purge step — `null` for a site whose domain isn't live yet. */
  cloudflareZoneId: string | null;
  pagesProjectName: string;
  pagesDevHost: string;
  dbName: string;
  r2Bucket: string;
  r2MediaPrefix: string;
  contactEmail: string;
  bannerImage: string;
  /** Used by every non-homepage hero banner (suburb/category/events/
   *  shopping-centre — anywhere index.astro isn't) — kept separate from
   *  `bannerImage` since a photo chosen to work well behind the homepage's
   *  taller hero doesn't necessarily crop well in these shorter, more
   *  letterboxed sections. Cape Town's is a wide panoramic shot chosen
   *  specifically to survive an aggressive object-fit:cover crop; Pretoria/
   *  Polokwane currently just reuse their existing bannerImage until they
   *  get an equivalent. */
  sectionBannerImage: string;
  /** News section's own hero banner — falls back to sectionBannerImage on a
   *  site where scripts/generate-news-banner-image.mjs hasn't run yet. */
  newsBannerImage?: string;
  tagline: string;
  footerTagline: string;
  googleSiteVerification: string | null;
  bingSiteVerification: string | null;
  /** Impact.com affiliate-network site verification — homepage only, per
   *  their own instructions, not site-wide. */
  impactSiteVerification: string | null;
  googleAnalyticsId: string | null;
  adsensePublisherId: string | null;
  /** AdSense ad-unit slot IDs (the numeric data-ad-slot from the AdSense
   *  dashboard) per placement. null = no manual unit there. */
  adsenseSlots?: Partial<Record<AdPlacement, string | null>>;
  features: SiteFeatures;
  theme: SiteTheme;
  /** Invoice header details — see functions/_lib/invoicing.ts. */
  invoicing?: {
    registeredAddress: string | null;
    vatNumber: string | null;
    registrationNumber: string | null;
  };
  legal?: SiteLegal;
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
