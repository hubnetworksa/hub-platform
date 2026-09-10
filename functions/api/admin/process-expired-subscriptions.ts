import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { logActivity } from '../../_lib/activity-log';

interface Env {
  DB: D1Database;
  CRON_SECRET?: string;
}

// Daily sweep (same CRON_SECRET-gated pattern as process-owner-reminders):
// a subscription that's cancelled, or whose recurring payment simply
// stopped renewing (still "active" in our DB but past its paid period —
// PayFast's ITN just never arrived to extend it), gets downgraded to
// Free once subscription_expires_at has passed. The owner keeps whatever
// they already paid for right up to that date either way.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const auth = context.request.headers.get('Authorization');
  if (!context.env.CRON_SECRET || auth !== `Bearer ${context.env.CRON_SECRET}`) {
    return json({ ok: false }, 401);
  }

  const db = context.env.DB;
  const expired = await db
    .prepare(
      `SELECT id, name FROM businesses
       WHERE subscription_tier > 0 AND subscription_expires_at IS NOT NULL AND subscription_expires_at <= datetime('now')`
    )
    .all<{ id: number; name: string }>();

  let downgraded = 0;
  for (const row of expired.results) {
    await db
      .prepare(`UPDATE businesses SET subscription_tier = 0, subscription_status = 'expired' WHERE id = ?`)
      .bind(row.id)
      .run();
    await logActivity(db, 'subscription_expired', row.name, 'Subscription period ended — downgraded to Free.');
    downgraded++;
  }

  return json({ ok: true, downgraded });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
