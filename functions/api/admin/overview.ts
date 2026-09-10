import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';

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
    .prepare("SELECT bc.review_token, bc.document_keys, b.name AS business_name, u.email AS claimant_email FROM business_claims bc JOIN businesses b ON b.id = bc.business_id JOIN users u ON u.id = bc.user_id WHERE bc.status = 'pending' ORDER BY bc.created_at DESC")
    .all<{ review_token: string; document_keys: string; business_name: string; claimant_email: string }>();

  // Not on the public site (fetch-d1-data.mjs only pulls status='published')
  // but still visible here — e.g. test listings hidden after publishing.
  const hidden = await db
    .prepare("SELECT id, slug, name, status FROM businesses WHERE status != 'published' ORDER BY name")
    .all<{ id: number; slug: string; name: string; status: string }>();

  const reports = await db
    .prepare("SELECT id, kind, business_slug, business_name, reason, relationship, requester_email, created_at FROM reports WHERE status = 'open' ORDER BY created_at DESC")
    .all<{ id: number; kind: string; business_slug: string; business_name: string; reason: string; relationship: string | null; requester_email: string | null; created_at: string }>();

  const [businessCount, userCount] = await Promise.all([
    db.prepare("SELECT COUNT(*) AS n FROM businesses WHERE status = 'published'").first<{ n: number }>(),
    db.prepare('SELECT COUNT(*) AS n FROM users').first<{ n: number }>(),
  ]);

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
      documentKeys: JSON.parse(c.document_keys) as string[],
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
    health: {
      resendConfigured: Boolean(context.env.RESEND_API_KEY),
      dispatchConfigured: Boolean(context.env.GITHUB_DISPATCH_TOKEN),
    },
  });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
