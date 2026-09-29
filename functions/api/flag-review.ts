import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../_lib/auth';
import { cleanText, json } from '../_lib/messages';

interface Env {
  DB: D1Database;
}

// Lets the owner send a review on their own listing to the admin
// moderation queue as fake/abusive — deliberately NOT a way to hide or
// remove it themselves. Only functions/api/admin/reviews.ts can change
// public visibility, which is what keeps the ratings trustworthy to a
// visitor: a business can't just make its bad reviews disappear.
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
  const reviewId = Number(body.reviewId);
  if (!reviewId) return json({ ok: false, error: 'Missing review.' }, 400);
  const reason = cleanText(body.reason, 300) ?? '';

  const review = await db
    .prepare(`SELECT r.id, b.owner_user_id FROM reviews r JOIN businesses b ON b.id = r.business_id WHERE r.id = ?`)
    .bind(reviewId)
    .first<{ id: number; owner_user_id: number | null }>();
  if (!review || (review.owner_user_id !== user.id && !isAdminEmail(user.email))) {
    return json({ ok: false, error: 'You do not own this business.' }, 403);
  }

  await db.prepare(`UPDATE reviews SET flagged = 1, flagged_reason = ? WHERE id = ?`).bind(reason, reviewId).run();
  return json({ ok: true });
};
