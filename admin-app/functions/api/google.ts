import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, rows, type Env } from '../_lib/sites';
import { readReport } from '../_lib/alerts';

// The Google screen: daily Search Console numbers, the "pages seen in
// Google" trend, Google's indexing verdict for the site's pages, search gaps
// on Google and on the sites' own search. Google data comes from the daily
// workflow (scripts/search-console-daily.mjs, reports 'google').

interface SiteData {
  property: string;
  daily: { date: string; clicks: number; impressions: number; ctr: number; position: number }[];
  pagesSeen: { date: string; pages: number }[];
  gaps: { query: string; impressions: number; clicks: number; position: number }[];
  top: { query: string; impressions: number; clicks: number; position: number }[];
  sitemapUrls: number;
  inspections: Record<string, [string, string | null, string | null, string]>;
  error: string | null;
  authority?: { moz?: { da: number; pa: number | null; spamScore: number | null; linkingDomains: number | null; checkedAt: string } } | null;
}

async function protectedPages(slug: string): Promise<{ count: number; generatedAt: string | null } | null> {
  try {
    const res = await fetch(`https://raw.githubusercontent.com/hubnetworksa/hub-platform/main/status/seo/pages-with-impressions.${slug}.json`, { cf: { cacheTtl: 3600 } } as RequestInit);
    if (!res.ok) return null;
    const b = (await res.json()) as { generatedAt?: string; paths?: unknown[] };
    return { count: Array.isArray(b.paths) ? b.paths.length : 0, generatedAt: b.generatedAt ?? null };
  } catch {
    return null;
  }
}

const isIndexed = (state: string) => /indexed/i.test(state) && !/not indexed/i.test(state);
const kindOf = (path: string) => {
  const [section, , sub] = path.split('/').filter(Boolean);
  if (!section) return 'Home';
  if (section === 'business') return 'Business';
  if (section === 'category') return sub ? 'Category in suburb' : 'Category';
  if (section === 'suburb') return 'Suburb';
  if (section === 'shopping-center') return 'Shopping centre';
  return section[0].toUpperCase() + section.slice(1);
};
const WEIGHT: Record<string, number> = { Home: 0, Category: 1, Suburb: 2, 'Category in suburb': 3, Business: 5 };

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const report = await readReport<{ generatedAt: string; sites: Record<string, SiteData> }>(env.ADMIN_DB, 'google');
  const sites = await Promise.all(
    hubSites(env).map(async (s) => {
      const d = report?.data.sites?.[s.slug];
      let index = null;
      if (d) {
        const entries = Object.entries(d.inspections ?? {});
        const states: Record<string, number> = {};
        for (const [, v] of entries) states[v[0]] = (states[v[0]] ?? 0) + 1;
        const notIndexed = entries
          .filter(([, v]) => !isIndexed(v[0]))
          .map(([path, v]) => ({ path, kind: kindOf(path), state: v[0], last_crawl: v[2], checked: v[3] }))
          .sort((a, b) => (WEIGHT[a.kind] ?? 4) - (WEIGHT[b.kind] ?? 4) || a.path.localeCompare(b.path));
        index = {
          checked: entries.length,
          sitemap_urls: d.sitemapUrls,
          indexed: entries.filter(([, v]) => isIndexed(v[0])).length,
          states: Object.entries(states).sort((a, b) => b[1] - a[1]).map(([state, n]) => ({ state, n, indexed: isIndexed(state) })),
          not_indexed: notIndexed.slice(0, 300),
          not_indexed_count: notIndexed.length,
        };
      }
      // On-site searches (last 30 days) and how many different listings each showed.
      const onsite = await rows<{ query: string; people: number; results: number }>(
        s.db,
        `SELECT lower(trim(query)) AS query, COUNT(DISTINCT ip_hash || date(created_at)) AS people, COUNT(DISTINCT business_id) AS results
         FROM business_stats WHERE event = 'search_appearance' AND query IS NOT NULL AND trim(query) != '' AND created_at >= datetime('now', '-30 days')
         GROUP BY lower(trim(query)) ORDER BY people DESC LIMIT 200`
      );
      const series = await rows<{ day: string; score: number }>(env.ADMIN_DB, `SELECT day, score FROM authority_daily WHERE site = ? AND day >= date('now', '-90 days') ORDER BY day`, s.slug);
      const moz = d?.authority?.moz;
      const protectedP = await protectedPages(s.slug);
      return {
        slug: s.slug,
        domain: s.domain,
        daily: d?.daily ?? [],
        pages_seen: d?.pagesSeen ?? [],
        gaps: d?.gaps ?? [],
        top: d?.top ?? [],
        index,
        onsite_thin: onsite.filter((q) => q.results <= 2 && q.people >= 2).slice(0, 30),
        error: d?.error ?? null,
        protectedPages: protectedP,
        authority: { current: moz ? { da: moz.da, pa: moz.pa ?? null, spamScore: moz.spamScore ?? null, linkingDomains: moz.linkingDomains ?? null, checkedAt: moz.checkedAt } : null, series },
      };
    })
  );
  return json({ ok: true, generated_at: report?.data.generatedAt ?? null, sites });
};
