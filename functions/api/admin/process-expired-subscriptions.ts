import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { logActivity } from '../../_lib/activity-log';
import { requestRebuild, flushPendingRebuild } from '../../_lib/deploy-hook';
import { safeEqual } from '../../_lib/timing';

interface Env {
  DB: D1Database;
  CRON_SECRET?: string;
  GITHUB_DISPATCH_TOKEN?: string;
}

// Daily sweep (same CRON_SECRET-gated pattern as process-owner-reminders):
// a subscription that's cancelled, or whose recurring payment simply
// stopped renewing (still "active" in our DB but past its paid period —
// PayFast's ITN just never arrived to extend it), gets downgraded/freed
// once its paid period has passed. The owner keeps whatever they already
// paid for right up to that date either way.
//
// Two independent things expire: a business's own tier (drops it to Free
// — the businesses.subscription_tier columns are the fast-read cache for
// that), and a sponsorship slot (category/suburb/homepage/centre — these
// don't touch `businesses` at all, just free the `subscriptions` row's
// product_type/product_target combo back up for someone else to buy).
// PayFast charges on the renewal date but its ITN can land hours later, and
// it retries failed cards for a few days. A still-"active" row therefore
// gets a grace period before it's treated as lapsed; a cancelled one ends
// exactly on its paid-through date. Dates are stored in both ISO and SQLite
// formats, so every comparison goes through datetime().
const GRACE = '+3 days';

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const auth = context.request.headers.get('Authorization') ?? '';
  if (!context.env.CRON_SECRET || !safeEqual(auth, `Bearer ${context.env.CRON_SECRET}`)) {
    return json({ ok: false }, 401);
  }

  const db = context.env.DB;

  const expiredTiers = await db
    .prepare(
      `SELECT id, name FROM businesses
       WHERE subscription_tier > 0 AND subscription_expires_at IS NOT NULL
         AND (
           (subscription_status = 'cancelled' AND datetime(subscription_expires_at) <= datetime('now'))
           OR (COALESCE(subscription_status, 'active') != 'cancelled' AND datetime(subscription_expires_at, ?) <= datetime('now'))
         )`
    )
    .bind(GRACE)
    .all<{ id: number; name: string }>();

  let downgraded = 0;
  for (const row of expiredTiers.results) {
    await db
      .prepare(`UPDATE businesses SET subscription_tier = 0, subscription_status = 'expired' WHERE id = ?`)
      .bind(row.id)
      .run();
    await db
      .prepare(`UPDATE subscriptions SET status = 'expired' WHERE business_id = ? AND product_type = 'tier' AND status IN ('active', 'cancelled')`)
      .bind(row.id)
      .run();
    await logActivity(db, 'subscription_expired', row.name, 'Subscription period ended — downgraded to Free.');
    downgraded++;
  }

  const expiredSlots = await db
    .prepare(
      `SELECT s.id, s.product_type, s.product_target, b.name FROM subscriptions s
       JOIN businesses b ON b.id = s.business_id
       WHERE s.product_type != 'tier' AND s.current_period_end IS NOT NULL
         AND (
           (s.status = 'cancelled' AND datetime(s.current_period_end) <= datetime('now'))
           OR (s.status = 'active' AND datetime(s.current_period_end, ?) <= datetime('now'))
         )`
    )
    .bind(GRACE)
    .all<{ id: number; product_type: string; product_target: string | null; name: string }>();

  let slotsFreed = 0;
  for (const row of expiredSlots.results) {
    await db.prepare(`UPDATE subscriptions SET status = 'expired' WHERE id = ?`).bind(row.id).run();
    await logActivity(db, 'sponsorship_expired', row.name, `${row.product_type} (${row.product_target ?? 'n/a'}) period ended — slot is open again.`);
    slotsFreed++;
  }

  // Badges, "Featured this month" and sponsor slots are baked into the
  // static pages, so anything that changed here needs a rebuild to show.
  if (downgraded || slotsFreed) await requestRebuild(context.env, 'subscriptions expired');
  const rebuilt = await flushPendingRebuild(context.env);

  return json({ ok: true, downgraded, slotsFreed, rebuilt });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
