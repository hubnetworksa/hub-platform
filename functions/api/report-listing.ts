import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { escapeHtml } from '../../src/lib/business-submission';
import { getSite } from '../_lib/site';
import { sendEmail } from '../_lib/send-email';

interface Env {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
}

// Recorded in the `reports` table (visible/resolvable from the admin
// dashboard's Reports panel) and best-effort emailed for immediate
// notification — the DB row is the source of truth, so a failed send here
// doesn't lose the report the way it would if email were the only record.

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
  const issue = clean(body.issue, 1000);
  const reporterEmail = clean(body.reporterEmail, 120);

  if (!businessSlug || !businessName || !issue || issue.length < 5) {
    return json({ ok: false, error: 'Please describe what needs fixing.' }, 400);
  }

  const businessUrl = `https://${site.domain}/business/${businessSlug}/`;

  await context.env.DB
    .prepare('INSERT INTO reports (kind, business_slug, business_name, reason, requester_email) VALUES (?, ?, ?, ?, ?)')
    .bind('report', businessSlug, businessName, issue, reporterEmail)
    .run();

  await sendEmail(context.env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: site.contactEmail,
    subject: `Listing issue reported: ${businessName}`,
    text: `Listing correction reported\n\nBusiness: ${businessName}\n${businessUrl}\n\nWhat's wrong:\n${issue}${reporterEmail ? `\n\nReporter's email (for follow-up): ${reporterEmail}` : ''}`,
    html: `<div style="font-family:sans-serif;max-width:480px">
      <h2>Listing correction reported</h2>
      <p><strong>Business:</strong> ${escapeHtml(businessName)}<br>
      <a href="${businessUrl}">${businessUrl}</a></p>
      <p><strong>What's wrong:</strong><br>${escapeHtml(issue).replace(/\n/g, '<br>')}</p>
      ${reporterEmail ? `<p><strong>Reporter's email (for follow-up):</strong> ${escapeHtml(reporterEmail)}</p>` : ''}
    </div>`,
  });

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
