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
  /** PayFast's own subscription token for the signup-tier payment, captured
   *  by the ITN onto the pending row. Stored on the `subscriptions` row so
   *  the subscription can actually be cancelled later — without it a Cancel
   *  button can only update our database while PayFast keeps billing. */
  payfastToken?: string | null;
}

/** The published listing a new submission for `name` in `suburbSlug` would be
 *  merged into, if any — so the admin review page can warn before approving. */
export async function findMergeTarget(
  db: D1Database,
  name: string,
  suburbSlug: string
): Promise<{ id: number; name: string; slug: string; owner_user_id: number | null } | null> {
  const row = await db
    .prepare(
      `SELECT b.id, b.name, b.slug, b.owner_user_id FROM businesses b
       JOIN suburbs s ON s.id = b.suburb_id
       WHERE lower(b.name) = lower(?) AND s.slug = ?`
    )
    .bind(name, suburbSlug)
    .first<{ id: number; name: string; slug: string; owner_user_id: number | null }>();
  return row ?? null;
}

/** Id of the shopping centre with this slug, or null (unknown / not given). */
export async function shoppingCenterIdForSlug(db: D1Database, slug: string | null | undefined): Promise<number | null> {
  if (!slug) return null;
  const row = await db.prepare('SELECT id FROM shopping_centers WHERE slug = ?').bind(slug).first<{ id: number }>();
  return row?.id ?? null;
}

// If a business with this exact name already exists IN THE SAME SUBURB
// (e.g. auto-added earlier by the research routine), the submission is
// merged into it rather than creating a duplicate listing — but only to
// fill gaps. Anyone can submit a listing under any name, so a submission is
// not proof of ownership: it never overwrites data already on the listing
// and never makes the submitter its owner. Taking over an existing listing
// has to go through the claim flow, which verifies against the business's
// own contact details. The admin review page flags these merges up front
// (see findMergeTarget).
export async function insertApprovedBusiness(db: D1Database, listing: ApprovedListing, invoicingEnv?: InvoicingEnv): Promise<void> {
  const existing = await db
    .prepare('SELECT id FROM businesses WHERE lower(name) = lower(?) AND suburb_id = ?')
    .bind(listing.name, listing.suburbId)
    .first<{ id: number }>();

  let businessId: number;

  if (existing) {
    await db
      .prepare(
        `UPDATE businesses
          SET address = COALESCE(NULLIF(address, ''), ?),
              phone = COALESCE(NULLIF(phone, ''), ?),
              website = COALESCE(NULLIF(website, ''), ?),
              email = COALESCE(NULLIF(email, ''), ?),
              description = COALESCE(NULLIF(description, ''), ?),
              hours = COALESCE(NULLIF(hours, ''), ?),
              shopping_center_id = COALESCE(shopping_center_id, ?),
              status = 'published'
          WHERE id = ?`
      )
      .bind(listing.address, listing.phone, listing.website, listing.email, listing.description, listing.hours ?? null, listing.shoppingCenterId ?? null, existing.id)
      .run();

    await db
      .prepare(
        `INSERT INTO business_categories (business_id, category_id, is_primary)
         SELECT ?, ?, 1 WHERE NOT EXISTS (SELECT 1 FROM business_categories WHERE business_id = ? AND is_primary = 1)`
      )
      .bind(existing.id, listing.categoryId, existing.id)
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

  const sub = await db
    .prepare(
      `INSERT INTO subscriptions (business_id, tier, product_type, m_payment_id, payfast_token, status, started_at, current_period_end)
       VALUES (?, ?, 'tier', ?, ?, 'active', datetime('now'), datetime('now', '+1 month'))`
    )
    .bind(businessId, tier, listing.paidMPaymentId, listing.payfastToken ?? null)
    .run();

  await db
    .prepare(`UPDATE businesses SET subscription_tier = ?, subscription_status = 'active', subscription_expires_at = datetime('now', '+1 month') WHERE id = ?`)
    .bind(tier, businessId)
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
