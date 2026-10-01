import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { tierPriceCents, sponsorPriceCents, centsToRand, isSponsorProductType, type BillingPeriod } from '../../_lib/pricing';

interface Env {
  DB: D1Database;
  RESEND_API_KEY?: string;
  GITHUB_DISPATCH_TOKEN?: string;
}

// Feeds the Dashboard tab and the sidebar's nav badges (every admin page
// loads AdminShell, which calls this once). Everything here is computed from
// real tables — nothing is a demo number.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const db = context.env.DB;

  const submissions = await db
    .prepare(
      `SELECT ps.id, ps.token, ps.name, ps.category_slug, ps.suburb_slug, ps.address, ps.phone, ps.email, ps.website, ps.description,
              ps.owner_confirm_token, ps.admin_approved_at, ps.created_at, ps.chosen_tier,
              c.name AS category_name, s.name AS suburb_name
       FROM pending_submissions ps
       LEFT JOIN categories c ON c.slug = ps.category_slug
       LEFT JOIN suburbs s ON s.slug = ps.suburb_slug
       ORDER BY ps.created_at DESC`
    )
    .all<{
      id: number; token: string; name: string; category_slug: string; suburb_slug: string;
      address: string | null; phone: string | null; email: string | null; website: string | null;
      description: string; owner_confirm_token: string | null; admin_approved_at: string | null; created_at: string; chosen_tier: number;
      category_name: string | null; suburb_name: string | null;
    }>();

  const claims = await db
    .prepare("SELECT bc.id, bc.review_token, bc.contact_name, bc.contact_phone, bc.contact_email, bc.role_note, bc.created_at, b.name AS business_name, u.email AS claimant_email FROM business_claims bc JOIN businesses b ON b.id = bc.business_id JOIN users u ON u.id = bc.user_id WHERE bc.status = 'pending' ORDER BY bc.created_at DESC")
    .all<{ id: number; review_token: string; contact_name: string | null; contact_phone: string | null; contact_email: string | null; role_note: string | null; created_at: string; business_name: string; claimant_email: string }>();

  const reports = await db
    .prepare("SELECT id, kind, business_slug, business_name, reason, relationship, requester_email, created_at FROM reports WHERE status = 'open' ORDER BY created_at DESC")
    .all<{ id: number; kind: string; business_slug: string; business_name: string; reason: string; relationship: string | null; requester_email: string | null; created_at: string }>();

  const [businessCount, userCount, newThisWeek, planCounts, pendingEventClaims, pendingEventSubmissions, openEnquiries, pendingReviews] = await Promise.all([
    db.prepare("SELECT COUNT(*) AS n FROM businesses WHERE status = 'published'").first<{ n: number }>(),
    db.prepare('SELECT COUNT(*) AS n FROM users').first<{ n: number }>(),
    db.prepare("SELECT COUNT(*) AS n FROM businesses WHERE status = 'published' AND created_at >= datetime('now', '-7 days')").first<{ n: number }>(),
    db
      .prepare("SELECT subscription_tier AS tier, COUNT(*) AS n FROM businesses WHERE subscription_tier > 0 AND subscription_status = 'active' GROUP BY subscription_tier")
      .all<{ tier: number; n: number }>(),
    db.prepare("SELECT COUNT(*) AS n FROM event_claims WHERE status = 'pending'").first<{ n: number }>(),
    db.prepare("SELECT COUNT(*) AS n FROM event_submissions WHERE status = 'pending'").first<{ n: number }>(),
    db.prepare("SELECT COUNT(*) AS n FROM messages WHERE status = 'open'").first<{ n: number }>(),
    // The reviews migration may not be applied on every site yet.
    db
      .prepare("SELECT COUNT(*) AS n FROM reviews WHERE status = 'pending' OR flagged = 1")
      .first<{ n: number }>()
      .catch(() => null),
  ]);

  const featuredListings = planCounts.results.find((r) => r.tier === 2)?.n ?? 0;
  const verifiedListings = planCounts.results.find((r) => r.tier === 1)?.n ?? 0;

  const awaiting = submissions.results.filter((s) => !s.owner_confirm_token && !s.admin_approved_at);
  let oldestDays: number | null = null;
  for (const s of awaiting) {
    const days = Math.floor((Date.now() - new Date(s.created_at.replace(' ', 'T') + 'Z').getTime()) / 86_400_000);
    if (Number.isFinite(days) && (oldestDays === null || days > oldestDays)) oldestDays = days;
  }

  // Revenue by product — every currently-paying subscription row. Read from
  // `subscriptions` directly (not the businesses.subscription_tier cache) so
  // it also counts sponsorship rows, which don't touch that column at all.
  // Admin comps (m_payment_id 'admin-comp-…') and rows past their paid
  // period bring in no money, so they are left out of revenue.
  // Monthly rows count at today's monthly price, as before. A yearly row is
  // a monthly figure too: what it pays per year (its last payment, else the
  // current yearly price) spread over 12 months.
  type SubRow = { tier: number; product_type: string; n: number };
  type YearlyRow = { tier: number; product_type: string; last_paid_cents: number | null };
  let activeSubs: SubRow[];
  let yearlySubs: YearlyRow[];
  try {
    activeSubs = (
      await db
        .prepare(
          `SELECT tier, product_type, COUNT(*) AS n FROM subscriptions
           WHERE status = 'active' AND m_payment_id NOT LIKE 'admin-comp-%' AND billing_period != 'yearly'
             AND (current_period_end IS NULL OR current_period_end > datetime('now'))
           GROUP BY tier, product_type`
        )
        .all<SubRow>()
    ).results;
    yearlySubs = (
      await db
        .prepare(
          `SELECT s.tier, s.product_type,
                  (SELECT p.amount_cents FROM payments p WHERE p.subscription_id = s.id ORDER BY p.id DESC LIMIT 1) AS last_paid_cents
           FROM subscriptions s
           WHERE s.status = 'active' AND s.m_payment_id NOT LIKE 'admin-comp-%' AND s.billing_period = 'yearly'
             AND (s.current_period_end IS NULL OR s.current_period_end > datetime('now'))`
        )
        .all<YearlyRow>()
    ).results;
  } catch (err) {
    // billing_period arrives with the yearly-billing migration; until it is
    // applied on a given city's database (the preview deploy never runs
    // migrations), every subscription is monthly — count them as before.
    if (!(err instanceof Error && /no such column/i.test(err.message))) throw err;
    activeSubs = (
      await db
        .prepare(
          `SELECT tier, product_type, COUNT(*) AS n FROM subscriptions
           WHERE status = 'active' AND m_payment_id NOT LIKE 'admin-comp-%'
             AND (current_period_end IS NULL OR current_period_end > datetime('now'))
           GROUP BY tier, product_type`
        )
        .all<SubRow>()
    ).results;
    yearlySubs = [];
  }

  let featuredCents = 0;
  let verifiedCents = 0;
  let categorySuburbCents = 0;
  let bannerCents = 0;
  let centreCents = 0;
  let guideCents = 0;
  let tourismCents = 0;
  const add = (tier: number, productType: string, cents: number) => {
    if (productType === 'tier') {
      if (tier === 2) featuredCents += cents;
      else if (tier === 1) verifiedCents += cents;
    } else if (productType === 'category_sponsor' || productType === 'suburb_sponsor') categorySuburbCents += cents;
    else if (productType === 'homepage_banner') bannerCents += cents;
    else if (productType === 'centre_sponsor') centreCents += cents;
    else if (productType === 'guide_sponsor') guideCents += cents;
    else if (productType === 'tourism_sponsor') tourismCents += cents;
  };
  const priceFor = async (tier: number, productType: string, period: BillingPeriod): Promise<number> =>
    (productType === 'tier'
      ? await tierPriceCents(db, tier, period)
      : isSponsorProductType(productType)
        ? await sponsorPriceCents(db, productType, period)
        : null) ?? 0;
  for (const row of activeSubs) {
    add(row.tier, row.product_type, (await priceFor(row.tier, row.product_type, 'monthly')) * row.n);
  }
  for (const row of yearlySubs) {
    const perYear = row.last_paid_cents ?? (await priceFor(row.tier, row.product_type, 'yearly'));
    add(row.tier, row.product_type, Math.round(perYear / 12));
  }
  const tierRevenueCents = featuredCents + verifiedCents;
  const sponsorshipRevenueCents = categorySuburbCents + bannerCents + centreCents + guideCents + tourismCents;

  // Written once a day by .github/workflows/routine-health.yml (scripts/routines/health.mjs):
  // when each scheduled routine last ran for this city, and whether that is late.
  let routineHealth: { checkedAt: string; rows: { routine: string; city: string; lastRun: string | null; daysAgo: number | null; status: string }[] } | null = null;
  try {
    const row = await db.prepare("SELECT value FROM site_settings WHERE key = 'routine_health'").first<{ value: string }>();
    if (row?.value) routineHealth = JSON.parse(row.value);
  } catch {
    routineHealth = null;
  }

  return json({
    ok: true,
    routineHealth,
    submissions: submissions.results.map((s) => ({
      ...s,
      status: s.owner_confirm_token ? 'Awaiting owner confirmation' : s.admin_approved_at ? 'Approved' : 'Pending your approval',
    })),
    claims: claims.results.map((c) => ({
      id: c.id,
      businessName: c.business_name,
      claimantEmail: c.claimant_email,
      reviewToken: c.review_token,
      contactName: c.contact_name,
      contactPhone: c.contact_phone,
      contactEmail: c.contact_email,
      roleNote: c.role_note,
      createdAt: c.created_at,
      ageDays: ageInDays(c.created_at),
      expired: ageInDays(c.created_at) > CLAIM_MAX_AGE_DAYS,
    })),
    reports: reports.results,
    stats: {
      businesses: businessCount?.n ?? 0,
      users: userCount?.n ?? 0,
      newThisWeek: newThisWeek?.n ?? 0,
      featuredListings,
      verifiedListings,
      pendingSubmissions: submissions.results.length,
      awaitingReview: awaiting.length,
      oldestAwaitingDays: oldestDays,
      pendingClaims: claims.results.length + (pendingEventClaims?.n ?? 0),
      pendingBusinessClaims: claims.results.length,
      pendingEventClaims: pendingEventClaims?.n ?? 0,
      openReports: reports.results.length,
      pendingReviews: pendingReviews?.n ?? 0,
      pendingEventSubmissions: pendingEventSubmissions?.n ?? 0,
      openEnquiries: openEnquiries?.n ?? 0,
    },
    revenue: {
      tierRand: centsToRand(tierRevenueCents),
      sponsorshipRand: centsToRand(sponsorshipRevenueCents),
      totalRand: centsToRand(tierRevenueCents + sponsorshipRevenueCents),
      totalCents: tierRevenueCents + sponsorshipRevenueCents,
      rows: [
        { key: 'featured', label: 'Featured plans', cents: featuredCents },
        { key: 'verified', label: 'Verified plans', cents: verifiedCents },
        { key: 'category_suburb', label: 'Category & suburb sponsors', cents: categorySuburbCents },
        { key: 'display', label: 'Homepage banner', cents: bannerCents },
        { key: 'centre', label: 'Shopping centre sponsors', cents: centreCents },
        { key: 'guide', label: 'Guide sponsors', cents: guideCents },
        { key: 'tourism', label: 'Things to do sponsors', cents: tourismCents },
      ],
    },
    health: {
      resendConfigured: Boolean(context.env.RESEND_API_KEY),
      dispatchConfigured: Boolean(context.env.GITHUB_DISPATCH_TOKEN),
    },
  });
};

// Same window functions/api/review-claim.ts enforces; older claims can only
// be dismissed via /api/admin/claims.
const CLAIM_MAX_AGE_DAYS = 14;

function ageInDays(createdAt: string): number {
  const ms = Date.parse(createdAt.includes('T') ? createdAt : createdAt.replace(' ', 'T') + 'Z');
  return Number.isFinite(ms) ? (Date.now() - ms) / 86_400_000 : 0;
}

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
