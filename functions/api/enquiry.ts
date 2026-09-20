import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { escapeHtml } from '../../src/lib/business-submission';
import { getSite } from '../_lib/site';
import { sendEmail } from '../_lib/send-email';
import { cleanText, looksLikeEmail, visitorHash, overMessageLimit, json } from '../_lib/messages';

interface Env {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
}

// "Send an enquiry" on a business page. Sent by the server: the enquiry is
// saved (admin Enquiries tab) and emailed to the business's own address — or
// to the site's contact address when none is on file. The business's email is
// looked up here, so it is never put into the public page. The visitor's own
// mail app is never involved.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  if (typeof body.company_url === 'string' && body.company_url.trim() !== '') {
    return json({ ok: false, error: 'Submission rejected.' }, 400);
  }
  const loadedAt = Number(body.loadedAt);
  if (!loadedAt || Date.now() - loadedAt < 2000) {
    return json({ ok: false, error: 'Submission rejected.' }, 400);
  }

  const slug = cleanText(body.businessSlug, 160);
  const name = cleanText(body.name, 120);
  const contact = cleanText(body.contact, 120);
  const message = cleanText(body.message, 2000);
  if (!slug) return json({ ok: false, error: 'Missing business.' }, 400);
  if (!name || !contact || !message || message.length < 5) {
    return json({ ok: false, error: 'Please fill in your name, how to reach you, and your message.' }, 400);
  }

  const db = context.env.DB;
  const business = await db
    .prepare(`SELECT name, email FROM businesses WHERE slug = ? AND status = 'published' AND closed_at IS NULL`)
    .bind(slug)
    .first<{ name: string; email: string | null }>();
  if (!business) return json({ ok: false, error: 'That listing could not be found.' }, 404);

  const ipHash = await visitorHash(context.request, site.slug);
  if (await overMessageLimit(db, ipHash)) {
    return json({ ok: false, error: 'You have sent several enquiries recently. Please try again in an hour.' }, 429);
  }
  // Also cap per business, so a listing's inbox can't be flooded from many addresses.
  const perBusiness = await db
    .prepare(`SELECT COUNT(*) AS n FROM messages WHERE kind = 'enquiry' AND business_slug = ? AND created_at > datetime('now', '-1 hour')`)
    .bind(slug)
    .first<{ n: number }>();
  if ((perBusiness?.n ?? 0) >= 20) {
    return json({ ok: false, error: 'This business has received a lot of enquiries just now. Please try again later.' }, 429);
  }

  const insert = await db
    .prepare(`INSERT INTO messages (kind, name, contact, message, business_slug, business_name, ip_hash) VALUES ('enquiry', ?, ?, ?, ?, ?, ?)`)
    .bind(name, contact, message, slug, business.name, ipHash)
    .run();

  const recipient = business.email && looksLikeEmail(business.email) ? business.email : site.contactEmail;
  const businessUrl = `https://${site.domain}/business/${slug}/`;
  const { sent } = await sendEmail(context.env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: recipient,
    subject: `Enquiry via ${site.siteName}: ${business.name}`,
    replyTo: looksLikeEmail(contact) ? contact : undefined,
    text: `Someone sent an enquiry about ${business.name} on ${site.siteName}.\n${businessUrl}\n\nFrom: ${name}\nContact: ${contact}\n\n${message}`,
    html: `<div style="font-family:sans-serif;max-width:520px">
      <h2>New enquiry for ${escapeHtml(business.name)}</h2>
      <p>Sent through <a href="${businessUrl}">${escapeHtml(site.siteName)}</a>.</p>
      <p><strong>From:</strong> ${escapeHtml(name)}<br><strong>Contact:</strong> ${escapeHtml(contact)}</p>
      <p>${escapeHtml(message).replace(/\n/g, '<br>')}</p></div>`,
  });
  if (sent) await db.prepare('UPDATE messages SET emailed = 1 WHERE id = ?').bind(insert.meta.last_row_id).run();

  return json({ ok: true });
};
