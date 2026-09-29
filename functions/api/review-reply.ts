import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../_lib/auth';
import { cleanText, json } from '../_lib/messages';
import { requestRebuild } from '../_lib/deploy-hook';

interface Env {
  DB: D1Database;
  GITHUB_DISPATCH_TOKEN?: string;
}

// The business owner's one public right of reply to a review on their own
// listing — never a way to remove or edit the review itself (see
// functions/api/flag-review.ts for that). Only allowed once the review is
// already 'approved': replying to something not public yet makes no sense,
// and a pending review could still be rejected outright.
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

  const reply = cleanText(body.reply, 1500);
  if (!reply) return json({ ok: false, error: 'Please write a reply.' }, 400);

  const review = await db
    .prepare(`SELECT r.id, r.status, b.owner_user_id FROM reviews r JOIN businesses b ON b.id = r.business_id WHERE r.id = ?`)
    .bind(reviewId)
    .first<{ id: number; status: string; owner_user_id: number | null }>();
  if (!review || (review.owner_user_id !== user.id && !isAdminEmail(user.email))) {
    return json({ ok: false, error: 'You do not own this business.' }, 403);
  }
  if (review.status !== 'approved') {
    return json({ ok: false, error: 'You can only reply to a review once it is live.' }, 400);
  }

  await db.prepare(`UPDATE reviews SET owner_reply = ?, owner_reply_at = datetime('now') WHERE id = ?`).bind(reply, reviewId).run();
  await requestRebuild(context.env, 'owner replied to a review');
  return json({ ok: true });
};
