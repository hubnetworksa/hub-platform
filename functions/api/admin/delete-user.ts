import type { PagesFunction, D1Database, D1PreparedStatement, R2Bucket } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { logActivity } from '../../_lib/activity-log';
import { triggerRebuild, rebuildTarget } from '../../_lib/deploy-hook';
import type { PayfastEnv } from '../../_lib/payfast';
import {
  prepareBusinessDeletion,
  finishBusinessDeletion,
  deleteR2Keys,
  parseDocumentKeys,
  isForeignKeyError,
  findBlockingTable,
  BUSINESS_DEPENDENT_TABLES,
  type BusinessDeletion,
} from '../../_lib/business-deletion';

interface Env extends PayfastEnv {
  DB: D1Database;
  MEDIA: R2Bucket;
  GITHUB_DISPATCH_TOKEN?: string;
}

// Permanently deletes a user account (Users & roles → Delete).
//   POST {userId}                          refused with 409 + the list if the
//                                          account still owns businesses
//   POST {userId, deleteBusinesses: true}  also deletes those businesses, the
//                                          same way delete-business.ts does
//                                          (paid invoices still block it)
//   POST {userId, unassign: true}          keeps them, with no owner
//
// Every table that points at users(id) (see db/migrations/<city>/) is dealt
// with in the SAME batch as the users row, so it's all-or-nothing:
//   sessions, auth_tokens, announcement_sends   deleted (account plumbing)
//   business_claims, event_claims, reviews      deleted (the account's own
//                                               submissions; reviews only
//                                               mean anything with an author)
//   pending_submissions.submitted_by_user_id    set to NULL: the submission
//                                               itself is still worth reviewing
//   event_submissions.submitted_by_user_id,
//   events.event_owner_user_id                  set to NULL too (no FK, but
//                                               a dangling id would be wrong)

/** The tables the batch below clears of the account's rows. */
const USER_DEPENDENT_TABLES = ['sessions', 'auth_tokens', 'announcement_sends', 'business_claims', 'event_claims', 'reviews', 'pending_submissions', 'businesses'];

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

  const userId = Number(body.userId);
  if (!userId) return json({ ok: false, error: 'Missing user.' }, 400);

  const target = await db.prepare('SELECT id, email FROM users WHERE id = ?').bind(userId).first<{ id: number; email: string }>();
  if (!target) return json({ ok: false, error: 'User not found.' }, 404);
  if (target.id === admin.id || isAdminEmail(target.email)) {
    return json({ ok: false, error: "The admin account can't be deleted." }, 400);
  }

  const owned = await db
    .prepare('SELECT id, name FROM businesses WHERE owner_user_id = ? ORDER BY name COLLATE NOCASE')
    .bind(userId)
    .all<{ id: number; name: string }>();
  const deleteBusinesses = body.deleteBusinesses === true;
  const unassign = body.unassign === true;

  if (owned.results.length > 0 && !deleteBusinesses && !unassign) {
    return json(
      {
        ok: false,
        error: `${target.email} owns ${owned.results.length} business${owned.results.length === 1 ? '' : 'es'}. Choose whether to delete them or keep them without an owner.`,
        ownsBusinesses: owned.results,
      },
      409
    );
  }

  const statements: D1PreparedStatement[] = [];
  const deletions: BusinessDeletion[] = [];
  if (owned.results.length > 0 && deleteBusinesses) {
    for (const b of owned.results) {
      const prepared = await prepareBusinessDeletion(db, b.id);
      if (!prepared.ok) {
        // Nothing has been deleted yet: one blocked business stops the lot.
        return json({ ok: false, error: `Can't delete "${b.name}": ${prepared.error}`, ownsBusinesses: owned.results }, prepared.status);
      }
      deletions.push(prepared.deletion);
      statements.push(...prepared.deletion.statements);
    }
  } else if (owned.results.length > 0) {
    statements.push(db.prepare('UPDATE businesses SET owner_user_id = NULL WHERE owner_user_id = ?').bind(userId));
  }

  // Read before the batch: the claim documents to clear from R2 afterwards,
  // and whether any of the account's reviews are live on the site.
  const [claimDocs, approvedReviews] = await Promise.all([
    db.prepare('SELECT document_keys FROM business_claims WHERE user_id = ?').bind(userId).all<{ document_keys: string }>(),
    db.prepare("SELECT COUNT(*) AS n FROM reviews WHERE user_id = ? AND status = 'approved'").bind(userId).first<{ n: number }>(),
  ]);
  const r2Keys = new Set<string>();
  for (const c of claimDocs.results) for (const key of parseDocumentKeys(c.document_keys)) r2Keys.add(key);

  statements.push(
    db.prepare('DELETE FROM sessions WHERE user_id = ?').bind(userId),
    db.prepare('DELETE FROM auth_tokens WHERE user_id = ?').bind(userId),
    db.prepare('DELETE FROM announcement_sends WHERE user_id = ?').bind(userId),
    db.prepare('DELETE FROM business_claims WHERE user_id = ?').bind(userId),
    db.prepare('DELETE FROM event_claims WHERE user_id = ?').bind(userId),
    db.prepare('DELETE FROM reviews WHERE user_id = ?').bind(userId),
    db.prepare('UPDATE pending_submissions SET submitted_by_user_id = NULL WHERE submitted_by_user_id = ?').bind(userId),
    db.prepare('UPDATE event_submissions SET submitted_by_user_id = NULL WHERE submitted_by_user_id = ?').bind(userId),
    db.prepare('UPDATE events SET event_owner_user_id = NULL WHERE event_owner_user_id = ?').bind(userId),
    db.prepare('DELETE FROM users WHERE id = ?').bind(userId)
  );

  try {
    await db.batch(statements);
  } catch (err) {
    if (!isForeignKeyError(err)) throw err;
    // A table added since this list was written still points at the account
    // (or at one of its businesses). Name it rather than a bare 500.
    const blocker =
      (await findBlockingTable(db, 'users', userId, ['user_id', 'owner_user_id', 'submitted_by_user_id'], USER_DEPENDENT_TABLES)) ??
      (await (async () => {
        for (const d of deletions) {
          const t = await findBlockingTable(db, 'businesses', d.businessId, ['business_id'], BUSINESS_DEPENDENT_TABLES);
          if (t) return t;
        }
        return null;
      })());
    console.error(`delete-user: user ${userId} is still referenced by ${blocker ?? 'another table'}`, err);
    return json({ ok: false, error: `Can't delete this account: rows in ${blocker ?? 'another table'} still reference it.` }, 409);
  }

  for (const d of deletions) await finishBusinessDeletion(context.env, db, d, admin.email);
  await deleteR2Keys(context.env.MEDIA, r2Keys);

  const what =
    owned.results.length === 0
      ? ''
      : deleteBusinesses
        ? ` Deleted ${owned.results.length} owned business${owned.results.length === 1 ? '' : 'es'}.`
        : ` ${owned.results.length} owned business${owned.results.length === 1 ? '' : 'es'} left without an owner.`;
  await logActivity(db, 'user_deleted', target.email, `Deleted by admin (${admin.email}).${what}`);

  // Deleted listings and removed live reviews both change the static pages.
  if (deletions.length > 0 || (approvedReviews?.n ?? 0) > 0) {
    await triggerRebuild(context.env.GITHUB_DISPATCH_TOKEN, rebuildTarget(context.env));
  }

  return json({ ok: true, deletedBusinesses: deletions.length, unassignedBusinesses: deleteBusinesses ? 0 : owned.results.length });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
