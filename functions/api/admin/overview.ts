import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { tierPriceCents, sponsorPriceCents, centsToRand } from '../../_lib/pricing';

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
    .prepare("SELECT bc.review_token, bc.contact_name, bc.contact_phone, bc.contact_email, bc.role_note, b.name AS business_name, u.email AS claimant_email FROM business_claims bc JOIN businesses b ON b.id = bc.business_id JOIN users u ON u.id = bc.user_id WHERE bc.status = 'pending' ORDER BY bc.created_at DESC")
    .all<{ review_token: string; contact_name: string | null; contact_phone: string | null; contact_email: string | null; role_note: string | null; business_name: string; claimant_email: string }>();

  const reports = await db
    .prepare("SELECT id, kind, business_slug, business_name, reason, relationship, requester_email, created_at FROM reports WHERE status = 'open' ORDER BY created_at DESC")
    .all<{ id: number; kind: string; business_slug: string; business_name: string; reason: string; relationship: string | null; requester_email: string | null; created_at: string }>();

  const [businessCount, userCount, newThisWeek, planCounts] = await Promise.all([
    db.prepare("SELECT COUNT(*) AS n FROM businesses WHERE status = 'published'").first<{ n: number }>(),
    db.prepare('SELECT COUNT(*) AS n FROM users').first<{ n: number }>(),
    db.prepare("SELECT COUNT(*) AS n FROM businesses WHERE status = 'published' AND created_at >= datetime('now', '-7 days')").first<{ n: number }>(),
    db
      .prepare("SELECT subscription_tier AS tier, COUNT(*) AS n FROM businesses WHERE subscription_tier > 0 AND subscription_status = 'active' GROUP BY subscription_tier")
      .all<{ tier: number; n: number }>(),
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
  const activeSubs = await db
    .prepare(
      `SELECT tier, product_type, COUNT(*) AS n FROM subscriptions
       WHERE status = 'active' AND m_payment_id NOT LIKE 'admin-comp-%'
         AND (current_period_end IS NULL OR current_period_end > datetime('now'))
       GROUP BY tier, product_type`
    )
    .all<{ tier: number; product_type: string; n: number }>();

  let featuredCents = 0;
  let verifiedCents = 0;
  let categorySuburbCents = 0;
  let bannerCents = 0;
  let centreCents = 0;
  let guideCents = 0;
  let tourismCents = 0;
  for (const row of activeSubs.results) {
    if (row.product_type === 'tier') {
      const each = (await tierPriceCents(db, row.tier)) ?? 0;
      if (row.tier === 2) featuredCents += each * row.n;
      else if (row.tier === 1) verifiedCents += each * row.n;
    } else {
      const each = (await sponsorPriceCents(db, row.product_type as Parameters<typeof sponsorPriceCents>[1])) ?? 0;
      if (row.product_type === 'category_sponsor' || row.product_type === 'suburb_sponsor') categorySuburbCents += each * row.n;
      else if (row.product_type === 'homepage_banner') bannerCents += each * row.n;
      else if (row.product_type === 'centre_sponsor') centreCents += each * row.n;
      else if (row.product_type === 'guide_sponsor') guideCents += each * row.n;
      else if (row.product_type === 'tourism_sponsor') tourismCents += each * row.n;
    }
  }
  const tierRevenueCents = featuredCents + verifiedCents;
  const sponsorshipRevenueCents = categorySuburbCents + bannerCents + centreCents + guideCents + tourismCents;

  return json({
    ok: true,
    submissions: submissions.results.map((s) => ({
      ...s,
      status: s.owner_confirm_token ? 'Awaiting owner confirmation' : s.admin_approved_at ? 'Approved' : 'Pending your approval',
    })),
    claims: claims.results.map((c) => ({
      businessName: c.business_name,
      claimantEmail: c.claimant_email,
      reviewToken: c.review_token,
      contactName: c.contact_name,
      contactPhone: c.contact_phone,
      contactEmail: c.contact_email,
      roleNote: c.role_note,
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
      pendingClaims: claims.results.length,
      openReports: reports.results.length,
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
        { key: 'display', label: 'Display ads', cents: bannerCents },
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

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
