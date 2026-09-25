import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSite } from '../_lib/site';
import { rateLimited } from '../_lib/messages';
import { getSessionUser } from '../_lib/auth';
import { isEventType, isHttpUrl } from '../_lib/events';
import { sendEmail } from '../_lib/send-email';
import { escapeHtml } from '../../src/lib/business-submission';
import { signFields, buildCheckoutParams, payfastConfigured, type PayfastEnv } from '../_lib/payfast';
import { eventFeaturePriceCents, centsToRand } from '../_lib/pricing';

interface Env extends PayfastEnv {
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

function isRealDate(v: string): boolean {
  if (!/^\d{4}-\d{2}-\d{2}$/.test(v)) return false;
  const [y, m, d] = v.split('-').map(Number);
  const dt = new Date(Date.UTC(y, m - 1, d));
  return dt.getUTCFullYear() === y && dt.getUTCMonth() === m - 1 && dt.getUTCDate() === d;
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const db = context.env.DB;

  // Unlike a business listing, an account is required to submit an event —
  // organisers need somewhere to end up owning it once it's approved (see
  // /my-events/), and featuring it always needs a real payer identity. The
  // page gates on this too (see src/pages/events/add.astro), but that's a
  // UX nicety, not the enforcement — this check is what actually matters.
  const sessionUser = await getSessionUser(context.request, db);
  if (!sessionUser) return json({ ok: false, error: 'Please log in first.' }, 401);

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
  // Must be one of our own uploads (see /api/submit-event-image), never an
  // arbitrary external link — organisers upload the poster, they don't paste
  // a URL to it (a pasted link can 404 or get replaced later; an upload is a
  // real copy we keep).
  const imageUrl = fields.imageUrl;
  if (imageUrl && !/^\/media\/event-submissions\/[a-zA-Z0-9-]+\.(jpg|png|webp)$/.test(imageUrl)) {
    return json({ ok: false, error: 'Please upload a poster image using the upload button, not a pasted link.' }, 400);
  }

  const contactEmail = fields.contactEmail;
  if (contactEmail && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(contactEmail)) {
    return json({ ok: false, error: 'That email address doesn\'t look right.' }, 400);
  }

  const pending = await db.prepare(`SELECT COUNT(*) AS n FROM event_submissions WHERE status = 'pending'`).first<{ n: number }>();
  if ((pending?.n ?? 0) >= MAX_PENDING) {
    return json({ ok: false, error: 'We have a backlog of events to review right now — please try again in a few days.' }, 503);
  }

  const wantsFeature = String(body.wantsFeature ?? '') === 'true' || String(body.wantsFeature ?? '') === 'on';

  // A double-submit (back button, second tab, retrying after an abandoned
  // PayFast redirect) shouldn't leave the admin two identical rows to
  // review — this account's own pending row for the same title and date is
  // updated in place instead.
  const duplicate = await db
    .prepare(
      `SELECT id, m_payment_id, payment_status FROM event_submissions
       WHERE status = 'pending' AND submitted_by_user_id = ? AND title = ? AND event_date = ?`
    )
    .bind(sessionUser.id, title, eventDate)
    .first<{ id: number; m_payment_id: string | null; payment_status: string | null }>();

  const values = [
    type,
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
    wantsFeature ? 1 : 0,
  ];

  let submissionId: number;
  if (duplicate) {
    await db
      .prepare(
        `UPDATE event_submissions
         SET type = ?, event_time = ?, venue = ?, suburb = ?, price = ?, ticket_url = ?, host = ?, image_url = ?,
             description = ?, contact_name = ?, contact_email = ?, contact_phone = ?, wants_feature = ?
         WHERE id = ?`
      )
      .bind(...values, duplicate.id)
      .run();
    submissionId = duplicate.id;
  } else {
    const token = crypto.randomUUID();
    const insert = await db
      .prepare(
        `INSERT INTO event_submissions
          (token, title, event_date, submitted_by_user_id, type, event_time, venue, suburb, price, ticket_url, host, image_url, description,
           contact_name, contact_email, contact_phone, wants_feature)
         VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`
      )
      .bind(token, title, eventDate, sessionUser?.id ?? null, ...values)
      .run();
    submissionId = insert.meta.last_row_id as number;
  }

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
    subject: duplicate ? `Event resubmitted (details updated): ${title}` : `New event to review: ${title}`,
    replyTo: contactEmail ?? sessionUser?.email ?? undefined,
    text: `A new event was submitted on ${site.siteName}.\n\n${details.join('\n')}\n\nReview & approve: ${reviewUrl}`,
    html: `<div style="font-family:sans-serif;max-width:520px">
      <h2>New event to review</h2>
      <p>${details.map((d) => escapeHtml(d)).join('<br>')}</p>
      <p><a href="${reviewUrl}">Review &amp; approve</a></p></div>`,
  });

  // No feature requested — nothing more to do.
  if (!wantsFeature || !payfastConfigured(context.env)) {
    return json({ ok: true, reviewUrl });
  }
  // Already paid on an earlier attempt — never send them to pay twice.
  if (duplicate?.payment_status === 'paid') {
    return json({ ok: true, reviewUrl, alreadyPaid: true });
  }

  // Featuring at submission time: a real PayFast checkout right here,
  // mirroring submit-business.ts's inline checkout for a chosen tier —
  // there's no `events` row (and so nothing for events/feature-start.ts to
  // authorize against) yet. Once-off, not a subscription (an event has a
  // fixed date, nothing to recur). The feature is actually applied when the
  // submission is approved — see admin/events.ts's approve-submission,
  // which reads payment_status and sets `featured` on the new events row —
  // via the "event-submission:<id>" branch of subscribe/notify.ts.
  const priceCents = await eventFeaturePriceCents(db);
  if (!priceCents) return json({ ok: true, reviewUrl });

  const amount = centsToRand(priceCents);
  // Reusing an unfinished checkout's id means a late ITN from the first
  // attempt still matches this row instead of being rejected as unknown.
  const mPaymentId = (duplicate?.payment_status === 'pending' && duplicate.m_payment_id) || crypto.randomUUID();
  // amount_cents is stored with the checkout so approval invoices what was
  // actually charged, not whatever the price happens to be that day (see
  // admin/events.ts's approve-submission).
  await db
    .prepare(`UPDATE event_submissions SET m_payment_id = ?, payment_status = 'pending', amount_cents = ? WHERE id = ?`)
    .bind(mPaymentId, priceCents, submissionId)
    .run();

  const origin = new URL(context.request.url).origin;
  const payerEmail = contactEmail ?? sessionUser?.email ?? site.contactEmail;
  const fields2: Record<string, string> = {
    merchant_id: context.env.PAYFAST_MERCHANT_ID!,
    merchant_key: context.env.PAYFAST_MERCHANT_KEY!,
    // Origin-based, like feature-start.ts — a preview deploy's payer has to
    // come back to the preview, not to the live domain.
    return_url: `${origin}/events/add/?event_featured=1`,
    cancel_url: `${origin}/events/add/?event_feature_cancelled=1`,
    notify_url: `${origin}/api/subscribe/notify`,
    name_first: fields.contactName ?? title,
    email_address: payerEmail,
    m_payment_id: mPaymentId,
    amount,
    item_name: `${site.siteName} — Featured event`,
    item_description: `Feature "${title}" on ${site.siteName} (applies once your event is approved)`,
    custom_str1: `event-submission:${submissionId}`,
    custom_str2: 'event_feature',
  };
  const signature = await signFields(fields2, context.env.PAYFAST_PASSPHRASE!);
  const params = buildCheckoutParams(fields2, signature);
  const redirectUrl = `https://${context.env.PAYFAST_HOST}/eng/process?${params.toString()}`;

  return json({ ok: true, reviewUrl, redirectUrl });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
