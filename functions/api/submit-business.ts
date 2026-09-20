import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSite } from '../_lib/site';
import { getSessionUser } from '../_lib/auth';
import { signFields, payfastConfigured, type PayfastEnv } from '../_lib/payfast';
import { TIER_NAMES, tierPriceCents, centsToRand } from '../_lib/pricing';
import { sendEmail } from '../_lib/send-email';
import { escapeHtml } from '../../src/lib/business-submission';

interface Env extends PayfastEnv {
  DB: D1Database;
  SITE: string;
  RESEND_API_KEY?: string;
}

// Submissions no longer publish immediately — they're held in
// pending_submissions until manually approved via the review link
// (functions/verify-listing.ts + functions/api/confirm-listing.ts). The
// checks below (honeypot, minimum time-on-form, length caps, raw-tag
// rejection) still matter as the first filter before a human ever sees it.
//
// The admin is emailed about each new submission by this function, straight
// after it is saved (best-effort — the saved row is what matters). The
// visitor's own mail app is never used. Trading hours and the shopping centre
// the form collects have no database column yet, so they travel only in that
// email for the reviewer.

const MAX_LEN: Record<string, number> = {
  name: 120,
  address: 200,
  phone: 30,
  email: 120,
  website: 200,
  description: 600,
  hours: 300,
  centre: 120,
};

function clean(v: unknown, field: string): string | null {
  if (typeof v !== 'string') return null;
  const trimmed = v.trim();
  if (!trimmed) return null;
  if (trimmed.length > (MAX_LEN[field] ?? 200)) return null;
  if (/<[a-z]/i.test(trimmed)) return null; // reject anything that looks like an HTML tag
  return trimmed;
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  // Honeypot — real users never fill this in, bots filling every field do.
  if (typeof body.company_url === 'string' && body.company_url.trim() !== '') {
    return json({ ok: false, error: 'Submission rejected.' }, 400);
  }
  // Minimum time-on-form — catches scripted instant-submits.
  const loadedAt = Number(body.loadedAt);
  if (!loadedAt || Date.now() - loadedAt < 3000) {
    return json({ ok: false, error: 'Submission rejected.' }, 400);
  }

  const name = clean(body.name, 'name');
  const categorySlug = typeof body.category === 'string' ? body.category.trim() : '';
  const suburbSlug = typeof body.suburb === 'string' ? body.suburb.trim() : '';
  if (!name || name.length < 2 || !categorySlug || !suburbSlug) {
    return json({ ok: false, error: 'Name, category and suburb are required.' }, 400);
  }

  const address = clean(body.address, 'address');
  const phone = clean(body.phone, 'phone');
  const email = clean(body.email, 'email');
  const website = clean(body.website, 'website');
  const description = clean(body.description, 'description') ?? `${name} is a business in ${suburbSlug.replace(/-/g, ' ')}, part of the Greater ${site.cityLabel} area.`;

  const db = context.env.DB;

  const category = await db.prepare('SELECT id, name FROM categories WHERE slug = ?').bind(categorySlug).first<{ id: number; name: string }>();
  const suburb = await db.prepare('SELECT id, name FROM suburbs WHERE slug = ?').bind(suburbSlug).first<{ id: number; name: string }>();
  if (!category || !suburb) {
    return json({ ok: false, error: 'Unknown category or suburb.' }, 400);
  }

  // Not required (anonymous submission is still allowed), but if the
  // submitter is logged in this lets the eventual published business show
  // up under their "My Businesses" once approved+confirmed.
  const sessionUser = await getSessionUser(context.request, db);

  // Plan chosen at signup (0=Basic/Free, 1=Verified, 2=Featured) — see the
  // Premium Listings v2 plan. Purely additive: an invalid/missing value or
  // a payfast misconfiguration just falls back to a free (tier 0)
  // submission rather than blocking the listing itself.
  const chosenTier = [0, 1, 2].includes(Number(body.chosenTier)) ? Number(body.chosenTier) : 0;

  const token = crypto.randomUUID();
  const insert = await db
    .prepare(
      `INSERT INTO pending_submissions
        (token, name, category_slug, suburb_slug, address, phone, email, website, description, submitted_by_user_id, chosen_tier)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`
    )
    .bind(token, name, categorySlug, suburbSlug, address, phone, email, website, description, sessionUser?.id ?? null, chosenTier)
    .run();
  const submissionId = insert.meta.last_row_id;

  const reviewUrl = `https://${site.domain}/verify-listing?token=${token}`;

  // Tell the admin there is a listing to review. Hours and shopping centre
  // are free text from the form (no column for them yet), for the reviewer only.
  const hours = clean(body.hours, 'hours');
  const centre = clean(body.centre, 'centre');
  const details = [
    `Name: ${name}`,
    `Category: ${category.name}`,
    `Suburb: ${suburb.name}`,
    ...(address ? [`Address: ${address}`] : []),
    ...(centre ? [`Shopping centre: ${centre}`] : []),
    ...(phone ? [`Phone: ${phone}`] : []),
    ...(email ? [`Email: ${email}`] : []),
    ...(website ? [`Website: ${website}`] : []),
    ...(hours ? [`Trading hours: ${hours}`] : []),
    ...(description ? [`Description: ${description}`] : []),
    `Plan chosen: ${TIER_NAMES[chosenTier]}`,
    ...(sessionUser ? [`Submitted by account: ${sessionUser.email}`] : []),
  ];
  await sendEmail(context.env, {
    from: `${site.siteName} <${site.contactEmail}>`,
    to: site.contactEmail,
    subject: `New business listing to review: ${name}`,
    replyTo: email ?? sessionUser?.email ?? undefined,
    text: `A new business listing was submitted on ${site.siteName}.\n\n${details.join('\n')}\n\nReview & approve: ${reviewUrl}`,
    html: `<div style="font-family:sans-serif;max-width:520px">
      <h2>New business listing to review</h2>
      <p>${details.map((d) => escapeHtml(d)).join('<br>')}</p>
      <p><a href="${reviewUrl}">Review &amp; approve</a></p></div>`,
  });

  // No paid tier chosen — nothing more to do.
  if (chosenTier === 0 || !payfastConfigured(context.env)) {
    return json({ ok: true, reviewUrl });
  }

  // Paid tier: build the PayFast checkout right here rather than a second
  // round trip to subscribe/start.ts — there's no `businesses` row (and so
  // no owning session) for that endpoint to authorize against yet. The
  // submission itself is the only thing identifying this payment; the
  // tier is actually applied once the listing is approved+confirmed (see
  // business-submission.ts's insertApprovedBusiness) via the
  // "submission:<id>" branch of subscribe/notify.ts.
  const priceCents = await tierPriceCents(db, chosenTier);
  if (!priceCents) return json({ ok: true, reviewUrl });

  const amount = centsToRand(priceCents);
  const mPaymentId = crypto.randomUUID();
  await db
    .prepare(`UPDATE pending_submissions SET m_payment_id = ?, payment_status = 'pending' WHERE id = ?`)
    .bind(mPaymentId, submissionId)
    .run();

  const origin = new URL(context.request.url).origin;
  const contactEmail = email ?? site.contactEmail;
  const fields: Record<string, string> = {
    merchant_id: context.env.PAYFAST_MERCHANT_ID!,
    merchant_key: context.env.PAYFAST_MERCHANT_KEY!,
    return_url: `https://${site.domain}/list-your-business/checkout/?paid=1`,
    cancel_url: `https://${site.domain}/list-your-business/checkout/?payment_cancelled=1`,
    notify_url: `${origin}/api/subscribe/notify`,
    name_first: name,
    email_address: contactEmail,
    m_payment_id: mPaymentId,
    amount,
    item_name: `${site.siteName} — ${TIER_NAMES[chosenTier]} listing`,
    item_description: `Monthly subscription for "${name}" on ${site.siteName} (applies once your listing is approved)`,
    custom_str1: `submission:${submissionId}`,
    custom_str2: 'tier',
    custom_int1: String(chosenTier),
    subscription_type: '1',
    recurring_amount: amount,
    frequency: '3',
    cycles: '0',
  };
  const signature = await signFields(fields, context.env.PAYFAST_PASSPHRASE!);
  const params = new URLSearchParams({ ...fields, signature });
  const redirectUrl = `https://${context.env.PAYFAST_HOST}/eng/process?${params.toString()}`;

  return json({ ok: true, reviewUrl, redirectUrl });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
