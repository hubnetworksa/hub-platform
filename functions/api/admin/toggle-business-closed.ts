import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { triggerRebuild, rebuildTarget } from '../../_lib/deploy-hook';
import { logActivity } from '../../_lib/activity-log';
import { clearBusinessSponsorSlots } from '../../_lib/sponsorships';
import { markBusinessesChanged } from '../../_lib/quality-cache';
import type { PayfastEnv } from '../../_lib/payfast';

interface Env extends PayfastEnv {
  DB: D1Database;
  GITHUB_DISPATCH_TOKEN?: string;
}

// Marks a business as closed (or reopens it) — independent of status/Hide:
// a closed business can stay 'published' (so unmarking it brings it straight
// back with no extra step) but is excluded from the public build the same
// way a hidden one is (fetch-d1-data.mjs: status = 'published' AND
// closed_at IS NULL). The research routine already sets closed_at the same
// way when it confirms a business has shut down; this is the same flag, set
// by an admin instead.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  const businessId = Number(body.businessId);
  const closed = body.closed === true;
  if (!businessId) return json({ ok: false, error: 'Missing business.' }, 400);

  const db = context.env.DB;
  const business = await db.prepare('SELECT name FROM businesses WHERE id = ?').bind(businessId).first<{ name: string }>();
  if (!business) return json({ ok: false, error: 'Business not found.' }, 404);

  await db
    .prepare(`UPDATE businesses SET closed_at = ${closed ? "datetime('now')" : 'NULL'} WHERE id = ?`)
    .bind(businessId)
    .run();
  await logActivity(db, closed ? 'business_closed' : 'business_reopened', business.name, `By admin (${user.email}).`);

  // Same reasoning as toggle-business-status.ts: a closed business can't
  // keep an exclusive sponsor spot it's no longer showing up to fill.
  if (closed) await clearBusinessSponsorSlots(context.env, db, businessId, business.name, `cleared — marked closed by admin (${user.email})`);

  await markBusinessesChanged(db);
  await triggerRebuild(context.env.GITHUB_DISPATCH_TOKEN, rebuildTarget(context.env));

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
