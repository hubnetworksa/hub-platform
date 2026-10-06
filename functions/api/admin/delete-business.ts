import type { PagesFunction, D1Database, R2Bucket } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { triggerRebuild, rebuildTarget } from '../../_lib/deploy-hook';
import type { PayfastEnv } from '../../_lib/payfast';
import { prepareBusinessDeletion, finishBusinessDeletion, isForeignKeyError, findBlockingTable, BUSINESS_DEPENDENT_TABLES } from '../../_lib/business-deletion';
import { markBusinessesChanged } from '../../_lib/quality-cache';

interface Env extends PayfastEnv {
  DB: D1Database;
  MEDIA: R2Bucket;
  GITHUB_DISPATCH_TOKEN?: string;
}

// Permanently deletes one business. The FK-safe delete order, the
// paid-invoice guard and the after-the-fact cleanup (tombstone, PayFast
// billing, R2 objects) live in _lib/business-deletion.ts, shared with
// delete-user.ts, which deletes an account's businesses the same way.
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

  const prepared = await prepareBusinessDeletion(db, businessId);
  if (!prepared.ok) return json({ ok: false, error: prepared.error }, prepared.status);

  // All-or-nothing: a failure part-way leaves the business exactly as it was.
  try {
    await db.batch(prepared.deletion.statements);
  } catch (err) {
    if (!isForeignKeyError(err)) throw err;
    // A table added since the list in _lib/business-deletion.ts was written
    // still points at the row. Name it, so the fix is obvious, rather than a bare 500.
    const blocker = await findBlockingTable(db, 'businesses', businessId, ['business_id'], BUSINESS_DEPENDENT_TABLES);
    console.error(`delete-business: business ${businessId} is still referenced by ${blocker ?? 'another table'}`, err);
    return json({ ok: false, error: `Can't delete this business: rows in ${blocker ?? 'another table'} still reference it.` }, 409);
  }

  await finishBusinessDeletion(context.env, db, prepared.deletion, user.email);
  await markBusinessesChanged(db);
  await triggerRebuild(context.env.GITHUB_DISPATCH_TOKEN, rebuildTarget(context.env));

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
