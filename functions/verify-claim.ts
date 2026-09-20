import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { escapeHtml } from '../src/lib/business-submission';
import { getSite } from './_lib/site';

interface Env {
  DB: D1Database;
  SITE: string;
}

// Opened from the verification email sent to the BUSINESS's own address (see
// functions/api/claim-business.ts). GET only shows who is claiming; nothing
// changes until the button is pressed (POST /api/verify-claim), so mail
// scanners that prefetch links can't confirm a claim by accident.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const token = new URL(context.request.url).searchParams.get('token') ?? '';
  const row = token
    ? await context.env.DB
        .prepare(
          `SELECT bc.status, bc.contact_name, bc.role_note, bc.created_at, b.name AS business_name
           FROM business_claims bc JOIN businesses b ON b.id = bc.business_id
           WHERE bc.verify_token = ?`
        )
        .bind(token)
        .first<{ status: string; contact_name: string | null; role_note: string | null; created_at: string; business_name: string }>()
    : null;

  if (!row || row.status !== 'pending') {
    return html(site, `<h1>Nothing to confirm</h1><p>This claim was already handled, or the link is not valid.</p>`);
  }

  const role = (row.role_note ?? '').split(' | ')[0].replace(/^Role: /, '');
  return html(
    site,
    `<h1>Confirm the claim on "${escapeHtml(row.business_name)}"</h1>
    <p>Someone asked to manage this business's listing on ${escapeHtml(site.siteName)}.</p>
    <p>Name: <strong>${escapeHtml(row.contact_name ?? 'Not specified')}</strong><br>Role: <strong>${escapeHtml(role || 'Not specified')}</strong></p>
    <p>You are seeing this because this is the business's email address on file. <strong>Only confirm if this person is you or someone you authorised</strong> — they will be able to edit the listing.</p>
    <form method="POST" action="/api/verify-claim" style="display:inline">
      <input type="hidden" name="token" value="${escapeHtml(token)}" />
      <input type="hidden" name="action" value="confirm" />
      <button type="submit" class="approve">Yes, confirm this claim</button>
    </form>
    <form method="POST" action="/api/verify-claim" style="display:inline">
      <input type="hidden" name="token" value="${escapeHtml(token)}" />
      <input type="hidden" name="action" value="deny" />
      <button type="submit" class="reject">No, this isn't us</button>
    </form>`
  );
};

function html(site: { siteName: string }, body: string): Response {
  return new Response(
    `<!doctype html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex">
    <title>Confirm claim — ${site.siteName}</title>
    <style>
      body{font-family:-apple-system,Segoe UI,Roboto,sans-serif;max-width:560px;margin:2rem auto;padding:0 1rem;color:#101a33;line-height:1.55}
      button{font-size:1rem;font-weight:700;padding:0.7rem 1.3rem;border-radius:8px;border:none;cursor:pointer;margin:1rem 0.5rem 0 0}
      button.approve{background:#1d6fe0;color:#fff}
      button.reject{background:#fff;color:#c23838;border:1px solid #c23838}
    </style></head><body>${body}</body></html>`,
    { headers: { 'Content-Type': 'text/html; charset=utf-8' } }
  );
}
