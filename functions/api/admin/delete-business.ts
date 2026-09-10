import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { logActivity } from '../../_lib/activity-log';
import { triggerRebuild } from '../../_lib/deploy-hook';

interface Env {
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

  await triggerRebuild(context.env.GITHUB_DISPATCH_TOKEN);

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
