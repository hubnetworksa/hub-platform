import type { D1Database } from '@cloudflare/workers-types';
import { randomToken, hashToken } from './auth';
import { sendEmail } from './send-email';
import { verifyEmailHtml } from './email-template';
import type { Site } from './site';

export const VERIFY_HOURS = 24;

/** A same-site path the person was heading to, or null. */
export function safeNext(next: unknown): string | null {
  return typeof next === 'string' && /^\/(?![\/\\])/.test(next) && next.length <= 300 ? next : null;
}

// Per-account throttle on verification emails, kept in rate_limits (keyed
// `user:<id>` rather than an IP hash): at most 1 per 2 minutes and 5 per day.
// Records the send when it allows it.
export async function takeVerificationSlot(db: D1Database, userId: number): Promise<boolean> {
  const key = `user:${userId}`;
  const recent = await db
    .prepare(`SELECT COUNT(*) AS n FROM rate_limits WHERE action = 'verify-email' AND ip_hash = ? AND created_at > datetime('now', '-2 minutes')`)
    .bind(key)
    .first<{ n: number }>();
  if ((recent?.n ?? 0) >= 1) return false;
  const day = await db
    .prepare(`SELECT COUNT(*) AS n FROM rate_limits WHERE action = 'verify-email' AND ip_hash = ? AND created_at > datetime('now', '-1 day')`)
    .bind(key)
    .first<{ n: number }>();
  if ((day?.n ?? 0) >= 5) return false;
  await db.prepare(`INSERT INTO rate_limits (action, ip_hash) VALUES ('verify-email', ?)`).bind(key).run();
  return true;
}

/** Issues a fresh confirmation link (replacing any earlier one) and emails it.
 *  Returns false, sending nothing, when the account is over its limit. */
export async function sendVerificationEmail(
  env: { RESEND_API_KEY?: string },
  db: D1Database,
  site: Site,
  user: { id: number; email: string },
  next?: string | null
): Promise<boolean> {
  if (!(await takeVerificationSlot(db, user.id))) return false;

  await db.prepare(`DELETE FROM auth_tokens WHERE user_id = ? AND purpose = 'email_verify'`).bind(user.id).run();
  await db.prepare(`DELETE FROM auth_tokens WHERE datetime(expires_at) < datetime('now')`).run();
  const token = randomToken();
  await db
    .prepare(`INSERT INTO auth_tokens (user_id, purpose, token_hash, expires_at) VALUES (?, 'email_verify', ?, datetime('now', ?))`)
    .bind(user.id, await hashToken(token), `+${VERIFY_HOURS} hours`)
    .run();

  const safe = safeNext(next);
  const link = `https://${site.domain}/verify-email?token=${token}${safe ? `&next=${encodeURIComponent(safe)}` : ''}`;
  await sendEmail(env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: user.email,
    subject: `Confirm your ${site.siteName} email`,
    text:
      `Thanks for creating a ${site.siteName} account.\n\n` +
      `Confirm your email address to finish setting it up (the link works once, for ${VERIFY_HOURS} hours):\n${link}\n\n` +
      `If you didn't create an account, ignore this email.`,
    html: verifyEmailHtml(site, { confirmUrl: link }),
  });
  return true;
}
