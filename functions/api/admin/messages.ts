import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';

interface Env {
  DB: D1Database;
}

// Backs the admin Enquiries tab: everything visitors sent through the site's
// own forms (the contact page and the enquiry form on each listing).
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const rows = await context.env.DB.prepare(
    `SELECT id, kind, name, contact, topic, message, business_slug, business_name, emailed, status, created_at
     FROM messages ORDER BY (status = 'open') DESC, created_at DESC LIMIT 300`
  ).all();
  const stats = await context.env.DB.prepare(
    `SELECT SUM(status = 'open') AS open, SUM(created_at > datetime('now', '-7 days')) AS thisWeek, COUNT(*) AS total FROM messages`
  ).first<{ open: number | null; thisWeek: number | null; total: number }>();
  return json({
    ok: true,
    messages: rows.results,
    stats: { open: stats?.open ?? 0, thisWeek: stats?.thisWeek ?? 0, total: stats?.total ?? 0 },
  });
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
  const id = Number(body.id);
  if (!id) return json({ ok: false, error: 'Missing id.' }, 400);
  const db = context.env.DB;

  if (body.action === 'resolve') {
    await db.prepare(`UPDATE messages SET status = 'resolved', resolved_at = datetime('now') WHERE id = ?`).bind(id).run();
    return json({ ok: true });
  }
  if (body.action === 'reopen') {
    await db.prepare(`UPDATE messages SET status = 'open', resolved_at = NULL WHERE id = ?`).bind(id).run();
    return json({ ok: true });
  }
  if (body.action === 'delete') {
    await db.prepare('DELETE FROM messages WHERE id = ?').bind(id).run();
    return json({ ok: true });
  }
  return json({ ok: false, error: 'Unknown action.' }, 400);
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
