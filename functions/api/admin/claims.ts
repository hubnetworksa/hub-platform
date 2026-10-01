import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { logActivity } from '../../_lib/activity-log';

interface Env {
  DB: D1Database;
}

// Business claims older than 14 days can no longer be approved through
// /api/review-claim, so this is the only way to get them out of the queue.
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

  if (body.action === 'dismiss') {
    const claim = await db
      .prepare("SELECT bc.id, b.name AS business_name, u.email AS claimant_email FROM business_claims bc JOIN businesses b ON b.id = bc.business_id JOIN users u ON u.id = bc.user_id WHERE bc.id = ? AND bc.status = 'pending'")
      .bind(id)
      .first<{ id: number; business_name: string; claimant_email: string }>();
    if (!claim) return json({ ok: false, error: 'That claim is no longer pending.' }, 404);
    await db.prepare("UPDATE business_claims SET status = 'rejected', reviewed_at = datetime('now') WHERE id = ?").bind(id).run();
    await logActivity(db, 'claim_rejected', claim.business_name, `Expired claim by ${claim.claimant_email} dismissed by admin.`);
    return json({ ok: true });
  }
  return json({ ok: false, error: 'Unknown action.' }, 400);
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
