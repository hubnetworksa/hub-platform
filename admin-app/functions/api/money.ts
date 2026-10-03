import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, rows, type Env, type HubSite } from '../_lib/sites';
import { readReport, writeReport } from '../_lib/alerts';

// The Money screen: income per month, monthly recurring income from paid
// plans and sponsor spots, new and cancelled plans, payments that didn't go
// through, plans ending soon, an upsell list (free listings people look at
// most) and AdSense earnings (from the daily Google workflow).

const PRODUCT: Record<string, string> = {
  tier: 'Plan',
  category_sponsor: 'Category sponsor',
  suburb_sponsor: 'Suburb sponsor',
  homepage_banner: 'Homepage banner',
  centre_sponsor: 'Centre sponsor',
  guide_sponsor: 'Guide sponsor',
  tourism_sponsor: 'Tourism sponsor',
};
const TIER: Record<number, string> = { 1: 'Verified', 2: 'Featured' };

interface Sub {
  id: number;
  business: string;
  slug: string;
  tier: number;
  product_type: string;
  billing_period: string | null;
  status: string;
  started_at: string | null;
  current_period_end: string | null;
  cancelled_at: string | null;
  last_cents: number | null;
}

async function upsell(s: HubSite) {
  return rows<{ slug: string; name: string; views: number; taps: number; owned: number }>(
    s.db,
    `SELECT b.slug, b.name, t.views, t.taps, (b.owner_user_id IS NOT NULL) AS owned
     FROM (SELECT business_id, SUM(event = 'view') AS views, SUM(event IN ('phone_click', 'website_click', 'whatsapp_click')) AS taps
           FROM business_stats WHERE created_at >= datetime('now', '-30 days') AND event IN ('view', 'phone_click', 'website_click', 'whatsapp_click')
           GROUP BY business_id) t
     JOIN businesses b ON b.id = t.business_id
     WHERE COALESCE(b.subscription_tier, 0) = 0 AND b.status = 'published' AND b.closed_at IS NULL AND b.is_test = 0
     ORDER BY t.taps * 5 + t.views DESC LIMIT 25`
  );
}

async function siteMoney(env: Env, s: HubSite) {
  const subs = await rows<Sub>(
    s.db,
    `SELECT s.id, b.name AS business, b.slug, s.tier, s.product_type, s.billing_period, s.status, s.started_at, s.current_period_end, s.cancelled_at,
            (SELECT p.amount_cents FROM payments p WHERE p.subscription_id = s.id AND p.status = 'COMPLETE' ORDER BY p.paid_at DESC LIMIT 1) AS last_cents
     FROM subscriptions s JOIN businesses b ON b.id = s.business_id
     WHERE s.status IN ('active', 'cancelled') OR s.started_at >= date('now', '-90 days') OR s.cancelled_at >= date('now', '-90 days')`
  );
  const now = new Date().toISOString().replace('T', ' ').slice(0, 19);
  const soon = new Date(Date.now() + 14 * 86400000).toISOString().replace('T', ' ').slice(0, 19);
  const late = new Date(Date.now() - 3 * 86400000).toISOString().replace('T', ' ').slice(0, 19);
  const month = now.slice(0, 7);
  const label = (x: Sub) => (x.product_type === 'tier' ? `${TIER[x.tier] ?? 'Paid'} plan` : PRODUCT[x.product_type] ?? x.product_type);
  const live = subs.filter((x) => x.status === 'active' || (x.status === 'cancelled' && x.current_period_end && x.current_period_end > now));
  const mrr = live
    .filter((x) => x.status === 'active')
    .reduce((a, x) => a + (x.last_cents ? (x.billing_period === 'yearly' ? x.last_cents / 12 : x.last_cents) : 0), 0);
  const item = (x: Sub, note: string) => ({ business: x.business, slug: x.slug, product: label(x), period: x.billing_period === 'yearly' ? 'yearly' : 'monthly', cents: x.last_cents, note });

  const revenue = await rows<{ m: string; kind: string; cents: number }>(
    s.db,
    `SELECT strftime('%Y-%m', paid_at) AS m, 'plans' AS kind, SUM(amount_cents) AS cents FROM payments WHERE status = 'COMPLETE' AND paid_at >= date('now', 'start of month', '-11 months') GROUP BY m
     UNION ALL
     SELECT strftime('%Y-%m', paid_at) AS m, 'events' AS kind, SUM(amount_cents) AS cents FROM event_payments WHERE status = 'complete' AND paid_at >= date('now', 'start of month', '-11 months') GROUP BY m`
  );
  const failed = await rows<{ business: string; slug: string; cents: number; status: string; paid_at: string }>(
    s.db,
    `SELECT b.name AS business, b.slug, p.amount_cents AS cents, p.status, p.paid_at FROM payments p JOIN subscriptions s ON s.id = p.subscription_id JOIN businesses b ON b.id = s.business_id
     WHERE p.status != 'COMPLETE' AND p.paid_at >= date('now', '-60 days') ORDER BY p.paid_at DESC LIMIT 50`
  );

  // The upsell list reads a month of listing stats: kept 12 hours.
  const kind = `upsell:${s.slug}`;
  const cached = await readReport<Awaited<ReturnType<typeof upsell>>>(env.ADMIN_DB, kind);
  let ups = cached?.data;
  if (!cached || Date.now() - new Date(`${cached.updated_at.replace(' ', 'T')}Z`).getTime() > 12 * 3600_000) {
    ups = await upsell(s);
    await writeReport(env.ADMIN_DB, kind, ups);
  }

  return {
    slug: s.slug,
    domain: s.domain,
    mrr_cents: Math.round(mrr),
    paying: live.length,
    by_product: Object.entries(live.reduce<Record<string, number>>((m, x) => ((m[label(x)] = (m[label(x)] ?? 0) + 1), m), {})).map(([product, n]) => ({ product, n })),
    new_this_month: subs.filter((x) => (x.started_at ?? '').startsWith(month)).map((x) => item(x, `started ${x.started_at?.slice(0, 10)}`)),
    cancelled_this_month: subs.filter((x) => (x.cancelled_at ?? '').startsWith(month)).map((x) => item(x, `cancelled ${x.cancelled_at?.slice(0, 10)}`)),
    ending_soon: live
      .filter((x) => x.current_period_end && x.current_period_end <= soon)
      .sort((a, b) => (a.current_period_end ?? '').localeCompare(b.current_period_end ?? ''))
      .map((x) => item(x, x.status === 'cancelled' ? `cancelled, ends ${x.current_period_end?.slice(0, 10)}` : `renews ${x.current_period_end?.slice(0, 10)}`)),
    overdue: subs.filter((x) => x.status === 'active' && x.current_period_end && x.current_period_end < late).map((x) => item(x, `renewal was due ${x.current_period_end?.slice(0, 10)}`)),
    failed,
    revenue,
    upsell: ups ?? [],
  };
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const sites = await Promise.all(hubSites(env).map((s) => siteMoney(env, s)));
  const google = await readReport<{ adsense?: { error?: string; currency?: string; daily?: { date: string; domain: string; earnings: number; pageViews: number; clicks: number }[] } }>(env.ADMIN_DB, 'google');
  return json({ ok: true, sites, adsense: google?.data.adsense ?? null, adsense_updated_at: google?.updated_at ?? null });
};
