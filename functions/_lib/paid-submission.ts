import type { D1Database } from '@cloudflare/workers-types';
import { cancelPayfastSubscription, payfastConfigured, type PayfastEnv } from './payfast';
import { sendEmail } from './send-email';
import { logActivity } from './activity-log';
import type { Site } from './site';

export interface PaidSubmission {
  id: number;
  name: string;
  email: string | null;
  chosen_tier: number;
  m_payment_id: string | null;
  payment_status: string | null;
  payfast_token?: string | null;
}

// A listing someone paid for at signup that will now never publish
// (admin rejected it, or the owner disputed it). Two things are owed:
// stop PayFast billing them again next month, and get the first charge
// refunded — which PayFast only allows from the merchant dashboard, so a
// human is told exactly which payment to refund. No-op for unpaid rows.
export async function closePaidSubmission(
  env: PayfastEnv & { RESEND_API_KEY?: string },
  db: D1Database,
  site: Site,
  row: PaidSubmission,
  why: string
): Promise<void> {
  if (row.payment_status !== 'paid') return;

  let billing = 'No PayFast subscription token was captured — check the PayFast dashboard and cancel it there.';
  if (row.payfast_token && payfastConfigured(env)) {
    try {
      const result = await cancelPayfastSubscription(env, row.payfast_token);
      billing = result.ok
        ? 'Recurring billing was cancelled on PayFast automatically.'
        : `PayFast refused the cancel (HTTP ${result.status}) — cancel it by hand. Token: ${row.payfast_token}`;
    } catch (err) {
      billing = `Calling PayFast to cancel failed (${String(err)}) — cancel it by hand. Token: ${row.payfast_token}`;
    }
  }

  await sendEmail(env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: site.contactEmail,
    subject: `Refund needed: ${row.name}`,
    text: [
      `"${row.name}" was paid for at signup but will not be published (${why}).`,
      '',
      `Tier: ${row.chosen_tier}`,
      `m_payment_id: ${row.m_payment_id ?? 'unknown'}`,
      `Owner email: ${row.email ?? 'none on file'}`,
      '',
      billing,
      'Refund the first payment from the PayFast merchant dashboard.',
    ].join('\n'),
  });
  await logActivity(db, 'submission_refund_needed', row.name, `${why}. Paid tier ${row.chosen_tier}, m_payment_id ${row.m_payment_id}. ${billing}`);
}
