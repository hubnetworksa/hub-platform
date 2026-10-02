import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { hashPassword, isAdminEmail } from '../_lib/auth';
import { sendVerificationEmail, takeVerificationSlot, safeNext } from '../_lib/email-verification';
import { rateLimited } from '../_lib/messages';
import { sendEmail } from '../_lib/send-email';
import { getSite } from '../_lib/site';

interface Env {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  const email = typeof body.email === 'string' ? body.email.trim().toLowerCase() : '';
  const password = typeof body.password === 'string' ? body.password : '';
  if (!email || !email.includes('@')) return json({ ok: false, error: 'Enter a valid email address.' }, 400);
  if (password.length < 8) return json({ ok: false, error: 'Password must be at least 8 characters.' }, 400);
  // The admin account (hubnetworksa@gmail.com, and admin@admin.com when the
  // preview's demo flag is on) must never be created via password sign-up —
  // admin access is granted purely by matching that literal address, so
  // anyone who registered it first would become admin. Real sign-in for
  // that address is Google OAuth only (see
  // functions/api/auth/google/callback.ts), which verifies the email with
  // Google before trusting it.
  if (isAdminEmail(email)) {
    return json({ ok: false, error: "That email address can't be used to create an account. Please sign in with Google instead." }, 400);
  }

  const db = context.env.DB;
  if (await rateLimited(db, context.request, site.slug, 'register', 5)) {
    return json({ ok: false, error: 'Too many sign-ups from your connection. Please try again in an hour.' }, 429);
  }
  const next = safeNext(body.next);
  // The same answer whether or not the address already has an account, so
  // this can't be used to find out who is registered.
  const done = () => json({ ok: true, verify: true });

  const existing = await db
    .prepare('SELECT id, email_verified_at FROM users WHERE email = ?')
    .bind(email)
    .first<{ id: number; email_verified_at: string | null }>();
  if (existing) {
    if (!existing.email_verified_at) {
      // A half-finished sign-up: send a fresh link (rate-limited). The password
      // is never replaced, so whoever typed it first can't be overridden here.
      await sendVerificationEmail(context.env, db, site, { id: existing.id, email }, next);
    } else if (await takeVerificationSlot(db, existing.id)) {
      await sendEmail(context.env, {
        from: `${site.siteName} <${site.contactEmail}>`,
        to: email,
        subject: `You already have a ${site.siteName} account`,
        text:
          `Someone tried to create a ${site.siteName} account with this email address, but you already have one.\n\n` +
          `Log in: https://${site.domain}/login/\nForgot your password? https://${site.domain}/forgot-password/\n\n` +
          `If this wasn't you, you can ignore this email.`,
      });
    }
    return done();
  }

  const passwordHash = await hashPassword(password);
  const insert = await db.prepare('INSERT INTO users (email, password_hash) VALUES (?, ?)').bind(email, passwordHash).run();
  await sendVerificationEmail(context.env, db, site, { id: insert.meta.last_row_id as number, email }, next);

  await sendEmail(context.env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: site.contactEmail,
    subject: `New account created: ${email}`,
    text: `A new ${site.siteName} account was just created via email/password (awaiting email confirmation): ${email}`,
  });

  // No session yet: the account is unusable until the emailed link is opened.
  return done();
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
