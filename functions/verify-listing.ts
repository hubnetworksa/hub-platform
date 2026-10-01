import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { escapeHtml, findMergeTarget } from '../src/lib/business-submission';
import { TIER_NAMES } from './_lib/pricing';
import { getSite } from './_lib/site';

interface Env {
  DB: D1Database;
  SITE: string;
}

interface PendingRow {
  token: string;
  name: string;
  category_slug: string;
  suburb_slug: string;
  address: string | null;
  phone: string | null;
  email: string | null;
  website: string | null;
  description: string;
  chosen_tier: number | null;
  payment_status: string | null;
}

// GET-only preview page reached from the emailed link. Deliberately does
// NOT take action on the mere GET — email clients/providers (Gmail, Outlook
// Safe Links, etc.) prefetch/scan links in emails, which would silently
// "click" a GET-triggers-the-action link before a human ever saw it. The
// actual approve/reject happens via the POST buttons on this page instead.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const token = new URL(context.request.url).searchParams.get('token') ?? '';
  const row = await context.env.DB.prepare(
    'SELECT token, name, category_slug, suburb_slug, address, phone, email, website, description, chosen_tier, payment_status FROM pending_submissions WHERE token = ?'
  )
    .bind(token)
    .first<PendingRow>();

  if (!row) {
    return html(site, `<h1>Nothing to review</h1><p>This submission has already been handled, or the link is invalid.</p>`);
  }

  const rowsHtml = [
    ['Name', row.name],
    ['Category', row.category_slug],
    ['Suburb', row.suburb_slug],
    ['Address', row.address],
    ['Phone', row.phone],
    ['Email', row.email],
    ['Website', row.website],
  ]
    .filter(([, v]) => v)
    .map(([k, v]) => `<tr><td class="k">${escapeHtml(k as string)}</td><td>${escapeHtml(v as string)}</td></tr>`)
    .join('');

  // What the admin needs to know BEFORE clicking: whether money is involved
  // (rejecting then owes a refund) and whether this lands on an existing
  // listing (it only fills that listing's blanks — ownership still needs a
  // claim).
  const tier = row.chosen_tier ?? 0;
  const planNote =
    tier > 0
      ? row.payment_status === 'paid'
        ? `<p class="note paid"><strong>Paid: ${escapeHtml(TIER_NAMES[tier] ?? `Tier ${tier}`)} plan.</strong> Approving applies it once the owner confirms. Rejecting cancels the PayFast billing and emails you to refund the first payment.</p>`
        : `<p class="note">Chose the ${escapeHtml(TIER_NAMES[tier] ?? `Tier ${tier}`)} plan but has <strong>not paid</strong> — it will publish on the free plan.</p>`
      : '';
  const merge = await findMergeTarget(context.env.DB, row.name, row.suburb_slug);
  const mergeNote = merge
    ? `<p class="note warn"><strong>Already listed:</strong> <a href="/business/${escapeHtml(merge.slug)}/" target="_blank" rel="noopener">${escapeHtml(merge.name)}</a> exists in this suburb. Approving only fills in details that listing is missing — it won't overwrite anything${merge.owner_user_id ? ', and that listing already has an owner' : ' or make the submitter its owner (they need to claim it)'}.</p>`
    : '';

  return html(site, `
    <h1>New business listing submitted</h1>
    ${planNote}${mergeNote}
    <table class="data">${rowsHtml}</table>
    <p><strong>Description</strong><br>${escapeHtml(row.description)}</p>
    <form method="POST" action="/api/confirm-listing" style="display:inline">
      <input type="hidden" name="token" value="${escapeHtml(token)}" />
      <input type="hidden" name="action" value="approve" />
      <button type="submit" class="approve">✅ Approve</button>
    </form>
    <p style="color:#5b6b85;font-size:0.85rem;">${row.email ? 'Approving emails the owner to confirm the details — it only actually publishes once they do.' : 'No email on file, so approving publishes immediately (no owner to confirm with).'}</p>
    <form method="POST" action="/api/confirm-listing" style="display:inline">
      <input type="hidden" name="token" value="${escapeHtml(token)}" />
      <input type="hidden" name="action" value="reject" />
      <button type="submit" class="reject">❌ Reject</button>
    </form>
  `);
};

function html(site: { siteName: string }, body: string): Response {
  return new Response(
    `<!doctype html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Review listing — ${site.siteName}</title>
    <style>
      body{font-family:-apple-system,Segoe UI,Roboto,sans-serif;max-width:560px;margin:2rem auto;padding:0 1rem;color:#101a33}
      table.data{border-collapse:collapse;width:100%;margin:1rem 0}
      table.data td{padding:0.4rem 0.6rem;border-bottom:1px solid #dce6f5;font-size:0.92rem}
      table.data td.k{color:#5b6b85;width:8rem}
      button{font-size:1rem;font-weight:700;padding:0.7rem 1.3rem;border-radius:8px;border:none;cursor:pointer;margin:1rem 0.5rem 0 0}
      button.approve{background:#1d6fe0;color:#fff}
      button.reject{background:#fff;color:#c23838;border:1px solid #c23838}
      .note{padding:0.7rem 0.9rem;border-radius:8px;background:#f2f6fc;border:1px solid #dce6f5;font-size:0.92rem}
      .note.paid{background:#eaf7ee;border-color:#9fd6b0}
      .note.warn{background:#fff6e5;border-color:#f0c878}
    </style></head><body>${body}</body></html>`,
    { headers: { 'Content-Type': 'text/html; charset=utf-8' } }
  );
}
