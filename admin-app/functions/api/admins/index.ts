import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import type { AdminUser } from '../../_lib/auth';

// Every admin account and the invites still waiting to be used.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  const me = context.data.user as AdminUser;
  const users =
    (
      await db
        .prepare(
          `SELECT u.id, u.username, u.created_at, u.last_login_at, (SELECT COUNT(*) FROM passkeys p WHERE p.user_id = u.id) AS passkeys
           FROM admin_users u ORDER BY u.created_at`
        )
        .all<{ id: number; username: string; created_at: string; last_login_at: string | null; passkeys: number }>()
    ).results ?? [];
  const invites =
    (await db.prepare(`SELECT username, created_at, expires_at FROM admin_invites WHERE used_at IS NULL AND expires_at > ? ORDER BY created_at DESC`).bind(new Date().toISOString()).all()).results ?? [];
  return json({ ok: true, admins: users.map((u) => ({ ...u, me: u.id === me.id })), invites });
};
