import type { D1Database } from '@cloudflare/workers-types';
import { cancelPayfastSubscription, payfastConfigured, type PayfastEnv } from './payfast';
import { logActivity } from './activity-log';

// Taking an exclusive sponsor spot away from whoever holds it — used by the
// admin "Ads & sponsors" page's Clear button (admin/sponsorships.ts) and
// whenever a business that holds a spot stops being public (hidden by
// admin/toggle-business-status.ts, or deleted by admin/delete-business.ts):
// a spot nobody can see must not stay sold, or block someone else buying it.
//
// The row goes to the terminal status 'cleared', not 'expired':
// notify.ts's recordRenewal revives an 'expired' row when a late PayFast
// charge lands (that's a lapsed card coming good), and reviving a row an
// admin deliberately cleared would silently undo the clear — and collide
// with whoever bought the spot since. 'cleared' is never revived (the charge
// is flagged for a refund instead), and like 'expired' it is outside
// pricing.ts's SLOT_HELD_SQL, so the spot is free the moment this runs.

export interface SponsorSubscriptionRow {
  id: number;
  status: string;
  payfast_token: string | null;
  product_type: string;
  product_target: string | null;
}

/** Stops PayFast billing (when the row has a token) and marks the row
 *  'cleared'. Returns a warning to surface when PayFast refused the cancel
 *  — the local clear still goes ahead, the billing just has to be stopped
 *  by hand. `why` is appended to the activity-log entry. */
export async function clearSponsorSubscription(
  env: PayfastEnv,
  db: D1Database,
  sub: SponsorSubscriptionRow,
  businessName: string | null,
  why: string
): Promise<string | null> {
  // Clearing a slot someone is paying for has to stop their billing too.
  let warning: string | null = null;
  if (sub.status === 'active' && sub.payfast_token && payfastConfigured(env)) {
    const r = await cancelPayfastSubscription(env, sub.payfast_token).catch(() => ({ ok: false, status: 0 }));
    if (!r.ok) warning = `PayFast refused the cancel (HTTP ${r.status}) — cancel it in the PayFast dashboard.`;
  }
  await db
    .prepare(`UPDATE subscriptions SET status = 'cleared', cancelled_at = COALESCE(cancelled_at, datetime('now')), current_period_end = datetime('now') WHERE id = ?`)
    .bind(sub.id)
    .run();
  await logActivity(db, 'sponsorship_cleared', businessName, `${sub.product_type} (${sub.product_target ?? 'n/a'}) ${why}.${warning ? ' ' + warning : ''}`);
  return warning;
}

/** Clears every sponsor spot a business currently holds (active, or
 *  cancelled but still inside its paid period). Tier plans are left alone —
 *  they're the business's own listing, not a shared spot. Returns how many
 *  rows were cleared, so the caller knows whether a rebuild is needed.
 *
 *  This is one-way: re-publishing a hidden business does NOT restore its
 *  spots. Their billing was cancelled on PayFast and the spot may have been
 *  sold to someone else in the meantime, so the owner (or an admin comp)
 *  has to buy it again. */
export async function clearBusinessSponsorSlots(env: PayfastEnv, db: D1Database, businessId: number, businessName: string | null, why: string): Promise<number> {
  const held = await db
    .prepare(
      `SELECT id, status, payfast_token, product_type, product_target FROM subscriptions
       WHERE business_id = ? AND product_type != 'tier' AND status IN ('active', 'cancelled')`
    )
    .bind(businessId)
    .all<SponsorSubscriptionRow>();
  for (const sub of held.results) await clearSponsorSubscription(env, db, sub, businessName, why);
  return held.results.length;
}
