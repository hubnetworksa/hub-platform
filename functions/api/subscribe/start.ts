import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { getSite } from '../../_lib/site';
import { signFields, payfastConfigured, type PayfastEnv } from '../../_lib/payfast';

interface Env extends PayfastEnv {
  DB: D1Database;
  SITE: string;
}

// Rand amounts per tier — see the Premium Listings plan's ladder. Kept
// server-side only; never trust a client-supplied amount for what PayFast
// actually charges.
const TIER_PRICES: Record<number, number> = { 1: 50, 2: 99, 3: 199, 4: 299 };
const TIER_NAMES: Record<number, string> = { 1: 'Verified', 2: 'Verified Plus', 3: 'Featured', 4: 'Premium' };

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false, error: 'Please log in first.' }, 401);

  if (!payfastConfigured(context.env)) {
    return json({ ok: false, error: 'Subscriptions are not configured on this site yet.' }, 503);
  }

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  const businessId = Number(body.businessId);
  const tier = Number(body.tier);
  if (!businessId || !TIER_PRICES[tier]) return json({ ok: false, error: 'Choose a valid tier.' }, 400);

  const business = await db.prepare('SELECT id, name, owner_user_id FROM businesses WHERE id = ?').bind(businessId).first<{ id: number; name: string; owner_user_id: number | null }>();
  if (!business || (business.owner_user_id !== user.id && !isAdminEmail(user.email))) {
    return json({ ok: false, error: 'You do not own this business.' }, 403);
  }

  const site = getSite(context.env.SITE);
  const amount = TIER_PRICES[tier].toFixed(2);
  const mPaymentId = crypto.randomUUID();

  await db
    .prepare('INSERT INTO subscriptions (business_id, tier, m_payment_id, status) VALUES (?, ?, ?, ?)')
    .bind(businessId, tier, mPaymentId, 'pending')
    .run();

  const origin = new URL(context.request.url).origin;
  const fields: Record<string, string> = {
    merchant_id: context.env.PAYFAST_MERCHANT_ID!,
    merchant_key: context.env.PAYFAST_MERCHANT_KEY!,
    return_url: `${origin}/my-businesses/edit/?id=${businessId}&upgraded=1`,
    cancel_url: `${origin}/my-businesses/edit/?id=${businessId}&upgrade_cancelled=1`,
    notify_url: `${origin}/api/subscribe/notify`,
    name_first: user.email.split('@')[0],
    email_address: user.email,
    m_payment_id: mPaymentId,
    amount,
    item_name: `${site.siteName} — ${TIER_NAMES[tier]} listing`,
    item_description: `Monthly subscription for "${business.name}" on ${site.siteName}`,
    custom_str1: String(businessId),
    custom_int1: String(tier),
    subscription_type: '1',
    recurring_amount: amount,
    frequency: '3', // PayFast: 3 = monthly
    cycles: '0', // 0 = until cancelled
  };

  const signature = await signFields(fields, context.env.PAYFAST_PASSPHRASE!);
  const params = new URLSearchParams({ ...fields, signature });

  return json({ ok: true, redirectUrl: `https://${context.env.PAYFAST_HOST}/eng/process?${params.toString()}` });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
