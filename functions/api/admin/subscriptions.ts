import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';

interface Env {
  DB: D1Database;
}

const TIER_NAMES: Record<number, string> = { 1: 'Verified', 2: 'Verified Plus', 3: 'Featured', 4: 'Premium' };
const TIER_PRICES: Record<number, number> = { 1: 50, 2: 99, 3: 199, 4: 299 };

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

  const monthlyRevenue = active.results
    .filter((r) => r.subscription_status === 'active')
    .reduce((sum, r) => sum + (TIER_PRICES[r.subscription_tier] ?? 0), 0);

  return json({
    ok: true,
    subscriptions: active.results.map((r) => ({
      ...r,
      tierName: TIER_NAMES[r.subscription_tier] ?? 'Free',
      priceRand: TIER_PRICES[r.subscription_tier] ?? 0,
    })),
    monthlyRevenue,
  });
};

// Admin comp/override — set a business to any tier directly, bypassing
// PayFast entirely (e.g. a manually comped account, or correcting a
// support issue). Does not touch billing.
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
  if (!businessId || tier < 0 || tier > 4) return json({ ok: false, error: 'Invalid business or tier.' }, 400);

  const db = context.env.DB;
  if (tier === 0) {
    await db.prepare(`UPDATE businesses SET subscription_tier = 0, subscription_status = 'expired' WHERE id = ?`).bind(businessId).run();
  } else {
    await db
      .prepare(`UPDATE businesses SET subscription_tier = ?, subscription_status = 'active', subscription_expires_at = datetime('now', '+100 years') WHERE id = ?`)
      .bind(tier, businessId)
      .run();
  }

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
