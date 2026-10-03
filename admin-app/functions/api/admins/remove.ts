import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import type { AdminUser } from '../../_lib/auth';
import { jsonBody } from '../../_lib/body';
import { logActivity } from '../../_lib/alerts';

// Removes another admin (POST { id }): their account, sessions and passkeys.
// You can't remove yourself, and the last admin can't be removed.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  const me = context.data.user as AdminUser;
  const id = Number(((await jsonBody(context.request)) ?? {}).id);
  if (!id) return json({ ok: false, error: 'Invalid request.' }, 400);
  if (id === me.id) return json({ ok: false, error: 'You can’t remove your own account.' }, 400);
  const n = await db.prepare('SELECT COUNT(*) AS n FROM admin_users').first<{ n: number }>();
  if ((n?.n ?? 0) <= 1) return json({ ok: false, error: 'There must always be at least one admin.' }, 400);
  const who = await db.prepare('SELECT username FROM admin_users WHERE id = ?').bind(id).first<{ username: string }>();
  await db.batch([
    db.prepare('DELETE FROM admin_sessions WHERE user_id = ?').bind(id),
    db.prepare('DELETE FROM passkeys WHERE user_id = ?').bind(id),
    db.prepare('DELETE FROM admin_invites WHERE created_by = ?').bind(id),
    db.prepare('DELETE FROM admin_users WHERE id = ?').bind(id),
  ]);
  if (who) await logActivity(db, me.username, null, 'admin_removed', who.username);
  return json({ ok: true });
};
