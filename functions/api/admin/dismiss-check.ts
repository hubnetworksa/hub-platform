import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { markBusinessesChanged } from '../../_lib/quality-cache';

interface Env {
  DB: D1Database;
}

// Dismisses one "what's missing" quality flag (Hub Admin's Listings screen)
// for one business — e.g. "No opening hours" on a business that genuinely
// doesn't have fixed hours, rather than one nobody's gotten to yet.
// quality.ts excludes a (check_key, slug) pair here from that check's list
// (and from the completeness score) on every future report.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }
  const checkKey = typeof body.checkKey === 'string' ? body.checkKey : '';
  const slug = typeof body.slug === 'string' ? body.slug : '';
  if (!/^[a-z_]{1,40}$/.test(checkKey) || !/^[a-z0-9-]{1,200}$/.test(slug)) return json({ ok: false, error: 'Invalid request.' }, 400);

  const db = context.env.DB;
  await db.prepare('INSERT OR IGNORE INTO dismissed_checks (check_key, slug) VALUES (?, ?)').bind(checkKey, slug).run();
  await markBusinessesChanged(db);

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
