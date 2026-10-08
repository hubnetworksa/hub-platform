import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, type Env } from '../_lib/sites';
import { readReport } from '../_lib/alerts';

// The Analytics screen: GA4 traffic per site, from the daily workflow
// (scripts/search-console-daily.mjs, reports 'google').

type Sums = { sessions: number; users: number; pageviews: number };
interface Analytics {
  propertyId: string;
  error?: string;
  daily?: { date: string; sessions: number; users: number; pageviews: number }[];
  topPages?: { path: string; pageviews: number; users: number }[];
  totals7?: Sums;
  totals28?: Sums;
  prev7?: Sums;
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const report = await readReport<{ generatedAt: string; sites: Record<string, { analytics?: Analytics }> }>(env.ADMIN_DB, 'google');
  const sites = hubSites(env).map((s) => ({ slug: s.slug, name: s.name, analytics: report?.data.sites?.[s.slug]?.analytics ?? null }));
  return json({ ok: true, generated_at: report?.data.generatedAt ?? null, sites });
};
