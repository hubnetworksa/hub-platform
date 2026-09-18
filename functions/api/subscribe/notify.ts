import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { buildSignatureString, md5, payfastConfigured, type PayfastEnv } from '../../_lib/payfast';
import { logActivity } from '../../_lib/activity-log';
import { tierPriceCents, sponsorPriceCents, isSponsorProductType } from '../../_lib/pricing';

interface Env extends PayfastEnv {
  DB: D1Database;
}

// PayFast's ITN webhook. Three of the four checks their own SDK performs
// are done here (signature, posted-data match, server-confirmation
// callback) — see functions/_lib/payfast.ts for why the fourth (dynamic
// source-IP/hostname validation) doesn't translate directly to a Workers
// Function. All three here are required to pass, not just the signature.
//
// Two payment shapes land here, distinguished by custom_str1's prefix:
//  - "business:<id>"   — an existing, owned business upgrading its tier or
//                         buying a sponsorship slot (started in subscribe/start.ts).
//  - "submission:<id>" — a not-yet-approved pending_submissions row paying
//                         for a tier at signup time (started inline in
//                         submit-business.ts). No `businesses` row exists
//                         yet, so this just marks the submission paid; the
//                         tier is actually applied once the submission is
//                         approved+confirmed — see business-submission.ts's
//                         insertApprovedBusiness.
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
  const [scope, rawId] = (posted.custom_str1 ?? '').split(':');
  const targetId = Number(rawId);
  if (!targetId || (scope !== 'business' && scope !== 'submission')) {
    return new Response('Unrecognized payment context', { status: 400 });
  }

  // 3. Re-POST back to PayFast to confirm this ITN is genuine — required
  // literal "VALID" response body. Done before touching the DB so a spoofed
  // signature with a forged confirmation never gets this far for nothing.
  const confirmRes = await fetch(`https://${context.env.PAYFAST_HOST}/eng/query/validate`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: raw,
  });
  const confirmBody = (await confirmRes.text()).trim();
  if (confirmBody !== 'VALID') {
    return new Response('Server confirmation failed', { status: 400 });
  }

  if (posted.payment_status !== 'COMPLETE') return new Response('OK', { status: 200 });

  const postedAmount = parseFloat(posted.amount_gross ?? posted.amount ?? '0');

  if (scope === 'submission') {
    return handleSubmissionPayment(db, targetId, posted, postedAmount, raw);
  }
  return handleBusinessPayment(db, targetId, posted, postedAmount, raw);
};

async function handleBusinessPayment(
  db: D1Database,
  businessId: number,
  posted: Record<string, string>,
  postedAmount: number,
  raw: string
): Promise<Response> {
  const mPaymentId = posted.m_payment_id;
  const subscription = await db
    .prepare('SELECT id, business_id, tier, product_type, product_target FROM subscriptions WHERE m_payment_id = ?')
    .bind(mPaymentId)
    .first<{ id: number; business_id: number; tier: number; product_type: string; product_target: string | null }>();
  if (!subscription) return new Response('Unknown payment', { status: 400 });

  // 2. Posted data matches what we expect for this payment (amount, with
  // float tolerance for rounding, per PayFast's own documented approach).
  const expectedCents =
    subscription.product_type === 'tier' || !isSponsorProductType(subscription.product_type)
      ? await tierPriceCents(db, subscription.tier)
      : await sponsorPriceCents(db, subscription.product_type);
  if (!expectedCents || Math.abs(postedAmount - expectedCents / 100) > 0.05) {
    return new Response('Amount mismatch', { status: 400 });
  }

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

  // Only a tier purchase changes the business's own badge/perks — a
  // sponsorship slot is a separate product, not the business's plan.
  if (subscription.product_type === 'tier') {
    await db
      .prepare(`UPDATE businesses SET subscription_tier = ?, subscription_status = 'active', subscription_expires_at = ? WHERE id = ?`)
      .bind(subscription.tier, periodEnd.toISOString(), businessId)
      .run();
  }

  await db
    .prepare('INSERT INTO payments (subscription_id, pf_payment_id, amount_cents, status, raw_itn) VALUES (?, ?, ?, ?, ?)')
    .bind(subscription.id, posted.pf_payment_id ?? null, Math.round(postedAmount * 100), posted.payment_status, raw)
    .run();

  const business = await db.prepare('SELECT name FROM businesses WHERE id = ?').bind(businessId).first<{ name: string }>();
  if (business) {
    const label = subscription.product_type === 'tier' ? `Tier ${subscription.tier}` : `${subscription.product_type} (${subscription.product_target ?? 'n/a'})`;
    await logActivity(db, 'subscription_activated', business.name, `${label} activated via PayFast.`);
  }

  return new Response('OK', { status: 200 });
}

async function handleSubmissionPayment(
  db: D1Database,
  submissionId: number,
  posted: Record<string, string>,
  postedAmount: number,
  raw: string
): Promise<Response> {
  const mPaymentId = posted.m_payment_id;
  const submission = await db
    .prepare('SELECT id, name, chosen_tier, m_payment_id FROM pending_submissions WHERE id = ? AND m_payment_id = ?')
    .bind(submissionId, mPaymentId)
    .first<{ id: number; name: string; chosen_tier: number; m_payment_id: string | null }>();
  if (!submission) return new Response('Unknown or already-resolved submission payment', { status: 400 });

  const expectedCents = await tierPriceCents(db, submission.chosen_tier);
  if (!expectedCents || Math.abs(postedAmount - expectedCents / 100) > 0.05) {
    return new Response('Amount mismatch', { status: 400 });
  }

  await db.prepare(`UPDATE pending_submissions SET payment_status = 'paid' WHERE id = ?`).bind(submissionId).run();
  await logActivity(db, 'submission_payment_received', submission.name, `Paid for tier ${submission.chosen_tier} at signup — applies once approved.`);

  return new Response('OK', { status: 200 });
}
