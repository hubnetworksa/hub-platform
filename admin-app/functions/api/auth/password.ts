import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { jsonBody } from '../../_lib/body';
import { hashPassword, passwordProblem, verifyPassword, type AdminUser } from '../../_lib/auth';

// Change password (signed in). Body: { current, password }
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  const user = context.data.user as AdminUser;
  const body = (await jsonBody(context.request)) ?? {};
  const row = await db.prepare('SELECT password_hash FROM admin_users WHERE id = ?').bind(user.id).first<{ password_hash: string }>();
  if (!row || typeof body.current !== 'string' || !(await verifyPassword(body.current.slice(0, 200), row.password_hash))) {
    return json({ ok: false, error: 'Your current password isn’t right.' }, 403);
  }
  const password = typeof body.password === 'string' ? body.password : '';
  const problem = passwordProblem(password, user.username);
  if (problem) return json({ ok: false, error: problem }, 400);
  await db.prepare('UPDATE admin_users SET password_hash = ? WHERE id = ?').bind(await hashPassword(password), user.id).run();
  return json({ ok: true });
};
