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

// The /contact/ form. The message is saved (admin Enquiries tab) and emailed
// to the site's contact address by the server — the visitor's own mail app is
// never involved. The saved row is the source of truth, so a failed or
// unconfigured email send doesn't lose the message.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  // Honeypot and minimum time-on-form, like every other public form.
  if (typeof body.company_url === 'string' && body.company_url.trim() !== '') {
    return json({ ok: false, error: 'Submission rejected.' }, 400);
  }
  const loadedAt = Number(body.loadedAt);
  if (!loadedAt || Date.now() - loadedAt < 2000) {
    return json({ ok: false, error: 'Submission rejected.' }, 400);
  }

  const name = body.name ? cleanText(body.name, 120) : null;
  const email = body.email ? cleanText(body.email, 120) : null;
  const topic = body.topic ? cleanText(body.topic, 80) : null;
  const message = cleanText(body.message, 4000);
  if (body.name && !name) return json({ ok: false, error: 'Please check your name.' }, 400);
  if (body.email && (!email || !looksLikeEmail(email))) return json({ ok: false, error: 'That email address does not look right.' }, 400);
  if (!message || message.length < 5) return json({ ok: false, error: 'Please write a message.' }, 400);

  const db = context.env.DB;
  const ipHash = await visitorHash(context.request, site.slug);
  if (await overMessageLimit(db, ipHash)) {
    return json({ ok: false, error: 'You have sent several messages recently. Please try again in an hour.' }, 429);
  }

  const insert = await db
    .prepare(`INSERT INTO messages (kind, name, contact, topic, message, ip_hash) VALUES ('contact', ?, ?, ?, ?, ?)`)
    .bind(name, email ?? '', topic, message, ipHash)
    .run();

  const subject = `${site.siteName} contact: ${topic ?? 'Message'}`;
  const { sent } = await sendEmail(context.env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: site.contactEmail,
    subject,
    replyTo: email ?? undefined,
    text: `New message from the ${site.siteName} contact form\n\nName: ${name ?? '—'}\nEmail: ${email ?? '—'}\nTopic: ${topic ?? '—'}\n\n${message}`,
    html: `<div style="font-family:sans-serif;max-width:520px">
      <h2>New contact message</h2>
      <p><strong>Name:</strong> ${escapeHtml(name ?? '—')}<br>
      <strong>Email:</strong> ${escapeHtml(email ?? '—')}<br>
      <strong>Topic:</strong> ${escapeHtml(topic ?? '—')}</p>
      <p>${escapeHtml(message).replace(/\n/g, '<br>')}</p></div>`,
  });
  if (sent) await db.prepare('UPDATE messages SET emailed = 1 WHERE id = ?').bind(insert.meta.last_row_id).run();

  return json({ ok: true });
};
