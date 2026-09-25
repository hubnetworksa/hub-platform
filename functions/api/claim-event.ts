import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser } from '../_lib/auth';
import { sendEmail } from '../_lib/send-email';
import { getSite } from '../_lib/site';
import { rateLimited } from '../_lib/messages';
import { escapeHtml } from '../../src/lib/business-submission';

interface Env {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
}

// Mirrors functions/api/claim-business.ts, simplified: events carry no
// verified contact email once published, so there's no self-serve
// "confirm from the business's own inbox" path — every claim goes to a
// person via functions/api/review-event-claim.ts.
function clean(v: unknown, max: number): string {
  return String(v ?? '')
    .replace(/[<>]/g, '')
    .replace(/\s+/g, ' ')
    .trim()
    .slice(0, max);
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false, error: 'Please log in first.' }, 401);
  if (await rateLimited(db, context.request, site.slug, 'claim-event', 5)) {
    return json({ ok: false, error: 'Too many submissions from your connection. Please try again in an hour.' }, 429);
  }

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid submission.' }, 400);
  }

  const eventId = Number(body.eventId);
  if (!eventId) return json({ ok: false, error: 'Choose an event to claim.' }, 400);

  const contactName = String(body.contactName ?? '').trim();
  const contactPhone = String(body.contactPhone ?? '').trim();
  const contactEmail = String(body.contactEmail ?? '').trim();
  const role = clean(body.roleNote, 60);
  if (!contactName) return json({ ok: false, error: 'Please enter your name.' }, 400);
  if (!contactPhone) return json({ ok: false, error: 'Please enter a phone number.' }, 400);
  if (!contactEmail || !contactEmail.includes('@')) return json({ ok: false, error: 'Please enter a valid email address.' }, 400);
  // Must be an explicit yes: a request that simply omits the field (any
  // script, not our form) used to pass as confirmed.
  if (body.confirmed !== true && body.confirmed !== 'true' && body.confirmed !== 'on') {
    return json({ ok: false, error: 'Please confirm you are authorised to manage this event.' }, 400);
  }

  const event = await db
    .prepare('SELECT id, title, event_owner_user_id FROM events WHERE id = ?')
    .bind(eventId)
    .first<{ id: number; title: string; event_owner_user_id: number | null }>();
  if (!event) return json({ ok: false, error: 'Event not found.' }, 404);
  if (event.event_owner_user_id) return json({ ok: false, error: 'This event has already been claimed.' }, 400);

  const existingClaim = await db.prepare("SELECT 1 FROM event_claims WHERE event_id = ? AND status = 'pending'").bind(eventId).first();
  if (existingClaim) return json({ ok: false, error: 'A claim on this event is already pending review.' }, 400);

  const note = clean(body.note, 400);
  const roleNote = [`Role: ${role || 'Not specified'}`, note ? `Note: ${note}` : ''].filter(Boolean).join(' | ').slice(0, 1400);

  const reviewToken = crypto.randomUUID();
  await db
    .prepare('INSERT INTO event_claims (event_id, user_id, contact_name, contact_phone, contact_email, role_note, review_token) VALUES (?, ?, ?, ?, ?, ?, ?)')
    .bind(eventId, user.id, contactName, contactPhone, contactEmail, roleNote, reviewToken)
    .run();

  const reviewUrl = `https://${site.domain}/review-event-claim?token=${reviewToken}`;

  await sendEmail(context.env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: contactEmail,
    subject: `Your claim on "${event.title}"`,
    text: `Thanks, ${contactName}. We've received your claim on "${event.title}".\n\nA person will review your claim and contact you. We may ask you to prove you're connected to this event.`,
  });

  await sendEmail(context.env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: site.contactEmail,
    subject: `Event claim to review: ${event.title}`,
    text: `${user.email} wants to claim "${event.title}".\n\nName: ${contactName}\nPhone: ${contactPhone}\nEmail: ${contactEmail}\n${roleNote}\n\nReview:\n${reviewUrl}`,
    html: `<div style="font-family:sans-serif;max-width:520px"><h2>Event claim to review</h2><p>${escapeHtml(user.email)} wants to claim "${escapeHtml(event.title)}".</p><p>Name: ${escapeHtml(contactName)}<br>Phone: ${escapeHtml(contactPhone)}<br>Email: ${escapeHtml(contactEmail)}</p><p>${escapeHtml(roleNote)}</p><p><a href="${reviewUrl}">Review this claim</a></p></div>`,
  });

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
