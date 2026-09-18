import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { eventSlug, isEventType } from '../../_lib/events';
import { logActivity } from '../../_lib/activity-log';

interface Env {
  DB: D1Database;
}

// Backs the admin "Events" tab — same shape as admin/businesses.astro and
// admin/ads-sponsors.astro: this endpoint owns D1 writes, the static site
// only picks them up on the next rebuild (see admin.astro's "Rebuild &
// deploy" button / functions/_lib/deploy-hook.ts).
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const rows = await context.env.DB.prepare('SELECT * FROM events ORDER BY event_date ASC').all();
  return json({ ok: true, events: rows.results });
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

  const db = context.env.DB;
  const action = String(body.action ?? '');

  if (action === 'delete') {
    const id = Number(body.id);
    if (!id) return json({ ok: false, error: 'Missing id.' }, 400);
    const existing = await db.prepare('SELECT title FROM events WHERE id = ?').bind(id).first<{ title: string }>();
    await db.prepare('DELETE FROM events WHERE id = ?').bind(id).run();
    if (existing) await logActivity(db, 'event_removed', existing.title, `Removed by ${user.email}.`);
    return json({ ok: true });
  }

  if (action === 'toggle-feature') {
    const id = Number(body.id);
    if (!id) return json({ ok: false, error: 'Missing id.' }, 400);
    await db.prepare('UPDATE events SET featured = NOT featured, updated_at = datetime(\'now\') WHERE id = ?').bind(id).run();
    return json({ ok: true });
  }

  if (action === 'create' || action === 'update') {
    const title = String(body.title ?? '').trim();
    const eventDate = String(body.eventDate ?? '').trim();
    if (!title) return json({ ok: false, error: 'Title is required.' }, 400);
    if (!/^\d{4}-\d{2}-\d{2}$/.test(eventDate)) return json({ ok: false, error: 'A valid date is required.' }, 400);

    const type = isEventType(body.type) ? body.type : 'Music';
    const eventTime = str(body.eventTime);
    const venue = str(body.venue);
    const suburb = str(body.suburb);
    const price = str(body.price) || 'Price TBC';
    const ticketUrl = str(body.ticketUrl) || '#';
    const host = str(body.host);
    const imageUrl = str(body.imageUrl);
    const description = str(body.description) ?? '';

    if (action === 'create') {
      const slug = eventSlug(title, eventDate);
      await db
        .prepare(
          `INSERT INTO events (slug, title, type, event_date, event_time, venue, suburb, price, ticket_url, host, image_url, description, source)
           VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'admin')`
        )
        .bind(slug, title, type, eventDate, eventTime, venue, suburb, price, ticketUrl, host, imageUrl, description)
        .run();
      await logActivity(db, 'event_added', title, `Added by ${user.email}.`);
      return json({ ok: true });
    }

    const id = Number(body.id);
    if (!id) return json({ ok: false, error: 'Missing id.' }, 400);
    await db
      .prepare(
        `UPDATE events SET title = ?, type = ?, event_date = ?, event_time = ?, venue = ?, suburb = ?, price = ?, ticket_url = ?, host = ?, image_url = ?, description = ?, updated_at = datetime('now')
         WHERE id = ?`
      )
      .bind(title, type, eventDate, eventTime, venue, suburb, price, ticketUrl, host, imageUrl, description, id)
      .run();
    return json({ ok: true });
  }

  return json({ ok: false, error: 'Unknown action.' }, 400);
};

function str(v: unknown): string | null {
  if (typeof v !== 'string') return null;
  const trimmed = v.trim();
  return trimmed || null;
}

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
