import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { visitorHash } from '../_lib/messages';

interface Env {
  DB: D1Database;
  SITE: string;
}

const EVENTS = new Set(['view', 'phone_click', 'website_click', 'search_appearance', 'whatsapp_click']);
// A single search can show many businesses at once; capped generously above
// the site's own render cap (40 results + 1 pinned) so a legitimate full
// page of results is never silently truncated.
const MAX_BATCH = 50;

// A first-party, honest counter behind the owner dashboard's "Profile
// views" / "Phone clicks" / "Website clicks" / "Search appearances" tiles
// — fired from the business page itself (a page view on load, a click on
// the phone/website buttons) and from the search page (once per real
// search, naming every business shown in that page of results). Nothing
// here is sent to or read by a third party; it only ever feeds a
// business's own owner back their own numbers.
//
// One row per event per business (see the business_stats migration); a
// same-visitor, same-business, same-event hit within the same day is
// silently a no-op rather than an error, so a page refresh, a repeated
// search or a slow network retry can't quietly inflate a number the owner
// is going to make decisions from. Never counts against a business that
// isn't actually live (closed/hidden listings don't need traffic numbers,
// and this must not become a way to probe which slugs exist).
async function recordOnce(db: D1Database, businessId: number, event: string, ipHash: string, query: string | null = null): Promise<void> {
  const seenToday = await db
    .prepare(
      `SELECT 1 FROM business_stats WHERE business_id = ? AND event = ? AND ip_hash = ? AND created_at > datetime('now', '-1 day') LIMIT 1`
    )
    .bind(businessId, event, ipHash)
    .first();
  if (!seenToday) {
    try {
      await db.prepare('INSERT INTO business_stats (business_id, event, ip_hash, query) VALUES (?, ?, ?, ?)').bind(businessId, event, ipHash, query).run();
    } catch (err) {
      // 'whatsapp_click' needs the whatsapp-click-stat migration's wider CHECK;
      // until a city's database has it, that one event is just not counted.
      if (err instanceof Error && /CHECK constraint failed/i.test(err.message)) return;
      // The `query` column arrives with the search_terms migration; until it
      // is applied on a given city's database, keep counting views/clicks
      // rather than losing every event over one optional field.
      if (!(err instanceof Error && /no such column/i.test(err.message))) throw err;
      await db.prepare('INSERT INTO business_stats (business_id, event, ip_hash) VALUES (?, ?, ?)').bind(businessId, event, ipHash).run();
    }
  }
}

// Same normalisation search.astro applies before sending, so the owner
// dashboard's term list groups "Plumber  " and "plumber" as one term.
function cleanQuery(v: unknown): string | null {
  if (typeof v !== 'string') return null;
  const q = v.trim().toLowerCase().replace(/\s+/g, ' ').slice(0, 80);
  return q || null;
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return new Response(null, { status: 204 }); // beacons never get an error page rendered at them
  }

  const event = typeof body.event === 'string' ? body.event : '';
  if (!EVENTS.has(event)) return new Response(null, { status: 204 });

  const db = context.env.DB;
  const ipHash = await visitorHash(context.request, context.env.SITE ?? 'site');

  // Search results show many businesses in one page, so this event batches
  // a whole result set into one request rather than one beacon per row.
  if (event === 'search_appearance') {
    const slugs = Array.isArray(body.businessSlugs)
      ? [...new Set(body.businessSlugs.filter((s): s is string => typeof s === 'string' && s.length > 0 && s.length <= 160))].slice(0, MAX_BATCH)
      : [];
    if (slugs.length === 0) return new Response(null, { status: 204 });
    const query = cleanQuery(body.query);

    const placeholders = slugs.map(() => '?').join(',');
    const rows = await db
      .prepare(`SELECT id FROM businesses WHERE status = 'published' AND closed_at IS NULL AND slug IN (${placeholders})`)
      .bind(...slugs)
      .all<{ id: number }>();
    for (const row of rows.results) {
      await recordOnce(db, row.id, event, ipHash, query);
    }
    return new Response(null, { status: 204 });
  }

  const slug = typeof body.businessSlug === 'string' ? body.businessSlug.trim().slice(0, 160) : '';
  if (!slug) return new Response(null, { status: 204 });

  const business = await db
    .prepare(`SELECT id FROM businesses WHERE slug = ? AND status = 'published' AND closed_at IS NULL`)
    .bind(slug)
    .first<{ id: number }>();
  if (!business) return new Response(null, { status: 204 });

  await recordOnce(db, business.id, event, ipHash);
  return new Response(null, { status: 204 });
};
