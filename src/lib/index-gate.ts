// Index gate: decides whether a business page is indexed by search engines.
//
// Every listing gets a content score (0..MAX_SCORE) from the signals below.
// Listings at or above the city threshold are indexed (robots meta + sitemap);
// the rest stay live but carry `noindex, follow` and leave the sitemap. The
// threshold lives in `site_settings.index_min_score` (admin Site settings) and
// is read in src/lib/site-overrides.ts. Pages with Google Search impressions in
// the last 90 days are PROTECTED (never noindexed), paid/owner-claimed
// listings are always indexed, and with no protected-pages list available
// (`listAvailable` false) everything stays indexed. Nothing is ever deleted.
//
// Side effect: BaseLayout turns off AdSense on noindex pages (noAds), so
// gated listings stop showing ads. Accepted trade-off.
//
// Pure module: no Astro or data imports, so functions/ and scripts can share it.
import { plainLine, canFormatDescription } from './rich-text';

export const MAX_SCORE = 15;
export const DEFAULT_MIN_SCORE = 6;
export const POINTS = { descriptionLong: 5, descriptionMid: 2, hours: 2, phone: 1, website: 1, map: 1, media: 1, claimed: 2, reviews: 2 } as const;

export type SignalKey = 'description' | 'hours' | 'phone' | 'website' | 'map' | 'media' | 'claimed' | 'reviews';

export const SIGNAL_LABELS: Record<SignalKey, string> = {
  description: 'Generic or short description',
  hours: 'Trading hours',
  phone: 'Phone number',
  website: 'Website',
  map: 'Map pin',
  media: 'Photo or logo',
  claimed: 'Claimed or paid',
  reviews: 'Customer review',
};

export interface ScoreInput {
  name: string;
  description?: string | null;
  hours?: string | null;
  phone?: string | null;
  website?: string | null;
  lat?: number | null;
  lng?: number | null;
  logo_key?: string | null;
  photoCount: number;
  approvedReviewCount: number;
  owner_user_id?: number | null;
  subscription_tier?: number | null;
  subscription_status?: string | null;
}

const TEMPLATE_RE = /^\s*.+? is a business in .+?, part of the .+? area( of the [^.]+ metro)?\.?\s*$/i;

/** True for the scraped/submit-form boilerplate ("X is a business in Y, part of the Z area ..."). */
export function isGenericDescription(text: string | null | undefined, _name?: string): boolean {
  if (!text) return false;
  const stripped = plainLine(text).replace(/\s*Opening hours:.*$/i, '');
  return TEMPLATE_RE.test(stripped);
}

const filled = (s: string | null | undefined) => typeof s === 'string' && s.trim().length > 0;

export function scoreBusiness(b: ScoreInput): { score: number; max: number; signals: Record<SignalKey, number>; generic: boolean; paidOrClaimed: boolean } {
  const generic = isGenericDescription(b.description, b.name);
  const len = plainLine(b.description).trim().length;
  const description = generic || len < 140 ? 0 : len < 300 ? POINTS.descriptionMid : POINTS.descriptionLong;
  const paidOrClaimed = (b.subscription_tier ?? 0) >= 1 || b.owner_user_id != null;
  const signals: Record<SignalKey, number> = {
    description,
    hours: (b.hours ?? '').trim().length >= 3 ? POINTS.hours : 0,
    phone: filled(b.phone) ? POINTS.phone : 0,
    website: filled(b.website) ? POINTS.website : 0,
    map: Number.isFinite(b.lat) && Number.isFinite(b.lng) && b.lat != null && b.lng != null ? POINTS.map : 0,
    media: (b.photoCount > 0 || !!b.logo_key) && canFormatDescription({ subscription_tier: b.subscription_tier, subscription_status: b.subscription_status }) ? POINTS.media : 0,
    claimed: paidOrClaimed ? POINTS.claimed : 0,
    reviews: b.approvedReviewCount > 0 ? POINTS.reviews : 0,
  };
  const score = Object.values(signals).reduce((a, n) => a + n, 0);
  return { score, max: MAX_SCORE, signals, generic, paidOrClaimed };
}

/** Signals that scored 0, in display order. */
export function missingSignals(signals: Record<SignalKey, number>): SignalKey[] {
  return (Object.keys(SIGNAL_LABELS) as SignalKey[]).filter((k) => !signals[k]);
}

export function indexDecision(a: { score: number; threshold: number; protected: boolean; paidOrClaimed: boolean; listAvailable: boolean }): 'index' | 'noindex' {
  return !a.listAvailable || a.protected || a.paidOrClaimed || a.threshold <= 0 || a.score >= a.threshold ? 'index' : 'noindex';
}
