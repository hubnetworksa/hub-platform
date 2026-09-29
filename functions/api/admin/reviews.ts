import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { requestRebuild } from '../../_lib/deploy-hook';

interface Env {
  DB: D1Database;
  GITHUB_DISPATCH_TOKEN?: string;
}

// Backs the admin Reviews moderation queue: every pending review, plus any
// already-approved review an owner has flagged as fake/abusive (see
// functions/api/flag-review.ts) — the owner can never remove a review
// themselves, only send it here for a real decision.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const rows = await context.env.DB.prepare(
    `SELECT r.id, r.rating, r.author_name, r.comment, r.status, r.flagged, r.flagged_reason, r.created_at,
            b.name AS business_name, b.slug AS business_slug
     FROM reviews r
     JOIN businesses b ON b.id = r.business_id
     WHERE r.status = 'pending' OR r.flagged = 1
     ORDER BY r.flagged DESC, r.created_at ASC
     LIMIT 300`
  ).all();
  return json({ ok: true, reviews: rows.results });
};

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }
  const id = Number(body.id);
  if (!id) return json({ ok: false, error: 'Missing id.' }, 400);
  const db = context.env.DB;

  if (body.action === 'approve') {
    await db.prepare(`UPDATE reviews SET status = 'approved', flagged = 0, reviewed_at = datetime('now') WHERE id = ?`).bind(id).run();
    await requestRebuild(context.env, 'review approved');
    return json({ ok: true });
  }
  if (body.action === 'reject') {
    await db.prepare(`UPDATE reviews SET status = 'rejected', flagged = 0, reviewed_at = datetime('now') WHERE id = ?`).bind(id).run();
    await requestRebuild(context.env, 'review rejected');
    return json({ ok: true });
  }
  return json({ ok: false, error: 'Unknown action.' }, 400);
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
