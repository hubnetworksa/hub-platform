import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { triggerRebuild } from '../../_lib/deploy-hook';
import { logActivity } from '../../_lib/activity-log';

interface Env {
  DB: D1Database;
  GITHUB_DISPATCH_TOKEN?: string;
}

// Flips a business between 'published' (shows on the live static site) and
// 'rejected' (stays in the database — visible in the admin dashboard's
// hidden-businesses panel — but excluded from the public build, since
// fetch-d1-data.mjs only pulls status = 'published'). Used to keep test
// listings out of the public directory without deleting them.
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
  const makePublic = body.status === 'published';
  if (!businessId) return json({ ok: false, error: 'Missing business.' }, 400);

  const db = context.env.DB;
  const business = await db.prepare('SELECT name FROM businesses WHERE id = ?').bind(businessId).first<{ name: string }>();

  await db
    .prepare("UPDATE businesses SET status = ? WHERE id = ?")
    .bind(makePublic ? 'published' : 'rejected', businessId)
    .run();
  await logActivity(db, makePublic ? 'business_published' : 'business_hidden', business?.name ?? null, `By admin (${user.email}).`);

  await triggerRebuild(context.env);

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
