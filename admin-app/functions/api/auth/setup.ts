import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { jsonBody, str } from '../../_lib/body';
import { hashPassword, ipHash, passwordProblem, recordFailure, safeEqual, startSession, tooManyAttempts, validUsername } from '../../_lib/auth';

// Creates the first admin account. Only works while there is no account at
// all, and only with the setup code (the SETUP_CODE secret, set from the
// GitHub secret HUB_ADMIN_SETUP_CODE). Body: { code, username, password }
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  const ip = await ipHash(context.request);
  if (await tooManyAttempts(db, 'setup', ip, 5, 60)) return json({ ok: false, error: 'Too many attempts. Try again in an hour.' }, 429);
  const users = await db.prepare('SELECT COUNT(*) AS n FROM admin_users').first<{ n: number }>();
  if (users?.n) return json({ ok: false, error: 'Setup is already done. Sign in instead.' }, 409);
  const expected = context.env.SETUP_CODE ?? '';
  if (expected.length < 12) return json({ ok: false, error: 'Setup isn’t available yet: the setup code hasn’t been added (see the instructions).' }, 503);
  const body = (await jsonBody(context.request)) ?? {};
  if (!safeEqual(str(body.code, 200), expected)) {
    await recordFailure(db, 'setup', ip);
    return json({ ok: false, error: 'That setup code isn’t right.' }, 403);
  }
  const username = str(body.username, 60);
  const password = typeof body.password === 'string' ? body.password : '';
  if (!validUsername(username)) return json({ ok: false, error: 'Usernames are 3–60 characters: letters, numbers, dot, dash, underscore or @.' }, 400);
  const problem = passwordProblem(password, username);
  if (problem) return json({ ok: false, error: problem }, 400);
  // INSERT ... WHERE NOT EXISTS: two setup requests at once can't create two accounts.
  const res = await db
    .prepare('INSERT INTO admin_users (username, password_hash) SELECT ?, ? WHERE NOT EXISTS (SELECT 1 FROM admin_users)')
    .bind(username, await hashPassword(password))
    .run();
  if (!res.meta.changes) return json({ ok: false, error: 'Setup is already done. Sign in instead.' }, 409);
  const cookie = await startSession(db, Number(res.meta.last_row_id), 'password');
  return json({ ok: true }, 200, { 'Set-Cookie': cookie });
};
