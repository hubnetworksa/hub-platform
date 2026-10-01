import type { PagesFunction, D1Database, R2Bucket } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { eventSlug, isEventType, isHttpUrl, isAllowedImageUrl } from '../../_lib/events';
import { requestRebuild } from '../../_lib/deploy-hook';
import { sendEmail } from '../../_lib/send-email';
import { getSite } from '../../_lib/site';
import { logActivity } from '../../_lib/activity-log';
import { eventFeaturePriceCents } from '../../_lib/pricing';
import { issueEventInvoice } from '../../_lib/invoicing';

interface Env {
  DB: D1Database;
  MEDIA: R2Bucket;
  SITE: string;
  RESEND_API_KEY?: string;
  GITHUB_DISPATCH_TOKEN?: string;
}

// Posters uploaded through submit-event-image.ts live in our own bucket; a
// rejected submission's poster is deleted rather than left public forever.
async function deleteUploadedPoster(media: R2Bucket, imageUrl: string | null): Promise<void> {
  const m = imageUrl?.match(/^\/media\/(event-submissions\/[A-Za-z0-9-]+\.(?:jpg|png|webp))$/);
  if (m) await media.delete(m[1]).catch(() => undefined);
}

async function uniqueEventSlug(db: D1Database, title: string, date: string): Promise<string> {
  const base = eventSlug(title, date);
  let slug = base;
  for (let n = 2; await db.prepare('SELECT 1 AS x FROM events WHERE slug = ?').bind(slug).first(); n++) slug = `${base}-${n}`;
  return slug;
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
            contact_name, contact_email, contact_phone, submitted_by_user_id, wants_feature, payment_status, amount_cents, created_at
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
    await requestRebuild(context.env, 'event removed');
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
        amount_cents: number | null;
        contact_email: string | null;
      }>();
    if (!sub) return json({ ok: false, error: 'That submission is already gone.' }, 404);

    const paid = sub.payment_status === 'paid';

    if (action === 'reject-submission') {
      await db.prepare('DELETE FROM event_submissions WHERE id = ?').bind(id).run();
      await deleteUploadedPoster(context.env.MEDIA, sub.image_url);
      // A paid-to-feature submission that gets rejected needs a manual
      // refund via PayFast's dashboard (there's no refund API for this
      // merchant type), so the site inbox gets a to-do, not just a log line.
      if (paid) {
        const site = getSite(context.env.SITE);
        await sendEmail(context.env, {
          from: `${site.siteName} <${site.contactEmail}>`,
          to: site.contactEmail,
          subject: `Refund needed: rejected event "${sub.title}"`,
          text: [
            `The event "${sub.title}" (${sub.event_date}) was paid to feature but has been rejected by ${user.email}.`,
            '',
            `Amount: R${((sub.amount_cents ?? 0) / 100).toFixed(2)}`,
            `m_payment_id: ${sub.m_payment_id ?? 'unknown'}`,
            `Organiser email: ${sub.contact_email ?? 'none on file'}`,
            '',
            'Refund it from the PayFast merchant dashboard.',
          ].join('\n'),
        });
      }
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
    const slug = await uniqueEventSlug(db, sub.title, sub.event_date);
    const inserted = await db
      .prepare(
        `INSERT INTO events (slug, title, type, event_date, event_time, venue, suburb, price, ticket_url, host, image_url, description, source, event_owner_user_id, featured)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'organiser', ?, ?)`
      )
      .bind(slug, sub.title, isEventType(sub.type) ? sub.type : 'Music', sub.event_date, sub.event_time, sub.venue, sub.suburb, sub.price, sub.ticket_url, sub.host, sub.image_url, sub.description, sub.submitted_by_user_id ?? null, paid ? 1 : 0)
      .run();
    const eventId = inserted.meta.last_row_id as number;

    if (paid) {
      // What was actually charged at checkout, not today's rate card.
      const amountCents = sub.amount_cents ?? (await eventFeaturePriceCents(db));
      const paymentInsert = await db
        .prepare(`INSERT INTO event_payments (event_id, m_payment_id, amount_cents, status, paid_at) VALUES (?, ?, ?, 'complete', datetime('now'))`)
        .bind(eventId, sub.m_payment_id, amountCents ?? 0)
        .run();
      await issueEventInvoice(context.env, paymentInsert.meta.last_row_id as number);
    }
    await db.prepare('DELETE FROM event_submissions WHERE id = ?').bind(id).run();
    await logActivity(db, 'event_approved', sub.title, `Organiser submission approved by ${user.email}.${paid ? ' Featured (paid at submission).' : ''}`);
    await requestRebuild(context.env, 'event approved');
    return json({ ok: true, slug });
  }

  if (action === 'toggle-feature') {
    const id = Number(body.id);
    if (!id) return json({ ok: false, error: 'Missing id.' }, 400);
    // Un-featuring an event the organiser paid to feature is almost always a
    // mis-click; the admin page has to confirm it explicitly (force).
    const ev = await db.prepare('SELECT featured FROM events WHERE id = ?').bind(id).first<{ featured: number }>();
    if (!ev) return json({ ok: false, error: 'Event not found.' }, 404);
    if (ev.featured && !body.force) {
      const paidFeature = await db.prepare(`SELECT 1 FROM event_payments WHERE event_id = ? AND status = 'complete'`).bind(id).first();
      if (paidFeature) return json({ ok: false, needsForce: true, error: 'The organiser paid to feature this event. Un-feature it anyway?' }, 409);
    }
    await db.prepare(`UPDATE events SET featured = NOT featured, updated_at = datetime('now') WHERE id = ?`).bind(id).run();
    await requestRebuild(context.env, 'event feature toggled');
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
    if (ticketUrl !== '#' && !isHttpUrl(ticketUrl)) return json({ ok: false, error: 'The ticket link must start with https://.' }, 400);
    const host = str(body.host);
    const imageUrl = str(body.imageUrl);
    if (imageUrl && !isAllowedImageUrl(imageUrl)) return json({ ok: false, error: 'The image must be an https:// link or an uploaded poster.' }, 400);
    const description = str(body.description) ?? '';

    if (action === 'create') {
      const slug = await uniqueEventSlug(db, title, eventDate);
      await db
        .prepare(
          `INSERT INTO events (slug, title, type, event_date, event_time, venue, suburb, price, ticket_url, host, image_url, description, source)
           VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'admin')`
        )
        .bind(slug, title, type, eventDate, eventTime, venue, suburb, price, ticketUrl, host, imageUrl, description)
        .run();
      await logActivity(db, 'event_added', title, `Added by ${user.email}.`);
      await requestRebuild(context.env, 'event added');
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
    await requestRebuild(context.env, 'event updated');
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
