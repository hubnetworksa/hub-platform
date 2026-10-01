import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { logActivity } from '../../_lib/activity-log';

interface Env {
  DB: D1Database;
}

// Backs the admin "News" tab: list what the daily news agent (or an admin)
// has published, and remove an article that turns out to be wrong. Like the
// events tab, the public site only reflects a removal after the next
// rebuild/deploy.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const rows = await context.env.DB.prepare(
    'SELECT id, slug, title, category, published_date, source_name, source_url, source, verification_json, created_at FROM news ORDER BY published_date DESC, id DESC LIMIT 200'
  ).all();
  return json({ ok: true, news: rows.results });
};

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  if (String(body.action ?? '') === 'delete') {
    const id = Number(body.id);
    if (!id) return json({ ok: false, error: 'Missing id.' }, 400);
    const existing = await context.env.DB.prepare('SELECT title FROM news WHERE id = ?').bind(id).first<{ title: string }>();
    await context.env.DB.prepare('DELETE FROM news WHERE id = ?').bind(id).run();
    if (existing) await logActivity(context.env.DB, 'news_removed', existing.title, `Removed by ${user.email}.`);
    return json({ ok: true });
  }

  return json({ ok: false, error: 'Unknown action.' }, 400);
};

function json(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), { status, headers: { 'Content-Type': 'application/json' } });
}
