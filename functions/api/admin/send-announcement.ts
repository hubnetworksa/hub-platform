import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSite, type Site } from '../../_lib/site';
import { getSessionUser, isAdminEmail, randomToken } from '../../_lib/auth';
import { sendEmail } from '../../_lib/send-email';
import { relaunchEmailHtml, relaunchEmailText } from '../../_lib/email-template';
import { safeEqual } from '../../_lib/timing';

interface Env {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
  CRON_SECRET?: string;
}

interface Recipient {
  id: number;
  email: string;
  unsubscribe_token: string | null;
}

// One-off service announcement to every registered user — built for the
// relaunch email, but keyed on a `campaign` name so it can be used again.
//
// Three modes, all POST, all JSON:
//   { campaign, test_to: "you@x" }  → one real email to that address, nothing
//                                     written to the database.
//   { campaign, dry_run: true }     → who WOULD get it (masked), send nothing.
//   { campaign }                    → the real thing. Sequential (there are a
//                                     few dozen users, not thousands); each
//                                     success is stamped in announcement_sends
//                                     so re-running the same campaign after a
//                                     failure never emails anyone twice.
//
// Auth: the same shared secret the cron endpoints use (so it can be fired
// with curl), or an admin's own session. Migration: <city>/00xx_announcements.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  if (!(await isAuthorised(context.request, context.env))) return json({ ok: false }, 401);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  const campaign = typeof body.campaign === 'string' ? body.campaign.trim() : '';
  if (!/^[a-z0-9][a-z0-9-]{2,63}$/.test(campaign)) {
    return json({ ok: false, error: 'campaign must be 3–64 chars of a-z, 0-9 and hyphens, e.g. "relaunch-2026-10".' }, 400);
  }

  const site = getSite(context.env.SITE);

  // Test send: real template, throwaway unsubscribe token that is never
  // stored (so clicking it just shows "no longer valid").
  if (typeof body.test_to === 'string' && body.test_to.trim()) {
    const to = body.test_to.trim();
    if (!looksLikeEmail(to)) return json({ ok: false, error: 'test_to is not an email address.' }, 400);
    const { sent } = await sendEmail(context.env, buildMessage(site, to, randomToken()));
    return json({ ok: true, mode: 'test', campaign, to: maskEmail(to), sent });
  }

  const limit = Number.isInteger(body.limit) && (body.limit as number) > 0 ? (body.limit as number) : null;

  const eligible = await db
    .prepare(
      `SELECT id, email, unsubscribe_token FROM users
       WHERE email_opt_out = 0
         AND email NOT LIKE '%@example.%'
         AND email NOT LIKE '%@example.invalid'
         AND email != 'admin@admin.com'
         AND email NOT LIKE 'launch-test-%'
         AND id NOT IN (SELECT user_id FROM announcement_sends WHERE campaign = ?)
       ORDER BY id`
    )
    .bind(campaign)
    .all<Recipient>();
  const alreadySent = await db
    .prepare('SELECT COUNT(*) AS n FROM announcement_sends WHERE campaign = ?')
    .bind(campaign)
    .first<{ n: number }>();
  const skippedAlreadySent = alreadySent?.n ?? 0;
  const totalEligible = eligible.results.length;
  const batch = limit ? eligible.results.slice(0, limit) : eligible.results;

  if (body.dry_run === true) {
    return json({
      ok: true,
      mode: 'dry_run',
      campaign,
      total_eligible: totalEligible,
      would_send: batch.length,
      skipped_already_sent: skippedAlreadySent,
      recipients: batch.map((r) => maskEmail(r.email)),
    });
  }

  if (!context.env.RESEND_API_KEY) {
    return json({ ok: false, error: 'RESEND_API_KEY is not set on this deployment — nothing sent.' }, 503);
  }

  let sent = 0;
  const failed: string[] = [];
  for (const user of batch) {
    let token = user.unsubscribe_token;
    if (!token) {
      token = randomToken();
      await db.prepare('UPDATE users SET unsubscribe_token = ? WHERE id = ? AND unsubscribe_token IS NULL').bind(token, user.id).run();
      // Lost a race with a concurrent run? Use whatever is there now.
      const fresh = await db.prepare('SELECT unsubscribe_token FROM users WHERE id = ?').bind(user.id).first<{ unsubscribe_token: string }>();
      token = fresh?.unsubscribe_token ?? token;
    }

    const result = await sendEmail(context.env, buildMessage(site, user.email, token));
    if (result.sent) {
      await db.prepare('INSERT OR IGNORE INTO announcement_sends (user_id, campaign) VALUES (?, ?)').bind(user.id, campaign).run();
      sent++;
    } else {
      failed.push(maskEmail(user.email));
    }
  }

  return json({
    ok: true,
    mode: 'send',
    campaign,
    sent,
    failed,
    skipped_already_sent: skippedAlreadySent,
    total_eligible: totalEligible,
    ...(limit && totalEligible > batch.length ? { remaining: totalEligible - batch.length } : {}),
  });
};

function buildMessage(site: Site, to: string, unsubscribeToken: string) {
  const base = `https://${site.domain}`;
  const urls = {
    unsubscribeUrl: `${base}/api/unsubscribe?t=${unsubscribeToken}`,
    dashboardUrl: `${base}/my-businesses/`,
    siteUrl: `${base}/`,
  };
  return {
    from: `${site.siteName} <${site.contactEmail}>`,
    to,
    replyTo: site.contactEmail,
    subject: `${site.siteName} has a new look — and new tools for your business`,
    text: relaunchEmailText(site, urls),
    html: relaunchEmailHtml(site, urls),
  };
}

async function isAuthorised(request: Request, env: Env): Promise<boolean> {
  const auth = request.headers.get('Authorization') ?? '';
  if (env.CRON_SECRET && auth && safeEqual(auth, `Bearer ${env.CRON_SECRET}`)) return true;
  const user = await getSessionUser(request, env.DB);
  return !!user && isAdminEmail(user.email);
}

function looksLikeEmail(s: string): boolean {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(s) && s.length <= 254;
}

/** j***@example.com — enough to recognise an address in a response or log
 *  without the response itself being a mailing list. */
function maskEmail(email: string): string {
  const at = email.indexOf('@');
  if (at < 1) return '***';
  return `${email[0]}***${email.slice(at)}`;
}

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
