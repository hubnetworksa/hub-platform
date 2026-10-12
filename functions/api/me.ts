import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../_lib/auth';

interface Env {
  DB: D1Database;
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user) return new Response(JSON.stringify({ ok: false }), { status: 401, headers: { 'Content-Type': 'application/json' } });
  let repStatus: 'active' | 'suspended' | null = null;
  try {
    const rep = await context.env.DB.prepare('SELECT status FROM sales_reps WHERE user_id = ?').bind(user.id).first<{ status: string }>();
    if (rep) repStatus = rep.status === 'suspended' ? 'suspended' : 'active';
  } catch {
    /* sales_reps may not exist yet on a database that has not been migrated */
  }
  return new Response(
    JSON.stringify({ ok: true, email: user.email, isAdmin: isAdminEmail(user.email), isRep: repStatus !== null, repStatus }),
    { headers: { 'Content-Type': 'application/json' } }
  );
};
