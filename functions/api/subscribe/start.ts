import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { getSite } from '../../_lib/site';
import { signFields, payfastConfigured, type PayfastEnv } from '../../_lib/payfast';
import {
  TIER_NAMES,
  isSlotTaken,
  isSponsorProductType,
  sponsorPriceCents,
  sponsorProductLabel,
  tierPriceCents,
  centsToRand,
  type SponsorProductType,
} from '../../_lib/pricing';

interface Env extends PayfastEnv {
  DB: D1Database;
  SITE: string;
}

// Checkout for an EXISTING, owned business — either a tier upgrade
// ({businessId, tier}) or an exclusive sponsorship purchase ({businessId,
// productType, productTarget?}). A new (not-yet-approved) submission's
// tier checkout is a separate, session-less flow started inline from
// functions/api/submit-business.ts instead — see that file and
// functions/api/subscribe/notify.ts's submission-scoped branch.
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
  if (!businessId) return json({ ok: false, error: 'Missing business.' }, 400);

  const business = await db
    .prepare('SELECT id, name, owner_user_id FROM businesses WHERE id = ?')
    .bind(businessId)
    .first<{ id: number; name: string; owner_user_id: number | null }>();
  if (!business || (business.owner_user_id !== user.id && !isAdminEmail(user.email))) {
    return json({ ok: false, error: 'You do not own this business.' }, 403);
  }

  const isSponsorPurchase = typeof body.productType === 'string' && body.productType !== 'tier';

  let amountCents: number | null;
  let itemName: string;
  let productType: 'tier' | SponsorProductType;
  let productTarget: string | null;
  let tier: number;

  if (isSponsorPurchase) {
    if (!isSponsorProductType(body.productType)) return json({ ok: false, error: 'Unknown sponsorship product.' }, 400);
    productType = body.productType;
    productTarget = typeof body.productTarget === 'string' && body.productTarget ? body.productTarget : null;
    if (productType !== 'homepage_banner' && !productTarget) {
      return json({ ok: false, error: 'Missing sponsorship target.' }, 400);
    }
    if (await isSlotTaken(db, productType, productTarget)) {
      return json({ ok: false, error: 'That spot is already sold — check back later.' }, 409);
    }
    amountCents = await sponsorPriceCents(db, productType);
    itemName = sponsorProductLabel(productType, productTarget);
    tier = 0;
  } else {
    tier = Number(body.tier);
    if (!tier) return json({ ok: false, error: 'Choose a valid tier.' }, 400);
    amountCents = await tierPriceCents(db, tier);
    itemName = `${TIER_NAMES[tier] ?? 'Listing'} listing`;
    productType = 'tier';
    productTarget = null;
  }

  if (!amountCents) return json({ ok: false, error: 'That product is not priced yet — contact us.' }, 400);

  const site = getSite(context.env.SITE);
  const amount = centsToRand(amountCents);
  const mPaymentId = crypto.randomUUID();

  await db
    .prepare(
      `INSERT INTO subscriptions (business_id, tier, product_type, product_target, m_payment_id, status)
       VALUES (?, ?, ?, ?, ?, 'pending')`
    )
    .bind(businessId, tier, productType, productTarget, mPaymentId)
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
    item_name: `${site.siteName} — ${itemName}`,
    item_description: `Monthly subscription for "${business.name}" on ${site.siteName}`,
    custom_str1: `business:${businessId}`,
    custom_str2: productType,
    custom_str3: productTarget ?? '',
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
