import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';

interface Env {
  DB: D1Database;
}

// Marks a "possible duplicate" group (Hub Admin's Listings screen) as not
// actually a duplicate, so quality.ts stops flagging that exact set of
// listings next time it runs. groupKey is their business slugs, sorted and
// joined by comma — the same identity quality.ts computes for the group.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }
  const groupKey = typeof body.groupKey === 'string' ? body.groupKey : '';
  if (!/^[a-z0-9-]{1,200}(,[a-z0-9-]{1,200}){1,5}$/.test(groupKey)) return json({ ok: false, error: 'Invalid group.' }, 400);

  await context.env.DB.prepare('INSERT OR IGNORE INTO dismissed_duplicates (group_key) VALUES (?)').bind(groupKey).run();
  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
