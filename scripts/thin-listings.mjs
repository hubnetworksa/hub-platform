// A "thin" business listing is one that gives a visitor nothing beyond the
// name, category, suburb and phone number: a free (Basic) listing nobody has
// claimed, with a one-line description, no trading hours, no website and no
// approved reviews. These pages stay on the site (search, suburb and category
// pages still list them, and they're useful to someone looking for a phone
// number), but they carry `noindex` and are left out of the sitemap, so
// Google judges the site by its substantive pages rather than thousands of
// near-identical stubs. That matters for AdSense's "Low value content" review.
//
// A listing drops out of this set on its own the moment it gains any real
// substance: the owner claims it, it moves to a paid plan, research adds
// hours/a website/a fuller description, or it receives an approved review.
//
// Shared by src/pages/business/[slug].astro (the robots meta tag) and
// astro.config.mjs (the sitemap filter) so the two can never disagree.

/** Descriptions shorter than this are one-liners ("X is a Y in Z, City."). */
export const THIN_DESCRIPTION_CHARS = 140;

/**
 * @param {{ subscription_tier?: number | null, owner_user_id?: number | null, description?: string | null, hours?: string | null, website?: string | null }} b
 * @param {number} approvedReviews
 * @returns {boolean}
 */
export function isThinListing(b, approvedReviews) {
  if ((b.subscription_tier ?? 0) >= 1) return false;
  if (b.owner_user_id) return false;
  if (approvedReviews > 0) return false;
  if ((b.hours ?? '').trim()) return false;
  if ((b.website ?? '').trim()) return false;
  return (b.description ?? '').trim().length < THIN_DESCRIPTION_CHARS;
}
