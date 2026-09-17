import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser } from '../_lib/auth';
import { sendEmail } from '../_lib/send-email';
import { getSite } from '../_lib/site';

interface Env {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false, error: 'Please log in first.' }, 401);

  let body: { businessId?: number; contactName?: string; contactPhone?: string; contactEmail?: string; roleNote?: string };
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid submission.' }, 400);
  }

  const businessId = Number(body.businessId);
  if (!businessId) return json({ ok: false, error: 'Choose a business to claim.' }, 400);

  const contactName = String(body.contactName ?? '').trim();
  const contactPhone = String(body.contactPhone ?? '').trim();
  const contactEmail = String(body.contactEmail ?? '').trim();
  const roleNote = String(body.roleNote ?? '').trim();
  if (!contactName) return json({ ok: false, error: 'Please enter your name.' }, 400);
  if (!contactPhone) return json({ ok: false, error: 'Please enter a phone number.' }, 400);
  if (!contactEmail || !contactEmail.includes('@')) return json({ ok: false, error: 'Please enter a valid email address.' }, 400);

  const business = await db.prepare('SELECT id, name, owner_user_id FROM businesses WHERE id = ?').bind(businessId).first<{ id: number; name: string; owner_user_id: number | null }>();
  if (!business) return json({ ok: false, error: 'Business not found.' }, 404);
  if (business.owner_user_id) return json({ ok: false, error: 'This business has already been claimed.' }, 400);

  const existingClaim = await db.prepare("SELECT 1 FROM business_claims WHERE business_id = ? AND status = 'pending'").bind(businessId).first();
  if (existingClaim) return json({ ok: false, error: 'A claim on this business is already pending review.' }, 400);

  const reviewToken = crypto.randomUUID();
  await db
    .prepare('INSERT INTO business_claims (business_id, user_id, document_keys, contact_name, contact_phone, contact_email, role_note, review_token) VALUES (?, ?, ?, ?, ?, ?, ?, ?)')
    .bind(businessId, user.id, '[]', contactName, contactPhone, contactEmail, roleNote || null, reviewToken)
    .run();

  const reviewUrl = `https://${site.domain}/review-claim?token=${reviewToken}`;

  await sendEmail(context.env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: site.contactEmail,
    subject: `Business claim to review: ${business.name}`,
    text: `${user.email} wants to claim "${business.name}".\n\nName: ${contactName}\nPhone: ${contactPhone}\nEmail: ${contactEmail}\nRole: ${roleNote || 'Not specified'}\n\nReview and approve/reject here: ${reviewUrl}`,
  });

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
