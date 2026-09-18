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
    .prepare('SELECT id, name, address, phone, website, description, hours, owner_user_id, subscription_tier, subscription_status, subscription_expires_at FROM businesses WHERE id = ?')
    .bind(businessId)
    .first<{
      id: number; name: string; address: string | null; phone: string | null; website: string | null; description: string; hours: string | null; owner_user_id: number | null;
      subscription_tier: number; subscription_status: string | null; subscription_expires_at: string | null;
    }>();
  if (!business || (business.owner_user_id !== user.id && !isAdminEmail(user.email))) return json({ ok: false, error: 'You do not own this business.' }, 403);

  const photos = await db
    .prepare('SELECT id, r2_key, sort_order, caption FROM business_photos WHERE business_id = ? ORDER BY sort_order')
    .bind(businessId)
    .all<{ id: number; r2_key: string; sort_order: number; caption: string | null }>();

  return json({
    ok: true,
    business: {
      id: business.id, name: business.name, address: business.address, phone: business.phone, website: business.website, description: business.description, hours: business.hours,
      subscription_tier: business.subscription_tier, subscription_status: business.subscription_status, subscription_expires_at: business.subscription_expires_at,
    },
    photos: photos.results,
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

  const business = await db.prepare('SELECT owner_user_id FROM businesses WHERE id = ?').bind(businessId).first<{ owner_user_id: number | null }>();
  if (!business || (business.owner_user_id !== user.id && !isAdminEmail(user.email))) return json({ ok: false, error: 'You do not own this business.' }, 403);

  const address = clean(body.address, 200);
  const phone = clean(body.phone, 30);
  const website = clean(body.website, 200);
  const description = clean(body.description, 600);
  const hours = clean(body.hours, 400);

  await db
    .prepare('UPDATE businesses SET address = ?, phone = ?, website = ?, description = COALESCE(?, description), hours = ?, updated_at = datetime(\'now\') WHERE id = ?')
    .bind(address, phone, website, description, hours, businessId)
    .run();

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
