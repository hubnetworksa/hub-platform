import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { getSite } from '../../_lib/site';
import { signFields, buildCheckoutParams, payfastConfigured, type PayfastEnv } from '../../_lib/payfast';
import { eventFeaturePriceCents, centsToRand } from '../../_lib/pricing';

interface Env extends PayfastEnv {
  DB: D1Database;
  SITE: string;
}

// Checkout for an owned event's "Feature this event" upgrade. Unlike a
// business tier this is a single, once-off payment (no subscription_type/
// frequency/cycles fields) — an event has a fixed date and the perk is
// meaningless past it, so there's nothing to recur or cancel. See
// functions/api/subscribe/notify.ts's "event:<id>" branch for what happens
// once PayFast confirms the payment.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false, error: 'Please log in first.' }, 401);

  if (!payfastConfigured(context.env)) {
    return json({ ok: false, error: 'Payments are not configured on this site yet.' }, 503);
  }

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  const eventId = Number(body.eventId);
  if (!eventId) return json({ ok: false, error: 'Missing event.' }, 400);

  const event = await db
    .prepare('SELECT id, title, featured, event_owner_user_id FROM events WHERE id = ?')
    .bind(eventId)
    .first<{ id: number; title: string; featured: number; event_owner_user_id: number | null }>();
  if (!event || (event.event_owner_user_id !== user.id && !isAdminEmail(user.email))) {
    return json({ ok: false, error: 'You do not manage this event.' }, 403);
  }
  if (event.featured) return json({ ok: false, error: 'This event is already featured.' }, 400);

  const amountCents = await eventFeaturePriceCents(db);
  if (!amountCents) return json({ ok: false, error: 'Featuring is not priced yet — contact us.' }, 400);

  const site = getSite(context.env.SITE);
  const amount = centsToRand(amountCents);
  const mPaymentId = crypto.randomUUID();

  await db
    .prepare(`INSERT INTO event_payments (event_id, m_payment_id, amount_cents, status) VALUES (?, ?, ?, 'pending')`)
    .bind(eventId, mPaymentId, amountCents)
    .run();

  const origin = new URL(context.request.url).origin;
  const fields: Record<string, string> = {
    merchant_id: context.env.PAYFAST_MERCHANT_ID!,
    merchant_key: context.env.PAYFAST_MERCHANT_KEY!,
    return_url: `${origin}/my-events/edit/?id=${eventId}&featured=1`,
    cancel_url: `${origin}/my-events/edit/?id=${eventId}&feature_cancelled=1`,
    notify_url: `${origin}/api/subscribe/notify`,
    name_first: user.email.split('@')[0],
    email_address: user.email,
    m_payment_id: mPaymentId,
    amount,
    item_name: `${site.siteName} — Featured event`,
    item_description: `Feature "${event.title}" on ${site.siteName} until the event date`,
    custom_str1: `event:${eventId}`,
    custom_str2: 'event_feature',
  };

  const signature = await signFields(fields, context.env.PAYFAST_PASSPHRASE!);
  const params = buildCheckoutParams(fields, signature);

  return json({ ok: true, redirectUrl: `https://${context.env.PAYFAST_HOST}/eng/process?${params.toString()}` });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
