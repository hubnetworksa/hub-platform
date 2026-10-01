import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSite } from '../../_lib/site';
import { sendEmail } from '../../_lib/send-email';
import { ownerReminderEmailHtml } from '../../_lib/email-template';
import { logActivity } from '../../_lib/activity-log';
import { flushPendingRebuild } from '../../_lib/deploy-hook';
import { safeEqual } from '../../_lib/timing';

interface Env {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
  CRON_SECRET?: string;
  GITHUB_DISPATCH_TOKEN?: string;
}

interface DueForReminder {
  id: number;
  name: string;
  email: string;
  owner_confirm_token: string;
}

interface DueForExpiry {
  id: number;
  name: string;
  email: string | null;
  chosen_tier: number;
  m_payment_id: string | null;
  payment_status: string | null;
}

// Called daily by .github/workflows/owner-reminders.yml (not by any
// browser session — there's no admin to log in as here), so this is
// gated on a shared secret instead of getSessionUser/isAdminEmail.
//
// Schedule: a submission awaiting owner confirmation gets one reminder
// email 3 days after admin approval, then — if there's still no response
// — expires (deleted, never published) 4 days after that reminder.
const REMINDER_AFTER_DAYS = 3;
const EXPIRE_AFTER_REMINDER_DAYS = 4;

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const auth = context.request.headers.get('Authorization') ?? '';
  if (!context.env.CRON_SECRET || !safeEqual(auth, `Bearer ${context.env.CRON_SECRET}`)) {
    return json({ ok: false }, 401);
  }

  const site = getSite(context.env.SITE);
  const db = context.env.DB;

  const dueForReminder = await db
    .prepare(
      `SELECT id, name, email, owner_confirm_token FROM pending_submissions
       WHERE owner_confirm_token IS NOT NULL
         AND reminder_sent_at IS NULL
         AND admin_approved_at <= datetime('now', ?)`
    )
    .bind(`-${REMINDER_AFTER_DAYS} days`)
    .all<DueForReminder>();

  let reminded = 0;
  for (const row of dueForReminder.results) {
    const confirmUrl = `https://${site.domain}/owner-confirm-listing?token=${row.owner_confirm_token}`;
    await sendEmail(context.env, {
      from: `${site.siteName} <${site.contactEmail}>`,
      to: row.email,
      subject: `Reminder: confirm your ${site.siteName} listing — ${row.name}`,
      text: `Hi,\n\nA few days ago, "${row.name}" was submitted to ${site.siteName} and is still waiting on your confirmation before it goes live.\n\nConfirm or dispute here: ${confirmUrl}\n\nIf we don't hear back in a few more days, it won't be published.`,
      html: ownerReminderEmailHtml(site, { businessName: row.name, confirmUrl }),
    });
    await db.prepare(`UPDATE pending_submissions SET reminder_sent_at = datetime('now') WHERE id = ?`).bind(row.id).run();
    reminded++;
  }

  const dueForExpiry = await db
    .prepare(
      `SELECT id, name, email, chosen_tier, m_payment_id, payment_status FROM pending_submissions
       WHERE owner_confirm_token IS NOT NULL
         AND reminder_sent_at IS NOT NULL
         AND reminder_sent_at <= datetime('now', ?)`
    )
    .bind(`-${EXPIRE_AFTER_REMINDER_DAYS} days`)
    .all<DueForExpiry>();

  let expired = 0;
  let escalated = 0;
  for (const row of dueForExpiry.results) {
    // A paid submission is never silently deleted — deleting it would keep
    // the money AND the recurring PayFast billing with nothing published and
    // no record of who paid. Escalate to a human once (the escalation itself
    // marks the row so the next sweep doesn't re-send) and leave the row alone.
    if (row.payment_status === 'paid') {
      await sendEmail(context.env, {
        from: `${site.siteName} <${site.contactEmail}>`,
        to: site.contactEmail,
        subject: `Action needed: paid submission expired unconfirmed — ${row.name}`,
        text: [
          `"${row.name}" was paid for but the owner never confirmed it after a reminder.`,
          ``,
          `Tier: ${row.chosen_tier}`,
          `m_payment_id: ${row.m_payment_id ?? 'unknown'}`,
          `Owner email: ${row.email ?? 'none on file'}`,
          ``,
          `It has NOT been deleted. Decide whether to publish it, refund the payment, or cancel the PayFast subscription, then remove the pending row by hand.`,
        ].join('\n'),
      });
      await db.prepare(`UPDATE pending_submissions SET reminder_sent_at = datetime('now') WHERE id = ?`).bind(row.id).run();
      await logActivity(db, 'submission_expiry_escalated', row.name, `Paid (tier ${row.chosen_tier}, m_payment_id ${row.m_payment_id}) — kept for manual refund/publish decision.`);
      escalated++;
      continue;
    }
    await db.prepare('DELETE FROM pending_submissions WHERE id = ?').bind(row.id).run();
    await logActivity(db, 'submission_expired', row.name, 'Owner never confirmed after a reminder — not published.');
    expired++;
  }

  const rebuilt = await flushPendingRebuild(context.env);

  return json({ ok: true, reminded, expired, escalated, rebuilt });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
