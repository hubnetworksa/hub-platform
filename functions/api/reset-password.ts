import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { hashPassword, hashToken, createSession, sessionCookie } from '../_lib/auth';
import { rateLimited } from '../_lib/messages';
import { getSite } from '../_lib/site';

interface Env {
  DB: D1Database;
  SITE: string;
}

// Step two of a password reset: swap a valid emailed token for a new
// password. The token is deleted before anything else happens, so it can
// only ever be used once, and every existing session for the account is
// signed out (a reset is often because someone else got in).
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const db = context.env.DB;

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }
  const token = typeof body.token === 'string' ? body.token : '';
  const password = typeof body.password === 'string' ? body.password : '';
  if (!/^[0-9a-f]{64}$/.test(token)) return json({ ok: false, error: 'This reset link is invalid. Ask for a new one.' }, 400);
  if (password.length < 8) return json({ ok: false, error: 'Password must be at least 8 characters.' }, 400);

  if (await rateLimited(db, context.request, site.slug, 'reset-password', 10)) {
    return json({ ok: false, error: 'Too many attempts from your connection. Please try again in an hour.' }, 429);
  }

  const tokenHash = await hashToken(token);
  const row = await db
    .prepare(`SELECT id, user_id, expires_at FROM auth_tokens WHERE token_hash = ? AND purpose = 'password_reset'`)
    .bind(tokenHash)
    .first<{ id: number; user_id: number; expires_at: string }>();
  if (!row) return json({ ok: false, error: 'This reset link has already been used or has expired. Ask for a new one.' }, 400);

  const claimed = await db.prepare('DELETE FROM auth_tokens WHERE id = ?').bind(row.id).run();
  if (!claimed.meta.changes) return json({ ok: false, error: 'This reset link has already been used. Ask for a new one.' }, 400);

  const live = await db.prepare(`SELECT datetime(?) > datetime('now') AS ok`).bind(row.expires_at).first<{ ok: number }>();
  if (!live?.ok) return json({ ok: false, error: 'This reset link has expired. Ask for a new one.' }, 400);

  await db.prepare('UPDATE users SET password_hash = ? WHERE id = ?').bind(await hashPassword(password), row.user_id).run();
  await db.prepare('DELETE FROM sessions WHERE user_id = ?').bind(row.user_id).run();

  const session = await createSession(db, row.user_id);
  return json({ ok: true }, 200, { 'Set-Cookie': sessionCookie(session) });
};

function json(data: unknown, status = 200, headers: Record<string, string> = {}): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json', ...headers } });
}
