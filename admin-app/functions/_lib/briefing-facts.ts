import type { D1Database } from '@cloudflare/workers-types';
import { hubSites, rows, type Env, type HubSite } from './sites';
import { readReport, writeReport } from './alerts';
import { gatherFacts, readBriefing, saDay } from './briefing';
import { qualityReport, qualityReportKey } from './quality';
import { routineHealth, D1_FREE_ROWS_READ, D1_FREE_ROWS_WRITTEN, type WorkflowRun } from './health';
import type { Check } from './security';

// The full facts for the morning-briefing routine: everything Hub Admin knows
// about each site and about the whole operation, so the briefing can cover
// the entire website rather than a few 24-hour counts. Built once a morning
// by /api/briefing/facts (a few dozen reads per city plus the reports the
// scheduled workflows already store), and kept in reports 'briefing_facts' so
// /api/briefing/submit can store them with the briefing without reading every
// database a second time.
//
// Same privacy rule as the light facts (briefing.ts): aggregated numbers,
// business names, page paths, searches and upgrade titles only. No visitor or
// admin names, emails, phone numbers or message text.

export const FULL_FACTS_KIND = 'briefing_facts';
const KEY_PAGES = ['/', '/category/', '/suburb/', '/about/', '/events/', '/news/', '/search/', '/shopping-center/', '/tourism/', '/guides/'];

type Sums = { sessions: number; users: number; pageviews: number };
interface GoogleSite {
  daily?: { date: string; clicks: number; impressions: number; ctr: number; position: number }[];
  pagesSeen?: { date: string; pages: number }[];
  gaps?: { query: string; impressions: number; clicks: number; position: number }[];
  top?: { query: string; impressions: number; clicks: number; position: number; prev: { impressions: number; clicks: number; position: number } | null }[];
  sitemapUrls?: number;
  inspections?: Record<string, [string, string | null, string | null, string]>;
  error?: string | null;
  analytics?: {
    error?: string;
    totals7?: Sums;
    prev7?: Sums;
    totals28?: Sums;
    channels?: { name: string; sessions: number }[];
    sources?: { name: string; sessions: number }[];
    devices?: { name: string; sessions: number }[];
    topPages?: { path: string; pageviews: number; users: number }[];
    landing?: { path: string; sessions: number; type: string }[];
    newVsReturning?: { new: number; returning: number };
    engagement?: { cur: { engagementRate: number; averageSessionDuration: number; bounceRate: number }; prev: { engagementRate: number; averageSessionDuration: number; bounceRate: number } };
  };
}
interface GoogleReport {
  generatedAt?: string;
  sites?: Record<string, GoogleSite>;
  adsense?: { error?: string; currency?: string; daily?: { date: string; domain: string; earnings: number; pageViews: number; clicks: number }[] };
}

const r1 = (n: number) => Math.round(n * 10) / 10;
const r2 = (n: number) => Math.round(n * 100) / 100;
const pctChange = (cur: number, prev: number) => (prev ? `${cur >= prev ? '+' : ''}${Math.round(((cur - prev) / prev) * 100)}%` : cur ? 'new' : 'no change');
const rand = (cents: number) => Math.round(cents / 100);

/** Every key page of a site answers 200? (Follows redirects such as /about -> /about/.) */
async function keyPages(domain: string) {
  const out = await Promise.all(
    KEY_PAGES.map(async (path) => {
      const start = Date.now();
      try {
        const res = await fetch(`https://${domain}${path}`, { method: 'GET', redirect: 'follow', cf: { cacheTtl: 0 } } as RequestInit);
        await res.body?.cancel().catch(() => {});
        return { path, status: res.status, ms: Date.now() - start };
      } catch {
        return { path, status: 0, ms: Date.now() - start };
      }
    })
  );
  return { all_ok: out.every((p) => p.status === 200), not_ok: out.filter((p) => p.status !== 200), slowest: [...out].sort((a, b) => b.ms - a.ms)[0] ?? null };
}

async function content(db: D1Database) {
  const r = await rows<Record<string, number | string | null>>(
    db,
    `SELECT
       (SELECT COUNT(*) FROM businesses WHERE status = 'published' AND closed_at IS NULL AND is_test = 0) AS listings_live,
       (SELECT COUNT(*) FROM businesses WHERE status = 'published' AND is_test = 0 AND created_at >= datetime('now', '-7 days')) AS listings_added_7d,
       (SELECT COUNT(*) FROM businesses WHERE status = 'published' AND is_test = 0 AND created_at >= datetime('now', '-30 days')) AS listings_added_30d,
       (SELECT COUNT(*) FROM businesses WHERE closed_at IS NOT NULL) AS listings_marked_closed,
       (SELECT COUNT(*) FROM businesses WHERE closed_at >= datetime('now', '-7 days')) AS listings_closed_7d,
       (SELECT COUNT(*) FROM businesses WHERE status = 'published' AND closed_at IS NULL AND owner_user_id IS NOT NULL) AS listings_claimed_by_owner,
       (SELECT COUNT(*) FROM businesses WHERE status = 'published' AND closed_at IS NULL AND COALESCE(subscription_tier, 0) > 0) AS listings_on_paid_tier,
       (SELECT COUNT(*) FROM businesses WHERE status = 'published' AND closed_at IS NULL AND updated_at >= datetime('now', '-7 days')) AS listings_updated_7d,
       (SELECT COUNT(*) FROM categories) AS categories_total,
       (SELECT COUNT(DISTINCT bc.category_id) FROM business_categories bc JOIN businesses b ON b.id = bc.business_id WHERE b.status = 'published' AND b.closed_at IS NULL) AS categories_with_listings,
       (SELECT COUNT(*) FROM suburbs) AS suburbs_total,
       (SELECT COUNT(DISTINCT suburb_id) FROM businesses WHERE status = 'published' AND closed_at IS NULL) AS suburbs_with_listings,
       (SELECT COUNT(*) FROM shopping_centers) AS shopping_centres,
       (SELECT COUNT(*) FROM events WHERE event_date >= date('now')) AS events_upcoming,
       (SELECT COUNT(*) FROM events WHERE event_date >= date('now') AND event_date < date('now', '+7 days')) AS events_next_7_days,
       (SELECT COUNT(*) FROM events WHERE event_date < date('now', '-1 day')) AS events_past_still_stored,
       (SELECT MIN(event_date) FROM events WHERE event_date >= date('now')) AS next_event_date,
       (SELECT COUNT(*) FROM news WHERE published_date >= date('now', '-7 days')) AS news_last_7d,
       (SELECT MAX(published_date) FROM news) AS latest_news_date,
       (SELECT COUNT(*) FROM reviews WHERE status = 'approved') AS reviews_approved,
       (SELECT ROUND(AVG(rating), 2) FROM reviews WHERE status = 'approved') AS reviews_average_rating,
       (SELECT COUNT(*) FROM reviews WHERE created_at >= datetime('now', '-7 days')) AS reviews_new_7d,
       (SELECT COUNT(*) FROM users WHERE email_verified_at IS NOT NULL) AS users_verified_total`
  );
  const upcoming = await rows<{ title: string; event_date: string }>(db, `SELECT title, event_date FROM events WHERE event_date >= date('now') ORDER BY event_date LIMIT 5`);
  const news = await rows<{ title: string; published_date: string; category: string }>(db, `SELECT title, published_date, category FROM news ORDER BY published_date DESC, id DESC LIMIT 5`);
  const newest = await rows<{ name: string; created_at: string }>(db, `SELECT name, created_at FROM businesses WHERE status = 'published' AND is_test = 0 ORDER BY created_at DESC LIMIT 8`);
  return { ...(r[0] ?? {}), next_events: upcoming, latest_news: news, newest_listings: newest };
}

/** First-party activity: last 7 days vs the 7 before, per event type. */
async function traffic(db: D1Database) {
  const ev = await rows<{ event: string; week: number; prev: number }>(
    db,
    `SELECT event, SUM(created_at >= datetime('now', '-7 days')) AS week, SUM(created_at < datetime('now', '-7 days')) AS prev
     FROM business_stats WHERE created_at >= datetime('now', '-14 days') GROUP BY event`
  );
  const two = async (table: string, where: string) => {
    const x = await rows<{ week: number; prev: number }>(
      db,
      `SELECT SUM(created_at >= datetime('now', '-7 days')) AS week, SUM(created_at < datetime('now', '-7 days')) AS prev
       FROM ${table} WHERE created_at >= datetime('now', '-14 days') AND ${where}`
    );
    const w = Number(x[0]?.week) || 0;
    const p = Number(x[0]?.prev) || 0;
    return { last_7d: w, previous_7d: p, change: pctChange(w, p) };
  };
  const byEvent = Object.fromEntries(ev.map((e) => [e.event, { last_7d: Number(e.week) || 0, previous_7d: Number(e.prev) || 0, change: pctChange(Number(e.week) || 0, Number(e.prev) || 0) }]));
  const [enquiries, contactForm, signups, installs] = await Promise.all([
    two('messages', `kind = 'enquiry'`),
    two('messages', `kind != 'enquiry'`),
    two('users', `email_verified_at IS NOT NULL`),
    two('app_events', `event = 'install'`),
  ]);
  const topViewed = await rows<{ name: string; views: number }>(
    db,
    `SELECT b.name, COUNT(*) AS views FROM business_stats s JOIN businesses b ON b.id = s.business_id
     WHERE s.event = 'view' AND s.created_at >= datetime('now', '-7 days') GROUP BY s.business_id ORDER BY views DESC LIMIT 8`
  );
  const topContacted = await rows<{ name: string; taps: number }>(
    db,
    `SELECT b.name, COUNT(*) AS taps FROM business_stats s JOIN businesses b ON b.id = s.business_id
     WHERE s.event IN ('phone_click', 'whatsapp_click', 'website_click', 'directions_click') AND s.created_at >= datetime('now', '-7 days')
     GROUP BY s.business_id ORDER BY taps DESC LIMIT 5`
  );
  const topCategories = await rows<{ category: string; views: number }>(
    db,
    `SELECT c.name AS category, COUNT(*) AS views FROM business_stats s JOIN business_categories bc ON bc.business_id = s.business_id JOIN categories c ON c.id = bc.category_id
     WHERE s.event = 'view' AND s.created_at >= datetime('now', '-7 days') GROUP BY c.id ORDER BY views DESC LIMIT 6`
  );
  const searches = await rows<{ query: string; people: number; results: number }>(
    db,
    `SELECT lower(trim(query)) AS query, COUNT(DISTINCT ip_hash) AS people, COUNT(DISTINCT business_id) AS results FROM business_stats
     WHERE event = 'search_appearance' AND query IS NOT NULL AND trim(query) != '' AND created_at >= datetime('now', '-7 days')
     GROUP BY lower(trim(query)) ORDER BY people DESC LIMIT 60`
  );
  return {
    by_event_last_7d_vs_previous_7d: byEvent,
    enquiries_to_businesses: enquiries,
    contact_form_messages: contactForm,
    new_verified_users: signups,
    app_installs: installs,
    most_viewed_listings_7d: topViewed,
    most_contacted_listings_7d: topContacted,
    most_viewed_categories_7d: topCategories,
    top_onsite_searches_7d: searches.slice(0, 10),
    onsite_searches_with_2_or_fewer_results_7d: searches.filter((s) => s.results <= 2).slice(0, 8),
  };
}

async function money(db: D1Database) {
  const r = await rows<Record<string, number>>(
    db,
    `SELECT
       (SELECT COALESCE(SUM(amount_cents), 0) FROM payments WHERE status = 'COMPLETE' AND paid_at >= date('now', 'start of month')) AS plans_mtd,
       (SELECT COALESCE(SUM(amount_cents), 0) FROM event_payments WHERE status = 'complete' AND paid_at >= date('now', 'start of month')) AS events_mtd,
       (SELECT COALESCE(SUM(amount_cents), 0) FROM payments WHERE status = 'COMPLETE' AND paid_at >= date('now', 'start of month', '-1 month') AND paid_at < date('now', 'start of month')) AS plans_last_month,
       (SELECT COALESCE(SUM(amount_cents), 0) FROM event_payments WHERE status = 'complete' AND paid_at >= date('now', 'start of month', '-1 month') AND paid_at < date('now', 'start of month')) AS events_last_month,
       (SELECT COUNT(*) FROM subscriptions WHERE status = 'active' AND m_payment_id NOT LIKE 'admin-comp-%') AS paid_plans_active,
       (SELECT COUNT(*) FROM subscriptions WHERE status = 'active' AND m_payment_id LIKE 'admin-comp-%') AS free_comp_plans,
       (SELECT COUNT(*) FROM subscriptions WHERE started_at >= date('now', 'start of month')) AS plans_started_this_month,
       (SELECT COUNT(*) FROM subscriptions WHERE cancelled_at >= date('now', 'start of month')) AS plans_cancelled_this_month,
       (SELECT COUNT(*) FROM subscriptions WHERE status = 'active' AND current_period_end < datetime('now', '-3 days')) AS renewals_overdue,
       (SELECT COUNT(*) FROM payments WHERE status != 'COMPLETE' AND paid_at >= date('now', '-30 days')) AS failed_or_pending_payments_30d`
  );
  const x = r[0] ?? {};
  const renewing = await rows<{ business: string; ends: string; status: string }>(
    db,
    `SELECT b.name AS business, date(s.current_period_end) AS ends, s.status FROM subscriptions s JOIN businesses b ON b.id = s.business_id
     WHERE s.status IN ('active', 'cancelled') AND s.current_period_end BETWEEN datetime('now') AND datetime('now', '+14 days') ORDER BY s.current_period_end LIMIT 10`
  );
  return {
    revenue_month_to_date_rand: rand((x.plans_mtd ?? 0) + (x.events_mtd ?? 0)),
    revenue_month_to_date_split_rand: { plans: rand(x.plans_mtd ?? 0), event_listings: rand(x.events_mtd ?? 0) },
    revenue_last_month_rand: rand((x.plans_last_month ?? 0) + (x.events_last_month ?? 0)),
    paid_plans_active: x.paid_plans_active ?? 0,
    free_comp_plans: x.free_comp_plans ?? 0,
    plans_started_this_month: x.plans_started_this_month ?? 0,
    plans_cancelled_this_month: x.plans_cancelled_this_month ?? 0,
    renewals_overdue: x.renewals_overdue ?? 0,
    failed_or_pending_payments_30d: x.failed_or_pending_payments_30d ?? 0,
    plans_ending_or_renewing_next_14d: renewing,
  };
}

/** Listing quality, from the Listings screen's daily cache (rebuilt here when it's over a day old). */
async function quality(env: Env, site: HubSite) {
  const kind = qualityReportKey(site.slug);
  let q = (await readReport<Awaited<ReturnType<typeof qualityReport>>>(env.ADMIN_DB, kind)) ?? null;
  const age = q ? Date.now() - new Date(`${q.updated_at.replace(' ', 'T')}Z`).getTime() : Infinity;
  if (age > 86400_000) {
    try {
      const data = await qualityReport(site);
      await writeReport(env.ADMIN_DB, kind, data);
      q = { data, updated_at: new Date().toISOString().replace('T', ' ').slice(0, 19) };
    } catch {
      /* keep whatever is cached */
    }
  }
  if (!q) return null;
  const d = q.data;
  return {
    checked_at: q.updated_at,
    live_listings_checked: d.total,
    completeness_score_pct: d.score,
    fully_complete_listings: d.complete,
    missing: Object.fromEntries(d.checks.map((c) => [c.label, c.count])),
    likely_duplicate_groups: d.duplicates.count,
    not_updated_in_180_days: d.stale.count,
    no_views_in_90_days: d.no_views.count,
    category_suburb_pages: d.thin.pages,
    thin_category_suburb_pages_noindexed: d.thin.count,
    enquiries_not_emailed_to_business_60d: d.owners.unreached.reduce((a, u) => a + u.n, 0),
    unclaimed_businesses_getting_enquiries_60d: d.owners.unclaimed.length,
    unclaimed_top: d.owners.unclaimed.slice(0, 5).map((u) => ({ name: u.name, enquiries: u.n })),
    approved_listings_owner_never_confirmed: d.owners.unconfirmed.length,
  };
}

async function uptime(db: D1Database, slug: string) {
  const r = await rows<{ day_pct: number | null; week_pct: number | null; day_ms: number | null; failed_24h: number; slow_24h: number }>(
    db,
    `SELECT
       ROUND(100.0 * SUM(CASE WHEN checked_at >= datetime('now', '-1 day') THEN ok END) / NULLIF(SUM(checked_at >= datetime('now', '-1 day')), 0), 2) AS day_pct,
       ROUND(100.0 * SUM(ok) / NULLIF(COUNT(*), 0), 2) AS week_pct,
       ROUND(AVG(CASE WHEN checked_at >= datetime('now', '-1 day') AND ok = 1 THEN ms END)) AS day_ms,
       SUM(checked_at >= datetime('now', '-1 day') AND ok = 0) AS failed_24h,
       SUM(checked_at >= datetime('now', '-1 day') AND ms > 4000) AS slow_24h
     FROM health_checks WHERE site = ? AND checked_at >= datetime('now', '-7 days')`,
    slug
  );
  const problems = await rows<{ problem: string; n: number }>(
    db,
    `SELECT problem, COUNT(*) AS n FROM health_checks WHERE site = ? AND problem IS NOT NULL AND checked_at >= datetime('now', '-1 day') GROUP BY problem ORDER BY n DESC LIMIT 3`,
    slug
  );
  const x = r[0];
  return x
    ? { uptime_24h_pct: x.day_pct, uptime_7d_pct: x.week_pct, average_homepage_ms_24h: x.day_ms, failed_checks_24h: Number(x.failed_24h) || 0, slow_checks_24h: Number(x.slow_24h) || 0, problems_24h: problems }
    : null;
}

function google(g: GoogleSite | undefined, adsense: GoogleReport['adsense'], domain: string) {
  if (!g) return null;
  const daily = [...(g.daily ?? [])].sort((a, b) => a.date.localeCompare(b.date));
  const sum = (xs: typeof daily) => ({
    clicks: xs.reduce((a, d) => a + d.clicks, 0),
    impressions: xs.reduce((a, d) => a + d.impressions, 0),
    average_position: xs.length ? r1(xs.reduce((a, d) => a + d.position, 0) / xs.length) : null,
  });
  const last7 = daily.slice(-7);
  const prev7 = daily.slice(-14, -7);
  const ins = Object.entries(g.inspections ?? {});
  const isIndexed = (s: string) => /indexed/i.test(s) && !/not indexed/i.test(s);
  const states: Record<string, number> = {};
  for (const [, v] of ins) states[v[0]] = (states[v[0]] ?? 0) + 1;
  const seen = [...(g.pagesSeen ?? [])].sort((a, b) => a.date.localeCompare(b.date));
  const a = g.analytics;
  const ads = (adsense?.daily ?? []).filter((d) => d.domain === domain || d.domain === `www.${domain}`).sort((x, y) => x.date.localeCompare(y.date));
  const ads7 = ads.slice(-7);
  const adsPrev = ads.slice(-14, -7);
  const adSum = (xs: typeof ads) => ({ earnings: r2(xs.reduce((t, d) => t + d.earnings, 0)), page_views: xs.reduce((t, d) => t + d.pageViews, 0), ad_clicks: xs.reduce((t, d) => t + d.clicks, 0) });
  return {
    search_console: {
      error: g.error ?? null,
      days: last7.length ? `${last7[0].date} to ${last7[last7.length - 1].date} (Google data lags about 3 days)` : null,
      last_7_days: sum(last7),
      previous_7_days: sum(prev7),
      top_queries: (g.top ?? []).slice(0, 8).map((q) => ({ query: q.query, clicks: q.clicks, impressions: q.impressions, position: r1(q.position), previous_clicks: q.prev?.clicks ?? null })),
      opportunities_high_impressions_few_clicks: (g.gaps ?? []).slice(0, 6).map((q) => ({ query: q.query, impressions: q.impressions, clicks: q.clicks, position: r1(q.position) })),
      pages_seen_in_google: seen.length ? { latest: seen[seen.length - 1], a_week_before: seen[seen.length - 8] ?? null } : null,
    },
    indexing: ins.length
      ? {
          sitemap_urls: g.sitemapUrls ?? null,
          pages_inspected: ins.length,
          indexed: ins.filter(([, v]) => isIndexed(v[0])).length,
          not_indexed: ins.filter(([, v]) => !isIndexed(v[0])).length,
          states: Object.entries(states).sort((x, y) => y[1] - x[1]).slice(0, 6).map(([state, n]) => ({ state, n })),
        }
      : { sitemap_urls: g.sitemapUrls ?? null },
    analytics_ga4: a
      ? {
          error: a.error ?? null,
          last_7_days: a.totals7 ?? null,
          previous_7_days: a.prev7 ?? null,
          last_28_days: a.totals28 ?? null,
          engagement_rate: a.engagement ? { current: r2(a.engagement.cur.engagementRate), previous: r2(a.engagement.prev.engagementRate) } : null,
          average_session_seconds: a.engagement ? { current: Math.round(a.engagement.cur.averageSessionDuration), previous: Math.round(a.engagement.prev.averageSessionDuration) } : null,
          channels: (a.channels ?? []).slice(0, 6).map((c) => ({ name: c.name, sessions: c.sessions })),
          sources: (a.sources ?? []).slice(0, 6),
          devices: (a.devices ?? []).slice(0, 4),
          new_vs_returning: a.newVsReturning ?? null,
          top_pages: (a.topPages ?? []).slice(0, 8),
          top_landing_pages: (a.landing ?? []).slice(0, 6),
        }
      : null,
    adsense: ads.length ? { currency: adsense?.currency ?? null, last_7_days: adSum(ads7), previous_7_days: adSum(adsPrev), latest_day: ads[ads.length - 1].date } : adsense?.error ? { error: adsense.error } : null,
  };
}

async function siteFull(env: Env, site: HubSite, g: GoogleReport | null, links: { sites?: Record<string, { pages?: number; broken?: { url: string; status: number }[]; websites?: { checked?: number; dead?: { name: string }[] } }> } | null, routines: Awaited<ReturnType<typeof routineHealth>>) {
  const db = site.db;
  const [pages, inventory, activity, revenue, listingQuality, health, gate, recovery] = await Promise.all([
    keyPages(site.domain),
    content(db),
    traffic(db),
    money(db),
    quality(env, site),
    uptime(env.ADMIN_DB, site.slug),
    readReport<{ totals?: Record<string, number> }>(env.ADMIN_DB, `index-gate:${site.slug}:v1`).catch(() => null),
    rows<Record<string, number | string | null>>(env.ADMIN_DB, `SELECT * FROM recovery_daily WHERE site = ? ORDER BY day DESC LIMIT 14`, site.slug),
  ]);
  const l = links?.sites?.[site.slug];
  const rt = routines.find((x) => x.site === site.slug);
  return {
    slug: site.slug,
    site: site.name,
    domain: site.domain,
    key_pages: pages,
    uptime: health,
    content: inventory,
    activity_last_7d_vs_previous_7d: activity,
    money: revenue,
    listing_quality: listingQuality,
    google_index_gate: gate?.data.totals ?? null,
    google: google(g?.sites?.[site.slug], g?.adsense, site.domain),
    google_recovery_trend_14d: recovery.length ? { latest: recovery[0], oldest: recovery[recovery.length - 1], days: recovery.length } : null,
    broken_links_weekly_crawl: l
      ? { pages_crawled: l.pages ?? null, broken: l.broken?.length ?? 0, broken_examples: (l.broken ?? []).slice(0, 5).map((b) => `${b.url} (${b.status || 'no answer'})`), business_websites_checked: l.websites?.checked ?? null, business_websites_not_answering: l.websites?.dead?.length ?? 0 }
      : null,
    routines: rt ? { checked_at: rt.checkedAt, late_or_failing: rt.rows.filter((r) => r.status !== 'ok'), all: rt.rows.map((r) => ({ routine: r.routine, status: r.status, last_run: r.lastRun })) } : null,
  };
}

async function operations(env: Env) {
  const db = env.ADMIN_DB;
  const runs = (await readReport<WorkflowRun[]>(db, 'github_runs'))?.data ?? [];
  const dayAgo = new Date(Date.now() - 86400_000).toISOString();
  const weekAgo = new Date(Date.now() - 7 * 86400_000).toISOString();
  const latestPer = new Map<string, WorkflowRun>();
  for (const r of runs) if (!latestPer.has(r.name)) latestPer.set(r.name, r);
  const failed = runs.filter((r) => r.conclusion === 'failure' || r.conclusion === 'timed_out');

  const usage = await rows<{ day: string; read: number; written: number }>(
    db,
    `SELECT day, SUM(rows_read) AS read, SUM(rows_written) AS written FROM d1_usage WHERE day >= date('now', '-7 days') GROUP BY day ORDER BY day DESC`
  );
  const topDb = await rows<{ database: string; read: number }>(db, `SELECT database, rows_read AS read FROM d1_usage WHERE day = date('now', '-1 day') ORDER BY rows_read DESC LIMIT 4`);
  const d1err = await readReport<{ error: string }>(db, 'd1_error');
  const security = (await readReport<Check[]>(db, 'security'))?.data ?? [];
  const upgrades = await rows<{ title: string; status: string; priority: string; sites: string; created_at: string }>(
    db,
    `SELECT title, status, priority, sites, created_at FROM upgrades WHERE status != 'done'
     ORDER BY CASE priority WHEN 'urgent' THEN 0 WHEN 'high' THEN 1 WHEN 'normal' THEN 2 ELSE 3 END, created_at LIMIT 20`
  );
  const done = await rows<{ title: string; done_at: string }>(db, `SELECT title, done_at FROM upgrades WHERE status = 'done' AND done_at >= datetime('now', '-7 days') ORDER BY done_at DESC LIMIT 10`);
  const adminActions = await rows<{ action: string; site: string | null; n: number }>(
    db,
    `SELECT action, site, COUNT(*) AS n FROM activity WHERE created_at >= datetime('now', '-1 day') GROUP BY action, site ORDER BY n DESC LIMIT 15`
  );
  const weekly = await readReport<{ week_ending?: string }>(db, 'weekly');
  return {
    github_workflows: {
      runs_seen: runs.length,
      failed_last_24h: failed.filter((r) => r.created_at >= dayAgo).map((r) => ({ workflow: r.name, branch: r.branch, at: r.created_at, step: r.error?.step ?? null, message: r.error?.message?.slice(0, 200) ?? null })),
      failed_last_7d_count: failed.filter((r) => r.created_at >= weekAgo).length,
      latest_run_per_workflow: [...latestPer.values()].slice(0, 20).map((r) => ({ workflow: r.name, result: r.conclusion ?? r.status, at: r.created_at })),
    },
    database_usage_cloudflare_d1: {
      free_daily_limits: { rows_read: D1_FREE_ROWS_READ, rows_written: D1_FREE_ROWS_WRITTEN },
      by_utc_day: usage.map((u) => ({ day: u.day, rows_read: u.read, rows_written: u.written, read_pct_of_limit: Math.round((u.read / D1_FREE_ROWS_READ) * 100), written_pct_of_limit: Math.round((u.written / D1_FREE_ROWS_WRITTEN) * 100) })),
      heaviest_databases_yesterday: topDb,
      error: d1err?.data.error ?? null,
    },
    security_checks: { failing: security.filter((c) => c.result === 'fail').map((c) => `${c.site}: ${c.name}`), warnings: security.filter((c) => c.result === 'warn').map((c) => `${c.site}: ${c.name}`), passing: security.filter((c) => c.result === 'pass').length },
    upgrades_open: upgrades.map((u) => ({ title: u.title, status: u.status, priority: u.priority, sites: u.sites, added: u.created_at.slice(0, 10) })),
    upgrades_done_last_7d: done,
    admin_actions_last_24h: adminActions,
    last_weekly_summary: weekly?.data.week_ending ?? null,
  };
}

/** Everything for the routine. Also kept in reports for submit.ts. */
export async function gatherFullFacts(env: Env) {
  const db = env.ADMIN_DB;
  const [light, g, links, routines, yesterday] = await Promise.all([
    gatherFacts(env),
    readReport<GoogleReport>(db, 'google'),
    readReport<{ generatedAt?: string; sites?: Record<string, { pages?: number; broken?: { url: string; status: number }[]; websites?: { checked?: number; dead?: { name: string }[] } }> }>(db, 'links'),
    routineHealth(env),
    readBriefing(db, saDay(-1)),
  ]);
  const sites = await Promise.all(hubSites(env).map((s) => siteFull(env, s, g?.data ?? null, links?.data ?? null, routines)));
  const facts = {
    ...light,
    generated_at: new Date().toISOString(),
    data_freshness: {
      google_report_updated: g?.updated_at ?? null,
      broken_links_crawl_updated: links?.updated_at ?? null,
    },
    sites_in_depth: sites,
    operations: await operations(env),
    yesterdays_briefing: yesterday ? { headline: yesterday.briefing.headline, needs_you: yesterday.briefing.needs_you } : null,
  };
  await writeReport(db, FULL_FACTS_KIND, facts);
  return facts;
}

/** The facts the routine was given this morning (under 6 hours old), or null. */
export async function cachedFullFacts(db: D1Database): Promise<unknown | null> {
  const r = await readReport<{ date?: string }>(db, FULL_FACTS_KIND);
  if (!r) return null;
  const age = Date.now() - new Date(`${r.updated_at.replace(' ', 'T')}Z`).getTime();
  return age < 6 * 3600_000 && r.data.date === saDay() ? r.data : null;
}

