import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { TIER_NAMES, sponsorPriceCents, tierPriceCents, sponsorProductLabel, type SponsorProductType } from '../../_lib/pricing';

interface Env {
  DB: D1Database;
}

// Backs the "Invoices" tab. There is no separate invoicing system — the
// billing history IS the `payments` table (one row per PayFast ITN, written by
// subscribe/notify.ts), and "outstanding" is a paid subscription whose period
// has ended without a renewal payment arriving (still 'active' in D1 until the
// daily expiry sweep frees it).
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const paid = await db
    .prepare(
      `SELECT p.id, p.pf_payment_id, p.amount_cents, p.status, p.paid_at, s.tier, s.product_type, s.product_target, b.name AS business_name
       FROM payments p
       JOIN subscriptions s ON s.id = p.subscription_id
       JOIN businesses b ON b.id = s.business_id
       ORDER BY p.paid_at DESC, p.id DESC LIMIT 200`
    )
    .all<{ id: number; pf_payment_id: string | null; amount_cents: number; status: string; paid_at: string; tier: number; product_type: string; product_target: string | null; business_name: string }>();

  const overdueSubs = await db
    .prepare(
      `SELECT s.id, s.tier, s.product_type, s.product_target, s.current_period_end, b.name AS business_name
       FROM subscriptions s JOIN businesses b ON b.id = s.business_id
       WHERE s.status = 'active' AND s.m_payment_id NOT LIKE 'admin-comp-%'
         AND s.current_period_end IS NOT NULL AND s.current_period_end <= datetime('now')
       ORDER BY s.current_period_end DESC`
    )
    .all<{ id: number; tier: number; product_type: string; product_target: string | null; current_period_end: string; business_name: string }>();

  const label = (productType: string, tier: number, target: string | null): string =>
    productType === 'tier'
      ? `${TIER_NAMES[tier] ?? 'Plan'} plan`
      : sponsorProductLabel(productType as SponsorProductType, target);

  const rows = paid.results.map((p) => ({
    id: `PF-${p.id}`,
    reference: p.pf_payment_id,
    client: p.business_name,
    product: label(p.product_type, p.tier, p.product_target),
    amountCents: p.amount_cents,
    date: p.paid_at,
    status: p.status === 'COMPLETE' ? 'Paid' : p.status,
    method: 'PayFast',
  }));

  for (const o of overdueSubs.results) {
    const cents =
      o.product_type === 'tier'
        ? (await tierPriceCents(db, o.tier)) ?? 0
        : (await sponsorPriceCents(db, o.product_type as SponsorProductType)) ?? 0;
    rows.push({
      id: `SUB-${o.id}`,
      reference: null,
      client: o.business_name,
      product: label(o.product_type, o.tier, o.product_target),
      amountCents: cents,
      date: o.current_period_end,
      status: 'Overdue',
      method: 'Renewal not received',
    });
  }

  rows.sort((a, b) => (a.date < b.date ? 1 : -1));

  return json({
    ok: true,
    invoices: rows,
    collectedCents: rows.filter((r) => r.status === 'Paid').reduce((sum, r) => sum + r.amountCents, 0),
    outstandingCents: rows.filter((r) => r.status === 'Overdue').reduce((sum, r) => sum + r.amountCents, 0),
  });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
