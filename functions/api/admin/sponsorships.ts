import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { isSlotTaken, isSponsorProductType } from '../../_lib/pricing';

interface Env {
  DB: D1Database;
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
      `SELECT s.id, s.product_type, s.product_target, s.current_period_end, (s.m_payment_id LIKE 'admin-comp-%') AS comped,
              b.id AS business_id, b.name AS business_name
       FROM subscriptions s JOIN businesses b ON b.id = s.business_id
       WHERE s.product_type != 'tier' AND s.status = 'active'
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
    if (!id) return json({ ok: false, error: 'Missing id.' }, 400);
    await db.prepare(`UPDATE subscriptions SET status = 'expired' WHERE id = ?`).bind(id).run();
    return json({ ok: true });
  }

  if (action === 'set') {
    const businessId = Number(body.businessId);
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

    return json({ ok: true });
  }

  return json({ ok: false, error: 'Unknown action.' }, 400);
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
