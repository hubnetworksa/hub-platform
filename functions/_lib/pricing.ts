import type { D1Database } from '@cloudflare/workers-types';

// Shared by every checkout/admin endpoint that needs a Rand amount or a
// tier/product label. Prices live in `site_settings` (cents, to avoid
// float rounding on money) so the admin "Plans & pricing" page can edit
// them without a code change — never hardcode a price here.

export const TIER_NAMES: Record<number, string> = { 0: 'Basic', 1: 'Verified', 2: 'Featured' };

export type SponsorProductType = 'category_sponsor' | 'suburb_sponsor' | 'homepage_banner' | 'centre_sponsor' | 'guide_sponsor' | 'tourism_sponsor';

const SPONSOR_TYPES = new Set<SponsorProductType>([
  'category_sponsor',
  'suburb_sponsor',
  'homepage_banner',
  'centre_sponsor',
  'guide_sponsor',
  'tourism_sponsor',
]);

export function isSponsorProductType(v: unknown): v is SponsorProductType {
  return typeof v === 'string' && SPONSOR_TYPES.has(v as SponsorProductType);
}

export function sponsorProductLabel(productType: SponsorProductType, target: string | null): string {
  switch (productType) {
    case 'category_sponsor':
      return `Category sponsor — ${target ?? ''}`;
    case 'suburb_sponsor':
      return `Suburb sponsor — ${target ?? ''}`;
    case 'homepage_banner':
      return 'Homepage banner';
    case 'centre_sponsor':
      return `Shopping centre sponsor — ${target ?? ''}`;
    case 'guide_sponsor':
      return `Guide sponsor — ${target ?? ''}`;
    case 'tourism_sponsor':
      return `Things to do sponsor — ${target ?? ''}`;
  }
}

export const TIER_SETTING_KEYS: Record<number, string> = { 1: 'price_verified_cents', 2: 'price_featured_cents' };
export const SPONSOR_SETTING_KEYS: Record<SponsorProductType, string> = {
  category_sponsor: 'price_sponsor_category_cents',
  suburb_sponsor: 'price_sponsor_suburb_cents',
  homepage_banner: 'price_sponsor_banner_cents',
  centre_sponsor: 'price_sponsor_centre_cents',
  guide_sponsor: 'price_sponsor_guide_cents',
  tourism_sponsor: 'price_sponsor_tourism_cents',
};

async function settingCents(db: D1Database, key: string): Promise<number | null> {
  const row = await db.prepare('SELECT value FROM site_settings WHERE key = ?').bind(key).first<{ value: string }>();
  if (!row) return null;
  const n = Number(row.value);
  return Number.isFinite(n) ? n : null;
}

// Plans and sponsor spots can be paid monthly or yearly. A yearly price is
// its own site_settings key (the monthly key with `_yearly` before
// `_cents`); until an admin sets one, yearly is monthly × 10 — two months
// free. Events stay one-off/monthly and have no yearly price.
export type BillingPeriod = 'monthly' | 'yearly';

export const YEARLY_FALLBACK_MONTHS = 10;

/** Anything other than the literal 'yearly' is monthly, so a request (or
 *  row) that predates yearly billing behaves exactly as before. */
export function parseBillingPeriod(v: unknown): BillingPeriod {
  return v === 'yearly' ? 'yearly' : 'monthly';
}

/** SQLite datetime() modifier for one paid period. */
export function periodInterval(period: BillingPeriod | string | null | undefined): '+1 year' | '+1 month' {
  return period === 'yearly' ? '+1 year' : '+1 month';
}

export function yearlyKey(monthlyKey: string): string {
  return monthlyKey.replace(/_cents$/, '_yearly_cents');
}

async function periodCents(db: D1Database, monthlyKey: string, period: BillingPeriod): Promise<number | null> {
  const monthly = await settingCents(db, monthlyKey);
  if (period === 'monthly') return monthly;
  const yearly = await settingCents(db, yearlyKey(monthlyKey));
  if (yearly) return yearly;
  return monthly ? monthly * YEARLY_FALLBACK_MONTHS : monthly;
}

/** Cents for a paid tier (1=Verified, 2=Featured) for one billing period.
 *  `null` for an unknown/free tier. */
export async function tierPriceCents(db: D1Database, tier: number, period: BillingPeriod = 'monthly'): Promise<number | null> {
  const key = TIER_SETTING_KEYS[tier];
  return key ? periodCents(db, key, period) : null;
}

/** Cents for a sponsorship product for one billing period. `null` if not configured. */
export async function sponsorPriceCents(
  db: D1Database,
  productType: SponsorProductType,
  period: BillingPeriod = 'monthly'
): Promise<number | null> {
  return periodCents(db, SPONSOR_SETTING_KEYS[productType], period);
}

/** Monthly and yearly cents for one monthly price key, from an already-loaded
 *  site_settings map (allPrices(), or a static page's build-time snapshot).
 *  Yearly falls back to monthly × 10 when its key is unset or 0. */
export function monthlyAndYearly(prices: Record<string, number | string | undefined>, monthlyKey: string): { monthly: number; yearly: number } {
  const monthly = Number(prices[monthlyKey]) || 0;
  const yearly = Number(prices[yearlyKey(monthlyKey)]) || monthly * YEARLY_FALLBACK_MONTHS;
  return { monthly, yearly };
}

/** Cents to feature an event (a one-off purchase, not a recurring plan). `null` if not configured. */
export async function eventFeaturePriceCents(db: D1Database): Promise<number | null> {
  return settingCents(db, 'price_event_feature_cents');
}

export function centsToRand(cents: number): string {
  return (cents / 100).toFixed(2);
}

/** All current prices, for the admin editor and the public pricing page. */
export async function allPrices(db: D1Database): Promise<Record<string, number>> {
  const rows = await db.prepare('SELECT key, value FROM site_settings').all<{ key: string; value: string }>();
  const out: Record<string, number> = {};
  for (const r of rows.results) out[r.key] = Number(r.value) || 0;
  return out;
}

// A cancelled slot is still occupied until the period the owner already
// paid for runs out — cancelling stops future billing, it doesn't hand the
// slot to someone else the same afternoon (the UI promises exactly that,
// and process-expired-subscriptions.ts does the real freeing once the date
// passes). current_period_end exists in both ISO ("…T…Z", written by
// notify.ts) and SQLite ("YYYY-MM-DD HH:MM:SS", written by admin comps)
// formats, so every comparison has to go through datetime().
//
// subscriptions.status values: 'pending' (checkout started, unpaid),
// 'active', 'cancelled' (billing stopped, paid period still running),
// 'expired' (period over — a late renewal charge revives it) and 'cleared'
// (admin took the spot away, or the business was hidden/deleted — terminal,
// never revived; see _lib/sponsorships.ts). Only the first two hold a slot.
// The database backs this up: a partial unique index
// (idx_subscriptions_one_active_slot) allows at most one 'active' row per
// sponsor spot, so a race that slips past this check fails loudly there.
export const SLOT_HELD_SQL = `(status = 'active' OR (status = 'cancelled' AND current_period_end IS NOT NULL AND datetime(current_period_end) > datetime('now')))`;

/** "Sold one at a time" — true if a live subscription already holds this
 *  exact slot. `excludeSubscriptionId` skips one row (the caller's own
 *  subscription, when re-checking just before activating it).
 *  `excludeBusinessId` skips every row of one business: an owner switching
 *  the same spot between monthly and yearly is buying a slot they already
 *  hold, and their old row is cancelled when the new one activates (see
 *  notify.ts) — it must not count as "taken" by someone else. */
export async function isSlotTaken(
  db: D1Database,
  productType: SponsorProductType,
  productTarget: string | null,
  excludeSubscriptionId?: number,
  excludeBusinessId?: number
): Promise<boolean> {
  const row = await db
    .prepare(
      `SELECT 1 FROM subscriptions WHERE product_type = ? AND product_target IS ? AND ${SLOT_HELD_SQL} AND id != ? AND business_id != ? LIMIT 1`
    )
    .bind(productType, productTarget, excludeSubscriptionId ?? -1, excludeBusinessId ?? -1)
    .first();
  return !!row;
}
