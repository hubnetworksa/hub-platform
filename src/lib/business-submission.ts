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
}

export async function insertApprovedBusiness(db: D1Database, listing: ApprovedListing): Promise<void> {
  const insert = await db
    .prepare(
      `INSERT INTO businesses
        (slug, name, suburb_id, address, phone, website, email, description, source_urls, status, origin)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'published', 'owner_submitted')`
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
      JSON.stringify(['owner-submitted'])
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
