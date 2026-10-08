import type { PagesFunction } from '@cloudflare/workers-types';
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
  if (kind === 'google') {
    const sites = (data as { sites?: Record<string, { authority?: { openPageRank?: { score?: number; rank?: number | null; checkedAt?: string } } | null }> }).sites ?? {};
    for (const [site, s] of Object.entries(sites)) {
      const o = s?.authority?.openPageRank;
      if (!o || typeof o.score !== 'number' || !o.checkedAt) continue;
      const day = new Date(o.checkedAt).toISOString().slice(0, 10);
      await db
        .prepare('INSERT INTO authority_daily (day, site, score, rank) VALUES (?, ?, ?, ?) ON CONFLICT(day, site) DO UPDATE SET score = excluded.score, rank = excluded.rank')
        .bind(day, site, o.score, typeof o.rank === 'number' ? o.rank : null)
        .run()
        .catch(() => {});
    }
  }
  return json({ ok: true });
};
