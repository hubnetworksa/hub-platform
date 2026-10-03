import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { sessionUser } from '../../_lib/auth';

// What the app should show: first-time setup, the sign-in screen, or the app.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  const users = await db.prepare('SELECT COUNT(*) AS n FROM admin_users').first<{ n: number }>();
  if (!users?.n) return json({ ok: true, setupNeeded: true, setupAvailable: !!context.env.SETUP_CODE, signedIn: false });
  const user = await sessionUser(context.request, db);
  if (!user) return json({ ok: true, setupNeeded: false, recoveryAvailable: !!context.env.SETUP_CODE, signedIn: false });
  const pk = await db.prepare('SELECT COUNT(*) AS n FROM passkeys WHERE user_id = ?').bind(user.id).first<{ n: number }>();
  return json({ ok: true, setupNeeded: false, signedIn: true, username: user.username, passkeys: pk?.n ?? 0 });
};
