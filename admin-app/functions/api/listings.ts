import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, type Env } from '../_lib/sites';
import { readReport, writeReport } from '../_lib/alerts';
import { qualityReport } from '../_lib/quality';

// Listing quality per city (Listings screen). Each city's report is kept for
// a day; ?refresh=<slug> rebuilds that city's now (at most every 10 minutes).
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const db = env.ADMIN_DB;
  const refresh = new URL(context.request.url).searchParams.get('refresh');
  const sites = hubSites(env);
  const reports = await Promise.all(
    sites.map(async (s) => {
      const kind = `quality:${s.slug}`;
      const cached = await readReport<Awaited<ReturnType<typeof qualityReport>>>(db, kind);
      const age = cached ? Date.now() - new Date(`${cached.updated_at.replace(' ', 'T')}Z`).getTime() : Infinity;
      if (cached && age < 86400_000 && !(refresh === s.slug && age > 600_000)) return { ...cached.data, domain: s.domain, updated_at: cached.updated_at };
      const data = await qualityReport(s);
      await writeReport(db, kind, data);
      return { ...data, domain: s.domain, updated_at: new Date().toISOString().replace('T', ' ').slice(0, 19) };
    })
  );
  return json({ ok: true, reports });
};
