import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { tierPriceCents, sponsorPriceCents, centsToRand } from '../../_lib/pricing';

interface Env {
  DB: D1Database;
  RESEND_API_KEY?: string;
  GITHUB_DISPATCH_TOKEN?: string;
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const db = context.env.DB;

  const submissions = await db
    .prepare('SELECT id, token, name, category_slug, suburb_slug, address, phone, email, website, description, owner_confirm_token, admin_approved_at FROM pending_submissions ORDER BY created_at DESC')
    .all<{
      id: number; token: string; name: string; category_slug: string; suburb_slug: string;
      address: string | null; phone: string | null; email: string | null; website: string | null;
      description: string; owner_confirm_token: string | null; admin_approved_at: string | null;
    }>();

  const claims = await db
    .prepare("SELECT bc.review_token, bc.contact_name, bc.contact_phone, bc.contact_email, bc.role_note, b.name AS business_name, u.email AS claimant_email FROM business_claims bc JOIN businesses b ON b.id = bc.business_id JOIN users u ON u.id = bc.user_id WHERE bc.status = 'pending' ORDER BY bc.created_at DESC")
    .all<{ review_token: string; contact_name: string | null; contact_phone: string | null; contact_email: string | null; role_note: string | null; business_name: string; claimant_email: string }>();

  // Not on the public site (fetch-d1-data.mjs only pulls status='published')
  // but still visible here — e.g. test listings hidden after publishing.
  const hidden = await db
    .prepare(
      `SELECT b.id, b.slug, b.name, b.status, b.subscription_tier, b.phone, s.name AS suburb_name,
              (SELECT c.name FROM business_categories bc JOIN categories c ON c.id = bc.category_id WHERE bc.business_id = b.id AND bc.is_primary = 1 LIMIT 1) AS category_name
       FROM businesses b LEFT JOIN suburbs s ON s.id = b.suburb_id
       WHERE b.status != 'published' ORDER BY b.name`
    )
    .all<{ id: number; slug: string; name: string; status: string; subscription_tier: number; phone: string | null; suburb_name: string | null; category_name: string | null }>();

  const reports = await db
    .prepare("SELECT id, kind, business_slug, business_name, reason, relationship, requester_email, created_at FROM reports WHERE status = 'open' ORDER BY created_at DESC")
    .all<{ id: number; kind: string; business_slug: string; business_name: string; reason: string; relationship: string | null; requester_email: string | null; created_at: string }>();

  const [businessCount, userCount] = await Promise.all([
    db.prepare("SELECT COUNT(*) AS n FROM businesses WHERE status = 'published'").first<{ n: number }>(),
    db.prepare('SELECT COUNT(*) AS n FROM users').first<{ n: number }>(),
  ]);

  // Revenue by product — tier subscriptions + sponsorship slots, all
  // currently active. Read from `subscriptions` directly (not the
  // businesses.subscription_tier cache) so it also counts sponsorship
  // rows, which don't touch that column at all.
  const activeSubs = await db
    .prepare("SELECT tier, product_type FROM subscriptions WHERE status = 'active'")
    .all<{ tier: number; product_type: string }>();
  let tierRevenueCents = 0;
  let sponsorshipRevenueCents = 0;
  for (const row of activeSubs.results) {
    if (row.product_type === 'tier') {
      tierRevenueCents += (await tierPriceCents(db, row.tier)) ?? 0;
    } else {
      sponsorshipRevenueCents += (await sponsorPriceCents(db, row.product_type as Parameters<typeof sponsorPriceCents>[1])) ?? 0;
    }
  }

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
    hidden: hidden.results,
    reports: reports.results,
    stats: {
      businesses: businessCount?.n ?? 0,
      users: userCount?.n ?? 0,
      pendingSubmissions: submissions.results.length,
      pendingClaims: claims.results.length,
      openReports: reports.results.length,
    },
    revenue: {
      tierRand: centsToRand(tierRevenueCents),
      sponsorshipRand: centsToRand(sponsorshipRevenueCents),
      totalRand: centsToRand(tierRevenueCents + sponsorshipRevenueCents),
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
