import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { canFormatDescription, renderRichText, plainHtml } from '../../src/lib/rich-text';
import { whatsappUrl } from '../../src/lib/whatsapp';
import { hoursSummary, openStatus } from '../../src/lib/openNow';
import { getSite } from '../_lib/site';

interface Env {
  DB: D1Database;
  SITE: string;
}

// Public, read-only, no auth. Everything this returns is already shown on
// the public business page to any visitor (or is the server's live answer
// to "is this still allowed to show?" for something that already is) —
// never an owner/admin-only field (no email, phone stays off this endpoint
// too even though it's shown elsewhere, no owner_user_id, no stats). See
// src/pages/business/[slug].astro's live-patch script, which fetches this
// once on load and swaps in whatever differs from the static HTML it was
// built with, so an owner's edit to one of these five fields (or a plan
// that's lapsed since) shows up without waiting for the next full rebuild
// (~15-25 min) — and re-checks the paid-plan gating live, the same as a
// rebuild would, rather than trusting whatever the static HTML assumed.
//
// The paid-plan rule itself (logoFor/whatsappFor/descriptionHtmlFor in
// src/lib/data.ts) is duplicated here rather than imported: data.ts pulls
// in src/site.ts, which reads SITE from process.env/import.meta.env at
// module-eval time — fine for the Astro build, but Pages Functions only get
// env per request via context.env (see functions/_lib/site.ts, which
// duplicates the Site shape for the exact same reason). canFormatDescription
// itself — the one rule logoFor/whatsappFor/descriptionHtmlFor are all built
// on — IS imported directly, from the dependency-free src/lib/rich-text.ts,
// so that part of "the rule lives in one place" still holds.
const FEATURED_TIER = 2; // kept in sync by hand with src/lib/data.ts's FEATURED_TIER
// Verified up to 4, Featured up to 10 — same caps as
// functions/api/business-photos.ts's TIER_PHOTO_CAP and the page's own
// PHOTO_CAP_BY_TIER. However many rows a business has in business_photos
// (e.g. left over from a higher plan before a downgrade), the SQL LIMIT
// below only ever reads/returns up to this many — never the whole table.
const PHOTO_CAP_BY_TIER: Record<number, number> = { 0: 0, 1: 4, 2: 10 };

interface Row {
  id: number;
  slug: string;
  name: string;
  description: string;
  short_description: string | null;
  subscription_tier: number;
  subscription_status: string | null;
  whatsapp: string | null;
  hours: string | null;
  logo_key: string | null;
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const url = new URL(context.request.url);
  const idParam = url.searchParams.get('id');
  const slugParam = url.searchParams.get('slug');
  if (idParam && !/^\d+$/.test(idParam)) return json({ ok: false, error: 'Invalid id.' }, 400);
  if (!idParam && !slugParam) return json({ ok: false, error: 'Missing id or slug.' }, 400);

  const db = context.env.DB;
  const SELECT =
    'SELECT id, slug, name, description, short_description, subscription_tier, subscription_status, whatsapp, hours, logo_key FROM businesses WHERE ';
  const row = idParam
    ? await db.prepare(`${SELECT}id = ?`).bind(Number(idParam)).first<Row>()
    : await db.prepare(`${SELECT}slug = ?`).bind(slugParam).first<Row>();
  if (!row) return json({ ok: false, error: 'Not found.' }, 404);

  // The one "paid plan is live right now" rule — same as logoFor/
  // whatsappFor/descriptionHtmlFor's canFormatDescription() check.
  const formatted = canFormatDescription(row);

  // Verified/Featured perk, same rule as logoFor. A key starting with "/" is
  // already a site path (the preview's demo placeholder) and is used as is.
  const logo = row.logo_key && formatted ? (row.logo_key.startsWith('/') ? row.logo_key : `/media/${row.logo_key}`) : null;

  // Featured-plan perk, same rule as whatsappFor (tier >= Featured AND the
  // plan is currently live) — whatsappUrl itself returns null for a number
  // that doesn't parse as an SA mobile.
  let whatsapp: string | null = null;
  if (row.whatsapp && row.subscription_tier >= FEATURED_TIER && formatted) {
    const site = getSite(context.env.SITE);
    whatsapp = whatsappUrl(row.whatsapp, row.name, site.siteName);
  }

  // Formatted (bold/italic/lists) only while the plan is live, same rule as
  // descriptionHtmlFor — a Basic or lapsed listing gets plain paragraphs
  // with the markers stripped, exactly like the static page would rebuild.
  const descriptionHtml = formatted ? renderRichText(row.description) : plainHtml(row.description);

  // Photos: same "cancelled still means paid-through until the expiry sweep
  // drops the tier" rule as business-photos.ts's paidTier, then capped by
  // tier and by the SQL LIMIT.
  const effectiveTier = row.subscription_status === 'active' || row.subscription_status === 'cancelled' ? row.subscription_tier : 0;
  const cap = PHOTO_CAP_BY_TIER[effectiveTier] ?? 0;
  let photos: { url: string; caption: string | null }[] = [];
  if (cap > 0) {
    const res = await db
      .prepare('SELECT r2_key, caption FROM business_photos WHERE business_id = ? ORDER BY sort_order LIMIT ?')
      .bind(row.id, cap)
      .all<{ r2_key: string; caption: string | null }>();
    photos = res.results.map((p) => ({ url: `/media/${p.r2_key}`, caption: p.caption }));
  }

  return json(
    {
      ok: true,
      id: row.id,
      logo,
      whatsapp,
      descriptionHtml,
      // Raw hours text (the "Trading hours" box) and the one-line summary
      // (the "About this listing" row) — see src/lib/openNow.ts. "Open now"
      // itself depends on the current moment, not just the hours text, so
      // the client recomputes it from hoursText with its own clock rather
      // than trusting a status computed at response time and cached for up
      // to 30s; openStatus() here is a double-check only (unused by the
      // client) that the live hours text alone is exactly what the build
      // would have produced.
      hoursText: row.hours,
      hoursSummaryText: hoursSummary(row.hours),
      open: openStatus(row.hours),
      photos,
    },
    200,
    // Short enough that an edit shows up fast, long enough that a page
    // getting hit repeatedly in the same minute doesn't re-read D1 every
    // single time.
    { 'Cache-Control': 'public, max-age=30' }
  );
};

function json(data: unknown, status = 200, extraHeaders: Record<string, string> = {}): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json', ...extraHeaders } });
}
