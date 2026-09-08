// Two-tier area structure for suburbs — mirrors src/lib/categoryGroups.ts's
// pattern exactly: a fixed, hand-authored grouping used for browsing, not a
// database concept. Every suburb slug here must exist in
// db/migrations/0002_seed_suburbs.sql; edit both together when the suburb
// list changes.

export interface AreaGroup {
  slug: string;
  name: string;
  suburbSlugs: string[];
}

export const AREA_GROUPS: AreaGroup[] = [
  {
    slug: 'polokwane-central',
    name: 'Polokwane Central & CBD',
    suburbSlugs: ['polokwane-central', 'hospark', 'moregloed', 'superbia'],
  },
  {
    slug: 'polokwane-east',
    name: 'Polokwane East',
    suburbSlugs: ['bendor', 'bendor-park', 'sterpark', 'ivy-park', 'serala-view', 'thornhill-estate', 'broadlands'],
  },
  {
    slug: 'polokwane-south',
    name: 'Polokwane South',
    suburbSlugs: ['flora-park', 'fauna-park', 'penina-park', 'southern-gateway', 'eduan-park', 'dalmada', 'annadale', 'extension-71', 'extension-76'],
  },
  {
    slug: 'polokwane-west',
    name: 'Polokwane West & Industrial',
    suburbSlugs: ['welgelegen', 'westenburg', 'nirvana', 'ladanna', 'capricorn'],
  },
  { slug: 'seshego', name: 'Seshego', suburbSlugs: ['seshego', 'seshego-zone-1', 'seshego-zone-4'] },
  { slug: 'mankweng', name: 'Mankweng', suburbSlugs: ['mankweng'] },
  { slug: 'greater-capricorn', name: 'Greater Capricorn', suburbSlugs: ['lebowakgomo'] },
];

export function groupForSuburb(suburbSlug: string): AreaGroup | undefined {
  return AREA_GROUPS.find((g) => g.suburbSlugs.includes(suburbSlug));
}

// Matches this site's Suburb.region values (see db/migrations/<site>/0002_seed_suburbs.sql) — used
// for display text (e.g. image alt) where the raw region slug isn't presentable on its own.
const REGION_LABELS: Record<string, string> = {
  polokwane: 'Polokwane',
  seshego: 'Seshego',
  'limpopo-other': 'Limpopo',
};

export function regionLabel(region: string): string {
  return REGION_LABELS[region] ?? region;
}
