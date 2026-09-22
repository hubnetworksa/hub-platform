import type { PagesFunction, D1Database, R2Bucket } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { eventSlug, isEventType } from '../../_lib/events';
import { logActivity } from '../../_lib/activity-log';
import { eventFeaturePriceCents } from '../../_lib/pricing';
import { issueEventInvoice } from '../../_lib/invoicing';

interface Env {
  DB: D1Database;
  MEDIA: R2Bucket;
  SITE: string;
  RESEND_API_KEY?: string;
}

// Backs the admin "Events" tab — same shape as admin/businesses.astro and
// admin/ads-sponsors.astro: this endpoint owns D1 writes, the static site
// only picks them up on the next rebuild (see admin.astro's "Rebuild &
// deploy" button / functions/_lib/deploy-hook.ts).
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const rows = await context.env.DB.prepare('SELECT * FROM events ORDER BY event_date ASC').all();
  // Organiser submissions waiting for review (see functions/api/submit-event.ts).
  const submissions = await context.env.DB.prepare(
    `SELECT id, title, type, event_date, event_time, venue, suburb, price, ticket_url, host, image_url, description,
            contact_name, contact_email, contact_phone, submitted_by_user_id, created_at
     FROM event_submissions WHERE status = 'pending' ORDER BY created_at ASC`
  ).all();
  return json({ ok: true, events: rows.results, submissions: submissions.results });
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

  if (action === 'approve-submission' || action === 'reject-submission') {
    const id = Number(body.id);
    if (!id) return json({ ok: false, error: 'Missing id.' }, 400);
    const sub = await db
      .prepare('SELECT * FROM event_submissions WHERE id = ?')
      .bind(id)
      .first<{
        title: string;
        type: string;
        event_date: string;
        event_time: string | null;
        venue: string | null;
        suburb: string | null;
        price: string;
        ticket_url: string;
        host: string | null;
        image_url: string | null;
        description: string;
        submitted_by_user_id: number | null;
        payment_status: string | null;
        m_payment_id: string | null;
      }>();
    if (!sub) return json({ ok: false, error: 'That submission is already gone.' }, 404);

    const paid = sub.payment_status === 'paid';

    if (action === 'reject-submission') {
      await db.prepare('DELETE FROM event_submissions WHERE id = ?').bind(id).run();
      // A paid-to-feature submission that gets rejected needs a manual
      // refund via PayFast's dashboard — same documented gap as a rejected
      // paid business listing (see submit-business.ts's own comment); there
      // is no automated refund flow.
      await logActivity(
        db,
        'event_rejected',
        sub.title,
        paid ? `Submission rejected by ${user.email}. It was paid to feature (m_payment_id ${sub.m_payment_id}) — refund manually via PayFast.` : `Submission rejected by ${user.email}.`
      );
      return json({ ok: true });
    }

    // Slug is title + date; if another event already has it (same title on
    // the same day) add a numeric suffix rather than failing the approval.
    const baseSlug = eventSlug(sub.title, sub.event_date);
    let slug = baseSlug;
    for (let n = 2; await db.prepare('SELECT 1 AS x FROM events WHERE slug = ?').bind(slug).first(); n++) {
      slug = `${baseSlug}-${n}`;
    }
    const inserted = await db
      .prepare(
        `INSERT INTO events (slug, title, type, event_date, event_time, venue, suburb, price, ticket_url, host, image_url, description, source, event_owner_user_id, featured)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'organiser', ?, ?)`
      )
      .bind(slug, sub.title, isEventType(sub.type) ? sub.type : 'Music', sub.event_date, sub.event_time, sub.venue, sub.suburb, sub.price, sub.ticket_url, sub.host, sub.image_url, sub.description, sub.submitted_by_user_id ?? null, paid ? 1 : 0)
      .run();
    const eventId = inserted.meta.last_row_id as number;

    if (paid) {
      const amountCents = await eventFeaturePriceCents(db);
      const paymentInsert = await db
        .prepare(`INSERT INTO event_payments (event_id, m_payment_id, amount_cents, status, paid_at) VALUES (?, ?, ?, 'complete', datetime('now'))`)
        .bind(eventId, sub.m_payment_id, amountCents ?? 0)
        .run();
      await issueEventInvoice(context.env, paymentInsert.meta.last_row_id as number);
    }
    await db.prepare('DELETE FROM event_submissions WHERE id = ?').bind(id).run();
    await logActivity(db, 'event_approved', sub.title, `Organiser submission approved by ${user.email}.${paid ? ' Featured (paid at submission).' : ''}`);
    return json({ ok: true, slug });
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
