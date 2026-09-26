import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { buildSignatureString, md5, payfastConfigured, type PayfastEnv } from '../../_lib/payfast';
import { logActivity } from '../../_lib/activity-log';

interface Env extends PayfastEnv {
  DB: D1Database;
}

const TIER_PRICES: Record<number, number> = { 1: 50, 2: 99, 3: 199, 4: 299 };

// PayFast's ITN webhook. Three of the four checks their own SDK performs
// are done here (signature, posted-data match, server-confirmation
// callback) — see functions/_lib/payfast.ts for why the fourth (dynamic
// source-IP/hostname validation) doesn't translate directly to a Workers
// Function and what stands in for it. All three here are required to
// pass, not just the signature — a valid signature alone doesn't prove
// the amount wasn't tampered with in transit.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  if (!payfastConfigured(context.env)) return new Response('Not configured', { status: 503 });

  const raw = await context.request.text();
  const posted = Object.fromEntries(new URLSearchParams(raw)) as Record<string, string>;
  const { signature, ...fields } = posted;

  // 1. Signature.
  const expectedSig = await md5(buildSignatureString(fields, context.env.PAYFAST_PASSPHRASE!));
  if (!signature || expectedSig !== signature) {
    return new Response('Invalid signature', { status: 400 });
  }

  const db = context.env.DB;
  const mPaymentId = posted.m_payment_id;
  const subscription = await db
    .prepare('SELECT id, business_id, tier FROM subscriptions WHERE m_payment_id = ?')
    .bind(mPaymentId)
    .first<{ id: number; business_id: number; tier: number }>();
  if (!subscription) return new Response('Unknown payment', { status: 400 });

  // 2. Posted data matches what we expect for this payment (amount, with
  // float tolerance for rounding, per PayFast's own documented approach).
  const expectedAmount = TIER_PRICES[subscription.tier];
  const postedAmount = parseFloat(posted.amount_gross ?? posted.amount ?? '0');
  if (!expectedAmount || Math.abs(postedAmount - expectedAmount) > 0.05) {
    return new Response('Amount mismatch', { status: 400 });
  }

  // 3. Re-POST back to PayFast to confirm this ITN is genuine — required
  // literal "VALID" response body.
  const confirmRes = await fetch(`https://${context.env.PAYFAST_HOST}/eng/query/validate`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: raw,
  });
  const confirmBody = (await confirmRes.text()).trim();
  if (confirmBody !== 'VALID') {
    return new Response('Server confirmation failed', { status: 400 });
  }

  const status = posted.payment_status;
  if (status === 'COMPLETE') {
    const now = new Date();
    const periodEnd = new Date(now);
    periodEnd.setMonth(periodEnd.getMonth() + 1);

    await db
      .prepare(
        `UPDATE subscriptions SET status = 'active', payfast_token = ?, started_at = COALESCE(started_at, datetime('now')), current_period_end = ?
         WHERE id = ?`
      )
      .bind(posted.token ?? null, periodEnd.toISOString(), subscription.id)
      .run();

    await db
      .prepare(`UPDATE businesses SET subscription_tier = ?, subscription_status = 'active', subscription_expires_at = ? WHERE id = ?`)
      .bind(subscription.tier, periodEnd.toISOString(), subscription.business_id)
      .run();

    await db
      .prepare('INSERT INTO payments (subscription_id, pf_payment_id, amount_cents, status, raw_itn) VALUES (?, ?, ?, ?, ?)')
      .bind(subscription.id, posted.pf_payment_id ?? null, Math.round(postedAmount * 100), status, raw)
      .run();

    const business = await db.prepare('SELECT name FROM businesses WHERE id = ?').bind(subscription.business_id).first<{ name: string }>();
    if (business) await logActivity(db, 'subscription_activated', business.name, `Tier ${subscription.tier} activated via PayFast.`);
  }

  return new Response('OK', { status: 200 });
};
