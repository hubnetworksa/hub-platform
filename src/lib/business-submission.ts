import type { D1Database } from '@cloudflare/workers-types';
import { slugify } from './slug';

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
}

// If a business with this exact name already exists (e.g. auto-added
// earlier by the research routine), the owner's submitted details replace
// it in place rather than creating a duplicate listing — same business,
// more authoritative data, existing slug/URL kept intact.
export async function insertApprovedBusiness(db: D1Database, listing: ApprovedListing): Promise<void> {
  const existing = await db
    .prepare('SELECT id, owner_user_id FROM businesses WHERE lower(name) = lower(?)')
    .bind(listing.name)
    .first<{ id: number; owner_user_id: number | null }>();

  if (existing) {
    // Never overwrite an existing claim's ownership just because a new
    // submission happened to reuse the same business name — only fill in
    // owner_user_id if the business isn't already owned by someone.
    const ownerUserId = existing.owner_user_id ?? listing.ownerUserId ?? null;
    await db
      .prepare(
        `UPDATE businesses
          SET suburb_id = ?, address = ?, phone = ?, website = ?, email = ?, description = ?,
              status = 'published', origin = 'owner_submitted', owner_user_id = ?
          WHERE id = ?`
      )
      .bind(listing.suburbId, listing.address, listing.phone, listing.website, listing.email, listing.description, ownerUserId, existing.id)
      .run();

    await db.prepare('DELETE FROM business_categories WHERE business_id = ? AND is_primary = 1').bind(existing.id).run();
    await db
      .prepare('INSERT INTO business_categories (business_id, category_id, is_primary) VALUES (?, ?, 1)')
      .bind(existing.id, listing.categoryId)
      .run();
    return;
  }

  const insert = await db
    .prepare(
      `INSERT INTO businesses
        (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin, owner_user_id)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'published', 'owner_submitted', ?)`
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
      listing.ownerUserId ?? null
    )
    .run();

  await db
    .prepare('INSERT INTO business_categories (business_id, category_id, is_primary) VALUES (?, ?, 1)')
    .bind(insert.meta.last_row_id, listing.categoryId)
    .run();
}

export function escapeHtml(s: string): string {
  return s.replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' })[c]!);
}
