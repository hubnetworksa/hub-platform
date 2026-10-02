import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { hashToken, rotateSession, sessionCookie } from './_lib/auth';
import { safeNext } from './_lib/email-verification';
import { rateLimited } from './_lib/messages';
import { getSite, type Site } from './_lib/site';
import { escapeHtml } from '../src/lib/business-submission';

interface Env {
  DB: D1Database;
  SITE: string;
}

// Opened from the "Confirm your email" link (see functions/_lib/email-verification.ts).
// GET only checks the token and shows a "Confirm my email" button; nothing
// changes until the button is pressed (POST), so link scanners that prefetch
// URLs (Outlook Safe Links, corporate gateways) can't use up the single-use
// token. POST marks the email confirmed, deletes the token, signs the person
// in and sends them to /my-businesses/ (or the ?next= path). Anything invalid
// or expired shows a friendly page with a resend form.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const db = context.env.DB;
  const url = new URL(context.request.url);
  const token = url.searchParams.get('token') ?? '';
  const next = safeNext(url.searchParams.get('next'));

  if (!/^[0-9a-f]{64}$/.test(token)) return failure(site, next, 'This confirmation link is not valid.');
  if (await rateLimited(db, context.request, site.slug, 'verify-email-link', 30)) {
    return failure(site, next, 'Too many attempts from your connection. Please try again later.');
  }
  const row = await db
    .prepare(`SELECT datetime(expires_at) > datetime('now') AS live FROM auth_tokens WHERE token_hash = ? AND purpose = 'email_verify'`)
    .bind(await hashToken(token))
    .first<{ live: number }>();
  if (!row) return failure(site, next, 'This confirmation link has already been used, or is not valid.');
  if (!row.live) return failure(site, next, 'This confirmation link has expired.');

  return shell(
    site,
    'Confirm your email',
    `<h1>Confirm your email</h1>
      <p>One last step: confirm that this is your email address to finish setting up your ${escapeHtml(site.siteName)} account.</p>
      <form method="POST" action="/verify-email">
        <input type="hidden" name="token" value="${escapeHtml(token)}">
        <input type="hidden" name="next" value="${escapeHtml(next ?? '')}">
        <button type="submit">Confirm my email</button>
      </form>`
  );
};

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const db = context.env.DB;

  let token = '';
  let nextRaw: unknown = null;
  try {
    const form = await context.request.formData();
    token = String(form.get('token') ?? '');
    nextRaw = form.get('next');
  } catch {
    return failure(site, null, 'This confirmation link is not valid.');
  }
  const next = safeNext(nextRaw);

  if (!/^[0-9a-f]{64}$/.test(token)) return failure(site, next, 'This confirmation link is not valid.');
  if (await rateLimited(db, context.request, site.slug, 'verify-email-link', 30)) {
    return failure(site, next, 'Too many attempts from your connection. Please try again later.');
  }

  const row = await db
    .prepare(`SELECT id, user_id, datetime(expires_at) > datetime('now') AS live FROM auth_tokens WHERE token_hash = ? AND purpose = 'email_verify'`)
    .bind(await hashToken(token))
    .first<{ id: number; user_id: number; live: number }>();
  if (!row) return failure(site, next, 'This confirmation link has already been used, or is not valid.');

  // Deleted before anything else, so it can only ever be used once.
  const claimed = await db.prepare('DELETE FROM auth_tokens WHERE id = ?').bind(row.id).run();
  if (!claimed.meta.changes) return failure(site, next, 'This confirmation link has already been used.');
  if (!row.live) return failure(site, next, 'This confirmation link has expired.');

  await db.prepare(`UPDATE users SET email_verified_at = COALESCE(email_verified_at, datetime('now')) WHERE id = ?`).bind(row.user_id).run();
  await db.prepare(`DELETE FROM auth_tokens WHERE user_id = ? AND purpose = 'email_verify'`).bind(row.user_id).run();

  const session = await rotateSession(db, context.request, row.user_id);
  return new Response(null, {
    status: 302,
    headers: { Location: next ?? '/my-businesses/', 'Set-Cookie': sessionCookie(session), 'Cache-Control': 'no-store' },
  });
};

function shell(site: Site, title: string, body: string, status = 200, script = ''): Response {
  const t = site.theme;
  return new Response(
    `<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex">
    <title>${escapeHtml(title)} — ${escapeHtml(site.siteName)}</title>
    <style>
      body{font-family:-apple-system,Segoe UI,Roboto,sans-serif;margin:0;background:${t.bgSubtle};color:${t.text};line-height:1.55}
      .card{max-width:420px;margin:4rem auto;padding:2.25rem 2rem;background:#fff;border:1px solid ${t.border};border-radius:16px;box-shadow:0 8px 30px rgba(0,0,0,.08)}
      @media (max-width:480px){.card{margin:1.5rem 1rem;padding:1.75rem 1.25rem}}
      h1{margin:0 0 .5rem;font-size:1.5rem;color:${t.navy}}
      p{margin:0 0 1rem;color:${t.textMuted};font-size:.95rem}
      label{display:flex;flex-direction:column;gap:.35rem;font-size:.9rem;font-weight:600;color:${t.text}}
      input[type=email]{font:inherit;padding:.65rem .8rem;border-radius:8px;border:1px solid ${t.border}}
      button{margin-top:1rem;width:100%;border:none;cursor:pointer;padding:.75rem 1rem;font:inherit;font-weight:700;border-radius:8px;background:${t.accent};color:${t.accentContrast}}
      button:disabled{opacity:.6;cursor:default}
      #status{min-height:1.2em;margin:.75rem 0 0;font-size:.88rem}
      .back{text-align:center;margin:1.5rem 0 0;font-size:.9rem}
      .back a{color:${t.accent};font-weight:600}
    </style></head><body><main class="card">${body}</main>${script}</body></html>`,
    { status, headers: { 'Content-Type': 'text/html; charset=utf-8', 'Cache-Control': 'no-store' } }
  );
}

function failure(site: Site, next: string | null, reason: string): Response {
  return shell(
    site,
    'Confirm your email',
    `<h1>We couldn't confirm your email</h1>
      <p>${escapeHtml(reason)} Enter your email and we'll send you a new link.</p>
      <form id="resend" data-next="${escapeHtml(next ?? '')}">
        <label>Email<input type="email" name="email" required maxlength="120" autocomplete="email"></label>
        <button type="submit">Resend email</button>
        <p id="status" role="status"></p>
      </form>
      <p class="back"><a href="/login/">Back to log in</a></p>`,
    400,
    `<script>
      const form = document.getElementById('resend'), status = document.getElementById('status');
      form.addEventListener('submit', async (e) => {
        e.preventDefault();
        const btn = form.querySelector('button'); btn.disabled = true;
        try {
          const res = await fetch('/api/resend-verification', { method: 'POST', headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ email: form.email.value, next: form.dataset.next || undefined }) });
          const out = await res.json();
          status.textContent = out.ok ? 'If that address has an unconfirmed account, a new link is on its way. It expires in 24 hours.' : (out.error || 'Something went wrong. Please try again.');
        } catch { status.textContent = 'Something went wrong. Please try again.'; }
        btn.disabled = false;
      });
    </script>`
  );
}
