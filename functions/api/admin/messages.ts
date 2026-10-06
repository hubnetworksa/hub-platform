import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { looksLikeEmail } from '../../_lib/messages';
import { sendEmail } from '../../_lib/send-email';
import { logActivity } from '../../_lib/activity-log';
import { getSite } from '../../_lib/site';

interface Env {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
}

// Backs the admin Enquiries tab: everything visitors sent through the site's
// own forms (the contact page and the enquiry form on each listing).
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const rows = await context.env.DB.prepare(
    `SELECT id, kind, name, contact, topic, message, business_slug, business_name, emailed, status, created_at
     FROM messages ORDER BY (status = 'open') DESC, created_at DESC LIMIT 300`
  ).all();
  const stats = await context.env.DB.prepare(
    `SELECT SUM(status = 'open') AS open, SUM(created_at > datetime('now', '-7 days')) AS thisWeek, COUNT(*) AS total FROM messages`
  ).first<{ open: number | null; thisWeek: number | null; total: number }>();
  return json({
    ok: true,
    messages: rows.results,
    stats: { open: stats?.open ?? 0, thisWeek: stats?.thisWeek ?? 0, total: stats?.total ?? 0 },
  });
};

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }
  const id = Number(body.id);
  if (!id) return json({ ok: false, error: 'Missing id.' }, 400);
  const db = context.env.DB;

  if (body.action === 'resolve') {
    await db.prepare(`UPDATE messages SET status = 'resolved', resolved_at = datetime('now') WHERE id = ?`).bind(id).run();
    return json({ ok: true });
  }
  if (body.action === 'reopen') {
    await db.prepare(`UPDATE messages SET status = 'open', resolved_at = NULL WHERE id = ?`).bind(id).run();
    return json({ ok: true });
  }
  // Answer the visitor by email (from Hub Admin's Inbox), then mark it done.
  // Enquiries excluded: those are between the visitor and the business
  // (already emailed straight to them) — admin never sees or replies to one.
  if (body.action === 'reply') {
    const text = typeof body.text === 'string' ? body.text.trim() : '';
    if (text.length < 2 || text.length > 5000) return json({ ok: false, error: 'The reply must be 2 to 5,000 characters.' }, 400);
    const msg = await db
      .prepare('SELECT kind, name, contact, topic, message, business_name FROM messages WHERE id = ?')
      .bind(id)
      .first<{ kind: string; name: string | null; contact: string; topic: string | null; message: string; business_name: string | null }>();
    if (!msg) return json({ ok: false, error: 'That message no longer exists.' }, 404);
    if (msg.kind === 'enquiry') return json({ ok: false, error: 'Business enquiries go straight to the business — admin cannot reply on their behalf.' }, 403);
    if (!looksLikeEmail(msg.contact)) return json({ ok: false, error: 'This message has no email address to reply to.' }, 400);
    const site = getSite(context.env.SITE);
    const quoted = msg.message.split('\n').map((l) => `> ${l}`).join('\n');
    const greeting = msg.name ? `Hi ${msg.name},\n\n` : '';
    const signoff = `\n\n— ${site.siteName}\nhttps://${site.domain}`;
    const { sent } = await sendEmail(context.env, {
      from: `${site.siteName} <${site.contactEmail}>`,
      to: msg.contact,
      replyTo: site.contactEmail,
      subject: `Re: ${msg.topic || (msg.business_name ? `your enquiry about ${msg.business_name}` : `your message to ${site.siteName}`)}`.slice(0, 150),
      text: `${greeting}${text}${signoff}\n\n${quoted}`,
      html: `<div style="font-family:sans-serif;max-width:560px;line-height:1.5">${greeting ? `<p>${escapeHtml(greeting.trim())}</p>` : ''}<p>${escapeHtml(text).replace(/\n/g, '<br>')}</p><p>— ${escapeHtml(site.siteName)}<br><a href="https://${site.domain}">${site.domain}</a></p><blockquote style="margin:16px 0 0;padding-left:12px;border-left:3px solid #ccc;color:#666">${escapeHtml(msg.message).replace(/\n/g, '<br>')}</blockquote></div>`,
    });
    if (!sent) return json({ ok: false, error: 'The email couldn’t be sent (is email set up for this site?).' }, 502);
    await db.prepare(`UPDATE messages SET status = 'resolved', resolved_at = datetime('now') WHERE id = ?`).bind(id).run();
    await logActivity(db, 'message_replied', msg.business_name ?? msg.name ?? 'Contact form', `Reply emailed to ${msg.contact}.`);
    return json({ ok: true });
  }
  if (body.action === 'delete') {
    await db.prepare('DELETE FROM messages WHERE id = ?').bind(id).run();
    return json({ ok: true });
  }
  return json({ ok: false, error: 'Unknown action.' }, 400);
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}

function escapeHtml(s: string): string {
  return s.replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' })[c]!);
}
