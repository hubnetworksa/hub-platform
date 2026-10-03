import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { jsonBody, str } from '../../_lib/body';
import { hashPassword, ipHash, passwordProblem, recordFailure, safeEqual, tooManyAttempts } from '../../_lib/auth';

// Forgotten password: the setup code plus the username sets a new password
// and signs that account out everywhere. Body: { code, username, password }
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  const ip = await ipHash(context.request);
  if (await tooManyAttempts(db, 'recover', ip, 5, 60)) return json({ ok: false, error: 'Too many attempts. Try again in an hour.' }, 429);
  const expected = context.env.SETUP_CODE ?? '';
  if (expected.length < 12) return json({ ok: false, error: 'Password reset isn’t available: the setup code secret isn’t set.' }, 503);
  const body = (await jsonBody(context.request)) ?? {};
  const username = str(body.username, 60);
  const user = await db.prepare('SELECT id FROM admin_users WHERE username = ?').bind(username).first<{ id: number }>();
  if (!safeEqual(str(body.code, 200), expected) || !user) {
    await recordFailure(db, 'recover', ip);
    return json({ ok: false, error: 'That setup code or username isn’t right.' }, 403);
  }
  const password = typeof body.password === 'string' ? body.password : '';
  const problem = passwordProblem(password, username);
  if (problem) return json({ ok: false, error: problem }, 400);
  await db.batch([
    db.prepare('UPDATE admin_users SET password_hash = ? WHERE id = ?').bind(await hashPassword(password), user.id),
    db.prepare('DELETE FROM admin_sessions WHERE user_id = ?').bind(user.id),
  ]);
  return json({ ok: true });
};
