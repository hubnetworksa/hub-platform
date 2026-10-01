// Shared build-time view of suburbs grouped into the site's browse regions
// (src/site-content/<city>/areaGroups.ts), with real listing counts, real
// suburb-sponsor status and real coordinates. Used by the suburb directory
// index (/suburb/) and the suburb map (/suburb/map/).
import { suburbs, businessesInSuburb, sponsorFor, type Suburb } from './data';
import { AREA_GROUPS, groupForSuburb } from '../site-content';

// The mockup's six region colours first (Suburb Map.html REGIONS), then
// extras for cities with more than six groups.
const REGION_COLORS = ['#1d6fe0', '#0f1b3d', '#4d9e2f', '#1f6fd6', '#9c5f00', '#c23838', '#7a3fb5', '#0d8f8f', '#c2650a', '#6b7280'];

export interface RegionSuburb {
  slug: string;
  name: string;
  count: number;
  lat: number | null;
  lng: number | null;
  sold: boolean;
}

export interface SuburbRegion {
  key: string;
  name: string;
  color: string;
  subs: RegionSuburb[];
  total: number;
  soldCount: number;
}

const byName = (a: { name: string }, b: { name: string }) => a.name.localeCompare(b.name);

function toRegionSuburb(s: Suburb): RegionSuburb {
  return {
    slug: s.slug,
    name: s.name,
    count: businessesInSuburb(s.id).length,
    lat: typeof s.lat === 'number' ? s.lat : null,
    lng: typeof s.lng === 'number' ? s.lng : null,
    sold: Boolean(sponsorFor('suburb_sponsor', s.slug)),
  };
}

export function buildSuburbRegions(): SuburbRegion[] {
  const regions: SuburbRegion[] = [];
  const seen = new Set<string>();
  for (const area of AREA_GROUPS) {
    const subs = area.suburbSlugs
      .map((slug) => suburbs.find((s) => s.slug === slug))
      .filter((s): s is Suburb => Boolean(s) && !seen.has(s!.slug))
      .map((s) => {
        seen.add(s.slug);
        return toRegionSuburb(s);
      })
      .sort(byName);
    if (subs.length === 0) continue;
    regions.push({ key: area.slug, name: area.name, color: '', subs, total: 0, soldCount: 0 });
  }
  // Any suburb not listed in an area group still gets a page, so it still gets a link.
  const orphans = suburbs.filter((s) => !seen.has(s.slug) && !groupForSuburb(s.slug)).map(toRegionSuburb).sort(byName);
  if (orphans.length > 0) regions.push({ key: 'other-areas', name: 'Other areas', color: '', subs: orphans, total: 0, soldCount: 0 });
  regions.forEach((r, i) => {
    r.color = REGION_COLORS[i % REGION_COLORS.length];
    r.total = r.subs.reduce((a, s) => a + s.count, 0);
    r.soldCount = r.subs.filter((s) => s.sold).length;
  });
  return regions;
}

const WORDS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten'];
/** "six" for small counts (matches the mockup's copy), digits otherwise. */
export const countWord = (n: number): string => WORDS[n] ?? String(n);
