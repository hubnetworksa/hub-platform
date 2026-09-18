import type { D1Database } from '@cloudflare/workers-types';

// Shared by every checkout/admin endpoint that needs a Rand amount or a
// tier/product label. Prices live in `site_settings` (cents, to avoid
// float rounding on money) so the admin "Plans & pricing" page can edit
// them without a code change — never hardcode a price here.

export const TIER_NAMES: Record<number, string> = { 0: 'Basic', 1: 'Verified', 2: 'Featured' };

export type SponsorProductType = 'category_sponsor' | 'suburb_sponsor' | 'homepage_banner' | 'centre_sponsor';

const SPONSOR_TYPES = new Set<SponsorProductType>([
  'category_sponsor',
  'suburb_sponsor',
  'homepage_banner',
  'centre_sponsor',
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
  }
}

const TIER_SETTING_KEYS: Record<number, string> = { 1: 'price_verified_cents', 2: 'price_featured_cents' };
const SPONSOR_SETTING_KEYS: Record<SponsorProductType, string> = {
  category_sponsor: 'price_sponsor_category_cents',
  suburb_sponsor: 'price_sponsor_suburb_cents',
  homepage_banner: 'price_sponsor_banner_cents',
  centre_sponsor: 'price_sponsor_centre_cents',
};

async function settingCents(db: D1Database, key: string): Promise<number | null> {
  const row = await db.prepare('SELECT value FROM site_settings WHERE key = ?').bind(key).first<{ value: string }>();
  if (!row) return null;
  const n = Number(row.value);
  return Number.isFinite(n) ? n : null;
}

/** Cents for a paid tier (1=Verified, 2=Featured). `null` for an unknown/free tier. */
export async function tierPriceCents(db: D1Database, tier: number): Promise<number | null> {
  const key = TIER_SETTING_KEYS[tier];
  return key ? settingCents(db, key) : null;
}

/** Cents for a sponsorship product. `null` if not configured. */
export async function sponsorPriceCents(db: D1Database, productType: SponsorProductType): Promise<number | null> {
  return settingCents(db, SPONSOR_SETTING_KEYS[productType]);
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

/** "Sold one at a time" — true if an active subscription already holds this exact slot. */
export async function isSlotTaken(
  db: D1Database,
  productType: SponsorProductType,
  productTarget: string | null
): Promise<boolean> {
  const row = await db
    .prepare(
      `SELECT 1 FROM subscriptions WHERE product_type = ? AND product_target IS ? AND status = 'active' LIMIT 1`
    )
    .bind(productType, productTarget)
    .first();
  return !!row;
}
