import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';

interface Env {
  DB: D1Database;
}

// Backs the admin Analytics tab with the same first-party counters the owner
// dashboard shows: business_stats rows written by functions/api/track-view.ts
// (already deduped per visitor per day there) plus listing enquiries from
// `messages`. Last 30 days only.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const db = context.env.DB;
  const since = "datetime('now', '-30 days')";

  const [statTotals, enquiryTotal, top] = await Promise.all([
    db
      .prepare(`SELECT event, COUNT(*) AS n FROM business_stats WHERE created_at >= ${since} GROUP BY event`)
      .all<{ event: string; n: number }>(),
    db
      .prepare(`SELECT COUNT(*) AS n FROM messages WHERE kind = 'enquiry' AND created_at >= ${since}`)
      .first<{ n: number }>(),
    db
      .prepare(
        `SELECT b.id, b.name, b.slug, b.subscription_tier,
                SUM(bs.event = 'view') AS views,
                SUM(bs.event = 'phone_click') AS phone_clicks,
                SUM(bs.event = 'website_click') AS website_clicks,
                SUM(bs.event = 'search_appearance') AS search_appearances,
                (SELECT COUNT(*) FROM messages m WHERE m.kind = 'enquiry' AND m.business_slug = b.slug AND m.created_at >= ${since}) AS enquiries
         FROM business_stats bs
         JOIN businesses b ON b.id = bs.business_id
         WHERE bs.created_at >= ${since}
         GROUP BY b.id
         ORDER BY views DESC, phone_clicks DESC
         LIMIT 20`
      )
      .all<{
        id: number; name: string; slug: string; subscription_tier: number | null;
        views: number | null; phone_clicks: number | null; website_clicks: number | null; search_appearances: number | null; enquiries: number | null;
      }>(),
  ]);

  const byEvent: Record<string, number> = {};
  for (const row of statTotals.results) byEvent[row.event] = row.n;

  return json({
    ok: true,
    days: 30,
    totals: {
      views: byEvent.view ?? 0,
      phoneClicks: byEvent.phone_click ?? 0,
      websiteClicks: byEvent.website_click ?? 0,
      searchAppearances: byEvent.search_appearance ?? 0,
      enquiries: enquiryTotal?.n ?? 0,
    },
    topListings: top.results.map((r) => ({
      id: r.id,
      name: r.name,
      slug: r.slug,
      subscription_tier: r.subscription_tier ?? 0,
      views: r.views ?? 0,
      phone_clicks: r.phone_clicks ?? 0,
      website_clicks: r.website_clicks ?? 0,
      search_appearances: r.search_appearances ?? 0,
      enquiries: r.enquiries ?? 0,
    })),
  });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
