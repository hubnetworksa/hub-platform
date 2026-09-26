import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { cancelPayfastSubscription, payfastConfigured, type PayfastEnv } from '../../_lib/payfast';
import { logActivity } from '../../_lib/activity-log';

interface Env extends PayfastEnv {
  DB: D1Database;
}

// Actually calls PayFast's own Subscriptions API to stop future billing —
// not just a local status flip. The business keeps its current tier until
// subscription_expires_at (the period already paid for); a daily sweep
// (functions/api/admin/process-expired-subscriptions.ts) downgrades it to
// Free once that date passes.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false, error: 'Please log in first.' }, 401);
  if (!payfastConfigured(context.env)) return json({ ok: false, error: 'Not configured.' }, 503);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }
  const businessId = Number(body.businessId);
  if (!businessId) return json({ ok: false, error: 'Missing business.' }, 400);

  const business = await db.prepare('SELECT id, name, owner_user_id FROM businesses WHERE id = ?').bind(businessId).first<{ id: number; name: string; owner_user_id: number | null }>();
  if (!business || (business.owner_user_id !== user.id && !isAdminEmail(user.email))) {
    return json({ ok: false, error: 'You do not own this business.' }, 403);
  }

  const subscription = await db
    .prepare(`SELECT id, payfast_token FROM subscriptions WHERE business_id = ? AND status = 'active' ORDER BY id DESC LIMIT 1`)
    .bind(businessId)
    .first<{ id: number; payfast_token: string | null }>();
  if (!subscription || !subscription.payfast_token) {
    return json({ ok: false, error: 'No active subscription found to cancel.' }, 400);
  }

  const result = await cancelPayfastSubscription(context.env, subscription.payfast_token);
  if (!result.ok) {
    return json({ ok: false, error: 'PayFast could not cancel this subscription — please try again or contact support.' }, 502);
  }

  await db.prepare(`UPDATE subscriptions SET status = 'cancelled', cancelled_at = datetime('now') WHERE id = ?`).bind(subscription.id).run();
  await db.prepare(`UPDATE businesses SET subscription_status = 'cancelled' WHERE id = ?`).bind(businessId).run();
  await logActivity(db, 'subscription_cancelled', business.name, 'Owner cancelled via PayFast — stays on current tier until the paid period ends.');

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
