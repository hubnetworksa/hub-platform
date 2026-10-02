// Counts and rankings computed from this city's build data, for prose on the
// About page, the buyer's guides and business pages. Everything here is a
// count of real rows in src/data/*.json — nothing is estimated or invented —
// so each site's copy says something only that city's directory can say.

import {
  businesses,
  categories,
  suburbs,
  shoppingCenters,
  businessesInCategory,
  businessesInShoppingCenter,
  suburbFor,
  shoppingCenterFor,
  type Business,
  type Category,
  type Suburb,
  type ShoppingCenter,
} from './data';
import { regionLabel } from '../site-content';

export interface Counted<T> {
  item: T;
  count: number;
}

function ranked<T>(counts: Map<T, number>, limit: number): Counted<T>[] {
  return [...counts]
    .map(([item, count]) => ({ item, count }))
    .sort((a, b) => b.count - a.count)
    .slice(0, limit);
}

/** Businesses per suburb, busiest first. */
export function topSuburbs(list: Business[], limit: number): Counted<Suburb>[] {
  const counts = new Map<Suburb, number>();
  for (const b of list) {
    const s = suburbFor(b);
    if (s) counts.set(s, (counts.get(s) ?? 0) + 1);
  }
  return ranked(counts, limit);
}

/** Businesses per region, biggest first, as a phrase: "in Atlantic Seaboard"
 *  (labels from the city's areaGroups.ts), or "elsewhere in Limpopo" for the
 *  catch-all "<province>-other" regions. */
export function topRegions(list: Business[], limit: number): Counted<string>[] {
  const counts = new Map<string, number>();
  for (const b of list) {
    const region = suburbFor(b)?.region;
    if (region) counts.set(region, (counts.get(region) ?? 0) + 1);
  }
  return ranked(counts, limit).map(({ item, count }) => ({
    item: item.endsWith('-other') ? `elsewhere in ${regionLabel(item)}` : `in ${regionLabel(item)}`,
    count,
  }));
}

/** Categories by how many businesses they list, biggest first (empty ones left out). */
export function topCategories(limit: number): Counted<Category>[] {
  const counts = new Map<Category, number>();
  for (const c of categories) {
    const n = businessesInCategory(c.id).length;
    if (n > 0) counts.set(c, n);
  }
  return ranked(counts, limit);
}

/** Malls by how many listed businesses trade inside them (fuel stations left out). */
export function topShoppingCentres(limit: number, list: Business[] = businesses): Counted<ShoppingCenter>[] {
  const counts = new Map<ShoppingCenter, number>();
  for (const b of list) {
    const c = shoppingCenterFor(b);
    if (c && c.type === 'mall') counts.set(c, (counts.get(c) ?? 0) + 1);
  }
  return ranked(counts, limit);
}

export interface DirectoryStats {
  businesses: number;
  suburbs: number;
  suburbsWithBusinesses: number;
  categoriesWithBusinesses: number;
  mallsWithBusinesses: number;
  withHours: number;
  inShoppingCentres: number;
}

export function directoryStats(): DirectoryStats {
  const suburbIds = new Set(businesses.map((b) => b.suburb_id));
  return {
    businesses: businesses.length,
    suburbs: suburbs.length,
    suburbsWithBusinesses: suburbs.filter((s) => suburbIds.has(s.id)).length,
    categoriesWithBusinesses: categories.filter((c) => businessesInCategory(c.id).length > 0).length,
    mallsWithBusinesses: shoppingCenters.filter((c) => c.type === 'mall' && businessesInShoppingCenter(c.id).length > 0).length,
    withHours: businesses.filter((b) => (b.hours ?? '').trim()).length,
    inShoppingCentres: businesses.filter((b) => b.shopping_center_id != null).length,
  };
}

/** "a, b and c" */
export function andList(items: string[]): string {
  if (items.length <= 1) return items.join('');
  return `${items.slice(0, -1).join(', ')} and ${items[items.length - 1]}`;
}

/** "1,261" (en-ZA would print a non-breaking-space thousands separator). */
export function fmt(n: number): string {
  return n.toLocaleString('en-US');
}
