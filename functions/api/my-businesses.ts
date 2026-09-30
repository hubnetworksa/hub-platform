import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser } from '../_lib/auth';

interface Env {
  DB: D1Database;
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user) return json({ ok: false }, 401);

  const db = context.env.DB;

  // status/closed_at aren't editable here — just enough to flag a listing
  // that's actually invisible on the public site (admin-hidden, or
  // auto-flagged closed) so the owner isn't kept in the dark on the list
  // view either, not only once they open the business.
  // category_slug/name and suburb_slug/name are only used client-side on the
  // sponsor checkout page, to note when the spot being bought doesn't match
  // the business's own category/suburb — sponsoring outside your own
  // category/suburb is still allowed, this is just a heads-up.
  const owned = await db
    .prepare(
      `SELECT b.id, b.slug, b.name, b.subscription_tier, b.subscription_status, b.subscription_expires_at,
              (b.status = 'published' AND b.closed_at IS NULL) AS visible,
              s.slug AS suburb_slug, s.name AS suburb_name,
              (SELECT c.slug FROM business_categories bc JOIN categories c ON c.id = bc.category_id WHERE bc.business_id = b.id AND bc.is_primary = 1 LIMIT 1) AS category_slug,
              (SELECT c.name FROM business_categories bc JOIN categories c ON c.id = bc.category_id WHERE bc.business_id = b.id AND bc.is_primary = 1 LIMIT 1) AS category_name
       FROM businesses b
       LEFT JOIN suburbs s ON s.id = b.suburb_id
       WHERE b.owner_user_id = ?
       ORDER BY b.name`
    )
    .bind(user.id)
    .all<{
      id: number;
      slug: string;
      name: string;
      subscription_tier: number;
      subscription_status: string | null;
      subscription_expires_at: string | null;
      visible: number;
      suburb_slug: string | null;
      suburb_name: string | null;
      category_slug: string | null;
      category_name: string | null;
    }>();

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
