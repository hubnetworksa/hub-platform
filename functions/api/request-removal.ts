import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { escapeHtml } from '../../src/lib/business-submission';
import { getSite } from '../_lib/site';
import { sendEmail } from '../_lib/send-email';

interface Env {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
}

// POPIA (and general correction) removal requests — same "human-handled,
// tracked-not-automated" design as report-listing.ts, deliberately: actually
// deleting a business is consequential and this endpoint has no way to
// verify the requester is who they say they are, so it's a prompt for a
// human to review and action (via the admin dashboard's Reports panel /
// admin/delete-business.ts), not a self-service delete.

function clean(v: unknown, maxLen: number): string | null {
  if (typeof v !== 'string') return null;
  const trimmed = v.trim();
  if (!trimmed) return null;
  if (trimmed.length > maxLen) return null;
  if (/<[a-z]/i.test(trimmed)) return null;
  return trimmed;
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  // Honeypot — real users never fill this in.
  if (typeof body.company_url === 'string' && body.company_url.trim() !== '') {
    return json({ ok: false, error: 'Submission rejected.' }, 400);
  }
  // Minimum time-on-form — catches scripted instant-submits.
  const loadedAt = Number(body.loadedAt);
  if (!loadedAt || Date.now() - loadedAt < 2000) {
    return json({ ok: false, error: 'Submission rejected.' }, 400);
  }

  const businessSlug = clean(body.businessSlug, 120);
  const businessName = clean(body.businessName, 120);
  const reason = clean(body.reason, 1000);
  const relationship = clean(body.relationship, 200);
  const requesterEmail = clean(body.requesterEmail, 120);

  if (!businessSlug || !businessName || !reason || reason.length < 5) {
    return json({ ok: false, error: 'Please tell us why this listing should be removed.' }, 400);
  }
  if (!requesterEmail || !requesterEmail.includes('@')) {
    return json({ ok: false, error: 'An email address is required so we can confirm the removal with you.' }, 400);
  }

  const businessUrl = `https://${site.domain}/business/${businessSlug}/`;

  await context.env.DB
    .prepare('INSERT INTO reports (kind, business_slug, business_name, reason, relationship, requester_email) VALUES (?, ?, ?, ?, ?, ?)')
    .bind('removal', businessSlug, businessName, reason, relationship, requesterEmail)
    .run();

  await sendEmail(context.env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: site.contactEmail,
    subject: `POPIA removal request: ${businessName}`,
    text: `Data removal request\n\nBusiness: ${businessName}\n${businessUrl}\n\nReason:\n${reason}${relationship ? `\n\nRequester's relationship to the business: ${relationship}` : ''}\n\nRequester's email: ${requesterEmail}\n\nVerify the requester's connection to this business before deleting — this form has no identity check.`,
    html: `<div style="font-family:sans-serif;max-width:480px">
      <h2>Data removal request</h2>
      <p><strong>Business:</strong> ${escapeHtml(businessName)}<br>
      <a href="${businessUrl}">${businessUrl}</a></p>
      <p><strong>Reason:</strong><br>${escapeHtml(reason).replace(/\n/g, '<br>')}</p>
      ${relationship ? `<p><strong>Requester's relationship to the business:</strong> ${escapeHtml(relationship)}</p>` : ''}
      <p><strong>Requester's email:</strong> ${escapeHtml(requesterEmail)}</p>
      <p style="color:#666;font-size:0.85em;">Verify the requester's connection to this business before deleting —
      this form has no identity check. Reply to confirm once removed.</p>
    </div>`,
  });

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
