import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';

interface Env {
  DB: D1Database;
}

// Admin-only: marks an account's email as confirmed by hand (e.g. someone
// whose confirmation email never arrives).
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const admin = await getSessionUser(context.request, db);
  if (!admin || !isAdminEmail(admin.email)) return json({ ok: false }, 403);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }
  const userId = Number(body.userId);
  if (!userId) return json({ ok: false, error: 'Missing user.' }, 400);

  const result = await db
    .prepare(`UPDATE users SET email_verified_at = COALESCE(email_verified_at, datetime('now')) WHERE id = ?`)
    .bind(userId)
    .run();
  if (!result.meta.changes) return json({ ok: false, error: 'User not found.' }, 404);
  await db.prepare(`DELETE FROM auth_tokens WHERE user_id = ? AND purpose = 'email_verify'`).bind(userId).run();
  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
