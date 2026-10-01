import type { PagesFunction, D1Database, R2Bucket } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../_lib/auth';
import { sniffImage } from '../_lib/images';
import { requestRebuild } from '../_lib/deploy-hook';

interface Env {
  DB: D1Database;
  MEDIA: R2Bucket;
  GITHUB_DISPATCH_TOKEN?: string;
}

// The dashboard resizes every photo to at most 1600px on its longest side
// and sends WebP (JPEG where the browser can't encode WebP), so real uploads
// are a few hundred KB whatever the phone shot. This cap is only a backstop
// for a browser that couldn't resize; the bytes are still sniffed below.
const MAX_FILE_BYTES = 8 * 1024 * 1024;
// Photo caps by tier (0=Basic, 1=Verified, 2=Featured) — see the Premium
// pricing page: Verified up to 4, Featured up to 10. Enforced here at
// upload time, and the public page shows no more than the current cap.
const TIER_PHOTO_CAP: Record<number, number> = { 0: 0, 1: 4, 2: 10 };

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
  if (cap === 0) return json({ ok: false, error: 'Photos come with the Verified and Featured plans — upgrade to add photos.' }, 403);

  const existing = await db.prepare('SELECT COUNT(*) as n FROM business_photos WHERE business_id = ?').bind(businessId).first<{ n: number }>();
  if ((existing?.n ?? 0) >= cap) return json({ ok: false, error: `Your tier allows up to ${cap} photos — remove one first.` }, 400);

  const file = form.get('photo');
  if (!(file instanceof File) || file.size === 0) return json({ ok: false, error: 'Choose a photo to upload.' }, 400);
  if (file.size > MAX_FILE_BYTES) return json({ ok: false, error: 'Photo must be under 8MB.' }, 400);
  const bytes = await file.arrayBuffer();
  const kind = sniffImage(bytes);
  if (!kind) {
    // HEIC/HEIF (iPhone): an ISO-BMFF "ftyp" box with a HEIF brand. Only
    // reached when the browser couldn't convert it (see preparePhoto).
    const head = String.fromCharCode(...new Uint8Array(bytes.slice(4, 12)));
    const heic = /^ftyp(heic|heix|hevc|hevx|heim|heis|mif1|msf1)$/.test(head);
    const error = heic
      ? "That's an iPhone HEIC photo, which can't be shown on the web. Export it as a JPG (or set Camera > Formats to Most Compatible) and try again."
      : 'Please upload a JPG, PNG or WEBP photo.';
    return json({ ok: false, error }, 400);
  }

  // Never the uploader's own filename in the key: it ends up in a public URL.
  const key = `business-photos/${businessId}/${crypto.randomUUID()}.${kind.ext}`;
  await context.env.MEDIA.put(key, bytes, { httpMetadata: { contentType: kind.contentType } });

  // After the last photo, not at COUNT(*): once one is removed the count
  // would hand out a sort_order that's already taken.
  const row = await db
    .prepare(
      `INSERT INTO business_photos (business_id, r2_key, sort_order)
       VALUES (?, ?, (SELECT COALESCE(MAX(sort_order) + 1, 0) FROM business_photos WHERE business_id = ?))
       RETURNING id, sort_order`
    )
    .bind(businessId, key, businessId)
    .first<{ id: number; sort_order: number }>();

  await requestRebuild(context.env, 'business photo uploaded');
  return json({ ok: true, key, id: row?.id ?? null, sort_order: row?.sort_order ?? null });
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

  await requestRebuild(context.env, 'business photo removed');
  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
