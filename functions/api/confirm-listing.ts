import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { generateUniqueSlug, insertApprovedBusiness } from '../../src/lib/business-submission';
import { getSite } from '../_lib/site';

interface Env {
  DB: D1Database;
  SITE: string;
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

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const form = await context.request.formData();
  const token = String(form.get('token') ?? '');
  const action = String(form.get('action') ?? '');
  const db = context.env.DB;

  const row = await db
    .prepare('SELECT id, name, category_slug, suburb_slug, address, phone, email, website, description FROM pending_submissions WHERE token = ?')
    .bind(token)
    .first<PendingRow>();

  if (!row) {
    return html(site, `<h1>Already handled</h1><p>This submission was already approved or rejected — no action taken.</p>`);
  }

  // Delete first — makes double-submits (double-click, resubmit) a no-op
  // rather than a double-publish, regardless of which branch runs below.
  await db.prepare('DELETE FROM pending_submissions WHERE id = ?').bind(row.id).run();

  if (action !== 'approve') {
    return html(site, `<h1>Rejected</h1><p>"${escapeHtml(row.name)}" was not published.</p>`);
  }

  const category = await db.prepare('SELECT id FROM categories WHERE slug = ?').bind(row.category_slug).first<{ id: number }>();
  const suburb = await db.prepare('SELECT id FROM suburbs WHERE slug = ?').bind(row.suburb_slug).first<{ id: number }>();
  if (!category || !suburb) {
    return html(site, `<h1>Couldn't publish</h1><p>The category or suburb on this submission no longer exists.</p>`);
  }

  const slug = await generateUniqueSlug(db, row.name, row.suburb_slug);
  if (!slug) {
    return html(site, `<h1>Couldn't publish</h1><p>Ran out of unique slug attempts for "${escapeHtml(row.name)}".</p>`);
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

  return html(site, `<h1>Published!</h1><p>"${escapeHtml(row.name)}" is now live: <a href="https://${site.domain}/business/${slug}/">view listing</a></p>`);
};

function escapeHtml(s: string): string {
  return s.replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' })[c]!);
}

function html(site: { siteName: string }, body: string): Response {
  return new Response(
    `<!doctype html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${site.siteName}</title>
    <style>body{font-family:-apple-system,Segoe UI,Roboto,sans-serif;max-width:560px;margin:2rem auto;padding:0 1rem;color:#101a33}
    a{color:#1d6fe0}</style></head><body>${body}</body></html>`,
    { headers: { 'Content-Type': 'text/html; charset=utf-8' } }
  );
}
