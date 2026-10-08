import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { hubSites, json, type Env } from '../_lib/sites';
import { jsonBody } from '../_lib/body';

// The Sales reps screen: every city's sales reps, commissions and payouts in
// one place, read from and written to each city's database directly (the
// sales_reps, rep_commissions and rep_payouts tables; same queries as the
// site's own functions/api/admin/reps.ts, minus the payout email and the
// site's activity log).
//   GET                 all cities: { cities: [{ slug, name, ok, error?, totals, reps }], grand }
//   GET ?site=&id=      one rep's detail from one city
//   POST { site, action, ... }  suspend / reactivate / void / mark-paid on one city

const EMPTY = { reps: 0, activeReps: 0, unpaidCents: 0, mtdCents: 0 };
const maskAccount = (n: string | null): string | null => {
  const digits = (n ?? '').replace(/\D/g, '');
  return digits.length > 0 ? `****${digits.slice(-4)}` : null;
};
const posInt = (v: unknown): number | null => {
  const n = Number(v);
  return Number.isInteger(n) && n > 0 ? n : null;
};

async function cityList(db: D1Database) {
  const rows = await db
    .prepare(
      `SELECT r.id, r.code, r.status, r.created_at, r.bank_account_number, u.email,
              (SELECT COUNT(*) FROM rep_commissions c WHERE c.rep_id = r.id AND c.status <> 'void') AS sales_count,
              (SELECT COALESCE(SUM(c.commission_cents), 0) FROM rep_commissions c WHERE c.rep_id = r.id AND c.status IN ('approved','paid') AND strftime('%Y-%m', c.created_at) = strftime('%Y-%m', 'now')) AS mtd_cents,
              (SELECT COALESCE(SUM(c.commission_cents), 0) FROM rep_commissions c WHERE c.rep_id = r.id AND c.status IN ('approved','paid')) AS lifetime_cents,
              (SELECT COALESCE(SUM(c.commission_cents), 0) FROM rep_commissions c WHERE c.rep_id = r.id AND c.status = 'approved') AS unpaid_cents
       FROM sales_reps r JOIN users u ON u.id = r.user_id
       ORDER BY unpaid_cents DESC, r.created_at DESC`
    )
    .all<{ id: number; code: string; status: string; created_at: string; bank_account_number: string | null; email: string; sales_count: number; mtd_cents: number; lifetime_cents: number; unpaid_cents: number }>();
  const reps = rows.results.map((r) => {
    const masked = maskAccount(r.bank_account_number);
    return { id: r.id, code: r.code, email: r.email, status: r.status, createdAt: r.created_at, salesCount: r.sales_count, mtdCents: r.mtd_cents, lifetimeCents: r.lifetime_cents, unpaidCents: r.unpaid_cents, bankMasked: masked, hasBank: masked !== null };
  });
  return {
    totals: { reps: reps.length, activeReps: reps.filter((r) => r.status === 'active').length, unpaidCents: reps.reduce((s, r) => s + r.unpaidCents, 0), mtdCents: reps.reduce((s, r) => s + r.mtdCents, 0) },
    reps,
  };
}

type Row = Record<string, string | number | null>;

async function cityDetail(db: D1Database, id: number) {
  const rep = await db
    .prepare(
      `SELECT r.id, r.code, r.status, r.created_at, r.suspended_at, r.bank_name, r.bank_account_holder, r.bank_account_number,
              r.bank_branch_code, r.bank_account_type, r.bank_consent_at, u.email
       FROM sales_reps r JOIN users u ON u.id = r.user_id WHERE r.id = ?`
    )
    .bind(id)
    .first<Row>();
  if (!rep) return null;
  const sales = await db
    .prepare(
      `SELECT c.id, c.client_name, c.product_label, c.sale_amount_cents, c.commission_cents, c.status, c.void_reason, c.created_at, c.paid_at, c.payout_id, p.reference AS payout_reference
       FROM rep_commissions c LEFT JOIN rep_payouts p ON p.id = c.payout_id
       WHERE c.rep_id = ? ORDER BY c.created_at DESC, c.id DESC`
    )
    .bind(id)
    .all<Row>();
  const payouts = await db
    .prepare(`SELECT id, period, total_cents, reference, paid_by, paid_at FROM rep_payouts WHERE rep_id = ? ORDER BY paid_at DESC, id DESC`)
    .bind(id)
    .all<Row>();
  const hasBank = !!(rep.bank_name || rep.bank_account_number);
  return {
    ok: true,
    rep: {
      id: rep.id,
      code: rep.code,
      email: rep.email,
      status: rep.status,
      createdAt: rep.created_at,
      suspendedAt: rep.suspended_at,
      bank: hasBank ? { bankName: rep.bank_name, accountHolder: rep.bank_account_holder, accountNumber: rep.bank_account_number, branchCode: rep.bank_branch_code, accountType: rep.bank_account_type, consentAt: rep.bank_consent_at } : null,
    },
    sales: sales.results.map((s) => ({ id: s.id, clientName: s.client_name, productLabel: s.product_label, saleAmountCents: s.sale_amount_cents, commissionCents: s.commission_cents, status: s.status, voidReason: s.void_reason, createdAt: s.created_at, paidAt: s.paid_at, payoutId: s.payout_id, payoutReference: s.payout_reference })),
    payouts: payouts.results.map((p) => ({ id: p.id, period: p.period, totalCents: p.total_cents, reference: p.reference, paidBy: p.paid_by, paidAt: p.paid_at })),
  };
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const url = new URL(context.request.url);
  const siteSlug = url.searchParams.get('site');

  if (siteSlug) {
    const site = hubSites(env).find((s) => s.slug === siteSlug);
    const id = posInt(url.searchParams.get('id'));
    if (!site || !id) return json({ ok: false, error: 'Invalid request.' }, 400);
    try {
      const d = await cityDetail(site.db, id);
      return d ? json(d) : json({ ok: false, error: 'Rep not found.' }, 404);
    } catch (e) {
      return json({ ok: false, error: `${site.name}: ${e instanceof Error ? e.message : 'query failed'}` }, 500);
    }
  }

  const cities = await Promise.all(
    hubSites(env).map(async (s) => {
      try {
        return { slug: s.slug, name: s.city, ok: true, error: undefined as string | undefined, ...(await cityList(s.db)) };
      } catch (e) {
        return { slug: s.slug, name: s.city, ok: false, error: e instanceof Error ? e.message : 'Query failed', totals: EMPTY, reps: [] as never[] };
      }
    })
  );
  const grand = cities.reduce(
    (a, c) => ({ reps: a.reps + c.totals.reps, activeReps: a.activeReps + c.totals.activeReps, unpaidCents: a.unpaidCents + c.totals.unpaidCents, mtdCents: a.mtdCents + c.totals.mtdCents }),
    { ...EMPTY }
  );
  return json({ ok: true, cities, grand });
};

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const actor = String(context.data.email);
  const body = await jsonBody(context.request);
  const site = hubSites(env).find((s) => s.slug === body?.site);
  const action = typeof body?.action === 'string' ? body.action : '';
  if (!site || !body) return json({ ok: false, error: 'Invalid request.' }, 400);
  const db = site.db;

  try {
    if (action === 'suspend' || action === 'reactivate') {
      const repId = posInt(body.repId);
      if (!repId) return json({ ok: false, error: 'Invalid rep.' }, 400);
      const res =
        action === 'suspend'
          ? await db.prepare(`UPDATE sales_reps SET status = 'suspended', suspended_at = datetime('now') WHERE id = ?`).bind(repId).run()
          : await db.prepare(`UPDATE sales_reps SET status = 'active', suspended_at = NULL WHERE id = ?`).bind(repId).run();
      if (!res.meta.changes) return json({ ok: false, error: 'Rep not found.' }, 404);
      return json({ ok: true });
    }

    if (action === 'void') {
      const commissionId = posInt(body.commissionId);
      if (!commissionId) return json({ ok: false, error: 'Invalid commission.' }, 400);
      const reason = String(body.reason ?? '').trim().slice(0, 200);
      const row = await db.prepare(`SELECT status FROM rep_commissions WHERE id = ?`).bind(commissionId).first<{ status: string }>();
      if (!row) return json({ ok: false, error: 'Commission not found.' }, 404);
      if (row.status !== 'pending' && row.status !== 'approved') return json({ ok: false, error: row.status === 'paid' ? 'Already paid, cannot void.' : 'Already void.' }, 400);
      await db.prepare(`UPDATE rep_commissions SET status = 'void', void_reason = ? WHERE id = ? AND status IN ('pending','approved')`).bind(reason || null, commissionId).run();
      return json({ ok: true });
    }

    if (action === 'mark-paid') {
      const repId = posInt(body.repId);
      if (!repId) return json({ ok: false, error: 'Invalid rep.' }, 400);
      const reference = String(body.reference ?? '').trim().slice(0, 80);
      const rep = await db.prepare(`SELECT id FROM sales_reps WHERE id = ?`).bind(repId).first();
      if (!rep) return json({ ok: false, error: 'Rep not found.' }, 404);
      const due = await db.prepare(`SELECT COALESCE(SUM(commission_cents), 0) AS total, COUNT(*) AS n FROM rep_commissions WHERE rep_id = ? AND status = 'approved'`).bind(repId).first<{ total: number; n: number }>();
      const totalCents = due?.total ?? 0;
      const count = due?.n ?? 0;
      if (!count || totalCents <= 0) return json({ ok: false, error: 'Nothing to pay.' }, 400);
      const ins = await db
        .prepare(`INSERT INTO rep_payouts (rep_id, period, total_cents, reference, paid_by) VALUES (?, strftime('%Y-%m','now'), ?, ?, ?)`)
        .bind(repId, totalCents, reference || null, actor)
        .run();
      const payoutId = Number(ins.meta.last_row_id);
      await db.prepare(`UPDATE rep_commissions SET status = 'paid', paid_at = datetime('now'), payout_id = ? WHERE rep_id = ? AND status = 'approved'`).bind(payoutId, repId).run();
      return json({ ok: true, payoutId, totalCents, count });
    }
  } catch (e) {
    return json({ ok: false, error: `${site.name}: ${e instanceof Error ? e.message : 'database error'}` }, 500);
  }
  return json({ ok: false, error: 'Unknown action.' }, 400);
};
