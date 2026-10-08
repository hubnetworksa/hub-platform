import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser } from '../../_lib/auth';
import { json } from '../../_lib/messages';
import { getSite } from '../../_lib/site';
import { repShareUrl } from '../../_lib/reps';

interface Env {
  DB: D1Database;
  SITE: string;
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false, error: 'unauthorized' }, 401);

  const rep = await db
    .prepare(
      `SELECT id, code, status, created_at, bank_name, bank_account_holder, bank_account_number, bank_branch_code, bank_account_type, bank_consent_at
       FROM sales_reps WHERE user_id = ?`
    )
    .bind(user.id)
    .first<{
      id: number; code: string; status: string; created_at: string;
      bank_name: string | null; bank_account_holder: string | null; bank_account_number: string | null;
      bank_branch_code: string | null; bank_account_type: string | null; bank_consent_at: string | null;
    }>();
  if (!rep) return json({ ok: false, error: 'not_rep' }, 403);

  const site = getSite(context.env.SITE);

  const stats = await db
    .prepare(
      `SELECT
         COALESCE(SUM(CASE WHEN status IN ('approved','paid') AND strftime('%Y-%m', created_at) = strftime('%Y-%m','now') THEN commission_cents END), 0) AS month_cents,
         COALESCE(SUM(CASE WHEN status IN ('approved','paid') THEN commission_cents END), 0) AS lifetime_cents,
         COALESCE(SUM(CASE WHEN status = 'approved' THEN commission_cents END), 0) AS unpaid_cents,
         COALESCE(SUM(CASE WHEN status = 'pending' THEN commission_cents END), 0) AS pending_cents,
         COUNT(CASE WHEN status != 'void' THEN 1 END) AS sales_count
       FROM rep_commissions WHERE rep_id = ?`
    )
    .bind(rep.id)
    .first<{ month_cents: number; lifetime_cents: number; unpaid_cents: number; pending_cents: number; sales_count: number }>();

  const sales = await db
    .prepare(
      `SELECT c.id, c.client_name, c.product_label, c.sale_amount_cents, c.commission_cents, c.status, c.created_at, c.paid_at, p.reference AS payout_reference
       FROM rep_commissions c LEFT JOIN rep_payouts p ON p.id = c.payout_id
       WHERE c.rep_id = ? ORDER BY c.created_at DESC, c.id DESC`
    )
    .bind(rep.id)
    .all<{
      id: number; client_name: string; product_label: string; sale_amount_cents: number; commission_cents: number;
      status: string; created_at: string; paid_at: string | null; payout_reference: string | null;
    }>();

  const payouts = await db
    .prepare('SELECT id, period, total_cents, reference, paid_at FROM rep_payouts WHERE rep_id = ? ORDER BY period DESC, id DESC')
    .bind(rep.id)
    .all<{ id: number; period: string; total_cents: number; reference: string | null; paid_at: string | null }>();

  const hasBank = !!(rep.bank_name || rep.bank_account_number);
  return json({
    ok: true,
    rep: {
      code: rep.code,
      status: rep.status,
      shareUrl: repShareUrl(site, rep.code),
      createdAt: rep.created_at,
      bank: hasBank
        ? {
            bankName: rep.bank_name,
            accountHolder: rep.bank_account_holder,
            accountNumber: rep.bank_account_number,
            branchCode: rep.bank_branch_code,
            accountType: rep.bank_account_type,
          }
        : null,
      bankConsentAt: rep.bank_consent_at,
    },
    stats: {
      monthCents: stats?.month_cents ?? 0,
      lifetimeCents: stats?.lifetime_cents ?? 0,
      unpaidCents: stats?.unpaid_cents ?? 0,
      pendingCents: stats?.pending_cents ?? 0,
      salesCount: stats?.sales_count ?? 0,
    },
    sales: sales.results.map((s) => ({
      id: s.id,
      clientName: s.client_name,
      productLabel: s.product_label,
      saleAmountCents: s.sale_amount_cents,
      commissionCents: s.commission_cents,
      status: s.status,
      createdAt: s.created_at,
      paidAt: s.paid_at,
      payoutReference: s.payout_reference,
    })),
    payouts: payouts.results.map((p) => ({ id: p.id, period: p.period, totalCents: p.total_cents, reference: p.reference, paidAt: p.paid_at })),
  });
};
