import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { logActivity } from '../../_lib/activity-log';
import { triggerRebuild, rebuildTarget } from '../../_lib/deploy-hook';
import { clearBusinessSponsorSlots } from '../../_lib/sponsorships';
import type { PayfastEnv } from '../../_lib/payfast';

interface Env extends PayfastEnv {
  DB: D1Database;
  GITHUB_DISPATCH_TOKEN?: string;
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  const businessId = Number(body.businessId);
  if (!businessId) return json({ ok: false, error: 'Missing business.' }, 400);

  const business = await db.prepare('SELECT name FROM businesses WHERE id = ?').bind(businessId).first<{ name: string }>();
  if (!business) return json({ ok: false, error: 'Business not found.' }, 404);

  // Log before deleting — the name wouldn't be recoverable afterward.
  await logActivity(db, 'business_deleted', business.name, `Deleted by admin (${user.email}).`);

  await db.prepare('DELETE FROM business_categories WHERE business_id = ?').bind(businessId).run();
  await db.prepare('DELETE FROM businesses WHERE id = ?').bind(businessId).run();

  // Its sponsor spots must not stay sold (and billed) to a business that no
  // longer exists: cancel them on PayFast and free the slots — see
  // _lib/sponsorships.ts. Done after the DELETE so a delete that fails
  // (e.g. a foreign key still pointing at the row) doesn't leave a business
  // that's still live with its billing cancelled. The subscriptions rows
  // themselves are kept as billing history, as they always were.
  await clearBusinessSponsorSlots(context.env, db, businessId, business.name, `cleared — business deleted by admin (${user.email})`);

  await triggerRebuild(context.env.GITHUB_DISPATCH_TOKEN, rebuildTarget(context.env));

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
