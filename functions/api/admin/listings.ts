import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { logActivity } from '../../_lib/activity-log';
import { triggerRebuild } from '../../_lib/deploy-hook';
import { generateUniqueSlug, insertApprovedBusiness } from '../../../src/lib/business-submission';

interface Env {
  DB: D1Database;
  GITHUB_DISPATCH_TOKEN?: string;
}

const PLAN_TIERS: Record<string, number> = { basic: 0, verified: 1, featured: 2 };

// Backs the Listings tab and its "New listing" / "Edit listing" modal:
//   GET  ?q=&plan=&status=&limit=&offset=  paged list across EVERY business
//                                          (published and hidden), with totals
//   GET  ?id=                              one listing, for the edit modal
//   POST {id?, name, category, suburb, phone, plan, description}
//                                          create (no id) or update (id)
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const params = new URL(context.request.url).searchParams;

  const id = Number(params.get('id'));
  if (id) {
    const row = await db
      .prepare(
        `SELECT b.id, b.slug, b.name, b.status, b.phone, b.description, b.subscription_tier, b.owner_user_id,
                s.slug AS suburb_slug, s.name AS suburb_name, u.email AS owner_email,
                (SELECT c.slug FROM business_categories bc JOIN categories c ON c.id = bc.category_id WHERE bc.business_id = b.id AND bc.is_primary = 1 LIMIT 1) AS category_slug,
                (SELECT c.name FROM business_categories bc JOIN categories c ON c.id = bc.category_id WHERE bc.business_id = b.id AND bc.is_primary = 1 LIMIT 1) AS category_name
         FROM businesses b
         LEFT JOIN suburbs s ON s.id = b.suburb_id
         LEFT JOIN users u ON u.id = b.owner_user_id
         WHERE b.id = ?`
      )
      .bind(id)
      .first();
    if (!row) return json({ ok: false, error: 'Business not found.' }, 404);
    return json({ ok: true, listing: row });
  }

  const q = (params.get('q') ?? '').trim();
  const plan = params.get('plan') ?? 'all';
  const status = params.get('status') ?? 'all';
  const limit = Math.min(Math.max(Number(params.get('limit')) || 25, 1), 100);
  const offset = Math.max(Number(params.get('offset')) || 0, 0);

  const where: string[] = [];
  const binds: unknown[] = [];
  if (q) {
    const like = `%${q}%`;
    where.push(
      `(b.name LIKE ? OR s.name LIKE ? OR EXISTS (SELECT 1 FROM business_categories bc JOIN categories c ON c.id = bc.category_id WHERE bc.business_id = b.id AND c.name LIKE ?))`
    );
    binds.push(like, like, like);
  }
  const tier = PLAN_TIERS[plan.toLowerCase()];
  if (tier !== undefined) {
    where.push('b.subscription_tier = ?');
    binds.push(tier);
  }
  if (status === 'hidden') where.push("b.status != 'published'");
  const whereSql = where.length ? `WHERE ${where.join(' AND ')}` : '';

  const rows = await db
    .prepare(
      `SELECT b.id, b.slug, b.name, b.status, b.subscription_tier, b.phone, s.name AS suburb_name,
              (SELECT c.name FROM business_categories bc JOIN categories c ON c.id = bc.category_id WHERE bc.business_id = b.id AND bc.is_primary = 1 LIMIT 1) AS category_name
       FROM businesses b LEFT JOIN suburbs s ON s.id = b.suburb_id
       ${whereSql}
       ORDER BY b.name COLLATE NOCASE LIMIT ? OFFSET ?`
    )
    .bind(...binds, limit, offset)
    .all();

  const matching = await db
    .prepare(`SELECT COUNT(*) AS n FROM businesses b LEFT JOIN suburbs s ON s.id = b.suburb_id ${whereSql}`)
    .bind(...binds)
    .first<{ n: number }>();
  const all = await db.prepare('SELECT COUNT(*) AS n FROM businesses').first<{ n: number }>();

  return json({ ok: true, results: rows.results, matching: matching?.n ?? 0, total: all?.n ?? 0 });
};

function clean(v: unknown, maxLen: number): string | null {
  if (typeof v !== 'string') return null;
  const t = v.trim();
  return t ? t.slice(0, maxLen) : null;
}

function parsePlan(v: unknown): number | null {
  if (typeof v === 'number' && [0, 1, 2].includes(v)) return v;
  if (typeof v === 'string') {
    if (v.toLowerCase() in PLAN_TIERS) return PLAN_TIERS[v.toLowerCase()];
    if (['0', '1', '2'].includes(v)) return Number(v);
  }
  return null;
}

// Same override semantics as admin/subscriptions.ts's POST: bypasses PayFast
// entirely (a manually comped / corrected plan).
async function applyTierOverride(db: D1Database, businessId: number, tier: number): Promise<void> {
  if (tier === 0) {
    await db.prepare(`UPDATE businesses SET subscription_tier = 0, subscription_status = 'expired' WHERE id = ?`).bind(businessId).run();
  } else {
    await db
      .prepare(`UPDATE businesses SET subscription_tier = ?, subscription_status = 'active', subscription_expires_at = datetime('now', '+100 years') WHERE id = ?`)
      .bind(tier, businessId)
      .run();
  }
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  const id = Number(body.id) || null;
  const name = clean(body.name, 120);
  const categoryInput = clean(body.category, 120);
  const suburbInput = clean(body.suburb, 120);
  const phone = clean(body.phone, 30);
  const description = clean(body.description, 600);
  const tier = parsePlan(body.plan) ?? 0;

  if (!name) return json({ ok: false, error: 'Add the business name.' }, 400);
  if (!categoryInput) return json({ ok: false, error: 'Pick a category.' }, 400);
  if (!suburbInput) return json({ ok: false, error: 'Pick a suburb.' }, 400);
  if (!description) return json({ ok: false, error: 'Add a short description.' }, 400);

  // The modal's Category / Suburb are free-typing inputs (with suggestions),
  // so resolve whatever was typed against the real rows — by name or slug.
  const category = await db
    .prepare('SELECT id, slug, name FROM categories WHERE lower(name) = lower(?) OR slug = lower(?) LIMIT 1')
    .bind(categoryInput, categoryInput)
    .first<{ id: number; slug: string; name: string }>();
  if (!category) return json({ ok: false, error: `"${categoryInput}" isn't one of this hub's categories — pick one from the list.` }, 400);
  const suburb = await db
    .prepare('SELECT id, slug, name FROM suburbs WHERE lower(name) = lower(?) OR slug = lower(?) LIMIT 1')
    .bind(suburbInput, suburbInput)
    .first<{ id: number; slug: string; name: string }>();
  if (!suburb) return json({ ok: false, error: `"${suburbInput}" isn't one of this hub's suburbs — pick one from the list.` }, 400);

  if (id) {
    const existing = await db.prepare('SELECT id FROM businesses WHERE id = ?').bind(id).first();
    if (!existing) return json({ ok: false, error: 'Business not found.' }, 404);

    await db
      .prepare(`UPDATE businesses SET name = ?, suburb_id = ?, phone = ?, description = ?, updated_at = datetime('now') WHERE id = ?`)
      .bind(name, suburb.id, phone, description, id)
      .run();
    await db.prepare('DELETE FROM business_categories WHERE business_id = ? AND is_primary = 1').bind(id).run();
    // A business can also carry non-primary categories; INSERT OR REPLACE so
    // picking one of those as the new primary doesn't hit the composite PK.
    await db.prepare('INSERT OR REPLACE INTO business_categories (business_id, category_id, is_primary) VALUES (?, ?, 1)').bind(id, category.id).run();

    const current = await db.prepare('SELECT subscription_tier FROM businesses WHERE id = ?').bind(id).first<{ subscription_tier: number }>();
    if ((current?.subscription_tier ?? 0) !== tier) await applyTierOverride(db, id, tier);

    await logActivity(db, 'business_edited', name, `Edited by admin (${user.email}).`);
    await triggerRebuild(context.env.GITHUB_DISPATCH_TOKEN);
    return json({ ok: true, id });
  }

  // Create. insertApprovedBusiness would silently overwrite a same-name
  // listing in the same suburb (right for owner submissions, wrong here),
  // so refuse instead.
  const dupe = await db
    .prepare('SELECT id FROM businesses WHERE lower(name) = lower(?) AND suburb_id = ?')
    .bind(name, suburb.id)
    .first();
  if (dupe) return json({ ok: false, error: `"${name}" already exists in ${suburb.name}.` }, 409);

  const slug = await generateUniqueSlug(db, name, suburb.slug);
  if (!slug) return json({ ok: false, error: 'Could not generate a unique URL for that name.' }, 409);

  await insertApprovedBusiness(db, {
    slug,
    name,
    suburbId: suburb.id,
    categoryId: category.id,
    address: null,
    phone,
    website: null,
    email: null,
    description,
    ownerUserId: null,
  });

  const created = await db.prepare('SELECT id FROM businesses WHERE slug = ?').bind(slug).first<{ id: number }>();
  if (created && tier > 0) await applyTierOverride(db, created.id, tier);

  await logActivity(db, 'business_created', name, `Added by admin (${user.email}).`);
  await triggerRebuild(context.env.GITHUB_DISPATCH_TOKEN);
  return json({ ok: true, id: created?.id ?? null, slug });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
