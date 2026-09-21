import type { D1Database } from '@cloudflare/workers-types';
import { slugify } from './slug';
import { tierPriceCents } from '../../functions/_lib/pricing';
import { issueInvoice, type InvoicingEnv } from '../../functions/_lib/invoicing';

// Shared between submit-business.ts (holds the pending row + emails the
// preview) and confirm-listing.ts (actually inserts on approval) so the
// slug-collision logic and business insert only exist in one place.

export async function generateUniqueSlug(db: D1Database, name: string, suburbSlug: string): Promise<string | null> {
  const base = `${slugify(name)}-${suburbSlug}`;
  for (let attempt = 0; attempt < 10; attempt++) {
    const candidate = attempt === 0 ? base : `${base}-${attempt + 1}`;
    const existing = await db.prepare('SELECT 1 FROM businesses WHERE slug = ?').bind(candidate).first();
    if (!existing) return candidate;
  }
  return null;
}

export interface ApprovedListing {
  slug: string;
  name: string;
  suburbId: number;
  categoryId: number;
  address: string | null;
  phone: string | null;
  website: string | null;
  email: string | null;
  description: string;
  /** The submitter's account id, if they were logged in — lets the
   *  published business show up under their "My Businesses" dashboard. */
  ownerUserId?: number | null;
  /** Tier chosen (and paid for) at submission time — 0 if none/free. Only
   *  actually applied if `paidMPaymentId` confirms PayFast's ITN marked it
   *  paid (see functions/api/subscribe/notify.ts's submission branch); a
   *  chosen-but-never-paid tier silently publishes at Basic instead of
   *  blocking the listing. */
  chosenTier?: number;
  paidMPaymentId?: string | null;
  /** Trading hours as free text ("Mon–Fri 08:00–17:00, Sat Closed"), from the listing form. */
  hours?: string | null;
  /** The shopping centre the business trades from, if the form named one. */
  shoppingCenterId?: number | null;
}

/** Id of the shopping centre with this slug, or null (unknown / not given). */
export async function shoppingCenterIdForSlug(db: D1Database, slug: string | null | undefined): Promise<number | null> {
  if (!slug) return null;
  const row = await db.prepare('SELECT id FROM shopping_centers WHERE slug = ?').bind(slug).first<{ id: number }>();
  return row?.id ?? null;
}

// If a business with this exact name already exists IN THE SAME SUBURB
// (e.g. auto-added earlier by the research routine), the owner's submitted
// details replace it in place rather than creating a duplicate listing —
// same business, more authoritative data, existing slug/URL kept intact.
// Matching on name alone (no suburb check) previously meant any two
// unrelated businesses sharing a common name anywhere in the city — e.g.
// two different shops both called "House" — would collide, silently
// overwriting one with the other's submitted details instead of both
// existing as distinct listings.
export async function insertApprovedBusiness(db: D1Database, listing: ApprovedListing, invoicingEnv?: InvoicingEnv): Promise<void> {
  const existing = await db
    .prepare('SELECT id, owner_user_id FROM businesses WHERE lower(name) = lower(?) AND suburb_id = ?')
    .bind(listing.name, listing.suburbId)
    .first<{ id: number; owner_user_id: number | null }>();

  let businessId: number;

  if (existing) {
    // Never overwrite an existing claim's ownership just because a new
    // submission happened to reuse the same business name — only fill in
    // owner_user_id if the business isn't already owned by someone.
    const ownerUserId = existing.owner_user_id ?? listing.ownerUserId ?? null;
    await db
      .prepare(
        `UPDATE businesses
          SET suburb_id = ?, address = ?, phone = ?, website = ?, email = ?, description = ?,
              hours = COALESCE(?, hours), shopping_center_id = COALESCE(?, shopping_center_id),
              status = 'published', origin = 'owner_submitted', owner_user_id = ?
          WHERE id = ?`
      )
      .bind(listing.suburbId, listing.address, listing.phone, listing.website, listing.email, listing.description, listing.hours ?? null, listing.shoppingCenterId ?? null, ownerUserId, existing.id)
      .run();

    await db.prepare('DELETE FROM business_categories WHERE business_id = ? AND is_primary = 1').bind(existing.id).run();
    await db
      .prepare('INSERT INTO business_categories (business_id, category_id, is_primary) VALUES (?, ?, 1)')
      .bind(existing.id, listing.categoryId)
      .run();
    businessId = existing.id;
  } else {
    const insert = await db
      .prepare(
        `INSERT INTO businesses
          (slug, name, suburb_id, address, phone, website, email, description, source_urls, hours, shopping_center_id, status, origin, owner_user_id)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'published', 'owner_submitted', ?)`
      )
      .bind(
        listing.slug,
        listing.name,
        listing.suburbId,
        listing.address,
        listing.phone,
        listing.website,
        listing.email,
        listing.description,
        JSON.stringify(['owner-submitted']),
        listing.hours ?? null,
        listing.shoppingCenterId ?? null,
        listing.ownerUserId ?? null
      )
      .run();
    businessId = insert.meta.last_row_id as number;

    await db
      .prepare('INSERT INTO business_categories (business_id, category_id, is_primary) VALUES (?, ?, 1)')
      .bind(businessId, listing.categoryId)
      .run();
  }

  await applyChosenTier(db, businessId, listing, invoicingEnv);
}

// A tier chosen (and paid for) back at submit-business.ts only takes
// effect here, once the business finally exists — there was nowhere to
// attach a `subscriptions` row (it requires a business_id) until now. A
// chosen-but-unpaid tier (abandoned checkout) just publishes free; it
// never blocks the listing itself.
async function applyChosenTier(db: D1Database, businessId: number, listing: ApprovedListing, invoicingEnv?: InvoicingEnv): Promise<void> {
  const tier = listing.chosenTier ?? 0;
  if (tier <= 0 || !listing.paidMPaymentId) return;

  const priceCents = await tierPriceCents(db, tier);
  if (!priceCents) return;

  const now = new Date();
  const periodEnd = new Date(now);
  periodEnd.setMonth(periodEnd.getMonth() + 1);

  const sub = await db
    .prepare(
      `INSERT INTO subscriptions (business_id, tier, product_type, m_payment_id, status, started_at, current_period_end)
       VALUES (?, ?, 'tier', ?, 'active', datetime('now'), ?)`
    )
    .bind(businessId, tier, listing.paidMPaymentId, periodEnd.toISOString())
    .run();

  await db
    .prepare(`UPDATE businesses SET subscription_tier = ?, subscription_status = 'active', subscription_expires_at = ? WHERE id = ?`)
    .bind(tier, periodEnd.toISOString(), businessId)
    .run();

  // Backfill the reconciliation record now that a subscription_id exists
  // to attach it to — the actual PayFast ITN was already verified back in
  // subscribe/notify.ts's submission branch, this just completes the audit
  // trail to match the direct-upgrade path's shape.
  const paymentInsert = await db
    .prepare('INSERT INTO payments (subscription_id, amount_cents, status, raw_itn) VALUES (?, ?, ?, ?)')
    .bind(sub.meta.last_row_id, priceCents, 'COMPLETE', 'applied at approval — see subscribe/notify.ts submission branch for the original ITN')
    .run();

  if (invoicingEnv) await issueInvoice(invoicingEnv, paymentInsert.meta.last_row_id as number);
}

export function escapeHtml(s: string): string {
  return s.replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' })[c]!);
}
