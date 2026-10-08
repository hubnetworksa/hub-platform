import type { D1Database } from '@cloudflare/workers-types';
import { logActivity } from './activity-log';
import { sendEmail } from './send-email';
import { getSite } from './site';
import { TIER_NAMES, isSponsorProductType, sponsorProductLabel } from './pricing';
import { repSaleEmailHtml, repSaleEmailText } from './email-template';

// Sales rep / referral programme helpers. See db/migrations/*/*_sales_reps.sql.

export const REP_CODE_ALPHABET = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
export type RepSourceType = 'subscription' | 'pending_submission';

export function normalizeRepCode(raw: unknown): string | null {
  if (typeof raw !== 'string') return null;
  const code = raw.trim().toUpperCase().replace(/[^A-Z0-9]/g, '');
  return code.length >= 4 && code.length <= 12 ? code : null;
}

export function generateRepCode(): string {
  const n = REP_CODE_ALPHABET.length; // 32 divides 256, so a byte modulo is unbiased
  const bytes = new Uint8Array(6);
  crypto.getRandomValues(bytes);
  let out = '';
  for (const b of bytes) out += REP_CODE_ALPHABET[b % n];
  return out;
}

function isUniqueViolation(err: unknown): boolean {
  return /UNIQUE constraint failed/i.test(err instanceof Error ? err.message : String(err));
}

export async function createRep(db: D1Database, userId: number): Promise<{ id: number; code: string }> {
  const find = () => db.prepare('SELECT id, code FROM sales_reps WHERE user_id = ?').bind(userId).first<{ id: number; code: string }>();
  const existing = await find();
  if (existing) return existing;
  for (let attempt = 0; attempt < 5; attempt++) {
    const code = generateRepCode();
    try {
      const res = await db.prepare('INSERT INTO sales_reps (user_id, code) VALUES (?, ?)').bind(userId, code).run();
      return { id: Number(res.meta.last_row_id), code };
    } catch (err) {
      if (!isUniqueViolation(err)) throw err;
      const raced = await find(); // same user created concurrently
      if (raced) return raced;
    }
  }
  throw new Error('Could not generate a unique rep code');
}

export async function resolveRepCode(db: D1Database, raw: unknown, buyerUserId?: number | null): Promise<string | null> {
  const code = normalizeRepCode(raw);
  if (!code) return null;
  const rep = await db.prepare('SELECT code, user_id, status FROM sales_reps WHERE code = ?').bind(code).first<{ code: string; user_id: number; status: string }>();
  if (!rep || rep.status !== 'active') return null;
  if (buyerUserId != null && rep.user_id === buyerUserId) return null;
  return rep.code;
}

export interface RecordRepCommissionInput {
  repCode: string | null | undefined;
  sourceType: RepSourceType;
  sourceId: number;
  clientName: string;
  productLabel: string;
  saleAmountCents: number;
  commissionCents: number | null;
  buyerUserId?: number | null;
}

export async function recordRepCommission(
  env: { DB: D1Database; SITE: string; RESEND_API_KEY?: string },
  input: RecordRepCommissionInput
): Promise<boolean> {
  const code = normalizeRepCode(input.repCode);
  if (!code) return false;
  if (input.commissionCents == null || !(input.commissionCents > 0)) return false;
  const db = env.DB;
  const rep = await db
    .prepare('SELECT r.id, r.status, r.user_id FROM sales_reps r WHERE r.code = ?')
    .bind(code)
    .first<{ id: number; status: string; user_id: number }>();
  if (!rep || rep.status !== 'active') return false;
  if (input.buyerUserId != null && rep.user_id === input.buyerUserId) return false;

  if (await buyerHasPaidBefore(db, input.sourceType, input.sourceId)) {
    console.log(`recordRepCommission: skipped ${input.sourceType} #${input.sourceId} (rep ${code}) - buyer is not a first-time paying customer`);
    return false;
  }

  // Starts 'pending': approved on the second successful payment (or by the
  // yearly cron / an admin), voided if the buyer cancels or lapses first.
  const res = await db
    .prepare(
      `INSERT OR IGNORE INTO rep_commissions
         (rep_id, rep_code, source_type, source_id, client_name, product_label, sale_amount_cents, commission_cents, status, approved_at)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'pending', NULL)`
    )
    .bind(rep.id, code, input.sourceType, input.sourceId, input.clientName, input.productLabel, input.saleAmountCents, input.commissionCents)
    .run();
  if (res.meta.changes !== 1) return false;

  const rand = (input.commissionCents / 100).toFixed(2);
  try {
    await logActivity(db, 'rep_commission_created', input.clientName, `Rep ${code}: R${rand} commission on ${input.productLabel} (pending until second payment).`);
  } catch {
    /* history is best-effort */
  }
  return true;
}

// True when this buyer already has a completed payment on anything other than
// the sale being commissioned: commission is for first-time customers only.
async function buyerHasPaidBefore(db: D1Database, sourceType: RepSourceType, sourceId: number): Promise<boolean> {
  try {
    if (sourceType === 'subscription') {
      const sub = await db.prepare('SELECT business_id FROM subscriptions WHERE id = ?').bind(sourceId).first<{ business_id: number }>();
      if (!sub) return false;
      const hit = await db
        .prepare(
          `SELECT 1 FROM payments p JOIN subscriptions s ON s.id = p.subscription_id
           WHERE s.business_id = ? AND s.id <> ? AND UPPER(p.status) IN ('COMPLETE','PAID') LIMIT 1`
        )
        .bind(sub.business_id, sourceId)
        .first();
      return !!hit;
    }
    const sub = await db.prepare('SELECT phone, email FROM pending_submissions WHERE id = ?').bind(sourceId).first<{ phone: string | null; email: string | null }>();
    if (!sub) return false;
    const phone = (sub.phone ?? '').replace(/[\s\-()]/g, '');
    const email = (sub.email ?? '').trim().toLowerCase();
    if (!phone && !email) return false;
    const hit = await db
      .prepare(
        `SELECT 1 FROM businesses b JOIN subscriptions s ON s.business_id = b.id JOIN payments p ON p.subscription_id = s.id
         WHERE UPPER(p.status) IN ('COMPLETE','PAID')
           AND ((? <> '' AND replace(replace(replace(replace(COALESCE(b.phone,''), ' ', ''), '-', ''), '(', ''), ')', '') = ?)
             OR (? <> '' AND lower(trim(COALESCE(b.email,''))) = ?))
         LIMIT 1`
      )
      .bind(phone, phone, email, email)
      .first();
    return !!hit;
  } catch (err) {
    console.error('buyerHasPaidBefore failed', err);
    return false;
  }
}

type RepMailEnv = { DB: D1Database; SITE?: string; RESEND_API_KEY?: string };

// The "You made a sale" email. Sent when a commission is approved (not when
// it is created) - the single place that email is built. Never throws.
export async function sendRepSaleEmail(env: RepMailEnv, repId: number, clientName: string, productLabel: string, commissionCents: number): Promise<void> {
  try {
    const rep = await env.DB.prepare('SELECT u.email FROM sales_reps r JOIN users u ON u.id = r.user_id WHERE r.id = ?').bind(repId).first<{ email: string | null }>();
    if (!rep?.email) return;
    const site = getSite(env.SITE);
    const data = { clientName, productLabel, commissionRand: (commissionCents / 100).toFixed(2), dashboardUrl: `https://${site.domain}/rep-dashboard/` };
    await sendEmail(env, {
      from: `${site.siteName} <${site.contactEmail}>`,
      to: rep.email,
      subject: `You made a sale on ${site.siteName}`,
      text: repSaleEmailText(site, data),
      html: repSaleEmailHtml(site, data),
    });
  } catch {
    /* never block the payment flow on an email */
  }
}

export async function approveRepCommission(db: D1Database, sourceType: RepSourceType, sourceId: number): Promise<boolean> {
  const res = await db
    .prepare("UPDATE rep_commissions SET status = 'approved', approved_at = datetime('now') WHERE source_type = ? AND source_id = ? AND status = 'pending'")
    .bind(sourceType, sourceId)
    .run();
  return res.meta.changes === 1;
}

// Approve + log + email the rep. Never throws.
export async function approveAndNotifyRepCommission(env: RepMailEnv, sourceType: RepSourceType, sourceId: number): Promise<boolean> {
  try {
    const row = await env.DB
      .prepare("SELECT rep_id, rep_code, client_name, product_label, commission_cents FROM rep_commissions WHERE source_type = ? AND source_id = ? AND status = 'pending'")
      .bind(sourceType, sourceId)
      .first<{ rep_id: number; rep_code: string; client_name: string; product_label: string; commission_cents: number }>();
    if (!row) return false;
    if (!(await approveRepCommission(env.DB, sourceType, sourceId))) return false;
    try {
      await logActivity(env.DB, 'rep_commission_approved', row.client_name, `Rep ${row.rep_code}: R${(row.commission_cents / 100).toFixed(2)} commission on ${row.product_label} approved.`);
    } catch {
      /* best-effort */
    }
    await sendRepSaleEmail(env, row.rep_id, row.client_name, row.product_label, row.commission_cents);
    return true;
  } catch (err) {
    console.error('approveAndNotifyRepCommission failed', err);
    return false;
  }
}

export async function voidRepCommission(db: D1Database, sourceType: RepSourceType, sourceId: number, reason: string): Promise<void> {
  await db
    .prepare("UPDATE rep_commissions SET status = 'void', void_reason = ? WHERE source_type = ? AND source_id = ? AND status IN ('pending','approved')")
    .bind(reason, sourceType, sourceId)
    .run();
}

// Auto-void: only touches still-pending rows (approved ones are the admin's call).
export async function voidPendingRepCommission(db: D1Database, sourceType: RepSourceType, sourceId: number, reason: string): Promise<void> {
  try {
    await db
      .prepare("UPDATE rep_commissions SET status = 'void', void_reason = ? WHERE source_type = ? AND source_id = ? AND status = 'pending'")
      .bind(reason, sourceType, sourceId)
      .run();
  } catch (err) {
    console.error('voidPendingRepCommission failed', err);
  }
}

export function productLabelFor(sub: { product_type: string | null; tier: number | null; product_target?: string | null; billing_period?: string | null }): string {
  const suffix = sub.billing_period === 'yearly' ? ' (yearly)' : sub.billing_period === 'monthly' ? ' (monthly)' : '';
  if (isSponsorProductType(sub.product_type)) return sponsorProductLabel(sub.product_type, sub.product_target ?? null) + suffix;
  const tierName = sub.tier != null ? TIER_NAMES[sub.tier] : undefined;
  return `${tierName ?? 'Listing'} listing${suffix}`;
}

export function repShareUrl(site: { domain?: string; url?: string }, code: string): string {
  const base = site.domain ? `https://${site.domain}` : (site.url ?? '').replace(/\/+$/, '');
  return `${base}/?rep=${encodeURIComponent(code)}`;
}
