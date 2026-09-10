import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { verifyPassword, createSession, sessionCookie, isAdminEmail } from '../_lib/auth';

interface Env {
  DB: D1Database;
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  const email = typeof body.email === 'string' ? body.email.trim().toLowerCase() : '';
  const password = typeof body.password === 'string' ? body.password : '';
  if (!email || !password) return json({ ok: false, error: 'Enter your email and password.' }, 400);

  const db = context.env.DB;
  const user = await db.prepare('SELECT id, password_hash FROM users WHERE email = ?').bind(email).first<{ id: number; password_hash: string | null }>();
  if (!user || !user.password_hash || !(await verifyPassword(password, user.password_hash))) {
    return json({ ok: false, error: 'Incorrect email or password.' }, 401);
  }

  const token = await createSession(db, user.id);
  return json({ ok: true, isAdmin: isAdminEmail(email) }, 200, { 'Set-Cookie': sessionCookie(token) });
};

function json(data: unknown, status = 200, headers: Record<string, string> = {}): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json', ...headers } });
}
