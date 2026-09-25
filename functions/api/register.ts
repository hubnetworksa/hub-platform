import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { hashPassword, rotateSession, sessionCookie } from '../_lib/auth';
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

  const db = context.env.DB;
  if (await rateLimited(db, context.request, site.slug, 'register', 5)) {
    return json({ ok: false, error: 'Too many sign-ups from your connection. Please try again in an hour.' }, 429);
  }
  const existing = await db.prepare('SELECT 1 FROM users WHERE email = ?').bind(email).first();
  if (existing) return json({ ok: false, error: 'An account with that email already exists.' }, 400);

  const passwordHash = await hashPassword(password);
  const insert = await db.prepare('INSERT INTO users (email, password_hash) VALUES (?, ?)').bind(email, passwordHash).run();
  const token = await rotateSession(db, context.request, insert.meta.last_row_id as number);

  await sendEmail(context.env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: site.contactEmail,
    subject: `New account created: ${email}`,
    text: `A new ${site.siteName} account was just created via email/password: ${email}`,
  });

  return json({ ok: true }, 200, { 'Set-Cookie': sessionCookie(token) });
};

function json(data: unknown, status = 200, headers: Record<string, string> = {}): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json', ...headers } });
}
