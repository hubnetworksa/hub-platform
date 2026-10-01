import type { D1Database, D1PreparedStatement, R2Bucket } from '@cloudflare/workers-types';
import { logActivity } from './activity-log';
import { clearSponsorSubscription, type SponsorSubscriptionRow } from './sponsorships';
import { cancelPayfastSubscription, payfastConfigured, type PayfastEnv } from './payfast';

// Shared by functions/api/admin/delete-business.ts (one business) and
// functions/api/admin/delete-user.ts (an account's businesses, inside the same
// batch that removes the account).
//
// D1 enforces foreign keys, and several tables reference businesses(id)
// WITHOUT `ON DELETE CASCADE` — subscriptions, business_claims and
// business_photos (payments hangs off subscriptions). So a business that was
// ever claimed, or whose owner ever even started a PayFast checkout (an
// abandoned checkout leaves a 'pending' subscriptions row), can't just have
// its row deleted: "FOREIGN KEY constraint failed". The dependents are
// deleted first, in FK-safe order, in ONE batch so the delete is atomic — a
// failure part-way leaves the business exactly as it was. The schema is
// deliberately not changed (no cascades added): this has to work on the live
// databases as they are. reviews and business_stats already cascade.
//
// So a delete is split in two:
//  - prepareBusinessDeletion: the checks, a snapshot of what needs acting on
//    afterwards, and the DELETE statements, for the caller to run in its own
//    db.batch (alongside whatever else it is deleting).
//  - finishBusinessDeletion: run only after that batch has succeeded.
//
// Snapshotted before the batch, acted on only after it succeeds:
//  - subscription rows: their PayFast tokens are gone with the rows, so any
//    billing still running is cancelled from the snapshot (sponsor spots via
//    clearSponsorSubscription; an active tier plan directly).
//  - R2 keys (photos, logo, claim documents): removed best-effort — an R2
//    hiccup must never leave the database half-deleted, and an orphaned
//    object is harmless, so it's logged and skipped. Invoice PDFs are never
//    touched: a business with a paid invoice can't be deleted at all.

type SubscriptionSnapshot = SponsorSubscriptionRow & { m_payment_id: string };

export interface BusinessDeletion {
  businessId: number;
  name: string;
  subs: SubscriptionSnapshot[];
  r2Keys: string[];
  tombstone: { name: string; slug: string | null; suburb_slug: string | null; phone: string | null; website: string | null } | null;
  statements: D1PreparedStatement[];
}

export type PrepareBusinessDeletionResult = { ok: true; deletion: BusinessDeletion } | { ok: false; status: 404 | 409; error: string };

export const PAID_INVOICES_ERROR = "This business has paid invoices on record and can't be deleted; hide it instead (Listings → Hide).";

export async function prepareBusinessDeletion(db: D1Database, businessId: number): Promise<PrepareBusinessDeletionResult> {
  const business = await db.prepare('SELECT name, logo_key FROM businesses WHERE id = ?').bind(businessId).first<{ name: string; logo_key: string | null }>();
  if (!business) return { ok: false, status: 404, error: 'Business not found.' };

  // Paid invoices are accounting records and are never deleted — not the
  // payments rows, not the PDFs in R2. A business that has any can only be
  // hidden. Pending/failed payments (an abandoned checkout) don't block.
  const paid = await db
    .prepare(
      `SELECT COUNT(*) AS n FROM payments p JOIN subscriptions s ON s.id = p.subscription_id
       WHERE s.business_id = ? AND (p.status = 'COMPLETE' OR p.invoice_number IS NOT NULL)`
    )
    .bind(businessId)
    .first<{ n: number }>();
  if ((paid?.n ?? 0) > 0) return { ok: false, status: 409, error: PAID_INVOICES_ERROR };

  // Everything the delete will take with it that still needs acting on
  // afterwards — read now, because the rows won't exist once the batch runs.
  const [subs, photos, claims] = await Promise.all([
    db
      .prepare('SELECT id, status, payfast_token, product_type, product_target, m_payment_id FROM subscriptions WHERE business_id = ?')
      .bind(businessId)
      .all<SubscriptionSnapshot>(),
    db.prepare('SELECT r2_key FROM business_photos WHERE business_id = ?').bind(businessId).all<{ r2_key: string }>(),
    db.prepare('SELECT document_keys FROM business_claims WHERE business_id = ?').bind(businessId).all<{ document_keys: string }>(),
  ]);
  const r2Keys = new Set<string>();
  for (const p of photos.results) if (p.r2_key) r2Keys.add(p.r2_key);
  if (business.logo_key) r2Keys.add(business.logo_key);
  for (const c of claims.results) for (const key of parseDocumentKeys(c.document_keys)) r2Keys.add(key);

  // What the suppressed_businesses tombstone needs, read while the row exists.
  const tombstone = await db
    .prepare('SELECT b.name, b.slug, s.slug AS suburb_slug, b.phone, b.website FROM businesses b LEFT JOIN suburbs s ON s.id = b.suburb_id WHERE b.id = ?')
    .bind(businessId)
    .first<{ name: string; slug: string | null; suburb_slug: string | null; phone: string | null; website: string | null }>()
    .catch(() => null);

  // Children before parents: payments → subscriptions, then the tables that
  // point straight at the business, then the business itself.
  const statements = [
    db.prepare('DELETE FROM payments WHERE subscription_id IN (SELECT id FROM subscriptions WHERE business_id = ?)').bind(businessId),
    db.prepare('DELETE FROM subscriptions WHERE business_id = ?').bind(businessId),
    db.prepare('DELETE FROM business_claims WHERE business_id = ?').bind(businessId),
    db.prepare('DELETE FROM business_photos WHERE business_id = ?').bind(businessId),
    db.prepare('DELETE FROM business_categories WHERE business_id = ?').bind(businessId),
    db.prepare('DELETE FROM businesses WHERE id = ?').bind(businessId),
  ];

  return { ok: true, deletion: { businessId, name: business.name, subs: subs.results, r2Keys: [...r2Keys], tombstone, statements } };
}

/** Everything that happens once the batch holding deletion.statements has
 *  succeeded: activity log, tombstone, billing cancellation, R2 cleanup.
 *  Doesn't trigger a rebuild; the caller does that once. */
export async function finishBusinessDeletion(
  env: PayfastEnv & { MEDIA: R2Bucket },
  db: D1Database,
  deletion: BusinessDeletion,
  adminEmail: string
): Promise<void> {
  const { businessId, name, tombstone } = deletion;
  await logActivity(db, 'business_deleted', name, `Deleted by admin (${adminEmail}).`);

  // Tombstone so the research routines never re-add it (see
  // db/migrations/<city>/*_suppressed_businesses.sql). Best-effort: a missing
  // table must never break a delete that has already happened.
  if (tombstone) {
    try {
      await db
        .prepare("INSERT INTO suppressed_businesses (name, slug, suburb_slug, phone_digits, website, reason) VALUES (?, ?, ?, ?, ?, 'deleted')")
        .bind(tombstone.name, tombstone.slug, tombstone.suburb_slug, String(tombstone.phone ?? '').replace(/\D/g, '').slice(-9) || null, tombstone.website)
        .run();
    } catch (err) {
      console.error(`delete-business: could not record tombstone for business ${businessId}`, err);
    }
  }

  // Its sponsor spots must not stay sold (and billed) to a business that no
  // longer exists: cancel them on PayFast and free the slots — see
  // _lib/sponsorships.ts. Done after the delete so a delete that fails
  // doesn't leave a business that's still live with its billing cancelled.
  // The rows are already gone (the UPDATE inside is a no-op), so this works
  // from the snapshot: the PayFast cancel and the activity-log entry are what
  // matter now.
  const why = `cleared — business deleted by admin (${adminEmail})`;
  for (const sub of deletion.subs) {
    if (sub.product_type !== 'tier') {
      if (sub.status === 'active' || sub.status === 'cancelled') await clearSponsorSubscription(env, db, sub, name, why);
      continue;
    }
    // An active tier plan is still being billed, and its token was just
    // deleted with the row — stop it now or it bills forever with no record.
    if (sub.status !== 'active' || !sub.payfast_token || !payfastConfigured(env)) continue;
    const r = await cancelPayfastSubscription(env, sub.payfast_token).catch(() => ({ ok: false, status: 0 }));
    const note = r.ok
      ? `Tier plan billing cancelled on PayFast (${sub.m_payment_id}) — business deleted by admin (${adminEmail}).`
      : `Business deleted by admin (${adminEmail}), but PayFast refused to cancel its tier plan (HTTP ${r.status}) — cancel token ${sub.payfast_token} by hand.`;
    await logActivity(db, 'subscription_cancelled', name, note);
  }

  await deleteR2Keys(env.MEDIA, deletion.r2Keys);
}

/** Best-effort: the database is the source of truth and is already
 *  consistent; an object that outlives its row is unreachable and harmless. */
export async function deleteR2Keys(media: R2Bucket, keys: Iterable<string>): Promise<void> {
  await Promise.all(
    [...keys].map((key) => media.delete(key).catch((err: unknown) => console.error(`delete: could not delete R2 object ${key}`, err)))
  );
}

/** business_claims.document_keys is a JSON array of R2 keys (see
 *  claim-document/[[path]].ts); tolerate a malformed value rather than let
 *  it stop the delete. */
export function parseDocumentKeys(raw: string | null): string[] {
  if (!raw) return [];
  try {
    const parsed: unknown = JSON.parse(raw);
    return Array.isArray(parsed) ? parsed.filter((k): k is string => typeof k === 'string' && k.length > 0) : [];
  } catch {
    return [];
  }
}

export function isForeignKeyError(err: unknown): boolean {
  const message = err instanceof Error ? `${err.message} ${(err.cause as Error | undefined)?.message ?? ''}` : String(err);
  return /FOREIGN KEY constraint failed/i.test(message);
}

/** The tables prepareBusinessDeletion's statements delete from. */
export const BUSINESS_DEPENDENT_TABLES = ['subscriptions', 'business_claims', 'business_photos', 'business_categories'];

/** Which table still has rows pointing at a row of `target`: every table
 *  whose schema references it without an ON DELETE action, skipping the
 *  ones the caller's batch already clears (`handled` — after the rollback
 *  they still have their rows), probed by each of the given column names.
 *  Diagnostic only — null if the lookup itself fails. */
export async function findBlockingTable(
  db: D1Database,
  target: 'businesses' | 'users',
  id: number,
  columns: string[],
  handled: string[] = []
): Promise<string | null> {
  try {
    const tables = await db
      .prepare("SELECT name, sql FROM sqlite_master WHERE type = 'table' AND sql LIKE ?")
      .bind(`%REFERENCES ${target}%`)
      .all<{ name: string; sql: string }>();
    for (const { name, sql } of tables.results) {
      if (!/^[A-Za-z0-9_]+$/.test(name) || handled.includes(name)) continue;
      const refs = sql.match(new RegExp(`REFERENCES ${target}\\s*\\(id\\)(\\s+ON DELETE)?`, 'gi')) ?? [];
      if (refs.length > 0 && refs.every((r) => /ON DELETE/i.test(r))) continue;
      for (const column of columns) {
        const row = await db.prepare(`SELECT COUNT(*) AS n FROM ${name} WHERE ${column} = ?`).bind(id).first<{ n: number }>().catch(() => null);
        if (row && row.n > 0) return name;
      }
    }
  } catch {
    // fall through
  }
  return null;
}
