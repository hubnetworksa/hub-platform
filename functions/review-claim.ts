import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { escapeHtml } from '../src/lib/business-submission';
import { getSite } from './_lib/site';

interface Env {
  DB: D1Database;
  SITE: string;
}

interface ClaimRow {
  id: number;
  business_name: string;
  claimant_email: string;
  contact_name: string | null;
  contact_phone: string | null;
  contact_email: string | null;
  role_note: string | null;
  status: string;
}

// GET-only preview page for the admin, reached from the claim-notification
// email (see functions/api/claim-business.ts). Same GET-does-nothing pattern
// as verify-listing.ts/owner-confirm-listing.ts, for the same reason (email
// prefetchers). The actual approve/reject happens via the POST buttons below.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const token = new URL(context.request.url).searchParams.get('token') ?? '';
  const row = await context.env.DB
    .prepare('SELECT bc.id, bc.contact_name, bc.contact_phone, bc.contact_email, bc.role_note, bc.status, b.name AS business_name, u.email AS claimant_email FROM business_claims bc JOIN businesses b ON b.id = bc.business_id JOIN users u ON u.id = bc.user_id WHERE bc.review_token = ?')
    .bind(token)
    .first<ClaimRow>();

  if (!row || row.status !== 'pending') {
    return html(site, `<h1>Nothing to review</h1><p>This claim has already been actioned, or the link is invalid.</p>`);
  }

  return html(site, `
    <h1>Claim request for "${escapeHtml(row.business_name)}"</h1>
    <p>Account email: <strong>${escapeHtml(row.claimant_email)}</strong></p>
    <p>Name: <strong>${escapeHtml(row.contact_name ?? 'Not specified')}</strong></p>
    <p>Phone: <strong>${escapeHtml(row.contact_phone ?? 'Not specified')}</strong></p>
    <p>Email: <strong>${escapeHtml(row.contact_email ?? 'Not specified')}</strong></p>
    <p>Role: <strong>${escapeHtml(row.role_note ?? 'Not specified')}</strong></p>
    <form method="POST" action="/api/review-claim" style="display:inline">
      <input type="hidden" name="token" value="${escapeHtml(token)}" />
      <input type="hidden" name="action" value="approve" />
      <button type="submit" class="approve">✅ Approve claim</button>
    </form>
    <form method="POST" action="/api/review-claim" style="display:inline">
      <input type="hidden" name="token" value="${escapeHtml(token)}" />
      <input type="hidden" name="action" value="reject" />
      <button type="submit" class="reject">❌ Reject claim</button>
    </form>
  `);
};

function html(site: { siteName: string }, body: string): Response {
  return new Response(
    `<!doctype html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Review claim — ${site.siteName}</title>
    <style>
      body{font-family:-apple-system,Segoe UI,Roboto,sans-serif;max-width:560px;margin:2rem auto;padding:0 1rem;color:#101a33}
      a{color:#1d6fe0}
      button{font-size:1rem;font-weight:700;padding:0.7rem 1.3rem;border-radius:8px;border:none;cursor:pointer;margin:1rem 0.5rem 0 0}
      button.approve{background:#1d6fe0;color:#fff}
      button.reject{background:#fff;color:#c23838;border:1px solid #c23838}
    </style></head><body>${body}</body></html>`,
    { headers: { 'Content-Type': 'text/html; charset=utf-8' } }
  );
}
