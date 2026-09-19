import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';

interface Env {
  DB: D1Database;
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  // last_seen = the newest session created for the account (a sign-in), the
  // closest real signal we keep to "last active".
  const rows = await context.env.DB
    .prepare(
      `SELECT u.id, u.email, u.created_at, COUNT(DISTINCT b.id) AS owned_count,
              (SELECT MAX(s.created_at) FROM sessions s WHERE s.user_id = u.id) AS last_seen
       FROM users u LEFT JOIN businesses b ON b.owner_user_id = u.id
       GROUP BY u.id ORDER BY u.created_at DESC`
    )
    .all<{ id: number; email: string; created_at: string; owned_count: number; last_seen: string | null }>();

  return json({
    ok: true,
    users: rows.results.map((u) => ({
      ...u,
      role: isAdminEmail(u.email) ? 'Admin' : u.owned_count > 0 ? 'Owner' : 'Member',
    })),
  });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
