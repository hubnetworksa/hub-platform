import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { generateUniqueSlug, insertApprovedBusiness } from '../../src/lib/business-submission';
import { getSite } from '../_lib/site';
import { triggerRebuild } from '../_lib/deploy-hook';

interface Env {
  DB: D1Database;
  SITE: string;
  DEPLOY_HOOK_URL?: string;
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
}

// The business owner's confirm/dispute step, reached from the email sent
// by functions/api/confirm-listing.ts once an admin approves a submission.
// Confirming is what actually publishes — approval alone never does.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const form = await context.request.formData();
  const token = String(form.get('token') ?? '');
  const action = String(form.get('action') ?? '');
  const db = context.env.DB;

  const row = await db
    .prepare(
      `SELECT id, name, category_slug, suburb_slug, address, phone, email, website, description
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
  });
  await triggerRebuild(context.env.DEPLOY_HOOK_URL);

  return html(site, `<h1>Published!</h1><p>Thanks for confirming — "${escapeHtml(row.name)}" is going live now: <a href="https://${site.domain}/business/${slug}/">view listing</a>. It may take a few minutes to appear while the site rebuilds.</p>`);
};

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
