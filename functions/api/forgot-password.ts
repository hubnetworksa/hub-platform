import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { randomToken, hashToken } from '../_lib/auth';
import { rateLimited } from '../_lib/messages';
import { sendEmail } from '../_lib/send-email';
import { getSite } from '../_lib/site';

interface Env {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
}

const TOKEN_MINUTES = 60;

// Step one of a password reset: email a single-use link. The response is
// the same whether or not the address has an account, so this can't be used
// to find out who is registered.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const db = context.env.DB;

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }
  const email = typeof body.email === 'string' ? body.email.trim().toLowerCase() : '';
  if (!email || !email.includes('@')) return json({ ok: false, error: 'Enter the email address you signed up with.' }, 400);

  if (await rateLimited(db, context.request, site.slug, 'forgot-password', 5)) {
    return json({ ok: false, error: 'Too many reset requests from your connection. Please try again in an hour.' }, 429);
  }

  const user = await db.prepare('SELECT id FROM users WHERE email = ?').bind(email).first<{ id: number }>();
  if (user) {
    // One live link per account: asking again replaces the previous one.
    await db.prepare(`DELETE FROM auth_tokens WHERE user_id = ? AND purpose = 'password_reset'`).bind(user.id).run();
    await db.prepare(`DELETE FROM auth_tokens WHERE datetime(expires_at) < datetime('now')`).run();

    const token = randomToken();
    await db
      .prepare(`INSERT INTO auth_tokens (user_id, purpose, token_hash, expires_at) VALUES (?, 'password_reset', ?, datetime('now', ?))`)
      .bind(user.id, await hashToken(token), `+${TOKEN_MINUTES} minutes`)
      .run();

    const origin = new URL(context.request.url).origin;
    const link = `${origin}/reset-password/?token=${token}`;
    await sendEmail(context.env, {
      from: `${site.siteName} <${site.contactEmail}>`,
      to: email,
      subject: `Reset your ${site.siteName} password`,
      text:
        `Someone asked to reset the password for your ${site.siteName} account.\n\n` +
        `Choose a new password here (the link works once, for ${TOKEN_MINUTES} minutes):\n${link}\n\n` +
        `If this wasn't you, ignore this email — your password stays the same.`,
    });
  }

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
