import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser } from '../_lib/auth';

interface Env {
  DB: D1Database;
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user) return json({ ok: false }, 401);

  const db = context.env.DB;

  const owned = await db
    .prepare('SELECT id, slug, name, subscription_tier, subscription_status, subscription_expires_at FROM businesses WHERE owner_user_id = ? ORDER BY name')
    .bind(user.id)
    .all<{ id: number; slug: string; name: string; subscription_tier: number; subscription_status: string | null; subscription_expires_at: string | null }>();

  const claims = await db
    .prepare('SELECT bc.id, bc.status, b.name AS business_name FROM business_claims bc JOIN businesses b ON b.id = bc.business_id WHERE bc.user_id = ? ORDER BY bc.created_at DESC')
    .bind(user.id)
    .all<{ id: number; status: string; business_name: string }>();

  const pending = await db
    // Submitted while logged in OR submitted anonymously with this address —
    // matching on email alone hid a logged-in submitter's own pending row
    // whenever they gave the business's email instead of their own.
    .prepare('SELECT id, name, owner_confirm_token, admin_approved_at FROM pending_submissions WHERE submitted_by_user_id = ? OR email = ? ORDER BY created_at DESC')
    .bind(user.id, user.email)
    .all<{ id: number; name: string; owner_confirm_token: string | null; admin_approved_at: string | null }>();

  const pendingWithStatus = pending.results.map((row) => ({
    name: row.name,
    status: row.admin_approved_at ? 'Awaiting your email confirmation' : 'Pending admin approval',
  }));

  return json({
    ok: true,
    email: user.email,
    owned: owned.results,
    claims: claims.results,
    pending: pendingWithStatus,
  });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
