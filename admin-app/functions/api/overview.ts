import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, rows, count, json, type Env, type HubSite } from '../_lib/sites';

// The "All sites" home screen: per-site headline numbers and one combined
// "needs attention" queue. Every item deep-links to the matching screen of
// that site's own admin (/admin/... on its domain), where the action is taken.

interface QueueItem {
  site: string;
  type: string;
  label: string;
  title: string;
  detail: string;
  created_at: string;
  link: string;
}

// [type, label, admin path, SQL returning title, detail, created_at]
const QUEUES: [string, string, string, string][] = [
  [
    'submission',
    'New listing',
    '/admin/submissions/',
    `SELECT name AS title, COALESCE(suburb_slug, '') AS detail, created_at FROM pending_submissions
     WHERE owner_confirm_token IS NULL AND admin_approved_at IS NULL ORDER BY created_at DESC LIMIT 25`,
  ],
  [
    'claim',
    'Business claim',
    '/admin/claims/',
    `SELECT b.name AS title, COALESCE(bc.contact_name, '') AS detail, bc.created_at FROM business_claims bc
     JOIN businesses b ON b.id = bc.business_id WHERE bc.status = 'pending' ORDER BY bc.created_at DESC LIMIT 25`,
  ],
  [
    'report',
    'Report',
    '/admin/reports/',
    `SELECT business_name AS title, CASE kind WHEN 'removal' THEN 'Removal request' ELSE 'Problem report' END AS detail, created_at
     FROM reports WHERE status = 'open' ORDER BY created_at DESC LIMIT 25`,
  ],
  [
    'message',
    'Message',
    '/admin/enquiries/',
    `SELECT COALESCE(business_name, name, 'Contact form') AS title, CASE kind WHEN 'enquiry' THEN 'Enquiry' ELSE 'Contact form' END AS detail, created_at
     FROM messages WHERE status = 'open' ORDER BY created_at DESC LIMIT 25`,
  ],
  [
    'review',
    'Review',
    '/admin/reviews/',
    `SELECT b.name AS title, r.author_name AS detail, r.created_at FROM reviews r
     JOIN businesses b ON b.id = r.business_id WHERE r.status = 'pending' ORDER BY r.created_at DESC LIMIT 25`,
  ],
  [
    'event',
    'Event',
    '/admin/events/',
    `SELECT title, COALESCE(contact_name, '') AS detail, created_at FROM event_submissions
     WHERE status = 'pending' ORDER BY created_at DESC LIMIT 25`,
  ],
  [
    'event-claim',
    'Event claim',
    '/admin/events/',
    `SELECT e.title AS title, COALESCE(ec.contact_name, '') AS detail, ec.created_at FROM event_claims ec
     JOIN events e ON e.id = ec.event_id WHERE ec.status = 'pending' ORDER BY ec.created_at DESC LIMIT 25`,
  ],
];

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
    Promise.all(
      QUEUES.map(async ([type, label, path, sql]) =>
        (await rows<{ title: string; detail: string; created_at: string }>(db, sql)).map(
          (r): QueueItem => ({ site: site.slug, type, label, title: r.title, detail: r.detail, created_at: r.created_at, link: `https://${site.domain}${path}` })
        )
      )
    ),
    checkSite(site.domain),
  ]);
  const items = queues.flat();
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
