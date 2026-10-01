import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';

interface Env {
  DB: D1Database;
}

// Admin-only search across every business regardless of status — the
// public functions/api/search-businesses.ts only surfaces unclaimed,
// published ones (for the claim flow), which isn't enough here since the
// whole point is finding businesses to hide/unhide.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const q = new URL(context.request.url).searchParams.get('q')?.trim() ?? '';
  if (q.length < 2) return json({ ok: true, results: [] });

  const results = await context.env.DB
    .prepare(
      `SELECT b.id, b.name, b.status, b.subscription_tier, b.phone, s.name AS suburb_name,
              (SELECT c.name FROM business_categories bc JOIN categories c ON c.id = bc.category_id WHERE bc.business_id = b.id AND bc.is_primary = 1 LIMIT 1) AS category_name
       FROM businesses b LEFT JOIN suburbs s ON s.id = b.suburb_id
       WHERE b.name LIKE ? ORDER BY b.name LIMIT 20`
    )
    .bind(`%${q}%`)
    .all<{ id: number; name: string; status: string; subscription_tier: number; phone: string | null; suburb_name: string | null; category_name: string | null }>();

  return json({ ok: true, results: results.results });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
