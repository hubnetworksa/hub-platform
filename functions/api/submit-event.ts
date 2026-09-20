import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSite } from '../_lib/site';
import { rateLimited } from '../_lib/messages';
import { getSessionUser } from '../_lib/auth';
import { isEventType } from '../_lib/events';
import { sendEmail } from '../_lib/send-email';
import { escapeHtml } from '../../src/lib/business-submission';

interface Env {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
}

// Organiser-submitted events (the "List your event free" form at
// /events/add/). Nothing is published here: the row lands in
// event_submissions and only becomes a real `events` row once an admin
// approves it on the admin Events page (functions/api/admin/events.ts).
//
// Same anti-abuse pattern as submit-business.ts — honeypot, minimum
// time-on-form, length caps and raw-tag rejection are the first filter
// before a human ever sees it. The admin is emailed by this function once the
// submission is saved (best-effort — the saved row is what matters); the
// visitor's own mail app is never used.

const MAX_LEN: Record<string, number> = {
  title: 120,
  type: 30,
  eventDate: 10,
  eventTime: 60,
  venue: 120,
  suburb: 80,
  price: 60,
  host: 80,
  ticketUrl: 300,
  imageUrl: 300,
  description: 600,
  contactName: 80,
  contactEmail: 120,
  contactPhone: 30,
};

// Cap on unreviewed submissions so a flood can't grow the table forever.
const MAX_PENDING = 300;

type Cleaned = { ok: true; value: string | null } | { ok: false };

// Empty -> ok/null; too long or tag-like -> not ok (caller rejects).
function clean(v: unknown, field: string): Cleaned {
  if (v === undefined || v === null) return { ok: true, value: null };
  if (typeof v !== 'string') return { ok: false };
  const trimmed = v.trim();
  if (!trimmed) return { ok: true, value: null };
  if (trimmed.length > (MAX_LEN[field] ?? 200)) return { ok: false };
  if (/<[a-z\/!]/i.test(trimmed)) return { ok: false };
  return { ok: true, value: trimmed };
}

function isHttpUrl(v: string): boolean {
  try {
    const u = new URL(v);
    return u.protocol === 'http:' || u.protocol === 'https:';
  } catch {
    return false;
  }
}

function isRealDate(v: string): boolean {
  if (!/^\d{4}-\d{2}-\d{2}$/.test(v)) return false;
  const [y, m, d] = v.split('-').map(Number);
  const dt = new Date(Date.UTC(y, m - 1, d));
  return dt.getUTCFullYear() === y && dt.getUTCMonth() === m - 1 && dt.getUTCDate() === d;
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  // Honeypot — real users never fill this in, bots filling every field do.
  if (typeof body.company_url === 'string' && body.company_url.trim() !== '') {
    return json({ ok: false, error: 'Submission rejected.' }, 400);
  }
  // Minimum time-on-form — catches scripted instant-submits.
  const loadedAt = Number(body.loadedAt);
  if (!loadedAt || Date.now() - loadedAt < 3000) {
    return json({ ok: false, error: 'Submission rejected.' }, 400);
  }
  if (await rateLimited(context.env.DB, context.request, site.slug, 'submit-event', 5)) {
    return json({ ok: false, error: 'Too many submissions from your connection. Please try again in an hour.' }, 429);
  }

  const fields: Record<string, string | null> = {};
  for (const f of Object.keys(MAX_LEN)) {
    const c = clean(body[f], f);
    if (!c.ok) return json({ ok: false, error: 'Some of your answers were too long or contained unsupported characters.' }, 400);
    fields[f] = c.value;
  }

  const title = fields.title;
  const eventDate = fields.eventDate;
  const venue = fields.venue;
  if (!title || title.length < 3) return json({ ok: false, error: 'Please give your event a title.' }, 400);
  if (!eventDate || !isRealDate(eventDate)) return json({ ok: false, error: 'Please choose the date of the event.' }, 400);
  if (eventDate < new Date().toISOString().slice(0, 10)) {
    return json({ ok: false, error: 'The date has already passed — events need a fixed date in the future.' }, 400);
  }
  if (!venue) return json({ ok: false, error: 'Please add the venue — events with no fixed venue are rejected.' }, 400);

  const type = isEventType(fields.type) ? fields.type : 'Music';

  const ticketUrl = fields.ticketUrl;
  if (ticketUrl && !isHttpUrl(ticketUrl)) return json({ ok: false, error: 'The ticket URL should start with https://.' }, 400);
  const imageUrl = fields.imageUrl;
  if (imageUrl && !isHttpUrl(imageUrl)) return json({ ok: false, error: 'The poster link should be a full https:// address.' }, 400);

  const contactEmail = fields.contactEmail;
  if (contactEmail && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(contactEmail)) {
    return json({ ok: false, error: 'That email address doesn\'t look right.' }, 400);
  }

  const db = context.env.DB;

  const pending = await db.prepare(`SELECT COUNT(*) AS n FROM event_submissions WHERE status = 'pending'`).first<{ n: number }>();
  if ((pending?.n ?? 0) >= MAX_PENDING) {
    return json({ ok: false, error: 'We have a backlog of events to review right now — please try again in a few days.' }, 503);
  }

  // Not required (anonymous submission is allowed), but when the organiser
  // is signed in we keep the link and fall back to their account email.
  const sessionUser = await getSessionUser(context.request, db);

  const token = crypto.randomUUID();
  await db
    .prepare(
      `INSERT INTO event_submissions
        (token, title, type, event_date, event_time, venue, suburb, price, ticket_url, host, image_url, description,
         contact_name, contact_email, contact_phone, submitted_by_user_id)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`
    )
    .bind(
      token,
      title,
      type,
      eventDate,
      fields.eventTime,
      venue,
      fields.suburb,
      fields.price || 'Price TBC',
      ticketUrl || '#',
      fields.host,
      imageUrl,
      fields.description ?? '',
      fields.contactName,
      contactEmail ?? sessionUser?.email ?? null,
      fields.contactPhone,
      sessionUser?.id ?? null
    )
    .run();

  const reviewUrl = `https://${site.domain}/admin/events/`;
  const details = [
    `Title: ${title}`,
    `Type: ${type}`,
    `Date: ${eventDate}${fields.eventTime ? ' ' + fields.eventTime : ''}`,
    `Venue: ${venue}${fields.suburb ? ', ' + fields.suburb : ''}`,
    ...(fields.price ? [`Price: ${fields.price}`] : []),
    ...(fields.host ? [`Seller: ${fields.host}`] : []),
    ...(ticketUrl ? [`Ticket URL: ${ticketUrl}`] : []),
    ...(imageUrl ? [`Poster: ${imageUrl}`] : []),
    ...(fields.description ? [`Description: ${fields.description}`] : []),
    ...(fields.contactName ? [`Contact: ${fields.contactName}`] : []),
    ...((contactEmail ?? sessionUser?.email) ? [`Contact email: ${contactEmail ?? sessionUser?.email}`] : []),
    ...(fields.contactPhone ? [`Contact phone: ${fields.contactPhone}`] : []),
  ];
  await sendEmail(context.env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: site.contactEmail,
    subject: `New event to review: ${title}`,
    replyTo: contactEmail ?? sessionUser?.email ?? undefined,
    text: `A new event was submitted on ${site.siteName}.\n\n${details.join('\n')}\n\nReview & approve: ${reviewUrl}`,
    html: `<div style="font-family:sans-serif;max-width:520px">
      <h2>New event to review</h2>
      <p>${details.map((d) => escapeHtml(d)).join('<br>')}</p>
      <p><a href="${reviewUrl}">Review &amp; approve</a></p></div>`,
  });
  return json({ ok: true, reviewUrl });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
