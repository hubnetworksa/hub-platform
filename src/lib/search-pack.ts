// Build-time only: the lean, pre-normalised business search payload and its
// content hash. The hash is in the URL (/search-index.<hash>.json) so the
// file can be cached forever and is fresh whenever the data changes.
import { createHash } from 'node:crypto';
import { businesses, suburbFor, categoriesFor, websiteUrl, logoFor, whatsappFor } from './data';
import { synonymsFor, locationSynonymsFor } from './categorySynonyms';
import { formatPhoneZA } from './phone';
import { plainLine } from './rich-text';
import { buildSearchPack, type PackRow, type SearchPack } from './fuzzy-search';
import site from '../site';

let cached: { json: string; hash: string; pack: SearchPack } | null = null;

export function searchPack() {
  if (cached) return cached;
  const catIdx = new Map<string, number>();
  const cats: { n: string; ks: string }[] = [];
  const subIdx = new Map<string, number>();
  const subs: { n: string; s: string }[] = [];
  const idx = <T>(map: Map<string, number>, list: T[], key: string, make: () => T) => {
    let i = map.get(key);
    if (i === undefined) {
      i = list.length;
      list.push(make());
      map.set(key, i);
    }
    return i;
  };
  const rows: PackRow[] = businesses.map((b) => {
    const cat = categoriesFor(b)[0];
    const sub = suburbFor(b);
    const row: PackRow = {
      n: b.name,
      s: b.slug,
      // Category / suburb are shared tables, not repeated on every row.
      // Synonyms (trade jargon + this city's variants) live with the category.
      ci: idx(catIdx, cats, cat?.slug ?? '', () => ({
        n: cat?.name ?? '',
        ks: cat ? [...synonymsFor(cat.slug), ...locationSynonymsFor(cat.name, site.cityLabel)].join(' ') : '',
      })),
      si: idx(subIdx, subs, sub?.slug ?? '', () => ({ n: sub?.name ?? '', s: sub?.slug ?? '' })),
      t: b.subscription_tier,
    };
    // Optional, and absent for nearly every row.
    if (b.hours) row.hr = b.hours;
    if (b.short_description) row.sd = plainLine(b.short_description);
    const logo = logoFor(b);
    if (logo) row.l = logo;
    // Only the pinned (top Featured) result renders these.
    if (b.subscription_tier >= 2) {
      row.p = formatPhoneZA(b.phone);
      row.w = websiteUrl(b.website) ?? '';
      row.a = b.address ?? '';
      row.d = plainLine(b.description);
      const wa = whatsappFor(b);
      if (wa) row.wa = wa;
    }
    return row;
  });
  const body = buildSearchPack(rows, cats, subs);
  const hash = createHash('sha1').update(JSON.stringify(body)).digest('hex').slice(0, 10);
  const pack: SearchPack = { v: hash, ...body };
  cached = { json: JSON.stringify(pack), hash, pack };
  return cached;
}

export const searchIndexUrl = () => `/search-index.${searchPack().hash}.json`;
