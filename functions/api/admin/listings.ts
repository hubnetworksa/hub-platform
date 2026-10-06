import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { logActivity } from '../../_lib/activity-log';
import { triggerRebuild, rebuildTarget } from '../../_lib/deploy-hook';
import { generateUniqueSlug, insertApprovedBusiness } from '../../../src/lib/business-submission';
import { formatPhoneZA, whatsappDigitsZA } from '../../../src/lib/phone';
import { SOCIAL_KINDS, SOCIAL_LABELS, normalizeSocial } from '../../_lib/social';
import { looksLikeEmail } from '../../_lib/messages';
import { descriptionLimitError, toSingleParagraph } from '../../../src/lib/rich-text';

interface Env {
  DB: D1Database;
  GITHUB_DISPATCH_TOKEN?: string;
}

const PLAN_TIERS: Record<string, number> = { basic: 0, verified: 1, featured: 2 };

// Backs the Listings tab and its "New listing" / "Edit listing" modal:
//   GET  ?q=&plan=&status=&limit=&offset=  paged list across EVERY business
//                                          (published and hidden), with totals
//   GET  ?id=                              one listing, for the edit modal
//   POST {id?, name, category, suburb, phone, email?, plan, description}
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
        `SELECT b.id, b.slug, b.name, b.status, b.phone, b.email, b.description, b.short_description, b.subscription_tier, b.owner_user_id,
                b.address, b.website, b.whatsapp, b.hours, b.lat, b.lng, b.logo_key,
                b.social_instagram, b.social_facebook, b.social_linkedin, b.social_youtube,
                sc.name AS shopping_center_name,
                s.slug AS suburb_slug, s.name AS suburb_name, u.email AS owner_email,
                (SELECT c.slug FROM business_categories bc JOIN categories c ON c.id = bc.category_id WHERE bc.business_id = b.id AND bc.is_primary = 1 LIMIT 1) AS category_slug,
                (SELECT c.name FROM business_categories bc JOIN categories c ON c.id = bc.category_id WHERE bc.business_id = b.id AND bc.is_primary = 1 LIMIT 1) AS category_name
         FROM businesses b
         LEFT JOIN suburbs s ON s.id = b.suburb_id
         LEFT JOIN users u ON u.id = b.owner_user_id
         LEFT JOIN shopping_centers sc ON sc.id = b.shopping_center_id
         WHERE b.id = ?`
      )
      .bind(id)
      .first();
    if (!row) return json({ ok: false, error: 'Business not found.' }, 404);
    const extra = await db
      .prepare('SELECT c.name FROM business_categories bc JOIN categories c ON c.id = bc.category_id WHERE bc.business_id = ? AND bc.is_primary = 0 ORDER BY c.name')
      .bind(id)
      .all<{ name: string }>();
    return json({ ok: true, listing: { ...row, extra_categories: extra.results.map((r) => r.name) } });
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
  else if (status === 'closed') where.push('b.closed_at IS NOT NULL');
  const whereSql = where.length ? `WHERE ${where.join(' AND ')}` : '';

  const rows = await db
    .prepare(
      `SELECT b.id, b.slug, b.name, b.status, b.closed_at, b.subscription_tier, b.phone, s.name AS suburb_name,
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

// "example.co.za" -> "https://example.co.za"; anything that isn't a usable
// http(s) address -> undefined (a 400).
function normalizeUrl(raw: string): string | undefined {
  if (/\s/.test(raw)) return undefined;
  const v = /^https?:\/\//i.test(raw) ? raw : `https://${raw}`;
  try {
    const u = new URL(v);
    if (!u.hostname.includes('.')) return undefined;
    return u.toString();
  } catch {
    return undefined;
  }
}

interface Extras {
  sets: Record<string, string | number | null>;
  extraCategoryIds: number[] | null;
}

// Every plain-column field beyond the core ones. A field is only touched when
// the request actually carries its key (older clients never wipe data); sent
// empty it's cleared to NULL.
async function resolveExtras(db: D1Database, body: Record<string, unknown>, primaryCategoryId: number): Promise<Extras | { error: string }> {
  const sets: Record<string, string | number | null> = {};
  const has = (k: string) => typeof body[k] === 'string' || body[k] === null;

  if (has('address')) sets.address = clean(body.address, 200);
  if (has('hours')) sets.hours = clean(body.hours, 400);
  if (has('website')) {
    const raw = clean(body.website, 200);
    if (raw) {
      const u = normalizeUrl(raw);
      if (!u) return { error: "That doesn't look like a valid website address." };
      sets.website = u;
    } else sets.website = null;
  }
  if (has('whatsapp')) {
    const raw = clean(body.whatsapp, 30);
    if (raw && !whatsappDigitsZA(raw)) return { error: 'WhatsApp needs a South African cellphone number, e.g. 082 123 4567 (06x, 07x or 08x).' };
    sets.whatsapp = raw ? formatPhoneZA(raw) : null;
  }
  for (const kind of SOCIAL_KINDS) {
    const key = `social_${kind}`;
    if (!has(key)) continue;
    const v = normalizeSocial(kind, body[key]);
    if (v === undefined) return { error: `That doesn't look like a ${SOCIAL_LABELS[kind]} page link. Paste the full address of the page.` };
    sets[key] = v;
  }
  for (const [key, label, min, max] of [['lat', 'Latitude', -90, 90], ['lng', 'Longitude', -180, 180]] as const) {
    if (!(key in body)) continue;
    const v = body[key];
    const raw = typeof v === 'number' ? String(v) : typeof v === 'string' ? v.trim() : '';
    if (!raw) {
      sets[key] = null;
      continue;
    }
    const n = Number(raw);
    if (!Number.isFinite(n) || n < min || n > max) return { error: `${label} must be a number between ${min} and ${max}.` };
    sets[key] = n;
  }
  if ('lat' in sets && 'lng' in sets && (sets.lat === null) !== (sets.lng === null)) return { error: 'Set both latitude and longitude, or clear both.' };
  if (has('shopping_center')) {
    const raw = clean(body.shopping_center, 120);
    if (!raw) sets.shopping_center_id = null;
    else {
      const c = await db.prepare('SELECT id FROM shopping_centers WHERE lower(name) = lower(?) OR slug = lower(?) LIMIT 1').bind(raw, raw).first<{ id: number }>();
      if (!c) return { error: `"${raw}" isn't one of this hub's shopping centres — pick one from the list, or clear it.` };
      sets.shopping_center_id = c.id;
    }
  }

  let extraCategoryIds: number[] | null = null;
  if ('extra_categories' in body) {
    const raw = body.extra_categories;
    const names = (Array.isArray(raw) ? raw : typeof raw === 'string' ? raw.split(/[,;\n]/) : [])
      .filter((v): v is string => typeof v === 'string')
      .map((v) => v.trim())
      .filter(Boolean);
    extraCategoryIds = [];
    for (const name of names) {
      const c = await db.prepare('SELECT id FROM categories WHERE lower(name) = lower(?) OR slug = lower(?) LIMIT 1').bind(name, name).first<{ id: number }>();
      if (!c) return { error: `"${name}" isn't one of this hub's categories — pick from the list.` };
      if (c.id !== primaryCategoryId && !extraCategoryIds.includes(c.id)) extraCategoryIds.push(c.id);
    }
  }
  return { sets, extraCategoryIds };
}

async function applyExtras(db: D1Database, id: number, r: Extras): Promise<void> {
  const cols = Object.keys(r.sets);
  if (cols.length) {
    // Column names come from the fixed set in resolveExtras, never the request.
    await db
      .prepare(`UPDATE businesses SET ${cols.map((c) => `${c} = ?`).join(', ')}, updated_at = datetime('now') WHERE id = ?`)
      .bind(...cols.map((c) => r.sets[c]), id)
      .run();
  }
  if (r.extraCategoryIds) {
    await db.prepare('DELETE FROM business_categories WHERE business_id = ? AND is_primary = 0').bind(id).run();
    for (const cid of r.extraCategoryIds) {
      await db.prepare('INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary) VALUES (?, ?, 0)').bind(id, cid).run();
    }
  }
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
  const phone = formatPhoneZA(clean(body.phone, 30)) || null;
  // Limits on visible characters (rich-text.ts); over is a 400, not a cut.
  const description = typeof body.description === 'string' ? body.description.trim() || null : null;
  const longError = descriptionLimitError(description, 'long');
  if (longError) return json({ ok: false, error: longError }, 400);
  const hasShort = typeof body.short_description === 'string';
  const shortDescription = hasShort ? toSingleParagraph(body.short_description as string) || null : null;
  const shortError = descriptionLimitError(shortDescription, 'short');
  if (shortError) return json({ ok: false, error: shortError }, 400);
  // The public contact email. Only touched when sent (older callers don't);
  // sent empty, it's cleared.
  const hasEmail = typeof body.email === 'string';
  const email = hasEmail ? clean(body.email, 160) : null;
  if (email && !looksLikeEmail(email)) return json({ ok: false, error: "That doesn't look like a valid email address." }, 400);
  const tier = parsePlan(body.plan) ?? 0;

  if (!name) return json({ ok: false, error: 'Add the business name.' }, 400);
  if (!categoryInput) return json({ ok: false, error: 'Pick a category.' }, 400);
  if (!suburbInput) return json({ ok: false, error: 'Pick a suburb.' }, 400);
  if (!description) return json({ ok: false, error: 'Add a description.' }, 400);

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

  const extras = await resolveExtras(db, body, category.id);
  if ('error' in extras) return json({ ok: false, error: extras.error }, 400);

  if (id) {
    const existing = await db.prepare('SELECT id FROM businesses WHERE id = ?').bind(id).first();
    if (!existing) return json({ ok: false, error: 'Business not found.' }, 404);

    await db
      .prepare(`UPDATE businesses SET name = ?, suburb_id = ?, phone = ?, description = ?, updated_at = datetime('now') WHERE id = ?`)
      .bind(name, suburb.id, phone, description, id)
      .run();
    if (hasShort) await db.prepare('UPDATE businesses SET short_description = ? WHERE id = ?').bind(shortDescription, id).run();
    if (hasEmail) await db.prepare('UPDATE businesses SET email = ? WHERE id = ?').bind(email, id).run();
    await db.prepare('DELETE FROM business_categories WHERE business_id = ? AND is_primary = 1').bind(id).run();
    // A business can also carry non-primary categories; INSERT OR REPLACE so
    // picking one of those as the new primary doesn't hit the composite PK.
    await db.prepare('INSERT OR REPLACE INTO business_categories (business_id, category_id, is_primary) VALUES (?, ?, 1)').bind(id, category.id).run();

    await applyExtras(db, id, extras);

    const current = await db.prepare('SELECT subscription_tier FROM businesses WHERE id = ?').bind(id).first<{ subscription_tier: number }>();
    if ((current?.subscription_tier ?? 0) !== tier) await applyTierOverride(db, id, tier);

    await logActivity(db, 'business_edited', name, `Edited by admin (${user.email}).`);
    await triggerRebuild(context.env.GITHUB_DISPATCH_TOKEN, rebuildTarget(context.env));
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
    email,
    description,
    shortDescription,
    ownerUserId: null,
  });

  const created = await db.prepare('SELECT id FROM businesses WHERE slug = ?').bind(slug).first<{ id: number }>();
  if (created) await applyExtras(db, created.id, extras);
  if (created && tier > 0) await applyTierOverride(db, created.id, tier);

  await logActivity(db, 'business_created', name, `Added by admin (${user.email}).`);
  await triggerRebuild(context.env.GITHUB_DISPATCH_TOKEN, rebuildTarget(context.env));
  return json({ ok: true, id: created?.id ?? null, slug });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
