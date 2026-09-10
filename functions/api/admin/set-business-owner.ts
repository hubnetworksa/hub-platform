import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { logActivity } from '../../_lib/activity-log';

interface Env {
  DB: D1Database;
}

// Manual fix-it tool for ownership links — clears with userEmail: null,
// or links to whichever account has that email (404 if no such account).
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const admin = await getSessionUser(context.request, db);
  if (!admin || !isAdminEmail(admin.email)) return json({ ok: false }, 403);

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

  const userEmail = typeof body.userEmail === 'string' ? body.userEmail.trim().toLowerCase() : null;

  if (!userEmail) {
    await db.prepare('UPDATE businesses SET owner_user_id = NULL WHERE id = ?').bind(businessId).run();
    await logActivity(db, 'owner_unlinked', business.name, `Unlinked by admin (${admin.email}).`);
    return json({ ok: true });
  }

  const targetUser = await db.prepare('SELECT id FROM users WHERE email = ?').bind(userEmail).first<{ id: number }>();
  if (!targetUser) return json({ ok: false, error: 'No account with that email.' }, 404);

  await db.prepare('UPDATE businesses SET owner_user_id = ? WHERE id = ?').bind(targetUser.id, businessId).run();
  await logActivity(db, 'owner_linked', business.name, `Linked to ${userEmail} by admin (${admin.email}).`);

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
