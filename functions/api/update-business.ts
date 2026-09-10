import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../_lib/auth';

interface Env {
  DB: D1Database;
}

function clean(v: unknown, maxLen: number): string | null {
  if (typeof v !== 'string') return null;
  const trimmed = v.trim();
  if (!trimmed) return null;
  return trimmed.slice(0, maxLen);
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false, error: 'Please log in first.' }, 401);

  const businessId = Number(new URL(context.request.url).searchParams.get('id'));
  if (!businessId) return json({ ok: false, error: 'Missing business.' }, 400);

  const business = await db
    .prepare('SELECT id, slug, name, address, phone, website, description, hours, owner_user_id, subscription_tier, subscription_status, subscription_expires_at, template_id, custom_blocks, suburb_id FROM businesses WHERE id = ?')
    .bind(businessId)
    .first<{ id: number; slug: string; name: string; address: string | null; phone: string | null; website: string | null; description: string; hours: string | null; owner_user_id: number | null; subscription_tier: number; subscription_status: string | null; subscription_expires_at: string | null; template_id: string; custom_blocks: string | null; suburb_id: number | null }>();
  if (!business || (business.owner_user_id !== user.id && !isAdminEmail(user.email))) return json({ ok: false, error: 'You do not own this business.' }, 403);

  const categories = await db
    .prepare('SELECT c.slug, c.name FROM business_categories bc JOIN categories c ON c.id = bc.category_id WHERE bc.business_id = ? ORDER BY bc.is_primary DESC')
    .bind(businessId)
    .all<{ slug: string; name: string }>();
  const suburb = business.suburb_id
    ? await db.prepare('SELECT slug, name FROM suburbs WHERE id = ?').bind(business.suburb_id).first<{ slug: string; name: string }>()
    : null;

  const tier = business.subscription_status === 'active' ? business.subscription_tier : 0;
  return json({
    ok: true,
    business: {
      id: business.id, slug: business.slug, name: business.name, address: business.address, phone: business.phone, website: business.website, description: business.description, hours: business.hours,
      categories: categories.results,
      suburb: suburb ?? null,
      subscriptionTier: tier,
      subscriptionExpiresAt: business.subscription_expires_at,
      templateId: business.template_id,
      customBlocks: business.custom_blocks ? JSON.parse(business.custom_blocks) : [],
    },
  });
};

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false, error: 'Please log in first.' }, 401);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  const businessId = Number(body.businessId);
  if (!businessId) return json({ ok: false, error: 'Missing business.' }, 400);

  const business = await db
    .prepare('SELECT owner_user_id, subscription_tier, subscription_status FROM businesses WHERE id = ?')
    .bind(businessId)
    .first<{ owner_user_id: number | null; subscription_tier: number; subscription_status: string | null }>();
  if (!business || (business.owner_user_id !== user.id && !isAdminEmail(user.email))) return json({ ok: false, error: 'You do not own this business.' }, 403);

  const tier = business.subscription_status === 'active' ? business.subscription_tier : 0;

  const address = clean(body.address, 200);
  const phone = clean(body.phone, 30);
  const website = clean(body.website, 200);
  const description = clean(body.description, 600);
  const hours = clean(body.hours, 400);

  // Template choice: Featured (3) and up only — never trust a client to
  // only send this when it's actually allowed to matter, since a lapsed
  // subscription could otherwise leave a stale template_id armed for
  // when it renews.
  let templateId: string | undefined;
  if (tier >= 3 && typeof body.templateId === 'string' && ['classic', 'gallery', 'services'].includes(body.templateId)) {
    templateId = body.templateId;
  }

  // Custom blocks: Premium (4) only. Capped at 6 blocks, each field
  // length-limited — same spirit as the length caps everywhere else in
  // this codebase.
  let customBlocksJson: string | undefined;
  if (tier >= 4 && Array.isArray(body.customBlocks)) {
    const VALID_TYPES = ['story', 'specials', 'team', 'gallery'];
    const blocks = (body.customBlocks as unknown[])
      .slice(0, 6)
      .filter((b): b is Record<string, unknown> => typeof b === 'object' && b !== null)
      .map((b) => ({
        type: VALID_TYPES.includes(String(b.type)) ? String(b.type) : 'story',
        title: clean(b.title, 60) ?? '',
        body: clean(b.body, 800) ?? '',
      }))
      .filter((b) => b.title || b.body);
    customBlocksJson = JSON.stringify(blocks);
  }

  await db
    .prepare(
      `UPDATE businesses SET address = ?, phone = ?, website = ?, description = COALESCE(?, description), hours = ?,
       template_id = COALESCE(?, template_id), custom_blocks = COALESCE(?, custom_blocks), updated_at = datetime('now')
       WHERE id = ?`
    )
    .bind(address, phone, website, description, hours, templateId ?? null, customBlocksJson ?? null, businessId)
    .run();

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
