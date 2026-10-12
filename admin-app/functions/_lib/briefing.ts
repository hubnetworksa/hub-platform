import type { D1Database } from '@cloudflare/workers-types';
import { hubSites, rows, count, checkSite, type Env, type HubSite } from './sites';
import { siteQueue, QUEUES } from './queues';

// The daily briefing on the Overview. Every morning a Claude routine (a
// scheduled Claude Code session on the owner's account, no API key) fetches
// the morning's facts from /api/briefing/facts, writes the briefing, and
// posts it to /api/briefing/submit (both protected by the routine's own key).
// Until it arrives, or on a morning it doesn't, the card shows a plain summary
// computed from the same facts, so it is never empty.
//
// The facts are aggregated numbers plus business names, searches and
// upgrades: no visitor names, emails, phone numbers or message text. They are
// stored with each briefing so any figure in it can be checked.
const LABELS = Object.fromEntries(QUEUES.map(([type, label]) => [type, label]));

/** Today's date in South Africa (the briefing's "day"). */
export function saDay(offsetDays = 0): string {
  return new Date(Date.now() + 2 * 3600000 + offsetDays * 86400000).toISOString().slice(0, 10);
}

const sum = (xs: number[]) => xs.reduce((a, b) => a + b, 0);

async function windowCounts(db: D1Database, table: string, where: string): Promise<{ last24: number; prev24: number; avg7: number }> {
  const r = await rows<{ last24: number; prev24: number; week: number }>(
    db,
    `SELECT
       SUM(created_at >= datetime('now', '-1 day')) AS last24,
       SUM(created_at < datetime('now', '-1 day') AND created_at >= datetime('now', '-2 days')) AS prev24,
       COUNT(*) AS week
     FROM ${table} WHERE created_at >= datetime('now', '-7 days')${where ? ` AND ${where}` : ''}`
  );
  const x = r[0] ?? { last24: 0, prev24: 0, week: 0 };
  return { last24: Number(x.last24) || 0, prev24: Number(x.prev24) || 0, avg7: Math.round(((Number(x.week) || 0) / 7) * 10) / 10 };
}

async function siteFacts(site: HubSite) {
  const db = site.db;
  const [health, queue, views, contacts, searches, enquiries, signups, installs, newListings, topViewed, topSearches, revenue24, revenueMonth, renewals] = await Promise.all([
    checkSite(site.domain),
    siteQueue(site),
    windowCounts(db, 'business_stats', `event = 'view'`),
    windowCounts(db, 'business_stats', `event IN ('phone_click', 'whatsapp_click', 'website_click')`),
    windowCounts(db, 'business_stats', `event = 'search_appearance'`),
    windowCounts(db, 'messages', `kind = 'enquiry'`),
    windowCounts(db, 'users', `email_verified_at IS NOT NULL`),
    windowCounts(db, 'app_events', `event = 'install'`),
    rows<{ name: string }>(db, `SELECT name FROM businesses WHERE status = 'published' AND created_at >= datetime('now', '-1 day') ORDER BY created_at DESC LIMIT 6`),
    rows<{ name: string; views: number }>(
      db,
      `SELECT b.name, COUNT(*) AS views FROM business_stats s JOIN businesses b ON b.id = s.business_id
       WHERE s.event = 'view' AND s.created_at >= datetime('now', '-1 day') GROUP BY s.business_id ORDER BY views DESC LIMIT 3`
    ),
    rows<{ query: string; people: number }>(
      db,
      `SELECT lower(trim(query)) AS query, COUNT(DISTINCT ip_hash) AS people FROM business_stats
       WHERE event = 'search_appearance' AND query IS NOT NULL AND trim(query) != '' AND created_at >= datetime('now', '-1 day')
       GROUP BY lower(trim(query)) ORDER BY people DESC LIMIT 5`
    ),
    count(db, `SELECT COALESCE(SUM(amount_cents), 0) FROM payments WHERE status = 'COMPLETE' AND paid_at >= datetime('now', '-1 day')`),
    count(db, `SELECT COALESCE(SUM(amount_cents), 0) FROM payments WHERE status = 'COMPLETE' AND paid_at >= date('now', 'start of month')`),
    count(db, `SELECT COUNT(*) FROM subscriptions WHERE status = 'active' AND current_period_end BETWEEN datetime('now') AND datetime('now', '+7 days')`),
  ]);
  const pending: Record<string, { count: number; oldest_days: number }> = {};
  for (const it of queue) {
    const age = Math.floor((Date.now() - new Date(`${it.created_at.replace(' ', 'T')}Z`).getTime()) / 86400000);
    const p = (pending[LABELS[it.type] ?? it.type] ??= { count: 0, oldest_days: 0 });
    p.count++;
    p.oldest_days = Math.max(p.oldest_days, age);
  }
  return {
    slug: site.slug,
    site: site.name,
    city: site.city,
    online: health.ok,
    homepage_response_ms: health.ms,
    waiting_for_admin: pending,
    last_24_hours_vs_previous_24_and_7_day_daily_average: {
      listing_views: views,
      contact_taps: contacts,
      search_appearances: searches,
      enquiries_to_businesses: enquiries,
      new_users: signups,
      app_installs: installs,
    },
    new_listings_published_last_24h: newListings.map((r) => r.name),
    most_viewed_listings_last_24h: topViewed,
    top_searches_last_24h: topSearches,
    revenue_last_24h_rand: Math.round(revenue24 / 100),
    revenue_month_to_date_rand: Math.round(revenueMonth / 100),
    paid_plans_renewing_next_7_days: renewals,
  };
}

async function searchConsole(): Promise<unknown> {
  try {
    const res = await fetch('https://raw.githubusercontent.com/hubnetworksa/hub-platform/main/status/seo/latest.json', { cf: { cacheTtl: 3600 } } as RequestInit);
    if (!res.ok) return null;
    const body = (await res.json()) as { date?: string; sites?: { slug: string; searchAnalytics?: { totals?: { current?: { clicks: number; impressions: number }; previous?: { clicks: number; impressions: number } } } }[] };
    return {
      report_date: body.date,
      note: 'Weekly Google Search Console report, last 28 days vs the 28 before (data lags about 3 days).',
      sites: (body.sites ?? []).map((s) => ({ slug: s.slug, google_clicks: s.searchAnalytics?.totals?.current?.clicks, previous_clicks: s.searchAnalytics?.totals?.previous?.clicks, impressions: s.searchAnalytics?.totals?.current?.impressions })),
    };
  } catch {
    return null;
  }
}

export async function gatherFacts(env: Env) {
  const [sites, google, upgrades] = await Promise.all([
    Promise.all(hubSites(env).map(siteFacts)),
    searchConsole(),
    rows<{ title: string; status: string; priority: string }>(env.ADMIN_DB, `SELECT title, status, priority FROM upgrades WHERE status != 'done' ORDER BY CASE priority WHEN 'urgent' THEN 0 WHEN 'high' THEN 1 ELSE 2 END LIMIT 8`),
  ]);
  return { date: saDay(), timezone: 'Africa/Johannesburg', sites, google_search: google, open_upgrades: upgrades };
}

export interface Briefing {
  headline: string;
  needs_you: { text: string; site: string }[];
  // `details`: the site in depth (traffic, Google, money, listings, health).
  sites: { slug: string; summary: string; details?: string[] }[];
  // Whole-operation sections (Google, money, website health, routines, ...).
  sections?: { title: string; items: string[] }[];
  worth_knowing: string[];
}

/** A plain summary from the same facts, for when the AI isn't available. */
function plainBriefing(facts: Awaited<ReturnType<typeof gatherFacts>>): Briefing {
  const needs: Briefing['needs_you'] = [];
  for (const s of facts.sites) {
    if (!s.online) needs.push({ text: `${s.site} isn't responding. Check it now.`, site: s.slug });
    for (const [label, p] of Object.entries(s.waiting_for_admin)) {
      needs.push({ text: `${p.count} ${label.toLowerCase()}${p.count === 1 ? '' : 's'} waiting${p.oldest_days >= 2 ? `, the oldest for ${p.oldest_days} days` : ''}.`, site: s.slug });
    }
  }
  const totalWaiting = sum(facts.sites.flatMap((s) => Object.values(s.waiting_for_admin).map((p) => p.count)));
  const down = facts.sites.filter((s) => !s.online);
  return {
    headline: down.length ? `${down.map((s) => s.site).join(' and ')} ${down.length === 1 ? 'is' : 'are'} down.` : totalWaiting ? `${totalWaiting} item${totalWaiting === 1 ? '' : 's'} across your sites need${totalWaiting === 1 ? 's' : ''} you today.` : 'All three sites are up and nothing is waiting for you.',
    needs_you: needs.slice(0, 5),
    sites: facts.sites.map((s) => {
      const m = s.last_24_hours_vs_previous_24_and_7_day_daily_average;
      return { slug: s.slug, summary: `${m.listing_views.last24} listing views and ${m.contact_taps.last24} contact taps in the last 24 hours (7-day average ${m.listing_views.avg7} and ${m.contact_taps.avg7}).` };
    }),
    worth_knowing: [],
  };
}

export const plainSummary = plainBriefing;

const str = (v: unknown, max: number) => (typeof v === 'string' ? v.trim().slice(0, max) : '');

/** Checks a briefing sent by the routine; returns it cleaned up, or an error to send back. */
export function validateBriefing(raw: unknown, slugs: string[]): { briefing: Briefing } | { error: string } {
  if (!raw || typeof raw !== 'object') return { error: 'Send a JSON object with headline, needs_you, sites and worth_knowing.' };
  const r = raw as Record<string, unknown>;
  const headline = str(r.headline, 300);
  if (!headline) return { error: '"headline" is required (one sentence).' };
  if (!Array.isArray(r.needs_you) || !Array.isArray(r.sites) || !Array.isArray(r.worth_knowing)) return { error: '"needs_you", "sites" and "worth_knowing" must be arrays.' };
  const needs = r.needs_you.slice(0, 10).map((n) => ({ text: str((n as Record<string, unknown>)?.text, 400), site: str((n as Record<string, unknown>)?.site, 30) }));
  if (needs.some((n) => !n.text || !(n.site === 'all' || slugs.includes(n.site)))) return { error: `Each "needs_you" item needs "text" and "site" (one of: ${[...slugs, 'all'].join(', ')}).` };
  const lines = (v: unknown, n: number, max: number) => (Array.isArray(v) ? v.slice(0, n).map((x) => str(x, max)).filter(Boolean) : []);
  const sites = r.sites.map((x) => {
    const o = (x ?? {}) as Record<string, unknown>;
    const details = lines(o.details, 14, 400);
    return { slug: str(o.slug, 30), summary: str(o.summary, 800), ...(details.length ? { details } : {}) };
  });
  if (sites.length !== slugs.length || sites.some((x, i) => x.slug !== slugs[i] || !x.summary)) return { error: `"sites" must have one entry per site, in this order: ${slugs.join(', ')}, each with a "summary".` };
  if (r.sections !== undefined && !Array.isArray(r.sections)) return { error: '"sections" must be an array of { "title", "items" }.' };
  const sections = (Array.isArray(r.sections) ? r.sections : [])
    .slice(0, 10)
    .map((x) => {
      const o = (x ?? {}) as Record<string, unknown>;
      return { title: str(o.title, 60), items: lines(o.items, 12, 400) };
    })
    .filter((x) => x.title && x.items.length);
  const worth = lines(r.worth_knowing, 8, 400);
  return { briefing: { headline, needs_you: needs, sites, ...(sections.length ? { sections } : {}), worth_knowing: worth } };
}

/** Saves today's briefing from the routine (replacing an earlier one today). */
export async function storeBriefing(env: Env, briefing: Briefing, facts: unknown): Promise<string> {
  const day = saDay();
  await env.ADMIN_DB.prepare(
    `INSERT INTO daily_briefings (day, content, facts, ai, model) VALUES (?, ?, ?, 1, 'claude-routine')
     ON CONFLICT(day) DO UPDATE SET content = excluded.content, facts = excluded.facts, ai = 1, model = 'claude-routine',
       regenerations = regenerations + 1, created_at = datetime('now')`
  )
    .bind(day, JSON.stringify(briefing), JSON.stringify(facts))
    .run();
  await env.ADMIN_DB.prepare(`DELETE FROM daily_briefings WHERE day < ?`).bind(saDay(-90)).run();
  return day;
}

export async function readBriefing(db: D1Database, day = saDay()) {
  const row = await db.prepare('SELECT day, content, ai, model, regenerations, created_at FROM daily_briefings WHERE day = ?').bind(day).first<{ day: string; content: string; ai: number; model: string | null; regenerations: number; created_at: string }>();
  return row ? { day: row.day, briefing: JSON.parse(row.content) as Briefing, ai: !!row.ai, model: row.model, regenerations: row.regenerations, created_at: row.created_at } : null;
}
