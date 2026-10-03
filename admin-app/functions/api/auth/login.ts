import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { jsonBody, str } from '../../_lib/body';
import { dummyVerify, ipHash, recordFailure, startSession, tooManyAttempts, userFailures, verifyPassword } from '../../_lib/auth';

// Username + password sign-in. Body: { username, password }
// Limits: 10 failures per 15 minutes from one connection, and 20 per hour
// against one username from anywhere. The same answer for an unknown
// username and a wrong password.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  const ip = await ipHash(context.request);
  if (await tooManyAttempts(db, 'login', ip, 10, 15)) return json({ ok: false, error: 'Too many failed sign-ins. Wait 15 minutes and try again.' }, 429);
  const body = (await jsonBody(context.request)) ?? {};
  const username = str(body.username, 60);
  const password = typeof body.password === 'string' ? body.password.slice(0, 200) : '';
  if (!username || !password) return json({ ok: false, error: 'Enter your username and password.' }, 400);
  if ((await userFailures(db, username)) >= 20) return json({ ok: false, error: 'This account is temporarily locked after many failed sign-ins. Try again in an hour.' }, 429);
  const user = await db.prepare('SELECT id, password_hash FROM admin_users WHERE username = ?').bind(username).first<{ id: number; password_hash: string }>();
  const ok = user ? await verifyPassword(password, user.password_hash) : (await dummyVerify(password), false);
  if (!user || !ok) {
    await recordFailure(db, 'login', ip, username);
    return json({ ok: false, error: 'Wrong username or password.' }, 401);
  }
  return json({ ok: true }, 200, { 'Set-Cookie': await startSession(db, user.id, 'password') });
};
