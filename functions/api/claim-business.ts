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
    .prepare('SELECT id, name, website, email, owner_user_id FROM businesses WHERE id = ?')
    .bind(businessId)
    .first<{ id: number; name: string; website: string | null; email: string | null; owner_user_id: number | null }>();
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

  // Ownership is proved at the BUSINESS's own email address (the one on file),
  // never the claimant's. Only when there is one on file; otherwise a person
  // reviews the claim by hand.
  const businessEmail = business.email && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(business.email.trim()) ? business.email.trim() : null;
  const verifyToken = businessEmail ? crypto.randomUUID() : null;

  const reviewToken = crypto.randomUUID();
  await db
    .prepare('INSERT INTO business_claims (business_id, user_id, document_keys, contact_name, contact_phone, contact_email, role_note, review_token, verify_token, verify_sent_to) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)')
    .bind(businessId, user.id, '[]', contactName, contactPhone, contactEmail, roleNote, reviewToken, verifyToken, businessEmail)
    .run();

  const reviewUrl = `https://${site.domain}/review-claim?token=${reviewToken}`;
  const masked = businessEmail ? maskEmail(businessEmail) : null;

  if (businessEmail && verifyToken) {
    const verifyUrl = `https://${site.domain}/verify-claim?token=${verifyToken}`;
    await sendEmail(context.env, {
      from: `${site.siteName} <${site.contactEmail}>`,
      to: businessEmail,
      subject: `Confirm the claim on "${business.name}"`,
      text: `Someone has asked to manage the listing for "${business.name}" on ${site.siteName}.

Name: ${contactName}
Role: ${role || 'Not specified'}

If this is you or someone you authorised, confirm it here:
${verifyUrl}

If you don't recognise this request, ignore this email or use the link to say it isn't yours — nothing changes until someone at this address confirms.`,
      html: `<div style="font-family:sans-serif;max-width:520px"><h2>Confirm the claim on ${escapeHtml(business.name)}</h2><p>Someone has asked to manage this listing on ${escapeHtml(site.siteName)}.</p><p>Name: <strong>${escapeHtml(contactName)}</strong><br>Role: <strong>${escapeHtml(role || 'Not specified')}</strong></p><p><a href="${verifyUrl}" style="display:inline-block;padding:12px 20px;border-radius:9px;background:#1d6fe0;color:#fff;font-weight:700;text-decoration:none">Review this claim</a></p><p style="color:#5b6478;font-size:13px">If you don't recognise this request, ignore this email. Nothing changes until someone at this address confirms.</p></div>`,
    });
  }

  // The claimant is told where the verification went — it has to be confirmed
  // from the business's own inbox, so opening it themselves is not enough.
  await sendEmail(context.env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: contactEmail,
    subject: `Your claim on "${business.name}"`,
    text: masked
      ? `Thanks, ${contactName}. We've received your claim on "${business.name}".

To prove the business is yours, we sent a verification email to the business's email address on file (${masked}). Your claim is only completed once someone confirms it from that inbox — it can't be verified from your own email address.

If you no longer have access to that inbox, reply to this email and we'll review your claim by hand.`
      : `Thanks, ${contactName}. We've received your claim on "${business.name}".

This listing has no business email address on file, so a person will review your claim and contact you. We may ask you to prove you're connected to the business.`,
  });

  await sendEmail(context.env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: site.contactEmail,
    subject: `Business claim to review: ${business.name}`,
    text: `${user.email} wants to claim "${business.name}".

Name: ${contactName}
Phone: ${contactPhone}
Email: ${contactEmail}
${parts.join('\n')}

${masked ? `A verification link was sent to the business's email on file (${masked}); the claim completes when someone confirms it there. You can still approve or reject by hand:` : 'No business email on file, so this needs a manual decision:'}
${reviewUrl}`,
  });

  return json({ ok: true, verification: masked ? 'business-email' : 'manual', sentTo: masked });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}

function maskEmail(email: string): string {
  const [local, domain] = email.split('@');
  return `${local.slice(0, 1)}${'*'.repeat(Math.max(2, Math.min(6, local.length - 1)))}@${domain}`;
}
