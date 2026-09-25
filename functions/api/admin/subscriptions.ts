import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { TIER_NAMES, tierPriceCents, centsToRand } from '../../_lib/pricing';
import { cancelPayfastSubscription, payfastConfigured, type PayfastEnv } from '../../_lib/payfast';
import { requestRebuild } from '../../_lib/deploy-hook';
import { logActivity } from '../../_lib/activity-log';

interface Env extends PayfastEnv {
  DB: D1Database;
  GITHUB_DISPATCH_TOKEN?: string;
}

// Admin's "Plans & pricing" tab reads this for the subscriber list + MRR.
// Sponsorship slots (category/suburb/homepage/centre) are a separate
// product surfaced by admin/ads-sponsors.ts instead — this endpoint is
// tier subscriptions only.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const db = context.env.DB;

  const active = await db
    .prepare(
      `SELECT b.id, b.name, b.subscription_tier, b.subscription_status, b.subscription_expires_at
       FROM businesses b WHERE b.subscription_status IN ('active', 'cancelled') ORDER BY b.subscription_tier DESC, b.name`
    )
    .all<{ id: number; name: string; subscription_tier: number; subscription_status: string; subscription_expires_at: string | null }>();

  const priceCentsByTier: Record<number, number> = {};
  for (const tier of [1, 2]) priceCentsByTier[tier] = (await tierPriceCents(db, tier)) ?? 0;

  // Revenue is what PayFast actually bills: active, token-bearing tier
  // subscriptions at the amount each last paid. Admin comps have no
  // subscription row and bring in nothing, so they don't count.
  const billed = await db
    .prepare(
      `SELECT COALESCE(SUM((SELECT p.amount_cents FROM payments p WHERE p.subscription_id = s.id ORDER BY p.id DESC LIMIT 1)), 0) AS cents
       FROM subscriptions s WHERE s.product_type = 'tier' AND s.status = 'active'`
    )
    .first<{ cents: number }>();
  const monthlyRevenueCents = billed?.cents ?? 0;

  return json({
    ok: true,
    subscriptions: active.results.map((r) => ({
      ...r,
      tierName: TIER_NAMES[r.subscription_tier] ?? 'Basic',
      priceRand: centsToRand(priceCentsByTier[r.subscription_tier] ?? 0),
    })),
    monthlyRevenueRand: centsToRand(monthlyRevenueCents),
  });
};

// Admin comp/override — set a business to any tier directly, bypassing
// PayFast entirely (e.g. a manually comped account, or correcting a
// support issue). Does not touch billing. tier 0 = Basic/Free, 1 =
// Verified, 2 = Featured.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }
  const businessId = Number(body.businessId);
  const tier = Number(body.tier);
  if (!Number.isInteger(businessId) || businessId <= 0 || !Number.isInteger(tier) || tier < 0 || tier > 2) {
    return json({ ok: false, error: 'Invalid business or tier.' }, 400);
  }

  const db = context.env.DB;
  if (tier === 0) {
    await db.prepare(`UPDATE businesses SET subscription_tier = 0, subscription_status = 'expired' WHERE id = ?`).bind(businessId).run();
    // Removing a plan must also stop PayFast billing for it — otherwise the
    // owner keeps paying for a tier they no longer have.
    const paying = await db
      .prepare(`SELECT id, payfast_token FROM subscriptions WHERE business_id = ? AND product_type = 'tier' AND status = 'active'`)
      .bind(businessId)
      .all<{ id: number; payfast_token: string | null }>();
    for (const sub of paying.results) {
      let note = 'stopped by admin';
      if (sub.payfast_token && payfastConfigured(context.env)) {
        const r = await cancelPayfastSubscription(context.env, sub.payfast_token).catch(() => ({ ok: false, status: 0 }));
        if (!r.ok) note = `stopped by admin, but PayFast refused the cancel (HTTP ${r.status}) — cancel token ${sub.payfast_token} by hand`;
      }
      await db
        .prepare(`UPDATE subscriptions SET status = 'cancelled', cancelled_at = datetime('now'), current_period_end = datetime('now') WHERE id = ?`)
        .bind(sub.id)
        .run();
      await logActivity(db, 'subscription_admin_removed', null, `Business #${businessId} tier subscription #${sub.id} ${note}.`);
    }
  } else {
    await db
      .prepare(`UPDATE businesses SET subscription_tier = ?, subscription_status = 'active', subscription_expires_at = datetime('now', '+100 years') WHERE id = ?`)
      .bind(tier, businessId)
      .run();
  }

  await requestRebuild(context.env, 'admin changed a plan');
  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
