// Resolves the per-site area-grouping module (src/site-content/<slug>/areaGroups.ts)
// for whichever SITE this build/dev/functions run is for. Plain static imports
// (not a dynamic import(`./${slug}/...`)) so Vite can bundle all three without
// any build-time path magic — each is tiny, so bundling all of them costs nothing.
import site from '../site';
import * as polokwane from './polokwane/areaGroups';
import * as pretoria from './pretoria/areaGroups';
import * as capetown from './capetown/areaGroups';

export type { AreaGroup } from './polokwane/areaGroups';

const AREA_MODULES = { polokwane, pretoria, capetown };

const mod = AREA_MODULES[site.slug as keyof typeof AREA_MODULES];
if (!mod) {
  throw new Error(`No src/site-content/${site.slug}/areaGroups.ts for site "${site.slug}"`);
}

export const AREA_GROUPS = mod.AREA_GROUPS;
export const groupForSuburb = mod.groupForSuburb;
export const regionLabel = mod.regionLabel;
