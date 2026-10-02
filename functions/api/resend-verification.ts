import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { rateLimited } from '../_lib/messages';
import { sendVerificationEmail, safeNext } from '../_lib/email-verification';
import { getSite } from '../_lib/site';

interface Env {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
}

// Emails a fresh confirmation link to an account that hasn't confirmed yet.
// The answer is identical whether or not the address has an account (or has
// already confirmed), so this can't be used to find out who is registered.
// Limits: 10 requests an hour per connection, and per account at most 1 email
// per 2 minutes and 5 per day (see takeVerificationSlot).
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
  if (!email || !email.includes('@')) return json({ ok: false, error: 'Enter a valid email address.' }, 400);

  if (await rateLimited(db, context.request, site.slug, 'resend-verification', 10)) {
    return json({ ok: false, error: 'Too many requests from your connection. Please try again in an hour.' }, 429);
  }

  const user = await db
    .prepare('SELECT id FROM users WHERE email = ? AND email_verified_at IS NULL AND password_hash IS NOT NULL')
    .bind(email)
    .first<{ id: number }>();
  if (user) await sendVerificationEmail(context.env, db, site, { id: user.id, email }, safeNext(body.next));

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
