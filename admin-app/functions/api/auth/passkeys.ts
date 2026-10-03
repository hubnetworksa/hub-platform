import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import type { AdminUser } from '../../_lib/auth';
import { jsonBody, str } from '../../_lib/body';

// The signed-in account's passkeys (GET) and removing one (POST { id }).
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = context.data.user as AdminUser;
  const rows = (await context.env.ADMIN_DB.prepare('SELECT id, name, created_at, last_used_at FROM passkeys WHERE user_id = ? ORDER BY created_at DESC').bind(user.id).all()).results ?? [];
  return json({ ok: true, passkeys: rows });
};

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const user = context.data.user as AdminUser;
  const b = (await jsonBody(context.request)) ?? {};
  await context.env.ADMIN_DB.prepare('DELETE FROM passkeys WHERE id = ? AND user_id = ?').bind(str(b.id, 1400), user.id).run();
  return json({ ok: true });
};
