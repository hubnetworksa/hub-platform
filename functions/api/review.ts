import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser } from '../_lib/auth';
import { cleanText, rateLimited, json } from '../_lib/messages';

interface Env {
  DB: D1Database;
  SITE: string;
}

// A visitor's star rating + written review on a business page. Requires a
// logged-in account — UNIQUE(business_id, user_id) in the reviews table is
// what actually enforces "one review per account per business", not just
// this endpoint's own logic. Never goes live immediately: status starts
// 'pending' and only functions/api/admin/reviews.ts can move it to
// 'approved' (picked up by the next build) or 'rejected'.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false, error: 'Please log in first.' }, 401);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  // Honeypot + timing check, same as the enquiry form — defense in depth
  // even though a real login is already required to reach this point.
  if (typeof body.company_url === 'string' && body.company_url.trim() !== '') {
    return json({ ok: false, error: 'Submission rejected.' }, 400);
  }
  const loadedAt = Number(body.loadedAt);
  if (!loadedAt || Date.now() - loadedAt < 2000) {
    return json({ ok: false, error: 'Submission rejected.' }, 400);
  }

  if (await rateLimited(db, context.request, context.env.SITE, 'review', 10)) {
    return json({ ok: false, error: 'Too many submissions from your connection. Please try again in an hour.' }, 429);
  }

  const slug = cleanText(body.businessSlug, 160);
  if (!slug) return json({ ok: false, error: 'Missing business.' }, 400);

  const rating = Number(body.rating);
  if (!Number.isInteger(rating) || rating < 1 || rating > 5) {
    return json({ ok: false, error: 'Choose a rating from 1 to 5 stars.' }, 400);
  }
  // A display name typed at submission time, same as the enquiry form's own
  // "name" field — the users table has no display name, only email, and an
  // account email must never be shown publicly (or even to the business
  // owner) alongside a review.
  const authorName = cleanText(body.authorName, 80);
  if (!authorName) return json({ ok: false, error: 'Please enter your name.' }, 400);
  const comment = cleanText(body.comment, 2000);
  if (!comment || comment.length < 5) {
    return json({ ok: false, error: 'Please write a few words about your experience.' }, 400);
  }

  const business = await db
    .prepare(`SELECT id FROM businesses WHERE slug = ? AND status = 'published' AND closed_at IS NULL`)
    .bind(slug)
    .first<{ id: number }>();
  if (!business) return json({ ok: false, error: 'That listing could not be found.' }, 404);

  try {
    await db
      .prepare('INSERT INTO reviews (business_id, user_id, rating, author_name, comment) VALUES (?, ?, ?, ?, ?)')
      .bind(business.id, user.id, rating, authorName, comment)
      .run();
  } catch (err) {
    // UNIQUE(business_id, user_id) violation — D1 surfaces this as a plain
    // Error whose message names the constraint, not a typed exception.
    if (err instanceof Error && /UNIQUE/i.test(err.message)) {
      return json({ ok: false, error: "You've already reviewed this business." }, 400);
    }
    throw err;
  }

  return json({ ok: true });
};
