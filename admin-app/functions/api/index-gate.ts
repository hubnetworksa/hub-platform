import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, type Env } from '../_lib/sites';
import { jsonBody } from '../_lib/body';
import { readReport, writeReport, logActivity } from '../_lib/alerts';
import { cityAdmin } from '../_lib/city-api';

// Indexing screen: per-city content-score histogram from the city's
// /api/admin/index-gate. Cached an hour in `reports` (kind index-gate:<slug>:v1);
// ?refresh=<slug> rebuilds that city now.
const key = (slug: string) => `index-gate:${slug}:v1`;
const TTL_MS = 3600_000;

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const db = env.ADMIN_DB;
  const actor = String(context.data.email);
  const refresh = new URL(context.request.url).searchParams.get('refresh');
  const sites = await Promise.all(
    hubSites(env).map(async (s) => {
      try {
        const cached = await readReport<Record<string, unknown>>(db, key(s.slug));
        const age = cached ? Date.now() - new Date(`${cached.updated_at.replace(' ', 'T')}Z`).getTime() : Infinity;
        if (cached && age < TTL_MS && refresh !== s.slug) return { ...cached.data, name: s.name, domain: s.domain, updated_at: cached.updated_at };
        const r = await cityAdmin(db, s, actor, '/api/admin/index-gate', {});
        if (!r.ok) throw new Error(r.error || `${s.name} said no (${r.status}).`);
        const data = r.body as Record<string, unknown>;
        await writeReport(db, key(s.slug), data);
        return { ...data, name: s.name, domain: s.domain, updated_at: new Date().toISOString().replace('T', ' ').slice(0, 19) };
      } catch (e) {
        return { slug: s.slug, name: s.name, error: e instanceof Error ? e.message : String(e) };
      }
    })
  );
  return json({ ok: true, sites });
};

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const actor = String(context.data.email);
  const body = await jsonBody(context.request);
  const site = hubSites(env).find((s) => s.slug === body?.site);
  const threshold = body?.threshold;
  if (!site || typeof threshold !== 'number' || !Number.isInteger(threshold) || threshold < 0 || threshold > 15) return json({ ok: false, error: 'Invalid request.' }, 400);

  const r = await cityAdmin(env.ADMIN_DB, site, actor, '/api/admin/site-settings', { key: 'index_min_score', value: threshold });
  if (!r.ok) return json({ ok: false, error: r.error || `${site.name} said no (${r.status}).` }, 502);
  await logActivity(env.ADMIN_DB, actor, site.slug, 'index_threshold_set', String(threshold));
  await env.ADMIN_DB.prepare('DELETE FROM reports WHERE kind = ?').bind(key(site.slug)).run();
  return json({ ok: true });
};
