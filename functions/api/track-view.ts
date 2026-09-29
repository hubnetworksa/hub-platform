import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { visitorHash } from '../_lib/messages';

interface Env {
  DB: D1Database;
  SITE: string;
}

const EVENTS = new Set(['view', 'phone_click', 'website_click']);

// A first-party, honest counter behind the owner dashboard's "Profile
// views" / "Phone clicks" / "Website clicks" tiles — fired from the
// business page itself (a page view on load, a click on the phone/website
// buttons). Nothing here is sent to or read by a third party; it only ever
// feeds the business's own owner back their own numbers.
//
// One row per event (see the business_stats migration); a same-visitor,
// same-business, same-event hit within the same day is silently a no-op
// rather than an error, so a page refresh or a slow network retry can't
// quietly inflate a number the owner is going to make decisions from.
// Never counts against a business that isn't actually live (closed/hidden
// listings don't need traffic numbers, and this must not become a way to
// probe which slugs exist).
export const onRequestPost: PagesFunction<Env> = async (context) => {
  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return new Response(null, { status: 204 }); // beacons never get an error page rendered at them
  }

  const slug = typeof body.businessSlug === 'string' ? body.businessSlug.trim().slice(0, 160) : '';
  const event = typeof body.event === 'string' ? body.event : '';
  if (!slug || !EVENTS.has(event)) return new Response(null, { status: 204 });

  const db = context.env.DB;
  const business = await db
    .prepare(`SELECT id FROM businesses WHERE slug = ? AND status = 'published' AND closed_at IS NULL`)
    .bind(slug)
    .first<{ id: number }>();
  if (!business) return new Response(null, { status: 204 });

  const ipHash = await visitorHash(context.request, context.env.SITE ?? 'site');
  const seenToday = await db
    .prepare(
      `SELECT 1 FROM business_stats WHERE business_id = ? AND event = ? AND ip_hash = ? AND created_at > datetime('now', '-1 day') LIMIT 1`
    )
    .bind(business.id, event, ipHash)
    .first();
  if (!seenToday) {
    await db.prepare('INSERT INTO business_stats (business_id, event, ip_hash) VALUES (?, ?, ?)').bind(business.id, event, ipHash).run();
  }

  return new Response(null, { status: 204 });
};
