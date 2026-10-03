import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { getSite } from '../../_lib/site';
import { sendEmail } from '../../_lib/send-email';
import { reportResolvedEmailHtml } from '../../_lib/email-template';

// Gets a copy of every "your report has been fixed" email. Override per site
// with the REPORT_COPY_EMAIL environment variable.
const REPORT_COPY_EMAIL = 'ethanmglindeque@gmail.com';

interface Env {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
  REPORT_COPY_EMAIL?: string;
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  const reportId = Number(body.reportId);
  if (!reportId) return json({ ok: false, error: 'Missing report.' }, 400);

  await context.env.DB
    .prepare("UPDATE reports SET status = 'resolved', resolved_at = datetime('now') WHERE id = ?")
    .bind(reportId)
    .run();

  // Tell the reporter their issue is fixed. Strictly best-effort: a failure
  // here is logged and never blocks (or undoes) the resolve above.
  try {
    await notifyReporter(context.env, reportId);
  } catch (err) {
    console.error('Report-resolved notification failed', err);
  }

  return json({ ok: true });
};

async function notifyReporter(env: Env, reportId: number): Promise<void> {
  // Only "report an error" rows (not removal requests), only when the
  // reporter gave an email, and only once.
  const row = await env.DB
    .prepare("SELECT business_slug, business_name, reason, requester_email FROM reports WHERE id = ? AND kind = 'report' AND status = 'resolved' AND requester_email IS NOT NULL AND requester_email != '' AND resolved_notified_at IS NULL")
    .bind(reportId)
    .first<{ business_slug: string; business_name: string; reason: string; requester_email: string }>();
  if (!row) return;

  // Claim the row first so concurrent/repeat clicks can't double-send.
  const claim = await env.DB
    .prepare("UPDATE reports SET resolved_notified_at = datetime('now') WHERE id = ? AND resolved_notified_at IS NULL")
    .bind(reportId)
    .run();
  if (!claim.meta?.changes) return;

  const site = getSite(env.SITE);
  const url = `https://${site.domain}/business/${row.business_slug}/`;

  // Invite the reporter to claim the listing if nobody owns it yet — reporters
  // are often the owner. Same link as the listing page's claim button.
  const biz = await env.DB
    .prepare('SELECT id, name FROM businesses WHERE slug = ? AND owner_user_id IS NULL')
    .bind(row.business_slug)
    .first<{ id: number; name: string }>();
  const claimUrl = biz
    ? `https://${site.domain}/my-businesses/claim/?businessId=${biz.id}&name=${encodeURIComponent(biz.name)}`
    : null;
  const claimText = claimUrl ? `\n\nIs this your business? Claim it for free to keep its details up to date: ${claimUrl}` : '';
  const from = `${site.siteName} <${site.contactEmail}>`;
  const subject = `Your report about ${row.business_name} has been fixed`;
  const text = `Hi,\n\nThanks for helping keep ${site.siteName} accurate. The problem you reported about ${row.business_name} has been fixed.\n\nYou reported:\n${row.reason}\n\nSee the updated listing: ${url}${claimText}\n\nThe ${site.siteName} team\nhttps://${site.domain}`;
  const html = reportResolvedEmailHtml(site, { businessName: row.business_name, reason: row.reason, listingUrl: url, claimUrl });

  const result = await sendEmail(env, { from, to: row.requester_email, subject, text, html });

  // Identical copy for the site team, so they see exactly what went out.
  const copyTo = env.REPORT_COPY_EMAIL || REPORT_COPY_EMAIL;
  if (result.sent && copyTo) {
    try {
      await sendEmail(env, { from, to: copyTo, subject: `[Copy — sent to ${row.requester_email}] ${subject}`, text, html });
    } catch (err) {
      console.error('Report-resolved copy failed', err);
    }
  }

  if (!result.sent) {
    // Nothing went out (no API key, or Resend failed) — release the claim so
    // a later re-resolve/retry isn't silently skipped.
    console.error('Report-resolved email not sent for report', reportId);
    await env.DB.prepare('UPDATE reports SET resolved_notified_at = NULL WHERE id = ?').bind(reportId).run();
  }
}

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
