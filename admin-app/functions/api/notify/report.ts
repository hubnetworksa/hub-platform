import type { D1Database, PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { notifyKeyOk } from '../../_lib/notify-key';
import { readReport, writeReport } from '../../_lib/alerts';

// Reports sent by the scheduled GitHub workflows (X-Notify-Key):
//   ?kind=links   the weekly broken-links crawl (scripts/admin-links.mjs)
//   ?kind=google  the daily Search Console / AdSense data
//                 (scripts/search-console-daily.mjs), which also GETs the
//                 previous copy to keep its history
const LIMITS: Record<string, number> = { links: 900_000, google: 1_800_000 };

export const onRequest: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  if (!(await notifyKeyOk(context.request, db))) return json({ ok: false }, 403);
  const kind = new URL(context.request.url).searchParams.get('kind') ?? '';
  if (!(kind in LIMITS)) return json({ ok: false, error: 'Unknown report.' }, 400);
  if (context.request.method === 'GET') {
    const r = await readReport<unknown>(db, kind);
    return json({ ok: true, data: r?.data ?? null, updated_at: r?.updated_at ?? null });
  }
  if (context.request.method !== 'POST') return json({ ok: false }, 405);
  const text = await context.request.text();
  if (text.length > LIMITS[kind]) return json({ ok: false, error: 'Report too large.' }, 413);
  let data: unknown;
  try {
    data = JSON.parse(text);
  } catch {
    return json({ ok: false, error: 'Body must be JSON.' }, 400);
  }
  if (!data || typeof data !== 'object' || Array.isArray(data)) return json({ ok: false, error: 'Report must be an object.' }, 400);
  await writeReport(db, kind, data);
  if (kind === 'google') await snapshotRecovery(db, data);
  return json({ ok: true });
};

const KEY_PATHS = ['/', '/category/', '/suburb/', '/about/'];
const indexedState = (s: unknown) => typeof s === 'string' && /indexed/i.test(s) && !/not indexed/i.test(s);

/** One recovery_daily row per site for the report's latest complete day. Never throws. */
async function snapshotRecovery(db: D1Database, data: unknown): Promise<void> {
  try {
    const sites = (data as { sites?: Record<string, any> }).sites ?? {};
    for (const [slug, d] of Object.entries(sites)) {
      const last = Array.isArray(d?.daily) ? d.daily[d.daily.length - 1] : null;
      if (!last?.date) continue;
      const seen = Array.isArray(d.pagesSeen) ? d.pagesSeen[d.pagesSeen.length - 1] : null;
      const insp: Record<string, unknown[]> = d.inspections && typeof d.inspections === 'object' ? d.inspections : {};
      const entries = Object.entries(insp);
      const indexed = entries.filter(([, v]) => indexedState(v?.[0])).length;
      const keyIndexed = KEY_PATHS.filter((p) => indexedState(insp[p]?.[0])).length;
      await db
        .prepare(
          `INSERT OR REPLACE INTO recovery_daily (day, site, impressions, clicks, pages_seen, position, indexed_sample, sampled, key_pages_indexed, sitemap_urls)
           VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`
        )
        .bind(last.date, slug, last.impressions ?? null, last.clicks ?? null, seen?.pages ?? null, last.position ?? null, indexed, entries.length, keyIndexed, d.sitemapUrls ?? null)
        .run();
    }
  } catch {
    // Best effort: the report itself is already saved.
  }
}
