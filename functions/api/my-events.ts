import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser } from '../_lib/auth';

interface Env {
  DB: D1Database;
}

// Mirrors functions/api/my-businesses.ts — events submitted or claimed while
// signed in show up here once the account has an owned/pending/claimed row.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user) return json({ ok: false }, 401);

  const db = context.env.DB;

  const owned = await db
    .prepare('SELECT id, slug, title, event_date, featured FROM events WHERE event_owner_user_id = ? ORDER BY event_date')
    .bind(user.id)
    .all<{ id: number; slug: string; title: string; event_date: string; featured: number }>();

  const claims = await db
    .prepare('SELECT ec.id, ec.status, e.title AS event_title FROM event_claims ec JOIN events e ON e.id = ec.event_id WHERE ec.user_id = ? ORDER BY ec.created_at DESC')
    .bind(user.id)
    .all<{ id: number; status: string; event_title: string }>();

  const pending = await db
    .prepare("SELECT id, title, status FROM event_submissions WHERE submitted_by_user_id = ? ORDER BY created_at DESC")
    .bind(user.id)
    .all<{ id: number; title: string; status: string }>();

  return json({
    ok: true,
    email: user.email,
    owned: owned.results,
    claims: claims.results,
    pending: pending.results.map((row) => ({ name: row.title, status: 'Pending admin approval' })),
  });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
