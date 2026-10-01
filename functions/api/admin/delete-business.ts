import type { PagesFunction, D1Database, R2Bucket } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { logActivity } from '../../_lib/activity-log';
import { triggerRebuild, rebuildTarget } from '../../_lib/deploy-hook';
import { clearSponsorSubscription, type SponsorSubscriptionRow } from '../../_lib/sponsorships';
import { cancelPayfastSubscription, payfastConfigured, type PayfastEnv } from '../../_lib/payfast';

interface Env extends PayfastEnv {
  DB: D1Database;
  MEDIA: R2Bucket;
  GITHUB_DISPATCH_TOKEN?: string;
}

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
// Snapshotted before the batch, acted on only after it succeeds:
//  - subscription rows: their PayFast tokens are gone with the rows, so any
//    billing still running is cancelled from the snapshot (sponsor spots via
//    clearSponsorSubscription, as before; an active tier plan directly).
//  - R2 keys (photos, claim documents): removed best-effort — an R2 hiccup
//    must never leave the database half-deleted, and an orphaned object is
//    harmless, so it's logged and skipped. Invoice PDFs are never touched:
//    a business with a paid invoice can't be deleted at all (guard below).

type SubscriptionSnapshot = SponsorSubscriptionRow & { m_payment_id: string };

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
  if ((paid?.n ?? 0) > 0) {
    return json({ ok: false, error: "This business has paid invoices on record and can't be deleted; hide it instead (Listings → Hide)." }, 409);
  }

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
  for (const c of claims.results) for (const key of parseDocumentKeys(c.document_keys)) r2Keys.add(key);

  // Log before deleting — the name wouldn't be recoverable afterward.
  await logActivity(db, 'business_deleted', business.name, `Deleted by admin (${user.email}).`);

  // Children before parents: payments → subscriptions, then the tables that
  // point straight at the business, then the business itself. All-or-nothing.
  try {
    await db.batch([
      db.prepare('DELETE FROM payments WHERE subscription_id IN (SELECT id FROM subscriptions WHERE business_id = ?)').bind(businessId),
      db.prepare('DELETE FROM subscriptions WHERE business_id = ?').bind(businessId),
      db.prepare('DELETE FROM business_claims WHERE business_id = ?').bind(businessId),
      db.prepare('DELETE FROM business_photos WHERE business_id = ?').bind(businessId),
      db.prepare('DELETE FROM business_categories WHERE business_id = ?').bind(businessId),
      db.prepare('DELETE FROM businesses WHERE id = ?').bind(businessId),
    ]);
  } catch (err) {
    if (!isForeignKeyError(err)) throw err;
    // A table added since this list was written still points at the row.
    // Name it, so the fix is obvious, rather than a bare 500.
    const blocker = await findBlockingTable(db, businessId);
    console.error(`delete-business: business ${businessId} is still referenced by ${blocker ?? 'another table'}`, err);
    return json({ ok: false, error: `Can't delete this business: rows in ${blocker ?? 'another table'} still reference it.` }, 409);
  }

  // Its sponsor spots must not stay sold (and billed) to a business that no
  // longer exists: cancel them on PayFast and free the slots — see
  // _lib/sponsorships.ts. Done after the delete so a delete that fails
  // doesn't leave a business that's still live with its billing cancelled.
  // The rows are already gone (the UPDATE inside is a no-op), so this works
  // from the snapshot: the PayFast cancel and the activity-log entry are what
  // matter now.
  const why = `cleared — business deleted by admin (${user.email})`;
  for (const sub of subs.results) {
    if (sub.product_type !== 'tier') {
      if (sub.status === 'active' || sub.status === 'cancelled') await clearSponsorSubscription(context.env, db, sub, business.name, why);
      continue;
    }
    // An active tier plan is still being billed, and its token was just
    // deleted with the row — stop it now or it bills forever with no record.
    if (sub.status !== 'active' || !sub.payfast_token || !payfastConfigured(context.env)) continue;
    const r = await cancelPayfastSubscription(context.env, sub.payfast_token).catch(() => ({ ok: false, status: 0 }));
    const note = r.ok
      ? `Tier plan billing cancelled on PayFast (${sub.m_payment_id}) — business deleted by admin (${user.email}).`
      : `Business deleted by admin (${user.email}), but PayFast refused to cancel its tier plan (HTTP ${r.status}) — cancel token ${sub.payfast_token} by hand.`;
    await logActivity(db, 'subscription_cancelled', business.name, note);
  }

  // Best-effort: the database is the source of truth and is already
  // consistent; an object that outlives its row is unreachable and harmless.
  await Promise.all(
    [...r2Keys].map((key) =>
      context.env.MEDIA.delete(key).catch((err: unknown) => console.error(`delete-business: could not delete R2 object ${key}`, err))
    )
  );

  await triggerRebuild(context.env.GITHUB_DISPATCH_TOKEN, rebuildTarget(context.env));

  return json({ ok: true });
};

/** business_claims.document_keys is a JSON array of R2 keys (see
 *  claim-document/[[path]].ts); tolerate a malformed value rather than let
 *  it stop the delete. */
function parseDocumentKeys(raw: string | null): string[] {
  if (!raw) return [];
  try {
    const parsed: unknown = JSON.parse(raw);
    return Array.isArray(parsed) ? parsed.filter((k): k is string => typeof k === 'string' && k.length > 0) : [];
  } catch {
    return [];
  }
}

function isForeignKeyError(err: unknown): boolean {
  const message = err instanceof Error ? `${err.message} ${(err.cause as Error | undefined)?.message ?? ''}` : String(err);
  return /FOREIGN KEY constraint failed/i.test(message);
}

/** Which table still has rows pointing at the business: every table whose
 *  schema references businesses(id), probed by its business_id column.
 *  Diagnostic only — null if the lookup itself fails. */
async function findBlockingTable(db: D1Database, businessId: number): Promise<string | null> {
  try {
    const tables = await db
      .prepare("SELECT name FROM sqlite_master WHERE type = 'table' AND sql LIKE '%REFERENCES businesses%'")
      .all<{ name: string }>();
    for (const { name } of tables.results) {
      if (!/^[A-Za-z0-9_]+$/.test(name)) continue;
      const row = await db.prepare(`SELECT COUNT(*) AS n FROM ${name} WHERE business_id = ?`).bind(businessId).first<{ n: number }>().catch(() => null);
      if (row && row.n > 0) return name;
    }
  } catch {
    // fall through
  }
  return null;
}

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
