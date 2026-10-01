import type { PagesFunction, D1Database, R2Bucket } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../_lib/auth';
import { sniffImage } from '../_lib/images';
import { requestRebuild } from '../_lib/deploy-hook';

interface Env {
  DB: D1Database;
  MEDIA: R2Bucket;
  GITHUB_DISPATCH_TOKEN?: string;
}

// One logo per business, a Verified/Featured perk (same tier rule as
// business-photos.ts). The dashboard scales the picked image to fit 512x512
// and sends WebP, so real uploads are tiny; the server still checks the
// bytes and the size. The build only shows the logo while the plan is paid
// (logoFor in src/lib/data.ts); a lapsed plan keeps logo_key and the file.
const MAX_LOGO_BYTES = 2 * 1024 * 1024;

type OwnedBusiness = {
  id: number;
  owner_user_id: number | null;
  subscription_tier: number;
  subscription_status: string | null;
  logo_key: string | null;
};

async function ownedBusiness(db: D1Database, businessId: number, userId: number, isAdmin: boolean) {
  const business = await db
    .prepare('SELECT id, owner_user_id, subscription_tier, subscription_status, logo_key FROM businesses WHERE id = ?')
    .bind(businessId)
    .first<OwnedBusiness>();
  if (!business || (business.owner_user_id !== userId && !isAdmin)) return null;
  return business;
}

// Cancelled still means paid-through: the expiry sweep drops the tier once that period ends.
function paidTier(business: OwnedBusiness): number {
  return business.subscription_status === 'active' || business.subscription_status === 'cancelled' ? business.subscription_tier : 0;
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false }, 401);

  const form = await context.request.formData();
  const businessId = Number(form.get('businessId'));
  const business = businessId && (await ownedBusiness(db, businessId, user.id, isAdminEmail(user.email)));
  if (!business) return json({ ok: false, error: 'You do not own this business.' }, 403);

  if (paidTier(business) < 1) return json({ ok: false, error: 'Logos come with the Verified and Featured plans — upgrade to add your logo.' }, 403);

  const file = form.get('logo');
  if (!(file instanceof File) || file.size === 0) return json({ ok: false, error: 'Choose a logo to upload.' }, 400);
  if (file.size > MAX_LOGO_BYTES) return json({ ok: false, error: 'Logo must be under 2MB.' }, 400);
  const bytes = await file.arrayBuffer();
  const kind = sniffImage(bytes);
  if (!kind) return json({ ok: false, error: 'Please upload a PNG, JPG or WEBP logo (SVG is not supported).' }, 400);

  // A fresh key every upload: /media/ is cached immutable, so reusing a key
  // would leave visitors on the old logo. Never the uploader's filename.
  const key = `business-logos/${businessId}/${crypto.randomUUID()}.${kind.ext}`;
  await context.env.MEDIA.put(key, bytes, { httpMetadata: { contentType: kind.contentType } });
  await db.prepare('UPDATE businesses SET logo_key = ? WHERE id = ?').bind(key, businessId).run();
  // Replacing: drop the old file only once the new one is stored and saved.
  if (business.logo_key && business.logo_key !== key) await context.env.MEDIA.delete(business.logo_key);

  await requestRebuild(context.env, 'business logo uploaded');
  return json({ ok: true, key });
};

export const onRequestDelete: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false }, 401);

  const businessId = Number(new URL(context.request.url).searchParams.get('businessId'));
  const business = businessId && (await ownedBusiness(db, businessId, user.id, isAdminEmail(user.email)));
  if (!business) return json({ ok: false, error: 'You do not own this business.' }, 403);
  if (!business.logo_key) return json({ ok: true });

  // Removing is allowed on any plan: an owner whose plan lapsed can still
  // delete the logo that's being kept for them.
  await context.env.MEDIA.delete(business.logo_key);
  await db.prepare('UPDATE businesses SET logo_key = NULL WHERE id = ?').bind(businessId).run();

  await requestRebuild(context.env, 'business logo removed');
  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
