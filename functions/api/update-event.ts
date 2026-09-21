import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../_lib/auth';

interface Env {
  DB: D1Database;
}

function clean(v: unknown, maxLen: number): string | null {
  if (typeof v !== 'string') return null;
  const trimmed = v.trim();
  if (!trimmed) return null;
  return trimmed.slice(0, maxLen);
}

// Mirrors functions/api/update-business.ts's ownership pattern: a session is
// required, then a per-row event_owner_user_id === session.user.id check (or
// isAdminEmail bypass) gates both the read and the write.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false, error: 'Please log in first.' }, 401);

  const eventId = Number(new URL(context.request.url).searchParams.get('id'));
  if (!eventId) return json({ ok: false, error: 'Missing event.' }, 400);

  const event = await db
    .prepare(
      `SELECT id, slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host, image_url, description, featured, event_owner_user_id
       FROM events WHERE id = ?`
    )
    .bind(eventId)
    .first<{
      id: number; slug: string; title: string; type: string; event_date: string; event_time: string | null;
      venue: string | null; suburb: string | null; address: string | null; price: string; ticket_url: string;
      host: string | null; image_url: string | null; description: string; featured: number; event_owner_user_id: number | null;
    }>();
  if (!event || (event.event_owner_user_id !== user.id && !isAdminEmail(user.email))) {
    return json({ ok: false, error: 'You do not manage this event.' }, 403);
  }

  const payments = await db
    .prepare('SELECT id, amount_cents, status, paid_at FROM event_payments WHERE event_id = ? ORDER BY id DESC LIMIT 24')
    .bind(eventId)
    .all<{ id: number; amount_cents: number; status: string; paid_at: string | null }>();

  return json({ ok: true, event, payments: payments.results });
};

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false, error: 'Please log in first.' }, 401);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  const eventId = Number(body.eventId);
  if (!eventId) return json({ ok: false, error: 'Missing event.' }, 400);

  const event = await db.prepare('SELECT event_owner_user_id FROM events WHERE id = ?').bind(eventId).first<{ event_owner_user_id: number | null }>();
  if (!event || (event.event_owner_user_id !== user.id && !isAdminEmail(user.email))) {
    return json({ ok: false, error: 'You do not manage this event.' }, 403);
  }

  const venue = clean(body.venue, 120);
  const suburb = clean(body.suburb, 80);
  const address = clean(body.address, 200);
  const price = clean(body.price, 60) ?? 'Price TBC';
  const ticketUrl = clean(body.ticketUrl, 300) ?? '#';
  const host = clean(body.host, 80);
  const eventTime = clean(body.eventTime, 60);
  const description = clean(body.description, 600) ?? '';

  await db
    .prepare(
      `UPDATE events SET venue = ?, suburb = ?, address = ?, price = ?, ticket_url = ?, host = ?, event_time = ?, description = ?, updated_at = datetime('now')
       WHERE id = ?`
    )
    .bind(venue, suburb, address, price, ticketUrl, host, eventTime, description, eventId)
    .run();

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
