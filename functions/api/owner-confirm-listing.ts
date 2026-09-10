import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { generateUniqueSlug, insertApprovedBusiness } from '../../src/lib/business-submission';
import { getSite, type Site } from '../_lib/site';
import { triggerRebuild } from '../_lib/deploy-hook';
import { sendEmail } from '../_lib/send-email';
import { listingLiveEmailHtml } from '../_lib/email-template';
import { logActivity } from '../_lib/activity-log';

interface Env {
  DB: D1Database;
  SITE: string;
  GITHUB_DISPATCH_TOKEN?: string;
  RESEND_API_KEY?: string;
}

interface PendingRow {
  id: number;
  name: string;
  category_slug: string;
  suburb_slug: string;
  address: string | null;
  phone: string | null;
  email: string | null;
  website: string | null;
  description: string;
  submitted_by_user_id: number | null;
}

// The business owner's confirm/dispute step, reached from the email sent
// by functions/api/confirm-listing.ts once an admin approves a submission.
// Confirming is what actually publishes — approval alone never does.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const form = await context.request.formData();
  const token = String(form.get('token') ?? '');
  const action = String(form.get('action') ?? '');
  const reason = String(form.get('reason') ?? '').trim();
  const db = context.env.DB;

  const row = await db
    .prepare(
      `SELECT id, name, category_slug, suburb_slug, address, phone, email, website, description, submitted_by_user_id
       FROM pending_submissions WHERE owner_confirm_token = ?`
    )
    .bind(token)
    .first<PendingRow>();

  if (!row) {
    return html(site, `<h1>Already handled</h1><p>This listing was already published or disputed — no action taken.</p>`);
  }

  // Delete first — makes double-submits a no-op rather than a double-publish.
  await db.prepare('DELETE FROM pending_submissions WHERE id = ?').bind(row.id).run();

  if (action !== 'confirm') {
    await logActivity(db, 'owner_disputed', row.name, reason ? `Reason given: ${reason}` : 'No reason given.');
    await notifyAdmin(context.env, site, {
      outcome: 'disputed',
      businessName: row.name,
      detail: reason ? `Reason given: ${reason}` : 'No reason given.',
    });
    return html(site, `<h1>Thanks for letting us know</h1><p>"${escapeHtml(row.name)}" won't be published. If you'd like to submit corrected details, or have any questions, email us at <a href="mailto:${site.contactEmail}">${site.contactEmail}</a>.</p>`);
  }

  const category = await db.prepare('SELECT id FROM categories WHERE slug = ?').bind(row.category_slug).first<{ id: number }>();
  const suburb = await db.prepare('SELECT id FROM suburbs WHERE slug = ?').bind(row.suburb_slug).first<{ id: number }>();
  if (!category || !suburb) {
    return html(site, `<h1>Couldn't publish</h1><p>The category or suburb on this submission no longer exists — please contact us at <a href="mailto:${site.contactEmail}">${site.contactEmail}</a>.</p>`);
  }

  const slug = await generateUniqueSlug(db, row.name, row.suburb_slug);
  if (!slug) {
    return html(site, `<h1>Couldn't publish</h1><p>Ran out of unique slug attempts for "${escapeHtml(row.name)}" — please contact us at <a href="mailto:${site.contactEmail}">${site.contactEmail}</a>.</p>`);
  }

  await insertApprovedBusiness(db, {
    slug,
    name: row.name,
    suburbId: suburb.id,
    categoryId: category.id,
    address: row.address,
    phone: row.phone,
    website: row.website,
    email: row.email,
    description: row.description,
    ownerUserId: row.submitted_by_user_id,
  });
  await triggerRebuild(context.env.GITHUB_DISPATCH_TOKEN);
  const listingUrl = `https://${site.domain}/business/${slug}/`;
  await logActivity(db, 'owner_confirmed', row.name, `Published: ${listingUrl}`);
  await notifyAdmin(context.env, site, {
    outcome: 'confirmed',
    businessName: row.name,
    detail: `Now live: ${listingUrl}`,
  });
  if (row.email) {
    await sendEmail(context.env, {
      from: `${site.siteName} <${site.contactEmail}>`,
      to: row.email,
      subject: `You're live on ${site.siteName}: ${row.name}`,
      text: `Thanks for confirming — "${row.name}" is now published on ${site.siteName}.\n\nView your listing: ${listingUrl}`,
      html: listingLiveEmailHtml(site, { businessName: row.name, listingUrl }),
    });
  }

  return html(site, `<h1>Published!</h1><p>Thanks for confirming — "${escapeHtml(row.name)}" is going live now: <a href="${listingUrl}">view listing</a>. It may take a few minutes to appear while the site rebuilds.</p>`);
};

// Best-effort notification back to the admin once the owner has acted —
// failures here should never block the response shown to the owner.
async function notifyAdmin(
  env: { RESEND_API_KEY?: string },
  site: Site,
  data: { outcome: 'confirmed' | 'disputed'; businessName: string; detail: string }
): Promise<void> {
  const icon = data.outcome === 'confirmed' ? '✅' : '❌';
  const subject = `${icon} ${data.businessName} — owner ${data.outcome}`;
  const text = `"${data.businessName}" was ${data.outcome} by the business owner.\n\n${data.detail}`;
  const from = `${site.siteName} <${site.contactEmail}>`;

  await sendEmail(env, { from, to: site.contactEmail, subject, text });

  // TEMP: a separate copy while trusting the flow on the first few real
  // approvals — remove once confirmed reliable (user request, 2026-09-09).
  await sendEmail(env, { from, to: 'ethanmglindeque@gmail.com', subject: `[monitor copy] ${subject}`, text });
}

function escapeHtml(s: string): string {
  return s.replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' })[c]!);
}

function html(site: { siteName: string; contactEmail: string }, body: string): Response {
  return new Response(
    `<!doctype html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${site.siteName}</title>
    <style>body{font-family:-apple-system,Segoe UI,Roboto,sans-serif;max-width:560px;margin:2rem auto;padding:0 1rem;color:#101a33}
    a{color:#1d6fe0}</style></head><body>${body}</body></html>`,
    { headers: { 'Content-Type': 'text/html; charset=utf-8' } }
  );
}
