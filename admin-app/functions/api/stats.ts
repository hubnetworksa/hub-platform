import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { hubSites, selectSites, rows, json, type Env, type HubSite } from '../_lib/sites';

// Stats for the Stats screen: GET /api/stats?range=7|30|90&site=all|<slug>
//
// Everything comes from what the sites already record:
//   business_stats  listing views, phone/WhatsApp/website taps, search appearances (+ query)
//   messages        enquiries sent to businesses
//   users           sign-ups;  app_events  installs/opens of the phone app
//   payments, event_payments  revenue
// plus Google Search Console totals from the weekly report the repo already
// commits (status/seo/latest.json).
//
// Results are kept in memory for 10 minutes per range: business_stats is the
// biggest table and every query here scans the window, so a dashboard left
// open doesn't eat into D1's daily read allowance.

const RANGES = [7, 30, 90];
const CONTACT_EVENTS = ['phone_click', 'whatsapp_click', 'website_click'];
const TTL = 10 * 60 * 1000;
const cache = new Map<string, { at: number; data: unknown }>();

function dayList(n: number, offset = 0): string[] {
  const out: string[] = [];
  const today = new Date();
  today.setUTCHours(0, 0, 0, 0);
  for (let i = n - 1 + offset; i >= offset; i--) out.push(new Date(today.getTime() - i * 86400000).toISOString().slice(0, 10));
  return out;
}

function monthList(n: number): string[] {
  const out: string[] = [];
  const d = new Date();
  d.setUTCDate(1);
  for (let i = n - 1; i >= 0; i--) {
    const m = new Date(Date.UTC(d.getUTCFullYear(), d.getUTCMonth() - i, 1));
    out.push(m.toISOString().slice(0, 7));
  }
  return out;
}

async function siteStats(site: HubSite, range: number) {
  const db = site.db;
  const since = `-${range * 2} days`;
  const sinceCur = `-${range} days`;
  const [daily, msgs, signups, installs, top, queries, cats, revenue, enqBy, groups, groupCounts] = await Promise.all([
    rows<{ d: string; event: string; n: number }>(
      db,
      `SELECT date(created_at) AS d, event, COUNT(*) AS n FROM business_stats WHERE created_at >= datetime('now', ?) GROUP BY d, event`,
      since
    ),
    rows<{ d: string; n: number }>(db, `SELECT date(created_at) AS d, COUNT(*) AS n FROM messages WHERE kind = 'enquiry' AND created_at >= datetime('now', ?) GROUP BY d`, since),
    rows<{ d: string; n: number }>(db, `SELECT date(created_at) AS d, COUNT(*) AS n FROM users WHERE email_verified_at IS NOT NULL AND created_at >= datetime('now', ?) GROUP BY d`, since),
    rows<{ d: string; event: string; n: number }>(db, `SELECT date(created_at) AS d, event, COUNT(DISTINCT device_id) AS n FROM app_events WHERE created_at >= datetime('now', ?) GROUP BY d, event`, since),
    rows<{ name: string; slug: string; views: number; contacts: number; phone: number; whatsapp: number; website: number }>(
      db,
      `SELECT b.name, b.slug, SUM(s.event = 'view') AS views, SUM(s.event IN ('phone_click', 'whatsapp_click', 'website_click')) AS contacts,
              SUM(s.event = 'phone_click') AS phone, SUM(s.event = 'whatsapp_click') AS whatsapp, SUM(s.event = 'website_click') AS website
       FROM business_stats s JOIN businesses b ON b.id = s.business_id
       WHERE s.created_at >= datetime('now', ?) GROUP BY s.business_id ORDER BY views DESC LIMIT 15`,
      sinceCur
    ),
    rows<{ query: string; n: number }>(
      db,
      `SELECT lower(trim(query)) AS query, COUNT(DISTINCT ip_hash || date(created_at)) AS n FROM business_stats
       WHERE event = 'search_appearance' AND query IS NOT NULL AND trim(query) != '' AND created_at >= datetime('now', ?)
       GROUP BY lower(trim(query)) ORDER BY n DESC LIMIT 15`,
      sinceCur
    ),
    rows<{ name: string; views: number }>(
      db,
      `SELECT c.name, COUNT(*) AS views FROM business_stats s
       JOIN business_categories bc ON bc.business_id = s.business_id AND bc.is_primary = 1
       JOIN categories c ON c.id = bc.category_id
       WHERE s.event = 'view' AND s.created_at >= datetime('now', ?) GROUP BY c.id ORDER BY views DESC LIMIT 12`,
      sinceCur
    ),
    rows<{ m: string; cents: number }>(
      db,
      `SELECT m, SUM(amount_cents) AS cents FROM (
         SELECT strftime('%Y-%m', paid_at) AS m, amount_cents FROM payments WHERE status = 'COMPLETE' AND paid_at >= date('now', 'start of month', '-11 months')
         UNION ALL
         SELECT strftime('%Y-%m', paid_at) AS m, amount_cents FROM event_payments WHERE status = 'complete' AND paid_at >= date('now', 'start of month', '-11 months'))
       GROUP BY m`
    ),
    // Enquiries per listing (the listing form records the slug).
    rows<{ slug: string; n: number }>(db, `SELECT business_slug AS slug, COUNT(*) AS n FROM messages WHERE kind = 'enquiry' AND business_slug IS NOT NULL AND created_at >= datetime('now', ?) GROUP BY business_slug`, sinceCur),
    // Paid vs free: views and contact taps in the period, and how many listings are in each group.
    rows<{ paid: number; views: number; taps: number }>(
      db,
      `SELECT (COALESCE(b.subscription_tier, 0) > 0) AS paid, SUM(s.event = 'view') AS views, SUM(s.event IN ('phone_click', 'whatsapp_click', 'website_click')) AS taps
       FROM business_stats s JOIN businesses b ON b.id = s.business_id
       WHERE s.created_at >= datetime('now', ?) AND b.status = 'published' GROUP BY paid`,
      sinceCur
    ),
    rows<{ paid: number; n: number }>(db, `SELECT (COALESCE(subscription_tier, 0) > 0) AS paid, COUNT(*) AS n FROM businesses WHERE status = 'published' AND closed_at IS NULL GROUP BY paid`),
  ]);

  const days = dayList(range * 2);
  const idx = new Map(days.map((d, i) => [d, i]));
  const blank = () => days.map(() => 0);
  const s = { views: blank(), contacts: blank(), searches: blank(), enquiries: blank(), signups: blank(), installs: blank(), opens: blank() };
  const clicks = { phone_click: 0, whatsapp_click: 0, website_click: 0 };
  for (const r of daily) {
    const i = idx.get(r.d);
    if (i === undefined) continue;
    if (r.event === 'view') s.views[i] += r.n;
    else if (r.event === 'search_appearance') s.searches[i] += r.n;
    else if (CONTACT_EVENTS.includes(r.event)) {
      s.contacts[i] += r.n;
      if (i >= range) clicks[r.event as keyof typeof clicks] += r.n;
    }
  }
  for (const r of msgs) if (idx.has(r.d)) s.enquiries[idx.get(r.d)!] += r.n;
  for (const r of signups) if (idx.has(r.d)) s.signups[idx.get(r.d)!] += r.n;
  for (const r of installs) {
    const i = idx.get(r.d);
    if (i === undefined) continue;
    if (r.event === 'install') s.installs[i] += r.n;
    else s.opens[i] += r.n;
  }

  const months = monthList(12);
  const rev = new Map(revenue.map((r) => [r.m, r.cents]));
  return {
    slug: site.slug,
    // [previous period..., current period...]; the client splits at `range`.
    series: s,
    clicks,
    paidVsFree: [0, 1].map((p) => ({ paid: p === 1, listings: groupCounts.find((g) => Number(g.paid) === p)?.n ?? 0, views: groups.find((g) => Number(g.paid) === p)?.views ?? 0, taps: groups.find((g) => Number(g.paid) === p)?.taps ?? 0 })),
    top: top.map((t) => ({ ...t, enquiries: enqBy.find((e) => e.slug === t.slug)?.n ?? 0, url: `https://${site.domain}/business/${t.slug}/` })),
    queries,
    categories: cats,
    revenue: months.map((m) => rev.get(m) ?? 0),
  };
}

interface SeoSite {
  slug: string;
  searchAnalytics?: {
    windows?: { current?: { startDate: string; endDate: string } };
    totals?: { current?: { clicks: number; impressions: number; position: number }; previous?: { clicks: number; impressions: number } };
    pagesWithImpressions?: { current?: number; previous?: number };
    topPages?: { page?: string; keys?: string[]; clicks: number; impressions: number; position: number }[];
    topQueries?: { query?: string; keys?: string[]; clicks: number; impressions: number; position: number }[];
  };
}

async function searchConsole(): Promise<unknown[]> {
  try {
    const res = await fetch('https://raw.githubusercontent.com/hubnetworksa/hub-platform/main/status/seo/latest.json', { cf: { cacheTtl: 3600 } } as RequestInit);
    if (!res.ok) return [];
    const body = (await res.json()) as { sites?: SeoSite[] };
    return (body.sites ?? []).map((s) => {
      const a = s.searchAnalytics ?? {};
      return {
        slug: s.slug,
        window: a.windows?.current ?? null,
        clicks: a.totals?.current?.clicks ?? 0,
        impressions: a.totals?.current?.impressions ?? 0,
        position: a.totals?.current?.position ?? null,
        prevClicks: a.totals?.previous?.clicks ?? 0,
        prevImpressions: a.totals?.previous?.impressions ?? 0,
        pages: a.pagesWithImpressions?.current ?? 0,
        topPages: (a.topPages ?? []).slice(0, 10).map((p) => ({ page: p.page ?? p.keys?.[0] ?? '', clicks: p.clicks, impressions: p.impressions, position: p.position })),
        topQueries: (a.topQueries ?? []).slice(0, 10).map((q) => ({ query: q.query ?? q.keys?.[0] ?? '', clicks: q.clicks, impressions: q.impressions, position: q.position })),
      };
    });
  } catch {
    return [];
  }
}

// First-party totals over the last `days` days for one site (used by the
// Analytics funnel): listing views, contact taps by kind, enquiries, searches.
export async function firstPartyTotals(db: D1Database, days: number) {
  const since = `-${days} days`;
  const [ev, enq] = await Promise.all([
    rows<{ event: string; n: number }>(db, `SELECT event, COUNT(*) AS n FROM business_stats WHERE created_at >= datetime('now', ?) GROUP BY event`, since),
    rows<{ n: number }>(db, `SELECT COUNT(*) AS n FROM messages WHERE kind = 'enquiry' AND created_at >= datetime('now', ?)`, since),
  ]);
  const get = (e: string) => Number(ev.find((r) => r.event === e)?.n ?? 0);
  return {
    range: days,
    views: get('view'),
    contacts: { phone: get('phone_click'), whatsapp: get('whatsapp_click'), website: get('website_click') },
    enquiries: Number(enq[0]?.n ?? 0),
    searches: get('search_appearance'),
  };
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const url = new URL(context.request.url);
  const range = RANGES.includes(Number(url.searchParams.get('range'))) ? Number(url.searchParams.get('range')) : 30;
  const siteParam = url.searchParams.get('site') ?? 'all';
  const sites = selectSites(context.env, siteParam);
  if (!sites.length) return json({ ok: false, error: 'Unknown site.' }, 400);

  const key = `${range}:${sites.map((s) => s.slug).join(',')}`;
  const hit = cache.get(key);
  if (hit && Date.now() - hit.at < TTL && url.searchParams.get('fresh') !== '1') return json(hit.data);

  const [perSite, seo] = await Promise.all([Promise.all(sites.map((s) => siteStats(s, range))), searchConsole()]);
  const data = {
    ok: true,
    range,
    generatedAt: new Date().toISOString(),
    days: dayList(range * 2),
    months: monthList(12),
    sites: hubSites(context.env).map((s) => ({ slug: s.slug, name: s.name, city: s.city, domain: s.domain })),
    selected: sites.map((s) => s.slug),
    perSite,
    seo: (seo as { slug: string }[]).filter((s) => sites.some((x) => x.slug === s.slug)),
  };
  cache.set(key, { at: Date.now(), data });
  return json(data);
};
