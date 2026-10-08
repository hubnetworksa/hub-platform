import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { hubSites, count, json, checkSite, type Env, type HubSite } from '../_lib/sites';
import { siteQueue, siteQueueCounts } from '../_lib/queues';
import { readReport } from '../_lib/alerts';

// The "All sites" home screen: per-site headline numbers and one combined
// "needs attention" queue (see _lib/queues.ts).

async function siteSummary(site: HubSite, adminDb: D1Database) {
  const db = site.db;
  const [listings, users, paidPlans, revenueMonth, awaitingOwner, queues, counts, health, gate] = await Promise.all([
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
    siteQueueCounts(site),
    checkSite(site.domain),
    // Indexable listings come from the Indexing screen's cache (no extra city call).
    readReport<{ totals?: { indexed?: number } }>(adminDb, `index-gate:${site.slug}:v1`).catch(() => null),
  ]);
  const items = queues;
  // True counts per type; `items` is only the newest 25 of each.
  const pending: Record<string, number> = {};
  for (const [t, n] of Object.entries(counts)) if (n > 0) pending[t] = n;
  const waiting = Object.values(pending).reduce((a, n) => a + n, 0);
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
    waiting,
    indexable: typeof gate?.data.totals?.indexed === 'number' ? gate.data.totals.indexed : null,
    health,
    items,
  };
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const summaries = await Promise.all(hubSites(context.env).map((s) => siteSummary(s, context.env.ADMIN_DB)));
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
    // The real number waiting (the list above is capped at 25 per type, 150 in all).
    queueTotal: summaries.reduce((a, s) => a + s.waiting, 0),
  });
};
