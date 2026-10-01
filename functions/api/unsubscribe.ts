import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSite, type Site } from '../_lib/site';

interface Env {
  DB: D1Database;
  SITE: string;
}

// The "Unsubscribe from updates" link in every service announcement
// (functions/_lib/email-template.ts → relaunchEmailHtml). No login: the
// person may well be reading on a phone they've never signed in from, and
// POPIA wants opting out to be as easy as opting in was.
//
// Two steps, same as functions/verify-claim.ts: GET only shows a confirm
// button, POST does the opt-out. Mail scanners (Outlook SafeLinks and the
// like) pre-open every link in an email, so a GET that acted on its own
// would unsubscribe people who never clicked anything.
//
// The token is a per-user 32-byte secret minted by send-announcement.ts, so
// guessing one is not practical; and the only thing it can do is set a flag
// that stops us emailing someone, which is idempotent, so no rate limit.

interface UserRow {
  id: number;
  email_opt_out: number;
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const token = (new URL(context.request.url).searchParams.get('t') ?? '').trim();
  const user = await lookup(context.env.DB, token);

  if (!user) return invalid(site);
  if (user.email_opt_out) {
    return page(
      site,
      "You're already unsubscribed",
      `We don't send service announcements to this address. Emails about your own account and billing aren't affected.`,
      200
    );
  }

  return page(
    site,
    `Unsubscribe from ${escapeHtml(site.siteName)} updates?`,
    `Press the button and we'll stop sending you service announcements. Emails about your own account and billing — password resets, invoices, listing confirmations — will still reach you.`,
    200,
    `<form method="POST" action="/api/unsubscribe">
    <input type="hidden" name="t" value="${escapeHtml(token)}">
    <button type="submit">Unsubscribe me</button>
  </form>`
  );
};

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  let token = '';
  try {
    const form = await context.request.formData();
    token = String(form.get('t') ?? '').trim();
  } catch {
    // Not a form post — fall through to the invalid-link page.
  }
  const user = await lookup(context.env.DB, token);
  if (!user) return invalid(site);

  await context.env.DB.prepare('UPDATE users SET email_opt_out = 1 WHERE id = ?').bind(user.id).run();

  return page(
    site,
    `You've been unsubscribed from ${escapeHtml(site.siteName)} updates`,
    `We won't send you service announcements any more. Emails about your own account and billing — password resets, invoices, listing confirmations — aren't affected.`,
    200
  );
};

async function lookup(db: D1Database, token: string): Promise<UserRow | null> {
  if (!/^[0-9a-f]{64}$/.test(token)) return null;
  return db.prepare('SELECT id, email_opt_out FROM users WHERE unsubscribe_token = ?').bind(token).first<UserRow>();
}

function invalid(site: Site): Response {
  return page(
    site,
    'This link is no longer valid',
    `This unsubscribe link doesn't match an account on ${escapeHtml(site.siteName)}. If you'd like to stop receiving updates, reply to the email you received and we'll take care of it.`,
    404
  );
}

function page(site: Site, heading: string, body: string, status: number, extra = ''): Response {
  const t = site.theme;
  const html = `<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="noindex">
<title>${heading} — ${escapeHtml(site.siteName)}</title>
<style>
  body{margin:0;background:${t.bgSubtle};font-family:-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif;color:${t.text};line-height:1.55}
  main{max-width:520px;margin:48px auto;padding:32px;background:${t.bgCard};border:1px solid ${t.border};border-radius:12px}
  img{display:block;width:36px;height:41px;margin-bottom:16px}
  h1{margin:0 0 12px;font-size:20px;color:${t.navy}}
  p{margin:0 0 16px;color:${t.textMuted};font-size:15px}
  a{color:${t.accent};font-weight:700;text-decoration:none}
  form{margin:0 0 20px}
  button{font-size:15px;font-weight:700;padding:12px 24px;border-radius:8px;border:none;cursor:pointer;background:${t.accent};color:${t.accentContrast}}
  footer{margin-top:24px;font-size:12px;color:${t.textMuted}}
  @media (max-width:600px){main{margin:16px;padding:24px}}
</style>
</head>
<body>
<main>
  <img src="https://${site.domain}/logo-icon.png" alt="">
  <h1>${heading}</h1>
  <p>${body}</p>
  ${extra}
  <p><a href="https://${site.domain}/">Back to ${escapeHtml(site.siteName)}</a></p>
  <footer>${escapeHtml(site.siteName)} · ${escapeHtml(site.contactEmail)} · <a href="https://${site.domain}/privacy/" style="font-weight:400">Privacy &amp; POPIA</a></footer>
</main>
</body>
</html>`;
  return new Response(html, { status, headers: { 'Content-Type': 'text/html; charset=utf-8', 'Cache-Control': 'no-store' } });
}

function escapeHtml(s: string): string {
  return s.replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' } as Record<string, string>)[c]!);
}
