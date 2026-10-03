import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { getSite } from '../../_lib/site';
import { sendEmail } from '../../_lib/send-email';
import { escapeHtml } from '../../../src/lib/business-submission';

interface Env {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
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
  const t = site.theme;

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
  const claimHtml = claimUrl
    ? `<div style="margin:20px 0;padding:14px 16px;border:1px solid ${t.border};border-radius:10px">
      <p style="margin:0 0 6px;font-weight:700;color:${t.navy}">Is this your business?</p>
      <p style="margin:0 0 12px;font-size:14px;color:${t.textMuted}">Claim it for free to keep its details up to date.</p>
      <a href="${claimUrl}" style="display:inline-block;padding:10px 16px;border-radius:8px;background:${t.navy};color:#fff;font-weight:700;text-decoration:none">Claim this listing</a>
    </div>`
    : '';

  const result = await sendEmail(env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: row.requester_email,
    subject: `Your report about ${row.business_name} has been fixed`,
    text: `Hi,\n\nThanks for helping keep ${site.siteName} accurate. The problem you reported about ${row.business_name} has been fixed.\n\nYou reported:\n${row.reason}\n\nSee the updated listing: ${url}${claimText}\n\nThe ${site.siteName} team\nhttps://${site.domain}`,
    html: `<div style="font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif;max-width:520px;color:${t.text};line-height:1.5">
      <h2 style="color:${t.navy};margin:0 0 12px">Your report has been fixed</h2>
      <p>Thanks for helping keep ${escapeHtml(site.siteName)} accurate. The problem you reported about <strong>${escapeHtml(row.business_name)}</strong> has been fixed.</p>
      <p style="margin:16px 0 4px;color:${t.textMuted};font-size:13px">You reported:</p>
      <blockquote style="margin:0;padding:8px 14px;border-left:3px solid ${t.border};color:${t.text}">${escapeHtml(row.reason).replace(/\n/g, '<br>')}</blockquote>
      <p style="margin:20px 0"><a href="${url}" style="color:${t.navy};font-weight:700">View the updated listing</a></p>
      ${claimHtml}
      <p style="color:${t.textMuted};font-size:13px">The ${escapeHtml(site.siteName)} team &middot; <a href="https://${site.domain}" style="color:${t.textMuted}">${escapeHtml(site.domain)}</a></p>
    </div>`,
  });

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
