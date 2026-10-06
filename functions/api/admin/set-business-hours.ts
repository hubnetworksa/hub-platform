import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { triggerRebuild, rebuildTarget } from '../../_lib/deploy-hook';
import { logActivity } from '../../_lib/activity-log';
import { markBusinessesChanged } from '../../_lib/quality-cache';

interface Env {
  DB: D1Database;
  GITHUB_DISPATCH_TOKEN?: string;
}

// Sets one business's opening hours straight from Hub Admin's "No opening
// hours" quality-check list — by slug, not id, since that's all a Listing
// carries (admin-app/functions/_lib/quality.ts). Narrower than the full
// listings.ts edit endpoint on purpose: that one demands name/category/
// suburb/description too, which this list doesn't have to hand.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  const slug = typeof body.slug === 'string' ? body.slug.trim() : '';
  const hours = typeof body.hours === 'string' ? body.hours.trim() : '';
  if (!slug) return json({ ok: false, error: 'Missing business.' }, 400);
  if (!hours) return json({ ok: false, error: 'Enter the opening hours first.' }, 400);
  if (hours.length > 400) return json({ ok: false, error: 'Opening hours must be 400 characters or fewer.' }, 400);

  const db = context.env.DB;
  const business = await db.prepare('SELECT name FROM businesses WHERE slug = ?').bind(slug).first<{ name: string }>();
  if (!business) return json({ ok: false, error: 'Business not found.' }, 404);

  await db.prepare(`UPDATE businesses SET hours = ?, updated_at = datetime('now') WHERE slug = ?`).bind(hours, slug).run();
  await logActivity(db, 'business_edited', business.name, `Opening hours set by admin (${user.email}).`);
  await markBusinessesChanged(db);
  await triggerRebuild(context.env.GITHUB_DISPATCH_TOKEN, rebuildTarget(context.env));

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
