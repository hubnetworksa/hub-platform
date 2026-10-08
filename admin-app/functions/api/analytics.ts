import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, type Env } from '../_lib/sites';
import { readReport } from '../_lib/alerts';
import { firstPartyTotals } from './stats';

// The Analytics screen: GA4 traffic per site, from the daily workflow
// (scripts/search-console-daily.mjs, reports 'google'), plus first-party
// totals (views, taps, enquiries) for the funnel.

const RANGE = 28;

type Sums = { sessions: number; users: number; pageviews: number };
type Eng = { engagementRate: number; averageSessionDuration: number; bounceRate: number; sessions: number; users: number };
interface Analytics {
  propertyId: string;
  error?: string;
  errors?: Record<string, string>;
  daily?: { date: string; sessions: number; users: number; pageviews: number }[];
  topPages?: { path: string; pageviews: number; users: number }[];
  totals7?: Sums;
  totals28?: Sums;
  prev7?: Sums;
  channels?: { name: string; sessions: number; users: number }[];
  sources?: { name: string; sessions: number }[];
  devices?: { name: string; sessions: number }[];
  cities?: { name: string; sessions: number }[];
  landing?: { path: string; sessions: number; type: string }[];
  newVsReturning?: { new: number; returning: number };
  engagement?: { cur: Eng; prev: Eng };
  byHour?: { hour: number; sessions: number }[];
  byWeekday?: { day: number; sessions: number }[];
  events?: { name: string; count: number }[];
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const report = await readReport<{ generatedAt: string; sites: Record<string, { analytics?: Analytics }> }>(env.ADMIN_DB, 'google');
  const sites = await Promise.all(
    hubSites(env).map(async (s) => {
      const analytics = report?.data.sites?.[s.slug]?.analytics ?? null;
      const fp = await firstPartyTotals(s.db, RANGE);
      return { slug: s.slug, name: s.name, domain: s.domain, analytics, firstParty: { ...fp, sessions: analytics?.totals28?.sessions ?? null } };
    })
  );
  return json({ ok: true, generated_at: report?.data.generatedAt ?? null, sites });
};
