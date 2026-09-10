import type { PagesFunction, D1Database } from '@cloudflare/workers-types';

interface Env {
  DB: D1Database;
}

// Used by the claim flow's search box to find an unclaimed business by name.
// Session isn't required to search — only to actually file a claim.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const q = new URL(context.request.url).searchParams.get('q')?.trim() ?? '';
  if (q.length < 2) return json({ ok: true, results: [] });

  const results = await context.env.DB
    .prepare("SELECT id, name FROM businesses WHERE name LIKE ? AND owner_user_id IS NULL ORDER BY name LIMIT 20")
    .bind(`%${q}%`)
    .all<{ id: number; name: string }>();

  return json({ ok: true, results: results.results });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
