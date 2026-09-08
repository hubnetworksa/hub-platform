// Two-tier area structure for suburbs — mirrors src/lib/categoryGroups.ts's
// pattern exactly: a fixed, hand-authored grouping used for browsing, not a
// database concept. Empty until Cape Town's suburbs are seeded and grouped
// (see db/migrations/capetown/0002_seed_suburbs.sql, not yet written) — the
// /suburb/ index just shows an empty state until then, nothing crashes.

export interface AreaGroup {
  slug: string;
  name: string;
  suburbSlugs: string[];
}

export const AREA_GROUPS: AreaGroup[] = [];

export function groupForSuburb(suburbSlug: string): AreaGroup | undefined {
  return AREA_GROUPS.find((g) => g.suburbSlugs.includes(suburbSlug));
}

// Matches this site's Suburb.region values (see db/migrations/<site>/0002_seed_suburbs.sql) — used
// for display text (e.g. image alt) where the raw region slug isn't presentable on its own.
const REGION_LABELS: Record<string, string> = {
  capetown: 'Cape Town',
};

export function regionLabel(region: string): string {
  return REGION_LABELS[region] ?? region;
}
