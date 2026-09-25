import type { PagesFunction, D1Database, R2Bucket } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../_lib/auth';
import { sniffImage } from '../_lib/images';

interface Env {
  DB: D1Database;
  MEDIA: R2Bucket;
}

const MAX_FILE_BYTES = 8 * 1024 * 1024; // 8MB per photo
// Photo caps by tier (0=Basic, 1=Verified, 2=Featured) — see the Premium
// Listings v2 plan. Only Featured gets photos; enforced here at upload
// time, not just hidden in the UI.
const TIER_PHOTO_CAP: Record<number, number> = { 0: 0, 1: 0, 2: 12 };

async function ownedBusiness(db: D1Database, businessId: number, userId: number, isAdmin: boolean) {
  const business = await db
    .prepare('SELECT id, owner_user_id, subscription_tier, subscription_status FROM businesses WHERE id = ?')
    .bind(businessId)
    .first<{ id: number; owner_user_id: number | null; subscription_tier: number; subscription_status: string | null }>();
  if (!business || (business.owner_user_id !== userId && !isAdmin)) return null;
  return business;
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false }, 401);

  const businessId = Number(new URL(context.request.url).searchParams.get('businessId'));
  const business = businessId && (await ownedBusiness(db, businessId, user.id, isAdminEmail(user.email)));
  if (!business) return json({ ok: false, error: 'You do not own this business.' }, 403);

  const photos = await db
    .prepare('SELECT id, r2_key, sort_order, caption FROM business_photos WHERE business_id = ? ORDER BY sort_order')
    .bind(businessId)
    .all();

  // Cancelled still means paid-through: the expiry sweep drops the tier once that period ends.
  const tier = business.subscription_status === 'active' || business.subscription_status === 'cancelled' ? business.subscription_tier : 0;
  return json({ ok: true, photos: photos.results, cap: TIER_PHOTO_CAP[tier] ?? 0 });
};

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false }, 401);

  const form = await context.request.formData();
  const businessId = Number(form.get('businessId'));
  const business = businessId && (await ownedBusiness(db, businessId, user.id, isAdminEmail(user.email)));
  if (!business) return json({ ok: false, error: 'You do not own this business.' }, 403);

  // Cancelled still means paid-through: the expiry sweep drops the tier once that period ends.
  const tier = business.subscription_status === 'active' || business.subscription_status === 'cancelled' ? business.subscription_tier : 0;
  const cap = TIER_PHOTO_CAP[tier] ?? 0;
  if (cap === 0) return json({ ok: false, error: 'Photos are a Featured-plan perk — upgrade to add photos.' }, 403);

  const existing = await db.prepare('SELECT COUNT(*) as n FROM business_photos WHERE business_id = ?').bind(businessId).first<{ n: number }>();
  if ((existing?.n ?? 0) >= cap) return json({ ok: false, error: `Your tier allows up to ${cap} photos — remove one first.` }, 400);

  const file = form.get('photo');
  if (!(file instanceof File) || file.size === 0) return json({ ok: false, error: 'Choose a photo to upload.' }, 400);
  if (file.size > MAX_FILE_BYTES) return json({ ok: false, error: 'Photo must be under 8MB.' }, 400);
  const bytes = await file.arrayBuffer();
  const kind = sniffImage(bytes);
  if (!kind) return json({ ok: false, error: 'Please upload a JPG, PNG or WEBP photo.' }, 400);

  // Never the uploader's own filename in the key: it ends up in a public URL.
  const key = `business-photos/${businessId}/${crypto.randomUUID()}.${kind.ext}`;
  await context.env.MEDIA.put(key, bytes, { httpMetadata: { contentType: kind.contentType } });

  const sortOrder = existing?.n ?? 0;
  await db.prepare('INSERT INTO business_photos (business_id, r2_key, sort_order) VALUES (?, ?, ?)').bind(businessId, key, sortOrder).run();

  return json({ ok: true, key });
};

export const onRequestDelete: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false }, 401);

  const photoId = Number(new URL(context.request.url).searchParams.get('photoId'));
  if (!photoId) return json({ ok: false, error: 'Missing photo.' }, 400);

  const photo = await db
    .prepare('SELECT bp.id, bp.r2_key, b.owner_user_id FROM business_photos bp JOIN businesses b ON b.id = bp.business_id WHERE bp.id = ?')
    .bind(photoId)
    .first<{ id: number; r2_key: string; owner_user_id: number | null }>();
  if (!photo || (photo.owner_user_id !== user.id && !isAdminEmail(user.email))) return json({ ok: false, error: 'Not found.' }, 404);

  await context.env.MEDIA.delete(photo.r2_key);
  await db.prepare('DELETE FROM business_photos WHERE id = ?').bind(photoId).run();

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
