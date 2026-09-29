import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { logActivity } from '../../_lib/activity-log';
import { requestRebuild } from '../../_lib/deploy-hook';

interface Env {
  DB: D1Database;
  GITHUB_DISPATCH_TOKEN?: string;
  REBUILD_WORKFLOW?: string;
  REBUILD_REF?: string;
}

interface ClaimRow {
  id: number;
  event_id: number;
  user_id: number;
  status: string;
  created_at: string;
  contact_name: string | null;
  contact_phone: string | null;
  contact_email: string | null;
  role_note: string | null;
  event_title: string;
  event_slug: string | null;
  claimant_email: string;
}

const SELECT = `SELECT ec.id, ec.event_id, ec.user_id, ec.status, ec.created_at, ec.contact_name, ec.contact_phone, ec.contact_email, ec.role_note,
                       e.title AS event_title, e.slug AS event_slug, u.email AS claimant_email
                FROM event_claims ec JOIN events e ON e.id = ec.event_id JOIN users u ON u.id = ec.user_id`;

// Admin-side twin of the emailed /review-event-claim?token= flow
// (functions/api/review-event-claim.ts): same state transitions, no token
// or 14-day window needed because the session is already an admin's.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const rows = await context.env.DB.prepare(`${SELECT} WHERE ec.status = 'pending' ORDER BY ec.created_at DESC`).all<ClaimRow>();
  return json({
    ok: true,
    claims: rows.results.map((c) => ({
      id: c.id,
      eventTitle: c.event_title,
      eventSlug: c.event_slug,
      claimantEmail: c.claimant_email,
      contactName: c.contact_name,
      contactPhone: c.contact_phone,
      contactEmail: c.contact_email,
      roleNote: c.role_note,
      createdAt: c.created_at,
    })),
  });
};

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }
  const id = Number(body.id);
  if (!id) return json({ ok: false, error: 'Missing id.' }, 400);
  if (body.action !== 'approve' && body.action !== 'reject') return json({ ok: false, error: 'Unknown action.' }, 400);
  const db = context.env.DB;

  const claim = await db.prepare(`${SELECT} WHERE ec.id = ?`).bind(id).first<ClaimRow>();
  if (!claim || claim.status !== 'pending') return json({ ok: false, error: 'That claim was already actioned.' }, 404);

  if (body.action === 'reject') {
    await db.prepare("UPDATE event_claims SET status = 'rejected', reviewed_at = datetime('now') WHERE id = ?").bind(claim.id).run();
    await logActivity(db, 'event_claim_rejected', claim.event_title, `Claim by ${claim.claimant_email} rejected.`);
    return json({ ok: true });
  }

  const linked = await db
    .prepare('UPDATE events SET event_owner_user_id = ? WHERE id = ? AND event_owner_user_id IS NULL')
    .bind(claim.user_id, claim.event_id)
    .run();
  if (!linked.meta.changes) {
    return json({ ok: false, error: `"${claim.event_title}" is already linked to another account, so this claim was not applied.` }, 409);
  }
  await db.prepare("UPDATE event_claims SET status = 'approved', reviewed_at = datetime('now') WHERE id = ?").bind(claim.id).run();
  await logActivity(db, 'event_claim_approved', claim.event_title, `Claim by ${claim.claimant_email} approved.`);
  await requestRebuild(context.env, 'event claim approved');
  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
