import type { PagesFunction, D1Database, R2Bucket } from '@cloudflare/workers-types';
import { buildItnSignatureString, cancelPayfastSubscription, md5, payfastConfigured, type PayfastEnv } from '../../_lib/payfast';
import { logActivity } from '../../_lib/activity-log';
import {
  tierPriceCents,
  sponsorPriceCents,
  isSponsorProductType,
  eventFeaturePriceCents,
  isSlotTaken,
} from '../../_lib/pricing';
import { issueInvoice, issueEventInvoice } from '../../_lib/invoicing';
import { requestRebuild } from '../../_lib/deploy-hook';
import { sendEmail } from '../../_lib/send-email';
import { getSite } from '../../_lib/site';

interface Env extends PayfastEnv {
  DB: D1Database;
  MEDIA: R2Bucket;
  SITE: string;
  GITHUB_DISPATCH_TOKEN?: string;
  RESEND_API_KEY?: string;
}

// PayFast's ITN webhook. Three of the four checks their own SDK performs
// are done here (signature, posted-data match, server-confirmation
// callback) — see functions/_lib/payfast.ts for why the fourth (dynamic
// source-IP/hostname validation) doesn't translate directly to a Workers
// Function. All three here are required to pass, not just the signature.
//
// PayFast retries an ITN until it gets a 200, so every branch below has to
// be idempotent AND has to answer 200 to a duplicate or late delivery of a
// payment we've already processed — a 400 there just buys another retry of
// the same thing. 400 is reserved for genuinely bad requests (bad
// signature, unknown payment, wrong amount, mismatched context).
//
// Four payment shapes land here, distinguished by custom_str1's prefix:
//  - "business:<id>"   — an existing, owned business upgrading its tier or
//                         buying a sponsorship slot (started in subscribe/start.ts).
//  - "submission:<id>" — a not-yet-approved pending_submissions row paying
//                         for a tier at signup time (started inline in
//                         submit-business.ts). No `businesses` row exists
//                         yet, so this just marks the submission paid; the
//                         tier is actually applied once the submission is
//                         approved+confirmed — see business-submission.ts's
//                         insertApprovedBusiness.
//  - "event:<id>"      — an owned, already-published event paying the
//                         once-off "Feature this event" fee (started in
//                         functions/api/events/feature-start.ts).
//  - "event-submission:<id>" — a not-yet-approved event_submissions row
//                         paying to be featured at submission time (started
//                         inline in submit-event.ts). No `events` row exists
//                         yet, so this just marks the submission paid; the
//                         feature is actually applied once admin approves
//                         it — see admin/events.ts's approve-submission.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  if (!payfastConfigured(context.env)) return new Response('Not configured', { status: 503 });

  const raw = await context.request.text();
  const posted = Object.fromEntries(new URLSearchParams(raw)) as Record<string, string>;

  // 1. Signature — over every field PayFast posted, in the order posted
  // (see buildItnSignatureString), not the outgoing checkout's field list.
  const expectedSig = await md5(buildItnSignatureString(posted, context.env.PAYFAST_PASSPHRASE!));
  if (!posted.signature || expectedSig !== posted.signature) {
    return new Response('Invalid signature', { status: 400 });
  }

  const db = context.env.DB;
  const [scope, rawId] = (posted.custom_str1 ?? '').split(':');
  const targetId = Number(rawId);
  const KNOWN_SCOPES = ['business', 'submission', 'event', 'event-submission'];
  if (!targetId || !KNOWN_SCOPES.includes(scope)) {
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
    return handleSubmissionPayment(context.env, db, targetId, posted, postedAmount, raw);
  }
  if (scope === 'event') {
    return handleEventPayment(context.env, db, targetId, posted, postedAmount, raw);
  }
  if (scope === 'event-submission') {
    return handleEventSubmissionPayment(context.env, db, targetId, posted, postedAmount, raw);
  }
  return handleBusinessPayment(context.env, db, targetId, posted, postedAmount, raw);
};

async function handleEventSubmissionPayment(
  env: Env,
  db: D1Database,
  submissionId: number,
  posted: Record<string, string>,
  postedAmount: number,
  raw: string
): Promise<Response> {
  const mPaymentId = posted.m_payment_id;
  const submission = await db
    .prepare('SELECT id, title, amount_cents, payment_status FROM event_submissions WHERE id = ? AND m_payment_id = ?')
    .bind(submissionId, mPaymentId)
    .first<{ id: number; title: string; amount_cents: number | null; payment_status: string | null }>();
  if (!submission) return new Response('Unknown event submission payment', { status: 400 });

  // What this submission was quoted at checkout, not whatever the price
  // happens to be now — an admin editing the rate card between checkout and
  // ITN must not turn a legitimate payment into an amount mismatch.
  const expectedCents = submission.amount_cents ?? (await eventFeaturePriceCents(db));
  if (!expectedCents || Math.abs(postedAmount - expectedCents / 100) > 0.05) {
    return new Response('Amount mismatch', { status: 400 });
  }

  const updated = await db
    .prepare(`UPDATE event_submissions SET payment_status = 'paid', raw_itn = ? WHERE id = ? AND payment_status = 'pending'`)
    .bind(raw, submissionId)
    .run();
  if (updated.meta.changes !== 1) return new Response('OK', { status: 200 }); // replay

  await logActivity(db, 'event_submission_payment_received', submission.title, 'Paid to feature at submission time — applies once approved.');

  return new Response('OK', { status: 200 });
}

async function handleEventPayment(
  env: Env,
  db: D1Database,
  eventId: number,
  posted: Record<string, string>,
  postedAmount: number,
  raw: string
): Promise<Response> {
  const mPaymentId = posted.m_payment_id;
  const payment = await db
    .prepare('SELECT id, event_id, amount_cents, status FROM event_payments WHERE event_id = ? AND m_payment_id = ?')
    .bind(eventId, mPaymentId)
    .first<{ id: number; event_id: number; amount_cents: number; status: string }>();
  if (!payment) return new Response('Unknown event payment', { status: 400 });

  // 2. Posted data matches what we expect (amount, with float tolerance for rounding).
  if (Math.abs(postedAmount - payment.amount_cents / 100) > 0.05) {
    return new Response('Amount mismatch', { status: 400 });
  }

  const updated = await db
    .prepare(`UPDATE event_payments SET status = 'complete', raw_itn = ?, paid_at = datetime('now') WHERE id = ? AND status = 'pending'`)
    .bind(raw, payment.id)
    .run();
  if (updated.meta.changes !== 1) return new Response('OK', { status: 200 }); // replay

  await db.prepare(`UPDATE events SET featured = 1, updated_at = datetime('now') WHERE id = ?`).bind(eventId).run();

  const event = await db.prepare('SELECT title FROM events WHERE id = ?').bind(eventId).first<{ title: string }>();
  if (event) await logActivity(db, 'event_featured', event.title, 'Featured via PayFast.');

  await issueEventInvoice(env, payment.id);
  await requestRebuild(env, 'event featured');

  return new Response('OK', { status: 200 });
}

async function handleBusinessPayment(
  env: Env,
  db: D1Database,
  businessId: number,
  posted: Record<string, string>,
  postedAmount: number,
  raw: string
): Promise<Response> {
  const mPaymentId = posted.m_payment_id;
  // Any status, not just 'pending': these are recurring subscriptions, and
  // PayFast sends a fresh ITN — same m_payment_id, new pf_payment_id — for
  // every monthly charge. The first one activates the row; every later one
  // is a renewal that must extend the paid period, or the expiry sweep
  // downgrades a paying customer after month one. A true replay of an ITN
  // we've already handled is recognised by its pf_payment_id instead.
  const subscription = await db
    .prepare('SELECT id, business_id, tier, product_type, product_target, status FROM subscriptions WHERE m_payment_id = ?')
    .bind(mPaymentId)
    .first<{ id: number; business_id: number; tier: number; product_type: string; product_target: string | null; status: string }>();
  if (!subscription) return new Response('Unknown payment', { status: 400 });

  // custom_str1 and m_payment_id must agree about whose payment this is —
  // otherwise a valid ITN for business A could be replayed with custom_str1
  // pointing at business B and upgrade B instead.
  if (subscription.business_id !== businessId) {
    return new Response('Payment context mismatch', { status: 400 });
  }

  if (posted.pf_payment_id) {
    const seen = await db.prepare('SELECT 1 FROM payments WHERE pf_payment_id = ?').bind(posted.pf_payment_id).first();
    if (seen) return new Response('OK', { status: 200 }); // replay of a charge already recorded
  }

  const isRenewal = subscription.status !== 'pending';

  // 2. Posted data matches what we expect for this payment (amount, with
  // float tolerance for rounding, per PayFast's own documented approach).
  // A renewal is charged the recurring_amount fixed at checkout, so it's
  // checked against what this subscription last paid — not today's rate
  // card, which an admin may have changed since.
  const lastPaid = isRenewal
    ? await db
        .prepare('SELECT amount_cents FROM payments WHERE subscription_id = ? ORDER BY id DESC LIMIT 1')
        .bind(subscription.id)
        .first<{ amount_cents: number }>()
    : null;
  const expectedCents =
    lastPaid?.amount_cents ??
    (subscription.product_type === 'tier' || !isSponsorProductType(subscription.product_type)
      ? await tierPriceCents(db, subscription.tier)
      : await sponsorPriceCents(db, subscription.product_type));
  if (!expectedCents || Math.abs(postedAmount - expectedCents / 100) > 0.05) {
    return new Response('Amount mismatch', { status: 400 });
  }

  const business = await db.prepare('SELECT name FROM businesses WHERE id = ?').bind(businessId).first<{ name: string }>();

  if (isRenewal) return recordRenewal(env, db, subscription, business?.name ?? null, posted, postedAmount, raw);

  // Two people can reach checkout for the same exclusive slot before either
  // pays — start.ts's isSlotTaken check can only see what's been bought so
  // far. Whoever's ITN lands second must not overwrite the first: don't
  // activate, flag it loudly, and still answer 200 so PayFast stops
  // retrying (the money is theirs, so a refund is owed by hand).
  if (subscription.product_type !== 'tier' && isSponsorProductType(subscription.product_type)) {
    if (await isSlotTaken(db, subscription.product_type, subscription.product_target, subscription.id)) {
      const label = `${subscription.product_type} (${subscription.product_target ?? 'n/a'})`;
      await logActivity(
        db,
        'sponsorship_slot_conflict',
        business?.name ?? null,
        `Paid for ${label} but the slot was already sold — payment ${mPaymentId} needs a refund.`
      );
      const site = getSite(env.SITE);
      await sendEmail(env, {
        from: `${site.siteName} <${site.contactEmail}>`,
        to: site.contactEmail,
        subject: `Refund owed — ${label} was already sold`,
        text:
          `${business?.name ?? `Business #${businessId}`} paid for ${label}, but that slot was already taken by the time PayFast confirmed the payment.\n\n` +
          `The sponsorship has NOT been activated. Refund this payment manually in the PayFast dashboard.\n\n` +
          `m_payment_id: ${mPaymentId}\npf_payment_id: ${posted.pf_payment_id ?? 'n/a'}\nAmount: R${postedAmount.toFixed(2)}\n`,
      });
      return new Response('OK', { status: 200 });
    }
  }

  // current_period_end is written in SQLite's own datetime() format so
  // every row is comparable without reformatting (admin comps already write
  // it this way; see pricing.ts's SLOT_HELD_SQL). The `status = 'pending'`
  // guard makes this the point where two simultaneous ITNs for the same
  // payment resolve — only one can win.
  const activated = await db
    .prepare(
      `UPDATE subscriptions SET status = 'active', payfast_token = ?, started_at = COALESCE(started_at, datetime('now')),
              current_period_end = datetime('now', '+1 month')
       WHERE id = ? AND status = 'pending'`
    )
    .bind(posted.token ?? null, subscription.id)
    .run();
  if (activated.meta.changes !== 1) return new Response('OK', { status: 200 }); // concurrent duplicate

  // Only a tier purchase changes the business's own badge/perks — a
  // sponsorship slot is a separate product, not the business's plan.
  if (subscription.product_type === 'tier') {
    await db
      .prepare(
        `UPDATE businesses SET subscription_tier = ?, subscription_status = 'active',
                subscription_expires_at = datetime('now', '+1 month') WHERE id = ?`
      )
      .bind(subscription.tier, businessId)
      .run();

    // An upgrade (or re-subscribe) replaces any earlier tier plan. That one
    // is only stopped now, once the new one is actually paid — cancelling at
    // checkout would leave an owner who abandons PayFast with no plan at all.
    // Without this PayFast keeps billing both plans every month.
    const older = await db
      .prepare(
        `SELECT id, payfast_token, status FROM subscriptions
         WHERE business_id = ? AND product_type = 'tier' AND id != ? AND status IN ('active', 'cancelled')`
      )
      .bind(businessId, subscription.id)
      .all<{ id: number; payfast_token: string | null; status: string }>();
    for (const old of older.results) {
      let note = 'replaced by a new plan';
      if (old.status === 'active' && old.payfast_token && payfastConfigured(env)) {
        const r = await cancelPayfastSubscription(env, old.payfast_token).catch(() => ({ ok: false, status: 0 }));
        if (!r.ok) note = `replaced by a new plan, but PayFast refused the cancel (HTTP ${r.status}) — cancel token ${old.payfast_token} by hand`;
      }
      await db
        .prepare(`UPDATE subscriptions SET status = 'cancelled', cancelled_at = COALESCE(cancelled_at, datetime('now')), current_period_end = datetime('now') WHERE id = ?`)
        .bind(old.id)
        .run();
      await logActivity(db, 'subscription_replaced', business?.name ?? null, `Old tier subscription #${old.id} ${note}.`);
    }
  }

  // OR IGNORE against the unique index on pf_payment_id: a retried ITN that
  // somehow gets past the guards above still can't produce a second payment
  // row — or a second invoice emailed to the owner.
  const paymentInsert = await db
    .prepare('INSERT OR IGNORE INTO payments (subscription_id, pf_payment_id, amount_cents, status, raw_itn) VALUES (?, ?, ?, ?, ?)')
    .bind(subscription.id, posted.pf_payment_id ?? null, Math.round(postedAmount * 100), posted.payment_status, raw)
    .run();

  if (paymentInsert.meta.changes === 1) {
    if (business) {
      const label = subscription.product_type === 'tier' ? `Tier ${subscription.tier}` : `${subscription.product_type} (${subscription.product_target ?? 'n/a'})`;
      await logActivity(db, 'subscription_activated', business.name, `${label} activated via PayFast.`);
    }
    await issueInvoice(env, paymentInsert.meta.last_row_id as number);
  }

  await requestRebuild(env, 'subscription activated');

  return new Response('OK', { status: 200 });
}

// A monthly charge on a subscription that's already live: push the paid
// period out a month from the end of what's already paid (a charge that
// lands a little late, inside the expiry sweep's 3-day grace, keeps the
// original billing date), or from now if it had fully lapsed — record
// the payment, and invoice it.
async function recordRenewal(
  env: Env,
  db: D1Database,
  subscription: { id: number; business_id: number; tier: number; product_type: string; product_target: string | null; status: string },
  businessName: string | null,
  posted: Record<string, string>,
  postedAmount: number,
  raw: string
): Promise<Response> {
  const paymentInsert = await db
    .prepare('INSERT OR IGNORE INTO payments (subscription_id, pf_payment_id, amount_cents, status, raw_itn) VALUES (?, ?, ?, ?, ?)')
    .bind(subscription.id, posted.pf_payment_id ?? null, Math.round(postedAmount * 100), posted.payment_status, raw)
    .run();
  if (paymentInsert.meta.changes !== 1) return new Response('OK', { status: 200 }); // concurrent duplicate

  // A charge that lands after the expiry sweep already lapsed the row (late
  // ITN, or PayFast retrying a failed card) is still money received, so the
  // subscription comes back — unless it's an exclusive slot someone else
  // has bought in the meantime, in which case the charge is owed back.
  let revive = subscription.status === 'expired';
  if (revive && isSponsorProductType(subscription.product_type) && (await isSlotTaken(db, subscription.product_type, subscription.product_target, subscription.id))) {
    revive = false;
    await logActivity(db, 'renewal_refund_needed', businessName, `Renewal charge for a lapsed ${subscription.product_type} slot that is now held by someone else — refund pf_payment_id ${posted.pf_payment_id ?? '?'} by hand.`);
    return new Response('OK', { status: 200 });
  }

  const extended = `datetime(CASE WHEN datetime(current_period_end) > datetime('now', '-3 days') THEN current_period_end ELSE 'now' END, '+1 month')`;
  await db
    .prepare(
      `UPDATE subscriptions SET current_period_end = ${extended}, payfast_token = COALESCE(payfast_token, ?),
         status = CASE WHEN status = 'expired' THEN 'active' ELSE status END
       WHERE id = ?`
    )
    .bind(posted.token ?? null, subscription.id)
    .run();

  if (subscription.product_type === 'tier') {
    await db
      .prepare(
        `UPDATE businesses SET subscription_tier = ?, subscription_status = CASE WHEN ? THEN 'active' ELSE subscription_status END,
           subscription_expires_at = (SELECT current_period_end FROM subscriptions WHERE id = ?)
         WHERE id = ?
           -- a charge on a plan that was since replaced must not undo the upgrade
           AND NOT EXISTS (SELECT 1 FROM subscriptions WHERE business_id = ? AND product_type = 'tier' AND status = 'active' AND id != ?)`
      )
      .bind(subscription.tier, revive ? 1 : 0, subscription.id, subscription.business_id, subscription.business_id, subscription.id)
      .run();
  }
  if (revive) await requestRebuild(env, 'lapsed subscription renewed');

  const label = subscription.product_type === 'tier' ? `Tier ${subscription.tier}` : `${subscription.product_type} (${subscription.product_target ?? 'n/a'})`;
  await logActivity(db, 'subscription_renewed', businessName, `${label} renewed via PayFast.`);
  await issueInvoice(env, paymentInsert.meta.last_row_id as number);

  return new Response('OK', { status: 200 });
}

async function handleSubmissionPayment(
  env: Env,
  db: D1Database,
  submissionId: number,
  posted: Record<string, string>,
  postedAmount: number,
  raw: string
): Promise<Response> {
  const mPaymentId = posted.m_payment_id;
  const submission = await db
    .prepare('SELECT id, name, chosen_tier, m_payment_id, payment_status FROM pending_submissions WHERE id = ? AND m_payment_id = ?')
    .bind(submissionId, mPaymentId)
    .first<{ id: number; name: string; chosen_tier: number; m_payment_id: string | null; payment_status: string | null }>();
  if (!submission || submission.payment_status === 'paid') {
    // Renewal ITNs repeat the original checkout's custom_str1, so month two
    // of a tier bought at signup still arrives as "submission:<id>" — long
    // after that pending row was approved and deleted. By then the charge
    // belongs to the subscription created at approval (same m_payment_id).
    const sub = await db.prepare('SELECT business_id FROM subscriptions WHERE m_payment_id = ?').bind(mPaymentId).first<{ business_id: number }>();
    if (sub) return handleBusinessPayment(env, db, sub.business_id, posted, postedAmount, raw);
    if (submission) return new Response('OK', { status: 200 }); // replay; not approved yet
    return new Response('Unknown submission payment', { status: 400 });
  }

  const expectedCents = await tierPriceCents(db, submission.chosen_tier);
  if (!expectedCents || Math.abs(postedAmount - expectedCents / 100) > 0.05) {
    return new Response('Amount mismatch', { status: 400 });
  }

  // The recurring-billing token has to be kept here: this checkout happens
  // before any `businesses` row exists, so without it the subscription
  // created at approval time has nothing to cancel with and the owner can
  // never stop being billed. business-submission.ts carries it across.
  const updated = await db
    .prepare(`UPDATE pending_submissions SET payment_status = 'paid', payfast_token = ? WHERE id = ? AND payment_status = 'pending'`)
    .bind(posted.token ?? null, submissionId)
    .run();
  if (updated.meta.changes !== 1) return new Response('OK', { status: 200 }); // replay

  await logActivity(db, 'submission_payment_received', submission.name, `Paid for tier ${submission.chosen_tier} at signup — applies once approved.`);

  return new Response('OK', { status: 200 });
}
