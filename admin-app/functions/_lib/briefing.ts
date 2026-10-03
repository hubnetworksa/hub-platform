import Anthropic from '@anthropic-ai/sdk';
import type { D1Database } from '@cloudflare/workers-types';
import { hubSites, rows, count, checkSite, type Env, type HubSite } from './sites';
import { siteQueue, QUEUES } from './queues';

// The daily briefing on the Overview: Claude reads the morning's facts from
// all three sites and writes a short "what's going on" for the admins.
//
// Only aggregated numbers and business names go to the model: no visitor
// names, emails, phone numbers or message text. The exact facts are stored
// with each briefing so any figure in it can be checked. Without an
// ANTHROPIC_API_KEY (or if the request fails or is declined) a plain summary
// is written from the same facts instead, so the card is never empty.

export const MODEL = 'claude-opus-5-5';
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
  sites: { slug: string; summary: string }[];
  worth_knowing: string[];
}

const SCHEMA = {
  type: 'object',
  additionalProperties: false,
  required: ['headline', 'needs_you', 'sites', 'worth_knowing'],
  properties: {
    headline: { type: 'string', description: 'One sentence, at most ~20 words: the single most important thing about today across all sites.' },
    needs_you: {
      type: 'array',
      description: 'Concrete actions for the admins today, most urgent first (at most 5). Empty if nothing needs doing.',
      items: {
        type: 'object',
        additionalProperties: false,
        required: ['text', 'site'],
        properties: { text: { type: 'string' }, site: { type: 'string', description: 'The site slug, or "all".' } },
      },
    },
    sites: {
      type: 'array',
      description: 'One entry per site, in the order given: one or two sentences on how it is doing.',
      items: { type: 'object', additionalProperties: false, required: ['slug', 'summary'], properties: { slug: { type: 'string' }, summary: { type: 'string' } } },
    },
    worth_knowing: { type: 'array', description: 'Up to 3 trends, wins or risks worth noticing.', items: { type: 'string' } },
  },
} as const;

const SYSTEM = `You write the morning briefing in Hub Admin, the dashboard Ethan and Guy use to run three local business directory websites in South Africa: PretoriaHub, PolokwaneHub and TheCapeTownHub. They read it on their phones before starting the day.

You get the morning's facts as JSON. Write what's going on and what needs their attention, like a sharp operations manager would.

- Use only the facts given. Never invent or estimate a number, and don't claim causes the data doesn't show. If something can't be told from the data, leave it out.
- Lead with what needs action: sites that are down, items waiting for an admin (especially ones waiting several days), payments, renewals.
- Compare the last 24 hours with the previous 24 hours and the 7-day daily average when the change is meaningful; ignore tiny numbers and noise (for example 1 vs 2).
- Name specific businesses, searches and upgrades when they matter.
- Plain, friendly South African English. Rand as R1,250. Short sentences. No greeting (the app adds one), no sign-off, no emoji, no markdown.
- When everything is quiet, say so briefly rather than padding.`;

/** Writes the briefing with Claude; null if there's no API key or it didn't produce one. */
async function aiBriefing(env: Env, facts: unknown): Promise<{ briefing: Briefing; model: string; input: number; output: number } | null> {
  const key = typeof env.ANTHROPIC_API_KEY === 'string' ? env.ANTHROPIC_API_KEY : '';
  if (!key) return null;
  const client = new Anthropic({ apiKey: key, maxRetries: 2, timeout: 60_000 });
  try {
    const response = await client.beta.messages.create({
      model: MODEL,
      max_tokens: 4000,
      betas: ['server-side-fallback-2026-07-01'],
      fallbacks: 'default',
      output_config: { effort: 'low', format: { type: 'json_schema', schema: SCHEMA } },
      system: SYSTEM,
      messages: [{ role: 'user', content: `Today's facts:\n${JSON.stringify(facts)}` }],
    });
    if (response.stop_reason !== 'end_turn') return null; // refusal, max_tokens, ...
    const text = response.content.flatMap((b) => (b.type === 'text' ? [b.text] : [])).join('');
    const parsed = JSON.parse(text) as Briefing;
    if (!parsed.headline || !Array.isArray(parsed.sites)) return null;
    return { briefing: parsed, model: response.model, input: response.usage.input_tokens, output: response.usage.output_tokens };
  } catch (e) {
    if (e instanceof Anthropic.AuthenticationError) console.error('briefing: the Anthropic API key was rejected');
    else if (e instanceof Anthropic.RateLimitError) console.error('briefing: rate limited');
    else if (e instanceof Anthropic.APIError) console.error(`briefing: API error ${e.status}`);
    else console.error('briefing: failed', e instanceof Error ? e.message : e);
    return null;
  }
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

/** Writes today's briefing and stores it (replacing today's, if any). */
export async function writeBriefing(env: Env): Promise<{ day: string; briefing: Briefing; ai: boolean }> {
  const facts = await gatherFacts(env);
  const ai = await aiBriefing(env, facts);
  const briefing = ai?.briefing ?? plainBriefing(facts);
  const day = saDay();
  await env.ADMIN_DB.prepare(
    `INSERT INTO daily_briefings (day, content, facts, ai, model, input_tokens, output_tokens) VALUES (?, ?, ?, ?, ?, ?, ?)
     ON CONFLICT(day) DO UPDATE SET content = excluded.content, facts = excluded.facts, ai = excluded.ai, model = excluded.model,
       input_tokens = excluded.input_tokens, output_tokens = excluded.output_tokens, regenerations = regenerations + 1, created_at = datetime('now')`
  )
    .bind(day, JSON.stringify(briefing), JSON.stringify(facts), ai ? 1 : 0, ai?.model ?? null, ai?.input ?? null, ai?.output ?? null)
    .run();
  await env.ADMIN_DB.prepare(`DELETE FROM daily_briefings WHERE day < ?`).bind(saDay(-90)).run();
  return { day, briefing, ai: !!ai };
}

export async function readBriefing(db: D1Database, day = saDay()) {
  const row = await db.prepare('SELECT day, content, ai, model, regenerations, created_at FROM daily_briefings WHERE day = ?').bind(day).first<{ day: string; content: string; ai: number; model: string | null; regenerations: number; created_at: string }>();
  return row ? { day: row.day, briefing: JSON.parse(row.content) as Briefing, ai: !!row.ai, model: row.model, regenerations: row.regenerations, created_at: row.created_at } : null;
}
