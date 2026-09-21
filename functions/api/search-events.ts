import type { PagesFunction, D1Database } from '@cloudflare/workers-types';

interface Env {
  DB: D1Database;
}

// Used by the "claim an event" flow's search box to find an unclaimed
// event by title — mirrors functions/api/search-businesses.ts.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const q = new URL(context.request.url).searchParams.get('q')?.trim() ?? '';
  if (q.length < 2) return json({ ok: true, results: [] });

  const results = await context.env.DB
    .prepare("SELECT id, title, event_date, venue FROM events WHERE title LIKE ? AND event_owner_user_id IS NULL ORDER BY event_date LIMIT 20")
    .bind(`%${q}%`)
    .all<{ id: number; title: string; event_date: string; venue: string | null }>();

  return json({ ok: true, results: results.results });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
