import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../_lib/auth';
import { SOCIAL_KINDS, SOCIAL_LABELS, normalizeSocial } from '../_lib/social';

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
    .prepare(
      'SELECT b.id, b.slug, b.name, b.address, b.phone, b.website, b.description, b.hours, b.owner_user_id, b.subscription_tier, b.subscription_status, b.subscription_expires_at, b.created_at, b.social_instagram, b.social_facebook, b.social_linkedin, b.social_youtube, s.name AS suburb_name FROM businesses b LEFT JOIN suburbs s ON s.id = b.suburb_id WHERE b.id = ?'
    )
    .bind(businessId)
    .first<{
      id: number; slug: string; name: string; address: string | null; phone: string | null; website: string | null; description: string; hours: string | null; owner_user_id: number | null;
      subscription_tier: number; subscription_status: string | null; subscription_expires_at: string | null; created_at: string; suburb_name: string | null;
      social_instagram: string | null; social_facebook: string | null; social_linkedin: string | null; social_youtube: string | null;
    }>();
  if (!business || (business.owner_user_id !== user.id && !isAdminEmail(user.email))) return json({ ok: false, error: 'You do not own this business.' }, 403);

  const photos = await db
    .prepare('SELECT id, r2_key, sort_order, caption FROM business_photos WHERE business_id = ? ORDER BY sort_order')
    .bind(businessId)
    .all<{ id: number; r2_key: string; sort_order: number; caption: string | null }>();

  // Real payment history for the Billing tab (PayFast ITNs recorded against this business's subscriptions).
  const payments = await db
    .prepare(
      'SELECT p.id, p.amount_cents, p.status, p.paid_at, p.invoice_number, s.tier, s.product_type FROM payments p JOIN subscriptions s ON s.id = p.subscription_id WHERE s.business_id = ? ORDER BY p.paid_at DESC, p.id DESC LIMIT 24'
    )
    .bind(businessId)
    .all<{ id: number; amount_cents: number; status: string; paid_at: string; invoice_number: string | null; tier: number; product_type: string | null }>();

  // Active sponsorship slots this business holds (category/suburb/banner/centre/guide/tourism) —
  // separate from the tier plan, shown as their own "buy/cancel" cards on the Billing tab.
  const sponsorships = await db
    .prepare(
      `SELECT product_type, product_target, current_period_end, status FROM subscriptions
       WHERE business_id = ? AND product_type != 'tier'
         AND (status = 'active' OR (status = 'cancelled' AND current_period_end IS NOT NULL AND datetime(current_period_end) > datetime('now')))
       ORDER BY id DESC`
    )
    .bind(businessId)
    .all<{ product_type: string; product_target: string | null; current_period_end: string | null; status: string }>();

  return json({
    ok: true,
    business: {
      id: business.id, slug: business.slug, created_at: business.created_at, suburb_name: business.suburb_name, name: business.name, address: business.address, phone: business.phone, website: business.website, description: business.description, hours: business.hours,
      subscription_tier: business.subscription_tier, subscription_status: business.subscription_status, subscription_expires_at: business.subscription_expires_at,
      social_instagram: business.social_instagram, social_facebook: business.social_facebook, social_linkedin: business.social_linkedin, social_youtube: business.social_youtube,
    },
    photos: photos.results,
    payments: payments.results,
    sponsorships: sponsorships.results,
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

  const business = await db.prepare('SELECT owner_user_id, subscription_tier, subscription_status FROM businesses WHERE id = ?').bind(businessId).first<{ owner_user_id: number | null; subscription_tier: number; subscription_status: string | null }>();
  if (!business || (business.owner_user_id !== user.id && !isAdminEmail(user.email))) return json({ ok: false, error: 'You do not own this business.' }, 403);

  const address = clean(body.address, 200);
  const phone = clean(body.phone, 30);
  const website = clean(body.website, 200);
  const description = clean(body.description, 600);
  const hours = clean(body.hours, 400);

  // Social links are a Featured-plan perk: saved only while the plan is active,
  // and left untouched for any other plan (never wiped by a downgrade).
  const isFeatured = (business.subscription_status === 'active' || business.subscription_status === 'cancelled') && business.subscription_tier >= 2;
  if (isFeatured) {
    const values: (string | null)[] = [];
    for (const kind of SOCIAL_KINDS) {
      const v = normalizeSocial(kind, body[`social_${kind}`]);
      if (v === undefined) {
        return json({ ok: false, error: `That doesn't look like a ${SOCIAL_LABELS[kind]} page link. Paste the full address of your page.` }, 400);
      }
      values.push(v);
    }
    await db
      .prepare('UPDATE businesses SET social_instagram = ?, social_facebook = ?, social_linkedin = ?, social_youtube = ? WHERE id = ?')
      .bind(...values, businessId)
      .run();
  }

  await db
    .prepare('UPDATE businesses SET address = ?, phone = ?, website = ?, description = COALESCE(?, description), hours = ?, updated_at = datetime(\'now\') WHERE id = ?')
    .bind(address, phone, website, description, hours, businessId)
    .run();

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
