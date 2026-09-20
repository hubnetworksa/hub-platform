import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser } from '../_lib/auth';
import { sendEmail } from '../_lib/send-email';
import { getSite } from '../_lib/site';
import { rateLimited } from '../_lib/messages';

interface Env {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
}

interface ClaimDetails {
  address?: string;
  postalCode?: string;
  centre?: string;
  website?: string;
  hours?: string;
}

interface ClaimBody {
  businessId?: number;
  contactName?: string;
  contactPhone?: string;
  contactEmail?: string;
  roleNote?: string;
  verifyMethod?: string;
  confirmed?: boolean;
  note?: string;
  details?: ClaimDetails;
}

// How the claimant wants to be verified. There is no SMS/OTP, phone-call or
// document-upload infrastructure: every claim is reviewed by a person, so
// "email" and "phone" only tell the reviewer HOW to verify (compare the email
// domain / call the number on file). Document upload is not available.
const VERIFY_LABELS: Record<string, string> = {
  email: 'Work email (reviewer checks the email domain against the business)',
  phone: 'Phone call (reviewer calls the number on file)',
};

// Free text ends up in the admin claims page and the review email, so keep it
// single-line and free of markup characters.
function clean(v: unknown, max: number): string {
  return String(v ?? '')
    .replace(/[<>]/g, '')
    .replace(/\s+/g, ' ')
    .trim()
    .slice(0, max);
}

function domainOf(value: string): string {
  const v = value.trim().toLowerCase();
  if (v.includes('@')) return v.split('@').pop() ?? '';
  return v.replace(/^https?:\/\//, '').replace(/^www\./, '').split(/[/?#]/)[0];
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false, error: 'Please log in first.' }, 401);
  if (await rateLimited(db, context.request, site.slug, 'claim-business', 5)) {
    return json({ ok: false, error: 'Too many submissions from your connection. Please try again in an hour.' }, 429);
  }

  let body: ClaimBody;
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
  const role = clean(body.roleNote, 60);
  if (!contactName) return json({ ok: false, error: 'Please enter your name.' }, 400);
  if (!contactPhone) return json({ ok: false, error: 'Please enter a phone number.' }, 400);
  if (!contactEmail || !contactEmail.includes('@')) return json({ ok: false, error: 'Please enter a valid email address.' }, 400);

  const verifyMethod = clean(body.verifyMethod, 20);
  if (verifyMethod === 'docs') {
    return json({ ok: false, error: "Document upload isn't available yet. Please choose work email or a phone call." }, 400);
  }
  // `confirmed` is only sent by the current claim form; older clients omit it.
  if (body.confirmed === false) {
    return json({ ok: false, error: 'Please confirm you are authorised to manage this business.' }, 400);
  }

  const business = await db
    .prepare('SELECT id, name, website, owner_user_id FROM businesses WHERE id = ?')
    .bind(businessId)
    .first<{ id: number; name: string; website: string | null; owner_user_id: number | null }>();
  if (!business) return json({ ok: false, error: 'Business not found.' }, 404);
  if (business.owner_user_id) return json({ ok: false, error: 'This business has already been claimed.' }, 400);

  const existingClaim = await db.prepare("SELECT 1 FROM business_claims WHERE business_id = ? AND status = 'pending'").bind(businessId).first();
  if (existingClaim) return json({ ok: false, error: 'A claim on this business is already pending review.' }, 400);

  // The business_claims table has no columns for the verification method or
  // for detail changes the claimant proposed, so they are written into the
  // free-text role_note as a readable single line (" | " separated). The admin
  // review page and email show it as-is.
  const parts: string[] = [];
  parts.push(`Role: ${role || 'Not specified'}`);
  if (VERIFY_LABELS[verifyMethod]) parts.push(`Verify by: ${VERIFY_LABELS[verifyMethod]}`);
  const emailDomain = domainOf(contactEmail);
  const siteDomain = business.website ? domainOf(business.website) : '';
  if (verifyMethod === 'email' && siteDomain) {
    const matches = emailDomain === siteDomain || emailDomain.endsWith(`.${siteDomain}`);
    parts.push(`Email domain ${matches ? 'matches' : 'does NOT match'} the business website (${siteDomain})`);
  }
  const d = body.details ?? {};
  const proposed: string[] = [];
  const address = clean(d.address, 200);
  const postalCode = clean(d.postalCode, 12);
  const centre = clean(d.centre, 120);
  const website = clean(d.website, 200);
  const hours = clean(d.hours, 300);
  if (address) proposed.push(`Address: ${address}`);
  if (postalCode) proposed.push(`Postal code: ${postalCode}`);
  if (centre) proposed.push(`Shopping centre: ${centre}`);
  if (website) proposed.push(`Website: ${website}`);
  if (hours) proposed.push(`Hours: ${hours}`);
  if (proposed.length) parts.push(`Proposed details (not applied automatically): ${proposed.join('; ')}`);
  const note = clean(body.note, 400);
  if (note) parts.push(`Note: ${note}`);
  const roleNote = parts.join(' | ').slice(0, 1400);

  const reviewToken = crypto.randomUUID();
  await db
    .prepare('INSERT INTO business_claims (business_id, user_id, document_keys, contact_name, contact_phone, contact_email, role_note, review_token) VALUES (?, ?, ?, ?, ?, ?, ?, ?)')
    .bind(businessId, user.id, '[]', contactName, contactPhone, contactEmail, roleNote, reviewToken)
    .run();

  const reviewUrl = `https://${site.domain}/review-claim?token=${reviewToken}`;

  await sendEmail(context.env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: site.contactEmail,
    subject: `Business claim to review: ${business.name}`,
    text: `${user.email} wants to claim "${business.name}".\n\nName: ${contactName}\nPhone: ${contactPhone}\nEmail: ${contactEmail}\n${parts.join('\n')}\n\nReview and approve/reject here: ${reviewUrl}`,
  });

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
