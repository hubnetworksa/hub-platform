import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../_lib/auth';
import { SOCIAL_KINDS, SOCIAL_LABELS, normalizeSocial } from '../_lib/social';
import { requestRebuild } from '../_lib/deploy-hook';
import { looksLikeEmail } from '../_lib/messages';
import { formatPhoneZA, whatsappDigitsZA } from '../../src/lib/phone';
import { descriptionLimitError, toSingleParagraph } from '../../src/lib/rich-text';

interface Env {
  DB: D1Database;
  GITHUB_DISPATCH_TOKEN?: string;
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
      `SELECT b.id, b.slug, b.name, b.address, b.phone, b.website, b.email, b.description, b.short_description, b.hours, b.owner_user_id,
              b.subscription_tier, b.subscription_status, b.subscription_expires_at, b.created_at,
              b.social_instagram, b.social_facebook, b.social_linkedin, b.social_youtube, b.logo_key, b.whatsapp,
              b.status, b.closed_at, s.name AS suburb_name,
              (SELECT ts.billing_period FROM subscriptions ts
               WHERE ts.business_id = b.id AND ts.product_type = 'tier' AND ts.status IN ('active', 'cancelled')
               ORDER BY ts.id DESC LIMIT 1) AS billing_period,
              (SELECT c.name FROM business_categories bc JOIN categories c ON c.id = bc.category_id WHERE bc.business_id = b.id AND bc.is_primary = 1 LIMIT 1) AS category_name
       FROM businesses b LEFT JOIN suburbs s ON s.id = b.suburb_id WHERE b.id = ?`
    )
    .bind(businessId)
    .first<{
      id: number; slug: string; name: string; address: string | null; phone: string | null; website: string | null; email: string | null; description: string; short_description: string | null; hours: string | null; owner_user_id: number | null;
      subscription_tier: number; subscription_status: string | null; subscription_expires_at: string | null; created_at: string; suburb_name: string | null;
      social_instagram: string | null; social_facebook: string | null; social_linkedin: string | null; social_youtube: string | null; logo_key: string | null; whatsapp: string | null;
      status: string; closed_at: string | null; category_name: string | null; billing_period: string | null;
    }>();
  if (!business || (business.owner_user_id !== user.id && !isAdminEmail(user.email))) return json({ ok: false, error: 'You do not own this business.' }, 403);

  const photos = await db
    .prepare('SELECT id, r2_key, sort_order, caption FROM business_photos WHERE business_id = ? ORDER BY sort_order')
    .bind(businessId)
    .all<{ id: number; r2_key: string; sort_order: number; caption: string | null }>();

  // Real payment history for the Billing tab (PayFast ITNs recorded against
  // this business's subscriptions). product_target is included so a
  // sponsorship payment can say which slot it was for (Category sponsor,
  // Suburb sponsor, etc.), not just the generic product type — an owner
  // holding more than one sponsorship couldn't otherwise tell them apart.
  const payments = await db
    .prepare(
      'SELECT p.id, p.amount_cents, p.status, p.paid_at, p.invoice_number, s.tier, s.product_type, s.product_target FROM payments p JOIN subscriptions s ON s.id = p.subscription_id WHERE s.business_id = ? ORDER BY p.paid_at DESC, p.id DESC LIMIT 24'
    )
    .bind(businessId)
    .all<{ id: number; amount_cents: number; status: string; paid_at: string; invoice_number: string | null; tier: number; product_type: string | null; product_target: string | null }>();

  // Active sponsorship slots this business holds (category/suburb/banner/centre/guide/tourism) —
  // separate from the tier plan, shown as their own "buy/cancel" cards on the Billing tab.
  const sponsorships = await db
    .prepare(
      `SELECT product_type, product_target, current_period_end, status, billing_period FROM subscriptions
       WHERE business_id = ? AND product_type != 'tier'
         AND (status = 'active' OR (status = 'cancelled' AND current_period_end IS NOT NULL AND datetime(current_period_end) > datetime('now')))
       ORDER BY id DESC`
    )
    .bind(businessId)
    .all<{ product_type: string; product_target: string | null; current_period_end: string | null; status: string; billing_period: string }>();

  // Dashboard stats are a paid-plan feature (owner decision 2026-09-30): a
  // free (Basic) listing gets `stats: null` and no search terms, and the
  // dashboard shows the tiles locked with an upgrade prompt. A cancelled
  // plan keeps its stats until the paid period runs out, like every other
  // perk. Enforced here, not just hidden client-side, so the numbers never
  // leave the server for a free listing.
  const statsUnlocked = (business.subscription_status === 'active' || business.subscription_status === 'cancelled') && business.subscription_tier >= 1;

  // Real page-view/click counts (see functions/api/track-view.ts and the
  // business_stats migration) over the last 30 days. has_any distinguishes
  // "genuinely zero traffic in the window" from "tracking only just went
  // live for this business" — the Overview tab shows "No data yet" only
  // for the latter, never a fabricated number for either.
  let stats: { has_any: boolean; views: number; phone_clicks: number; website_clicks: number; search_appearances: number } | null = null;
  if (statsUnlocked) {
    const statsRows = await db
      .prepare(`SELECT event, COUNT(*) AS n FROM business_stats WHERE business_id = ? AND created_at > datetime('now', '-30 days') GROUP BY event`)
      .bind(businessId)
      .all<{ event: string; n: number }>();
    const hasAnyStats = await db.prepare('SELECT 1 FROM business_stats WHERE business_id = ? LIMIT 1').bind(businessId).first();
    const statsByEvent = Object.fromEntries(statsRows.results.map((r) => [r.event, r.n]));
    stats = {
      has_any: !!hasAnyStats,
      views: statsByEvent.view ?? 0,
      phone_clicks: statsByEvent.phone_click ?? 0,
      website_clicks: statsByEvent.website_click ?? 0,
      search_appearances: statsByEvent.search_appearance ?? 0,
    };
  }

  // Real enquiries sent through this business's own page (see
  // functions/api/enquiry.ts, which already saves every one — the owner
  // dashboard just never read them back before now). Read-only: resolving
  // or deleting a message stays an admin-only action in admin/messages.ts.
  const enquiries = await db
    .prepare(
      `SELECT id, name, contact, message, created_at FROM messages WHERE kind = 'enquiry' AND business_slug = ? ORDER BY created_at DESC LIMIT 50`
    )
    .bind(business.slug)
    .all<{ id: number; name: string | null; contact: string; message: string; created_at: string }>();
  const enquiriesTotal = await db
    .prepare(`SELECT COUNT(*) AS n FROM messages WHERE kind = 'enquiry' AND business_slug = ?`)
    .bind(business.slug)
    .first<{ n: number }>();
  const enquiriesRecent = await db
    .prepare(`SELECT COUNT(*) AS n FROM messages WHERE kind = 'enquiry' AND business_slug = ? AND created_at > datetime('now', '-30 days')`)
    .bind(business.slug)
    .first<{ n: number }>();

  // The actual words behind the "Search appearances" count (see the
  // search_terms migration and track-view.ts). Tolerates a database the
  // migration hasn't reached yet — the rest of the dashboard must still load.
  let searchTerms: { query: string; n: number }[] = [];
  if (statsUnlocked) try {
    const terms = await db
      .prepare(
        `SELECT query, COUNT(*) AS n FROM business_stats
         WHERE business_id = ? AND event = 'search_appearance' AND query IS NOT NULL AND created_at > datetime('now', '-30 days')
         GROUP BY query ORDER BY n DESC LIMIT 8`
      )
      .bind(businessId)
      .all<{ query: string; n: number }>();
    searchTerms = terms.results;
  } catch {
    searchTerms = [];
  }

  // Every review on this business, any status — this IS the owner's
  // "oversight": they see a review the moment it's submitted (Pending),
  // not only once an admin approves it. They can reply or flag it (see
  // functions/api/review-reply.ts / flag-review.ts) but never remove it.
  const reviews = await db
    .prepare(
      `SELECT id, rating, author_name, comment, status, flagged, owner_reply, owner_reply_at, created_at
       FROM reviews WHERE business_id = ? ORDER BY created_at DESC LIMIT 50`
    )
    .bind(businessId)
    .all<{ id: number; rating: number; author_name: string; comment: string; status: string; flagged: number; owner_reply: string | null; owner_reply_at: string | null; created_at: string }>();
  const reviewsTotal = await db.prepare(`SELECT COUNT(*) AS n FROM reviews WHERE business_id = ?`).bind(businessId).first<{ n: number }>();

  return json({
    ok: true,
    business: {
      id: business.id, slug: business.slug, created_at: business.created_at, suburb_name: business.suburb_name, category_name: business.category_name,
      name: business.name, address: business.address, phone: business.phone, website: business.website, email: business.email, description: business.description, short_description: business.short_description, hours: business.hours,
      subscription_tier: business.subscription_tier, subscription_status: business.subscription_status, subscription_expires_at: business.subscription_expires_at,
      // The live tier subscription's billing period ('monthly' | 'yearly'), for the Billing card.
      billing_period: business.billing_period ?? 'monthly',
      social_instagram: business.social_instagram, social_facebook: business.social_facebook, social_linkedin: business.social_linkedin, social_youtube: business.social_youtube,
      // Logo (Verified/Featured perk) — the dashboard's Logo card previews it.
      logo_key: business.logo_key,
      // WhatsApp number (Featured perk): editable on Featured, shown locked below it.
      whatsapp: business.whatsapp,
      // Whether the business currently shows on the public site at all —
      // an admin can hide a listing (status != 'published') and the
      // automated closed-business check can flag one as closed
      // (closed_at); both remove it from every rebuild
      // (scripts/fetch-d1-data.mjs), independent of the plan. The owner
      // dashboard has to say so plainly, since nothing else would.
      visible: business.status === 'published' && !business.closed_at,
      hidden_reason: business.status !== 'published' ? 'admin_hidden' : business.closed_at ? 'marked_closed' : null,
    },
    photos: photos.results,
    payments: payments.results,
    sponsorships: sponsorships.results,
    stats,
    statsLocked: !statsUnlocked,
    enquiries: enquiries.results,
    enquiriesTotal: enquiriesTotal?.n ?? 0,
    enquiriesRecent: enquiriesRecent?.n ?? 0,
    searchTerms,
    reviews: reviews.results,
    reviewsTotal: reviewsTotal?.n ?? 0,
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

  const business = await db.prepare('SELECT owner_user_id, subscription_tier, subscription_status, whatsapp FROM businesses WHERE id = ?').bind(businessId).first<{ owner_user_id: number | null; subscription_tier: number; subscription_status: string | null; whatsapp: string | null }>();
  if (!business || (business.owner_user_id !== user.id && !isAdminEmail(user.email))) return json({ ok: false, error: 'You do not own this business.' }, 403);

  const address = clean(body.address, 200);
  const phone = formatPhoneZA(clean(body.phone, 30)) || null;
  const website = clean(body.website, 200);
  // Limits count visible characters (markers excluded) — see rich-text.ts.
  // Over the limit is a clear 400 now, not a silent cut mid-sentence.
  const description = typeof body.description === 'string' ? body.description.trim() || null : null;
  const longError = descriptionLimitError(description, 'long');
  if (longError) return json({ ok: false, error: longError }, 400);
  // Optional. Only touched when the form sends it (older clients don't);
  // sent empty, it's cleared.
  const hasShort = typeof body.short_description === 'string';
  const shortDescription = hasShort ? toSingleParagraph(body.short_description as string) || null : null;
  const shortError = descriptionLimitError(shortDescription, 'short');
  if (shortError) return json({ ok: false, error: shortError }, 400);
  const hours = clean(body.hours, 400);
  const email = clean(body.email, 160);
  if (email && !looksLikeEmail(email)) {
    return json({ ok: false, error: 'That doesn\'t look like a valid email address.' }, 400);
  }

  // Social links are a Featured-plan perk: saved only while the plan is active,
  // and left untouched for any other plan (never wiped by a downgrade).
  const isFeatured = (business.subscription_status === 'active' || business.subscription_status === 'cancelled') && business.subscription_tier >= 2;

  // WhatsApp number, also a Featured-plan perk. Only touched when the form
  // sends it (the dashboard disables, and so omits, the field below Featured);
  // sent empty, it's cleared. A non-Featured listing sending its stored value
  // back unchanged is a no-op; trying to change it is refused outright.
  let whatsapp: string | null | undefined;
  if (typeof body.whatsapp === 'string') {
    const raw = clean(body.whatsapp, 30);
    const comparable = (v: string | null) => (v ? whatsappDigitsZA(v) ?? v.trim() : '');
    if (!isFeatured) {
      if (comparable(raw) !== comparable(business.whatsapp)) {
        return json({ ok: false, error: 'The WhatsApp button is a Featured-plan perk. Upgrade to Featured under Billing to add a WhatsApp number.' }, 403);
      }
    } else {
      if (raw && !whatsappDigitsZA(raw)) {
        return json({ ok: false, error: 'WhatsApp needs a South African cellphone number, e.g. 082 123 4567 or +27 82 123 4567 (06x, 07x or 08x; not a landline or 086/080 number).' }, 400);
      }
      whatsapp = raw ? formatPhoneZA(raw) : null;
    }
  }

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
    .prepare('UPDATE businesses SET address = ?, phone = ?, website = ?, email = ?, description = COALESCE(?, description), hours = ?, updated_at = datetime(\'now\') WHERE id = ?')
    .bind(address, phone, website, email, description, hours, businessId)
    .run();
  if (hasShort) {
    await db.prepare('UPDATE businesses SET short_description = ? WHERE id = ?').bind(shortDescription, businessId).run();
  }
  if (whatsapp !== undefined) {
    await db.prepare('UPDATE businesses SET whatsapp = ? WHERE id = ?').bind(whatsapp, businessId).run();
  }

  // Every field just saved (and the social links above, when applicable) is
  // shown on the public page — without this the owner sees "Saved." but the
  // live site keeps showing what was there before.
  await requestRebuild(context.env, 'business edited by owner');

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
