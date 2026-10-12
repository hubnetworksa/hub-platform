import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { logActivity } from '../../_lib/activity-log';
import { sendEmail } from '../../_lib/send-email';
import { getSite } from '../../_lib/site';
import { repPayoutEmailHtml, repPayoutEmailText } from '../../_lib/email-template';
import { sendRepSaleEmail } from '../../_lib/reps';

interface Env {
  DB: D1Database;
  SITE?: string;
  RESEND_API_KEY?: string;
}

const maskAccount = (n: string | null): string | null => {
  const digits = (n ?? '').replace(/\D/g, '');
  return digits.length > 0 ? `****${digits.slice(-4)}` : null;
};

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const idParam = new URL(context.request.url).searchParams.get('id');
  if (idParam !== null) {
    const id = Number(idParam);
    if (!Number.isInteger(id) || id <= 0) return json({ ok: false, error: 'Invalid id.' }, 400);

    const rep = await db
      .prepare(
        `SELECT r.id, r.code, r.status, r.created_at, r.suspended_at, r.bank_name, r.bank_account_holder, r.bank_account_number,
                r.bank_branch_code, r.bank_account_type, r.bank_consent_at, u.email
         FROM sales_reps r JOIN users u ON u.id = r.user_id WHERE r.id = ?`
      )
      .bind(id)
      .first<{ id: number; code: string; status: string; created_at: string; suspended_at: string | null; bank_name: string | null; bank_account_holder: string | null; bank_account_number: string | null; bank_branch_code: string | null; bank_account_type: string | null; bank_consent_at: string | null; email: string }>();
    if (!rep) return json({ ok: false, error: 'Rep not found.' }, 404);

    const sales = await db
      .prepare(
        `SELECT c.id, c.client_name, c.product_label, c.sale_amount_cents, c.commission_cents, c.status, c.void_reason, c.created_at, c.paid_at, c.payout_id, p.reference AS payout_reference
         FROM rep_commissions c LEFT JOIN rep_payouts p ON p.id = c.payout_id
         WHERE c.rep_id = ? ORDER BY c.created_at DESC, c.id DESC`
      )
      .bind(id)
      .all<{ id: number; client_name: string; product_label: string; sale_amount_cents: number; commission_cents: number; status: string; void_reason: string | null; created_at: string; paid_at: string | null; payout_id: number | null; payout_reference: string | null }>();

    const payouts = await db
      .prepare(`SELECT id, period, total_cents, reference, paid_by, paid_at FROM rep_payouts WHERE rep_id = ? ORDER BY paid_at DESC, id DESC`)
      .bind(id)
      .all<{ id: number; period: string; total_cents: number; reference: string | null; paid_by: string | null; paid_at: string }>();

    const hasBank = !!(rep.bank_name || rep.bank_account_number);
    return json({
      ok: true,
      rep: {
        id: rep.id,
        code: rep.code,
        email: rep.email,
        status: rep.status,
        createdAt: rep.created_at,
        suspendedAt: rep.suspended_at,
        bank: hasBank
          ? {
              bankName: rep.bank_name,
              accountHolder: rep.bank_account_holder,
              accountNumber: rep.bank_account_number,
              branchCode: rep.bank_branch_code,
              accountType: rep.bank_account_type,
              consentAt: rep.bank_consent_at,
            }
          : null,
      },
      sales: sales.results.map((s) => ({
        id: s.id,
        clientName: s.client_name,
        productLabel: s.product_label,
        saleAmountCents: s.sale_amount_cents,
        commissionCents: s.commission_cents,
        status: s.status,
        voidReason: s.void_reason,
        createdAt: s.created_at,
        paidAt: s.paid_at,
        payoutId: s.payout_id,
        payoutReference: s.payout_reference,
      })),
      payouts: payouts.results.map((p) => ({ id: p.id, period: p.period, totalCents: p.total_cents, reference: p.reference, paidBy: p.paid_by, paidAt: p.paid_at })),
    });
  }

  const rows = await db
    .prepare(
      `SELECT r.id, r.code, r.status, r.created_at, r.bank_account_number, u.email,
              (SELECT COUNT(*) FROM rep_commissions c WHERE c.rep_id = r.id AND c.status <> 'void') AS sales_count,
              (SELECT COALESCE(SUM(c.commission_cents), 0) FROM rep_commissions c WHERE c.rep_id = r.id AND c.status IN ('approved','paid') AND strftime('%Y-%m', c.created_at) = strftime('%Y-%m', 'now')) AS mtd_cents,
              (SELECT COALESCE(SUM(c.commission_cents), 0) FROM rep_commissions c WHERE c.rep_id = r.id AND c.status IN ('approved','paid')) AS lifetime_cents,
              (SELECT COALESCE(SUM(c.commission_cents), 0) FROM rep_commissions c WHERE c.rep_id = r.id AND c.status = 'approved') AS unpaid_cents,
              (SELECT COALESCE(SUM(c.commission_cents), 0) FROM rep_commissions c WHERE c.rep_id = r.id AND c.status = 'pending') AS pending_cents
       FROM sales_reps r JOIN users u ON u.id = r.user_id
       ORDER BY unpaid_cents DESC, r.created_at DESC`
    )
    .all<{ id: number; code: string; status: string; created_at: string; bank_account_number: string | null; email: string; sales_count: number; mtd_cents: number; lifetime_cents: number; unpaid_cents: number; pending_cents: number }>();

  const reps = rows.results.map((r) => {
    const masked = maskAccount(r.bank_account_number);
    return {
      id: r.id,
      code: r.code,
      email: r.email,
      status: r.status,
      createdAt: r.created_at,
      salesCount: r.sales_count,
      mtdCents: r.mtd_cents,
      lifetimeCents: r.lifetime_cents,
      unpaidCents: r.unpaid_cents,
      pendingCents: r.pending_cents,
      bankMasked: masked,
      hasBank: masked !== null,
    };
  });

  return json({
    ok: true,
    totals: {
      reps: reps.length,
      activeReps: reps.filter((r) => r.status === 'active').length,
      unpaidCents: reps.reduce((s, r) => s + r.unpaidCents, 0),
      pendingCents: reps.reduce((s, r) => s + r.pendingCents, 0),
      mtdCents: reps.reduce((s, r) => s + r.mtdCents, 0),
    },
    reps,
  });
};

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
  const action = String(body.action ?? '');
  const posInt = (v: unknown): number | null => {
    const n = Number(v);
    return Number.isInteger(n) && n > 0 ? n : null;
  };

  if (action === 'suspend' || action === 'reactivate') {
    const repId = posInt(body.repId);
    if (!repId) return json({ ok: false, error: 'Invalid rep.' }, 400);
    const res =
      action === 'suspend'
        ? await db.prepare(`UPDATE sales_reps SET status = 'suspended', suspended_at = datetime('now') WHERE id = ?`).bind(repId).run()
        : await db.prepare(`UPDATE sales_reps SET status = 'active', suspended_at = NULL WHERE id = ?`).bind(repId).run();
    if (!res.meta.changes) return json({ ok: false, error: 'Rep not found.' }, 404);
    await logActivity(db, action === 'suspend' ? 'rep_suspended' : 'rep_reactivated', null, `Sales rep #${repId} ${action === 'suspend' ? 'suspended' : 'reactivated'} by ${user.email}.`);
    return json({ ok: true });
  }

  if (action === 'void') {
    const commissionId = posInt(body.commissionId);
    if (!commissionId) return json({ ok: false, error: 'Invalid commission.' }, 400);
    const reason = String(body.reason ?? '').trim().slice(0, 200);
    const row = await db.prepare(`SELECT status FROM rep_commissions WHERE id = ?`).bind(commissionId).first<{ status: string }>();
    if (!row) return json({ ok: false, error: 'Commission not found.' }, 404);
    if (row.status !== 'pending' && row.status !== 'approved') {
      return json({ ok: false, error: row.status === 'paid' ? 'Already paid, cannot void.' : 'Already void.' }, 400);
    }
    await db
      .prepare(`UPDATE rep_commissions SET status = 'void', void_reason = ? WHERE id = ? AND status IN ('pending','approved')`)
      .bind(reason || null, commissionId)
      .run();
    await logActivity(db, 'rep_commission_void', null, `Commission #${commissionId} voided by ${user.email}${reason ? `: ${reason}` : ''}.`);
    return json({ ok: true });
  }

  if (action === 'approve') {
    const commissionId = posInt(body.commissionId);
    if (!commissionId) return json({ ok: false, error: 'Invalid commission.' }, 400);
    const row = await db
      .prepare(`SELECT rep_id, client_name, product_label, commission_cents, status FROM rep_commissions WHERE id = ?`)
      .bind(commissionId)
      .first<{ rep_id: number; client_name: string; product_label: string; commission_cents: number; status: string }>();
    if (!row) return json({ ok: false, error: 'Commission not found.' }, 404);
    if (row.status !== 'pending') return json({ ok: false, error: `Only pending commissions can be approved (this one is ${row.status}).` }, 400);
    const res = await db
      .prepare(`UPDATE rep_commissions SET status = 'approved', approved_at = datetime('now') WHERE id = ? AND status = 'pending'`)
      .bind(commissionId)
      .run();
    if (res.meta.changes !== 1) return json({ ok: false, error: 'Commission is no longer pending.' }, 409);
    await logActivity(db, 'rep_commission_approved', row.client_name, `Commission #${commissionId} approved by ${user.email}.`);
    await sendRepSaleEmail(context.env, row.rep_id, row.client_name, row.product_label, row.commission_cents);
    return json({ ok: true });
  }

  if (action === 'mark-paid') {
    const repId = posInt(body.repId);
    if (!repId) return json({ ok: false, error: 'Invalid rep.' }, 400);
    const reference = String(body.reference ?? '').trim().slice(0, 80);

    const rep = await db
      .prepare(`SELECT u.email FROM sales_reps r JOIN users u ON u.id = r.user_id WHERE r.id = ?`)
      .bind(repId)
      .first<{ email: string }>();
    if (!rep) return json({ ok: false, error: 'Rep not found.' }, 404);

    const due = await db
      .prepare(`SELECT COALESCE(SUM(commission_cents), 0) AS total, COUNT(*) AS n FROM rep_commissions WHERE rep_id = ? AND status = 'approved'`)
      .bind(repId)
      .first<{ total: number; n: number }>();
    const totalCents = due?.total ?? 0;
    const count = due?.n ?? 0;
    if (!count || totalCents <= 0) return json({ ok: false, error: 'nothing_to_pay' }, 400);

    let payoutId: number;
    try {
      const ins = await db
        .prepare(`INSERT INTO rep_payouts (rep_id, period, total_cents, reference, paid_by) VALUES (?, strftime('%Y-%m','now'), ?, ?, ?)`)
        .bind(repId, totalCents, reference || null, user.email)
        .run();
      payoutId = Number(ins.meta.last_row_id);
      await db
        .prepare(`UPDATE rep_commissions SET status = 'paid', paid_at = datetime('now'), payout_id = ? WHERE rep_id = ? AND status = 'approved'`)
        .bind(payoutId, repId)
        .run();
    } catch {
      return json({ ok: false, error: 'Could not record the payout.' }, 500);
    }

    try {
      const site = getSite(context.env.SITE);
      const period = new Date().toISOString().slice(0, 7);
      const data = { period, totalRand: (totalCents / 100).toFixed(2), reference, dashboardUrl: `https://${site.domain}/rep-dashboard/` };
      await sendEmail(context.env, {
        from: `${site.siteName} <${site.contactEmail}>`,
        to: rep.email,
        subject: `Your ${site.siteName} commission has been paid`,
        text: repPayoutEmailText(site, data),
        html: repPayoutEmailHtml(site, data),
      });
    } catch {
      /* best-effort notification */
    }

    await logActivity(db, 'rep_paid', null, `Paid sales rep #${repId} R${(totalCents / 100).toFixed(2)} (${count} commission${count === 1 ? '' : 's'}) by ${user.email}${reference ? `, ref ${reference}` : ''}.`);
    return json({ ok: true, payoutId, totalCents, count });
  }

  return json({ ok: false, error: 'Unknown action.' }, 400);
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
