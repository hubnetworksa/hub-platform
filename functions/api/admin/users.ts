import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';

interface Env {
  DB: D1Database;
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const rows = await context.env.DB
    .prepare('SELECT u.id, u.email, u.created_at, COUNT(b.id) AS owned_count FROM users u LEFT JOIN businesses b ON b.owner_user_id = u.id GROUP BY u.id ORDER BY u.created_at DESC')
    .all<{ id: number; email: string; created_at: string; owned_count: number }>();

  return json({ ok: true, users: rows.results });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
