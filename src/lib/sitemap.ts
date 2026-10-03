// What goes in the sitemap and each URL's <lastmod> (plus a page-type
// `chunk` label; the sitemap itself is one file). Read by astro.config.mjs
// (the @astrojs/sitemap filter/serialize hooks), so the sitemap is decided from the same build data the pages
// are generated from (src/lib/data.ts), never a second copy of the rules.
//
// Every public page goes in, thin ones included (the owner wants all pages
// in the sitemap so Google can find them); only noindex pages are left out,
// since listing a noindex URL asks Google to crawl a page it must not index.

import {
  businesses,
  categories,
  suburbs,
  shoppingCenters,
  events,
  news,
  businessesInCategory,
  businessesInSuburb,
  businessesInSuburbAndCategory,
  businessesInShoppingCenter,
  categoryHasBusinesses,
  todaySast,
  type Business,
} from './data';
import { CATEGORY_GROUPS } from './categoryGroups';
// @ts-ignore: plain .mjs shared with astro.config.mjs and the prebuild scripts
import { NOINDEX_PATH_PREFIXES } from '../../scripts/noindex-paths.mjs';

/** Page types, used to label sitemap entries; anything else is "pages". */
export const SITEMAP_CHUNKS = [
  'business',
  'category',
  'category-suburb',
  'suburb',
  'shopping-centre',
  'events',
  'news',
  'guides',
  'tourism',
] as const;
export type SitemapChunk = (typeof SITEMAP_CHUNKS)[number] | 'pages';

export interface SitemapEntry {
  chunk: SitemapChunk;
  /** ISO 8601, or undefined when there's no honest date for the page. */
  lastmod?: string;
}

export const BUILD_DATE = new Date().toISOString();

/** D1's datetime('now') text ("2026-09-21 04:27:50", UTC) as ISO 8601. */
export function isoFromD1(value: string | null | undefined): string | undefined {
  if (!value) return undefined;
  const d = new Date(/T/.test(value) ? value : `${value.replace(' ', 'T')}Z`);
  return Number.isNaN(d.getTime()) ? undefined : d.toISOString();
}

/** A YYYY-MM-DD date as ISO 8601 (midnight UTC). */
export function isoFromDate(value: string | null | undefined): string | undefined {
  if (!value || !/^\d{4}-\d{2}-\d{2}$/.test(value)) return undefined;
  return `${value}T00:00:00.000Z`;
}

/** Newest updated_at among the businesses a list page shows, else the build date. */
function newestUpdate(list: Business[]): string {
  let newest: string | undefined;
  for (const b of list) {
    const iso = isoFromD1(b.updated_at);
    if (iso && (!newest || iso > newest)) newest = iso;
  }
  return newest ?? BUILD_DATE;
}

const businessBySlug = new Map(businesses.map((b) => [b.slug, b]));
const categoryBySlug = new Map(categories.map((c) => [c.slug, c]));
const suburbBySlug = new Map(suburbs.map((s) => [s.slug, s]));
const centreBySlug = new Map(shoppingCenters.map((c) => [c.slug, c]));
const eventBySlug = new Map(events.map((e) => [e.slug, e]));
const newsBySlug = new Map(news.map((n) => [n.slug, n]));
const groupBySlug = new Map(CATEGORY_GROUPS.map((g) => [g.slug, g]));

/** Account, admin, form and utility pages (login, report-listing, the
 *  list-your-business flow, /events/add/, ...): they all carry noindex, so
 *  they never go in the sitemap. */
const isNoindexPath = (path: string): boolean =>
  (NOINDEX_PATH_PREFIXES as string[]).some((prefix) => path.startsWith(prefix));

/** Static pages whose content comes from the build data, so the build date is a real "last changed". */
const DATA_DRIVEN_STATIC = new Set(['/', '/about/']);

/**
 * The sitemap entry for a site path (e.g. "/business/foo/"), or null to leave
 * it out. Paths this doesn't recognise go in "pages" without a lastmod.
 */
export function sitemapEntryFor(pathname: string): SitemapEntry | null {
  const path = pathname.endsWith('/') ? pathname : `${pathname}/`;
  if (isNoindexPath(path)) return null;
  const parts = path.split('/').filter(Boolean);
  const [section, slug, sub] = parts;

  switch (section) {
    case 'business': {
      if (!slug) return { chunk: 'business', lastmod: newestUpdate(businesses) };
      const b = businessBySlug.get(slug);
      return { chunk: 'business', lastmod: isoFromD1(b?.updated_at) };
    }
    case 'category': {
      if (!slug) return { chunk: 'category', lastmod: newestUpdate(businesses) };
      const category = categoryBySlug.get(slug);
      if (!category) return { chunk: 'category' };
      if (!sub) {
        // Empty categories carry noindex (category/[slug]/index.astro) —
        // categoryHasBusinesses() is the one shared check for both, so this
        // can't drift from the page's own noindex condition again.
        if (!categoryHasBusinesses(category.id)) return null;
        return { chunk: 'category', lastmod: newestUpdate(businessesInCategory(category.id)) };
      }
      const suburb = suburbBySlug.get(sub);
      if (!suburb) return { chunk: 'category-suburb' };
      const listed = businessesInSuburbAndCategory(suburb.id, category.id);
      return { chunk: 'category-suburb', lastmod: newestUpdate(listed) };
    }
    case 'section': {
      const group = slug ? groupBySlug.get(slug) : undefined;
      const listed = group
        ? group.categorySlugs.flatMap((s) => {
            const c = categoryBySlug.get(s);
            return c ? businessesInCategory(c.id) : [];
          })
        : businesses;
      return { chunk: 'category', lastmod: newestUpdate(listed) };
    }
    case 'suburb': {
      if (!slug) return { chunk: 'suburb', lastmod: newestUpdate(businesses) };
      const suburb = suburbBySlug.get(slug);
      return { chunk: 'suburb', lastmod: suburb ? newestUpdate(businessesInSuburb(suburb.id)) : undefined };
    }
    case 'shopping-center': {
      if (!slug) return { chunk: 'shopping-centre', lastmod: newestUpdate(businesses.filter((b) => b.shopping_center_id != null)) };
      const centre = centreBySlug.get(slug);
      return { chunk: 'shopping-centre', lastmod: centre ? newestUpdate(businessesInShoppingCenter(centre.id)) : undefined };
    }
    case 'events': {
      if (!slug) return { chunk: 'events', lastmod: BUILD_DATE };
      const event = eventBySlug.get(slug);
      // A past event's page stops changing once it has happened; an upcoming
      // one (a future date is never a valid lastmod) as of this build.
      if (!event) return { chunk: 'events' };
      return { chunk: 'events', lastmod: event.event_date < todaySast() ? isoFromDate(event.event_date) : BUILD_DATE };
    }
    case 'news': {
      if (!slug) {
        const newest = news.map((n) => n.published_date).sort().pop();
        return { chunk: 'news', lastmod: isoFromDate(newest) ?? BUILD_DATE };
      }
      return { chunk: 'news', lastmod: isoFromDate(newsBySlug.get(slug)?.published_date) };
    }
    case 'guides':
      return { chunk: 'guides', lastmod: BUILD_DATE };
    case 'tourism':
      return { chunk: 'tourism' };
    default:
      return DATA_DRIVEN_STATIC.has(path) ? { chunk: 'pages', lastmod: BUILD_DATE } : { chunk: 'pages' };
  }
}

/**
 * The dateModified a page's JSON-LD carries: the same date as its sitemap
 * <lastmod>, falling back to the build date for static and list pages with
 * no data-driven date of their own (the build is when they last changed).
 */
export function lastModifiedFor(pathname: string): string {
  const path = pathname.endsWith('/') ? pathname : `${pathname}/`;
  if (isNoindexPath(path)) return BUILD_DATE;
  return sitemapEntryFor(path)?.lastmod ?? BUILD_DATE;
}
