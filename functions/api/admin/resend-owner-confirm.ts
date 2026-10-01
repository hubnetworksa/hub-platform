import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSite } from '../../_lib/site';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { logActivity } from '../../_lib/activity-log';
import { looksLikeEmail } from '../../_lib/messages';
import { sendOwnerConfirmEmail } from '../../_lib/owner-confirm';
import { safeEqual } from '../../_lib/timing';

interface Env {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
  CRON_SECRET?: string;
}

interface AwaitingOwnerRow {
  id: number;
  name: string;
  address: string | null;
  phone: string | null;
  email: string | null;
  website: string | null;
  description: string;
  owner_confirm_token: string | null;
}

// Re-sends the owner confirmation email for a submission the admin already
// approved (owner_confirm_token set) — e.g. when the owner typed their email
// wrong or never got it. Approvals → "Resend verification email".
//   POST {submissionId, email?}               (update the email, then) resend
//   POST {submissionId, email, send: false}   only update the email (the
//                                             Save button); the reminder
//                                             still goes out on schedule
// `email`, when given, replaces the submission's email first. It's the SAME
// email the approval sends (_lib/owner-confirm.ts), with the SAME token, so
// a link from an earlier copy still works. reminder_sent_at and
// admin_approved_at are reset, so process-owner-reminders.ts's reminder and
// expiry clock starts over from now.
//
// Auth: an admin session, or `Authorization: Bearer <CRON_SECRET>` so it can
// be fired from .github/workflows/resend-owner-confirm.yml.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const actor = await authorisedAs(context.request, context.env);
  if (!actor) return json({ ok: false }, 401);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  const submissionId = Number(body.submissionId);
  if (!submissionId) return json({ ok: false, error: 'Missing submission.' }, 400);

  let newEmail: string | null = null;
  if (body.email !== undefined && body.email !== null && body.email !== '') {
    newEmail = typeof body.email === 'string' ? body.email.trim() : '';
    if (!newEmail || newEmail.length > 160 || !looksLikeEmail(newEmail)) {
      return json({ ok: false, error: "That doesn't look like a valid email address." }, 400);
    }
  }

  const row = await db
    .prepare('SELECT id, name, address, phone, email, website, description, owner_confirm_token FROM pending_submissions WHERE id = ?')
    .bind(submissionId)
    .first<AwaitingOwnerRow>();
  if (!row) return json({ ok: false, error: 'Submission not found.' }, 404);
  if (!row.owner_confirm_token) {
    return json({ ok: false, error: 'This submission is not awaiting owner confirmation.' }, 409);
  }

  if (body.send === false) {
    if (!newEmail) return json({ ok: false, error: 'Enter the new email address.' }, 400);
    await db.prepare('UPDATE pending_submissions SET email = ? WHERE id = ?').bind(newEmail, row.id).run();
    if (newEmail !== row.email) {
      await logActivity(db, 'submission_email_changed', row.name, `Owner email changed from ${row.email ?? 'none'} to ${newEmail} by ${actor}.`);
    }
    return json({ ok: true, to: newEmail, emailUpdated: newEmail !== row.email, sent: false });
  }

  const to = newEmail ?? row.email;
  if (!to) return json({ ok: false, error: 'This submission has no email address. Add one first.' }, 400);

  await db
    .prepare(`UPDATE pending_submissions SET email = ?, reminder_sent_at = NULL, admin_approved_at = datetime('now') WHERE id = ?`)
    .bind(to, row.id)
    .run();

  const site = getSite(context.env.SITE);
  const result = await sendOwnerConfirmEmail(context.env, site, to, row, row.owner_confirm_token);

  const changed = newEmail && newEmail !== row.email ? ` Email changed from ${row.email ?? 'none'} to ${to}.` : '';
  await logActivity(
    db,
    'owner_confirm_resent',
    row.name,
    `${result.sent ? `Owner confirmation re-sent to ${to}` : `Owner confirmation could NOT be sent to ${to}`} by ${actor}.${changed}`
  );

  if (!result.sent) {
    return json(
      { ok: false, emailUpdated: !!changed, error: 'The email could not be sent (email sending is not set up or failed for this site).', subject: result.subject, text: result.text },
      502
    );
  }
  return json({ ok: true, to, emailUpdated: !!changed, sent: true });
};

/** Who's calling: 'CI' for the shared secret, the admin's email for a
 *  session, or null. Same secret check as process-owner-reminders.ts. */
async function authorisedAs(request: Request, env: Env): Promise<string | null> {
  const auth = request.headers.get('Authorization') ?? '';
  if (auth) {
    return env.CRON_SECRET && safeEqual(auth, `Bearer ${env.CRON_SECRET}`) ? 'CI' : null;
  }
  const user = await getSessionUser(request, env.DB);
  return user && isAdminEmail(user.email) ? `admin (${user.email})` : null;
}

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
