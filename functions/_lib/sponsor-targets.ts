import type { D1Database } from '@cloudflare/workers-types';
import { GUIDES } from '../../src/lib/guides';
import { TOURISM } from '../../src/site-content/tourism';
import type { SponsorProductType } from './pricing';

// Every sponsorship slot a page can actually show. Checkout refuses
// anything else, so nobody can pay for a "category" or "suburb" that no page
// ever renders.
export async function isValidSponsorTarget(
  db: D1Database,
  siteSlug: string,
  productType: SponsorProductType,
  target: string | null
): Promise<boolean> {
  if (productType === 'homepage_banner') return target === null;
  if (!target || !/^[a-z0-9-]{1,120}$/.test(target)) return false;
  switch (productType) {
    case 'category_sponsor':
      return !!(await db.prepare('SELECT 1 FROM categories WHERE slug = ?').bind(target).first());
    case 'suburb_sponsor':
      return !!(await db.prepare('SELECT 1 FROM suburbs WHERE slug = ?').bind(target).first());
    case 'centre_sponsor':
      return !!(await db.prepare('SELECT 1 FROM shopping_centers WHERE slug = ?').bind(target).first());
    case 'guide_sponsor':
      return GUIDES.some((g) => g.slug === target);
    case 'tourism_sponsor':
      return (TOURISM[siteSlug]?.picks ?? []).some((p) => p.slug === target);
  }
}
