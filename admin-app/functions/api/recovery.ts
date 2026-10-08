import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, rows, type Env } from '../_lib/sites';
import { readReport } from '../_lib/alerts';

// Site recovery: is Google bringing a site back after the September 2026 spam
// update? Baseline (the week before the drop) against now, from the daily
// Google report plus the recovery_daily snapshots (indexing state over time).

/** First day of the drop. The baseline is the 7 days before it. */
const COLLAPSE_DATE = '2026-09-24';
const KEY_PATHS = ['/', '/category/', '/suburb/', '/about/'];

interface SiteData {
  daily: { date: string; clicks: number; impressions: number; ctr: number; position: number }[];
  pagesSeen: { date: string; pages: number }[];
  top: { query: string; impressions: number; clicks: number; position: number; prev: { impressions: number; clicks: number; position: number } | null }[];
  topWindow?: { startDate: string; endDate: string; prevStartDate: string; prevEndDate: string };
  sitemapUrls: number;
  inspections: Record<string, [string, string | null, string | null, string]>;
  error: string | null;
}

const isIndexed = (state: string | undefined | null) => !!state && /indexed/i.test(state) && !/not indexed/i.test(state);
const kindOf = (path: string) => {
  const [section, , sub] = path.split('/').filter(Boolean);
  if (!section) return 'Home';
  if (section === 'business') return 'Business';
  if (section === 'category') return sub ? 'Category in suburb' : 'Category';
  if (section === 'suburb') return 'Suburb';
  if (section === 'shopping-center') return 'Shopping centre';
  return section[0].toUpperCase() + section.slice(1);
};
const avg = (xs: number[]) => (xs.length ? xs.reduce((a, b) => a + b, 0) / xs.length : 0);
const pct = (now: number, base: number) => (base > 0 ? Math.min(999, Math.round((now / base) * 100)) : null);

/** Rolling 7-entry averages aligned to `values` (the first six are null). */
const rolling7 = (values: number[]): (number | null)[] => values.map((_, i) => (i < 6 ? null : avg(values.slice(i - 6, i + 1))));
const maxOf = (xs: (number | null)[]) => Math.max(0, ...xs.filter((v): v is number => v != null));

type Point = { date: string; impressions: number; clicks: number; position: number; pagesSeen: number; indexedSample: number | null; sampled: number | null; keyPagesIndexed: number | null };

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const sites = hubSites(env);
  if (!sites.length) return json({ ok: false, error: 'No sites.' }, 404);
  const asked = new URL(context.request.url).searchParams.get('site');
  const site = sites.find((s) => s.slug === asked) ?? sites.find((s) => s.slug === 'pretoria') ?? sites[0];

  const report = await readReport<{ generatedAt: string; sites: Record<string, SiteData> }>(env.ADMIN_DB, 'google');
  const d = report?.data.sites?.[site.slug];
  const snaps = await rows<{ day: string; indexed_sample: number | null; sampled: number | null; key_pages_indexed: number | null; sitemap_urls: number | null }>(
    env.ADMIN_DB,
    'SELECT day, indexed_sample, sampled, key_pages_indexed, sitemap_urls FROM recovery_daily WHERE site = ? ORDER BY day',
    site.slug
  );

  // Merge the 90-day series by date.
  const byDate = new Map<string, Point>();
  const slot = (date: string) => {
    let x = byDate.get(date);
    if (!x) byDate.set(date, (x = { date, impressions: 0, clicks: 0, position: 0, pagesSeen: 0, indexedSample: null, sampled: null, keyPagesIndexed: null }));
    return x;
  };
  for (const r of d?.daily ?? []) Object.assign(slot(r.date), { impressions: r.impressions, clicks: r.clicks, position: r.position });
  for (const r of d?.pagesSeen ?? []) slot(r.date).pagesSeen = r.pages;
  for (const s of snaps) Object.assign(slot(s.day), { indexedSample: s.indexed_sample, sampled: s.sampled, keyPagesIndexed: s.key_pages_indexed });
  const series = [...byDate.values()].sort((a, b) => a.date.localeCompare(b.date));

  // Baseline: the 7 days before the collapse; else the best 7-day average seen.
  const imprs = series.map((x) => x.impressions);
  const seen = series.map((x) => x.pagesSeen);
  const before = series.filter((x) => x.date < COLLAPSE_DATE).slice(-7);
  let baseline = { impressions: avg(before.map((x) => x.impressions)), pagesSeen: avg(before.map((x) => x.pagesSeen)) };
  let baselineNote: string | null = null;
  if (!before.length) {
    baseline = { impressions: maxOf(rolling7(imprs)), pagesSeen: maxOf(rolling7(seen)) };
    baselineNote = series.length ? 'No data from before the drop, so the baseline is the best 7-day average in the last 90 days.' : 'No data yet.';
  }
  baseline = { impressions: Math.round(baseline.impressions), pagesSeen: Math.round(baseline.pagesSeen) };

  const last7 = series.slice(-7);
  const now = { impressions: Math.round(avg(last7.map((x) => x.impressions))), pagesSeen: Math.round(avg(last7.map((x) => x.pagesSeen))) };
  const recoveryPct = { impressions: pct(now.impressions, baseline.impressions), pagesSeen: pct(now.pagesSeen, baseline.pagesSeen) };

  // Key pages and the sample.
  const insp = d?.inspections ?? {};
  const keyPages = KEY_PATHS.map((path) => {
    const v = insp[path];
    return { path, state: v?.[0] ?? null, indexed: isIndexed(v?.[0]), lastCrawl: v?.[2] ?? null, checked: v?.[3] ?? null };
  });
  const entries = Object.entries(insp);
  const states: Record<string, number> = {};
  const types: Record<string, { checked: number; indexed: number }> = {};
  for (const [path, v] of entries) {
    states[v[0]] = (states[v[0]] ?? 0) + 1;
    const t = (types[kindOf(path)] ??= { checked: 0, indexed: 0 });
    t.checked++;
    if (isIndexed(v[0])) t.indexed++;
  }
  const inspection = {
    checked: entries.length,
    indexed: entries.filter(([, v]) => isIndexed(v[0])).length,
    sitemapUrls: d?.sitemapUrls ?? 0,
    byState: Object.entries(states).sort((a, b) => b[1] - a[1]).map(([state, n]) => ({ state, n, indexed: isIndexed(state) })),
    byType: Object.entries(types).map(([kind, t]) => ({ kind, ...t })).sort((a, b) => b.checked - a.checked),
  };

  const top = d?.top ?? [];
  const queries = {
    top,
    window: d?.topWindow ?? null,
    withImpressionsNow: top.filter((q) => q.impressions > 0).length,
    withImpressionsPrev: top.filter((q) => (q.prev?.impressions ?? 0) > 0).length,
  };

  // Milestones; `when` is the first date the condition held after the drop.
  const bP = baseline.pagesSeen;
  const bI = baseline.impressions;
  const post = series.filter((x) => x.date >= COLLAPSE_DATE);
  const n = (v: number) => v.toLocaleString('en-ZA');
  const keyMs = (path: string, label: string, id: string) => {
    const k = keyPages.find((x) => x.path === path)!;
    return { id, label, done: k.indexed, when: k.indexed ? k.checked : null, detail: k.state ? `Google says: ${k.state}${k.lastCrawl ? `, last crawled ${k.lastCrawl}` : ''}.` : 'Not checked by Google inspection yet.' };
  };
  const step = (id: string, label: string, test: (x: Point) => boolean, detail: string) => {
    const when = post.find(test)?.date ?? null;
    return { id, label, done: when != null, when, detail };
  };
  const topBack = top.filter((q) => q.impressions >= 10 && q.position <= 10);
  const rollI = rolling7(imprs);
  const rollP = rolling7(seen);
  const fullIdx = series.findIndex((x, i) => x.date >= COLLAPSE_DATE && bP > 0 && bI > 0 && (rollP[i] ?? 0) >= bP * 0.9 && (rollI[i] ?? 0) >= bI * 0.9);
  const sitemapOk = (d?.sitemapUrls ?? 0) > 0;
  const milestones = [
    keyMs('/', 'Homepage indexed', 'home'),
    keyMs('/category/', '/category/ indexed again', 'category'),
    keyMs('/suburb/', '/suburb/ indexed again', 'suburb'),
    keyMs('/about/', '/about/ indexed again', 'about'),
    {
      id: 'sitemap',
      label: 'Sitemap processed (URLs > 0)',
      done: sitemapOk,
      when: sitemapOk ? snaps.find((s) => (s.sitemap_urls ?? 0) > 0)?.day ?? report?.data.generatedAt?.slice(0, 10) ?? null : null,
      detail: `${n(d?.sitemapUrls ?? 0)} URLs found in the sitemap.`,
    },
    step('seen100', 'Pages seen > 100 in a day', (x) => x.pagesSeen > 100, `Best day since the drop: ${n(Math.max(0, ...post.map((x) => x.pagesSeen)))} pages.`),
    step('seen25', 'Pages seen > 25% of baseline', (x) => bP > 0 && x.pagesSeen > bP * 0.25, `Needs more than ${n(Math.round(bP * 0.25))} pages in a day.`),
    step('seen50', 'Pages seen > 50% of baseline', (x) => bP > 0 && x.pagesSeen > bP * 0.5, `Needs more than ${n(Math.round(bP * 0.5))} pages in a day.`),
    step('imp25', 'Impressions > 25% of baseline', (x) => bI > 0 && x.impressions > bI * 0.25, `Needs more than ${n(Math.round(bI * 0.25))} in a day.`),
    step('imp50', 'Impressions > 50% of baseline', (x) => bI > 0 && x.impressions > bI * 0.5, `Needs more than ${n(Math.round(bI * 0.5))} in a day.`),
    {
      id: 'topquery',
      label: 'Top query back on page 1',
      done: topBack.length > 0,
      when: topBack.length ? d?.topWindow?.endDate ?? null : null,
      detail: topBack.length ? `"${topBack[0].query}" at position ${topBack[0].position} (${topBack[0].impressions} impressions this week).` : 'No search with 10+ impressions this week ranks in the top 10 yet.',
    },
    {
      id: 'full',
      label: 'Full recovery (≥ 90% of baseline for 7 days)',
      done: fullIdx >= 0,
      when: fullIdx >= 0 ? series[fullIdx].date : null,
      detail: 'Pages seen and impressions both at 90% or more of the baseline, as a 7-day average.',
    },
  ];

  const daysSinceCollapse = Math.max(0, Math.floor((Date.now() - Date.parse(`${COLLAPSE_DATE}T00:00:00Z`)) / 86_400_000));
  return json({
    ok: true,
    generatedAt: report?.data.generatedAt ?? null,
    site: site.slug,
    domain: site.domain,
    sites: sites.map((s) => ({ slug: s.slug, name: s.name })),
    collapseDate: COLLAPSE_DATE,
    daysSinceCollapse,
    baseline,
    baselineNote,
    now,
    recoveryPct,
    series,
    keyPages,
    keyPagesIndexed: keyPages.filter((k) => k.indexed).length,
    inspection,
    queries,
    milestones,
    error: d?.error ?? (report ? (d ? null : 'No Google data for this site yet.') : 'No Google report yet.'),
  });
};
