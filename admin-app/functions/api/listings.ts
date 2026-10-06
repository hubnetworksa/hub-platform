import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, count, type Env } from '../_lib/sites';
import { readReport, writeReport } from '../_lib/alerts';
import { qualityReport } from '../_lib/quality';

// Listing quality per city (Listings screen). Each city's report is kept for
// a day; ?refresh=<slug> rebuilds that city's now (at most every 10 minutes).
// A native-admin action on the city itself (hide, mark closed, delete, edit
// — functions/_lib/quality-cache.ts in the main repo) bumps
// site_settings.meta_businesses_changed_ms there, since the city has no way
// to clear this cache directly; checking it against the cache's own
// timestamp forces an early refresh for exactly that case, without having
// to shorten the cache window for everyone else.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const db = env.ADMIN_DB;
  const refresh = new URL(context.request.url).searchParams.get('refresh');
  const sites = hubSites(env);
  const reports = await Promise.all(
    sites.map(async (s) => {
      const kind = `quality:${s.slug}`;
      const cached = await readReport<Awaited<ReturnType<typeof qualityReport>>>(db, kind);
      const cachedAt = cached ? new Date(`${cached.updated_at.replace(' ', 'T')}Z`).getTime() : 0;
      const age = cached ? Date.now() - cachedAt : Infinity;
      const changedAt = await count(s.db, `SELECT value FROM site_settings WHERE key = 'meta_businesses_changed_ms'`);
      const staleFromCityEdit = !!cached && changedAt > cachedAt;
      if (cached && age < 86400_000 && !staleFromCityEdit && !(refresh === s.slug && age > 600_000)) return { ...cached.data, domain: s.domain, updated_at: cached.updated_at };
      const data = await qualityReport(s);
      await writeReport(db, kind, data);
      return { ...data, domain: s.domain, updated_at: new Date().toISOString().replace('T', ' ').slice(0, 19) };
    })
  );
  return json({ ok: true, reports });
};
