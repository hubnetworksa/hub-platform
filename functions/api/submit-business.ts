import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSite } from '../_lib/site';

interface Env {
  DB: D1Database;
  SITE: string;
}

// Submissions no longer publish immediately — they're held in
// pending_submissions until manually approved via the review link
// (functions/verify-listing.ts + functions/api/confirm-listing.ts). The
// checks below (honeypot, minimum time-on-form, length caps, raw-tag
// rejection) still matter as the first filter before a human ever sees it.
//
// Notifying the admin of a new submission is done via a mailto: link the
// client opens (see list-your-business.astro), not server-side SMTP — this
// Function has no email-sending credentials at all. The site's contact
// address is a Cloudflare Email Routing address (receive-only); the actual
// send happens from the submitter's own mail client, which is real email
// transport start to finish, just not something this Function drives.

const MAX_LEN: Record<string, number> = {
  name: 120,
  address: 200,
  phone: 30,
  email: 120,
  website: 200,
  description: 600,
};

function clean(v: unknown, field: string): string | null {
  if (typeof v !== 'string') return null;
  const trimmed = v.trim();
  if (!trimmed) return null;
  if (trimmed.length > (MAX_LEN[field] ?? 200)) return null;
  if (/<[a-z]/i.test(trimmed)) return null; // reject anything that looks like an HTML tag
  return trimmed;
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  // Honeypot — real users never fill this in, bots filling every field do.
  if (typeof body.company_url === 'string' && body.company_url.trim() !== '') {
    return json({ ok: false, error: 'Submission rejected.' }, 400);
  }
  // Minimum time-on-form — catches scripted instant-submits.
  const loadedAt = Number(body.loadedAt);
  if (!loadedAt || Date.now() - loadedAt < 3000) {
    return json({ ok: false, error: 'Submission rejected.' }, 400);
  }

  const name = clean(body.name, 'name');
  const categorySlug = typeof body.category === 'string' ? body.category.trim() : '';
  const suburbSlug = typeof body.suburb === 'string' ? body.suburb.trim() : '';
  if (!name || name.length < 2 || !categorySlug || !suburbSlug) {
    return json({ ok: false, error: 'Name, category and suburb are required.' }, 400);
  }

  const address = clean(body.address, 'address');
  const phone = clean(body.phone, 'phone');
  const email = clean(body.email, 'email');
  const website = clean(body.website, 'website');
  const description = clean(body.description, 'description') ?? `${name} is a business in ${suburbSlug.replace(/-/g, ' ')}, part of the Greater ${site.cityLabel} area.`;

  const db = context.env.DB;

  const category = await db.prepare('SELECT id FROM categories WHERE slug = ?').bind(categorySlug).first();
  const suburb = await db.prepare('SELECT id FROM suburbs WHERE slug = ?').bind(suburbSlug).first();
  if (!category || !suburb) {
    return json({ ok: false, error: 'Unknown category or suburb.' }, 400);
  }

  const token = crypto.randomUUID();
  await db
    .prepare(
      `INSERT INTO pending_submissions
        (token, name, category_slug, suburb_slug, address, phone, email, website, description)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`
    )
    .bind(token, name, categorySlug, suburbSlug, address, phone, email, website, description)
    .run();

  const reviewUrl = `https://${site.domain}/verify-listing?token=${token}`;

  // The row is safely saved regardless — the client builds and opens the
  // mailto: notification from this response, we don't send anything here.
  return json({ ok: true, reviewUrl });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
