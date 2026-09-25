import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { isSlotTaken, isSponsorProductType } from '../../_lib/pricing';
import { cancelPayfastSubscription, payfastConfigured, type PayfastEnv } from '../../_lib/payfast';
import { requestRebuild } from '../../_lib/deploy-hook';
import { logActivity } from '../../_lib/activity-log';

interface Env extends PayfastEnv {
  DB: D1Database;
  GITHUB_DISPATCH_TOKEN?: string;
}

// Backs the "Ads & sponsors" admin page — the exclusive-slot counterpart
// to admin/subscriptions.ts's tier management. Lists every currently-sold
// slot; comping a new one bypasses PayFast entirely (admin override, same
// pattern as admin/subscriptions.ts's tier comp), same as a manually
// arranged/off-platform sale.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const rows = await context.env.DB
    .prepare(
      // Same "held" rule as pricing.ts's SLOT_HELD_SQL (written out with the
      // s. prefix because businesses has its own status column): a cancelled
      // slot is still occupied until its paid period ends.
      `SELECT s.id, s.product_type, s.product_target, s.status, s.current_period_end, (s.m_payment_id LIKE 'admin-comp-%') AS comped,
              b.id AS business_id, b.name AS business_name
       FROM subscriptions s JOIN businesses b ON b.id = s.business_id
       WHERE s.product_type != 'tier'
         AND (s.status = 'active' OR (s.status = 'cancelled' AND s.current_period_end IS NOT NULL AND datetime(s.current_period_end) > datetime('now')))
       ORDER BY s.product_type, s.product_target`
    )
    .all();

  return json({ ok: true, sponsorships: rows.results });
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

  const db = context.env.DB;
  const action = String(body.action ?? '');

  if (action === 'clear') {
    const id = Number(body.id);
    if (!Number.isInteger(id) || id <= 0) return json({ ok: false, error: 'Missing id.' }, 400);
    const sub = await db
      .prepare(`SELECT id, status, payfast_token, product_type, product_target FROM subscriptions WHERE id = ? AND product_type != 'tier'`)
      .bind(id)
      .first<{ id: number; status: string; payfast_token: string | null; product_type: string; product_target: string | null }>();
    if (!sub) return json({ ok: false, error: 'Sponsorship not found.' }, 404);
    // Clearing a slot someone is paying for has to stop their billing too.
    let warning: string | null = null;
    if (sub.status === 'active' && sub.payfast_token && payfastConfigured(context.env)) {
      const r = await cancelPayfastSubscription(context.env, sub.payfast_token).catch(() => ({ ok: false, status: 0 }));
      if (!r.ok) warning = `PayFast refused the cancel (HTTP ${r.status}) — cancel it in the PayFast dashboard.`;
    }
    await db.prepare(`UPDATE subscriptions SET status = 'expired', current_period_end = datetime('now') WHERE id = ?`).bind(id).run();
    await logActivity(db, 'sponsorship_cleared', null, `${sub.product_type} (${sub.product_target ?? 'n/a'}) cleared by admin.${warning ? ' ' + warning : ''}`);
    await requestRebuild(context.env, 'sponsorship cleared');
    return json({ ok: true, warning });
  }

  if (action === 'set') {
    const businessId = Number(body.businessId);
    if (!Number.isInteger(businessId) || businessId <= 0) return json({ ok: false, error: 'Invalid business.' }, 400);
    const productType = body.productType;
    const productTarget = typeof body.productTarget === 'string' && body.productTarget ? body.productTarget : null;
    if (!businessId || !isSponsorProductType(productType)) return json({ ok: false, error: 'Invalid business or product type.' }, 400);
    if (productType !== 'homepage_banner' && !productTarget) return json({ ok: false, error: 'Missing target.' }, 400);

    const business = await db.prepare('SELECT id FROM businesses WHERE id = ?').bind(businessId).first();
    if (!business) return json({ ok: false, error: 'Business not found.' }, 404);

    if (await isSlotTaken(db, productType, productTarget)) {
      return json({ ok: false, error: 'That slot is already sold — clear it first.' }, 409);
    }

    await db
      .prepare(
        `INSERT INTO subscriptions (business_id, tier, product_type, product_target, m_payment_id, status, started_at, current_period_end)
         VALUES (?, 0, ?, ?, ?, 'active', datetime('now'), datetime('now', '+100 years'))`
      )
      .bind(businessId, productType, productTarget, `admin-comp-${crypto.randomUUID()}`)
      .run();

    await requestRebuild(context.env, 'sponsorship comped');
    return json({ ok: true });
  }

  return json({ ok: false, error: 'Unknown action.' }, 400);
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
