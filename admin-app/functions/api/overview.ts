import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, count, json, type Env, type HubSite } from '../_lib/sites';
import { siteQueue } from '../_lib/queues';

// The "All sites" home screen: per-site headline numbers and one combined
// "needs attention" queue (see _lib/queues.ts).

async function siteSummary(site: HubSite) {
  const db = site.db;
  const [listings, users, paidPlans, revenueMonth, awaitingOwner, queues, health] = await Promise.all([
    count(db, `SELECT COUNT(*) FROM businesses WHERE status = 'published' AND closed_at IS NULL`),
    count(db, `SELECT COUNT(*) FROM users WHERE email_verified_at IS NOT NULL`),
    count(db, `SELECT COUNT(*) FROM subscriptions WHERE status = 'active' AND m_payment_id NOT LIKE 'admin-comp-%'`),
    count(
      db,
      `SELECT COALESCE(SUM(amount_cents), 0) FROM (
         SELECT amount_cents FROM payments WHERE status = 'COMPLETE' AND paid_at >= date('now', 'start of month')
         UNION ALL
         SELECT amount_cents FROM event_payments WHERE status = 'complete' AND paid_at >= date('now', 'start of month'))`
    ),
    count(db, `SELECT COUNT(*) FROM pending_submissions WHERE owner_confirm_token IS NOT NULL`),
    siteQueue(site),
    checkSite(site.domain),
  ]);
  const items = queues;
  const pending: Record<string, number> = {};
  for (const it of items) pending[it.type] = (pending[it.type] ?? 0) + 1;
  return {
    slug: site.slug,
    name: site.name,
    city: site.city,
    domain: site.domain,
    listings,
    users,
    paidPlans,
    revenueMonthCents: revenueMonth,
    awaitingOwner,
    pending,
    health,
    items,
  };
}

async function checkSite(domain: string): Promise<{ ok: boolean; status: number; ms: number }> {
  const start = Date.now();
  try {
    const res = await fetch(`https://${domain}/`, { method: 'HEAD', redirect: 'manual', cf: { cacheTtl: 0 } } as RequestInit);
    return { ok: res.status >= 200 && res.status < 400, status: res.status, ms: Date.now() - start };
  } catch {
    return { ok: false, status: 0, ms: Date.now() - start };
  }
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const summaries = await Promise.all(hubSites(context.env).map(siteSummary));
  const queue = summaries
    .flatMap((s) => s.items)
    .sort((a, b) => (a.created_at < b.created_at ? 1 : -1))
    .slice(0, 150);
  return json({
    ok: true,
    email: context.data.email,
    generatedAt: new Date().toISOString(),
    sites: summaries.map(({ items: _items, ...s }) => s),
    queue,
  });
};
