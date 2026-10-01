// Real suburb outlines for the interactive map, keyed by suburb slug. Fetched
// from the municipalities' own open map services by
// scripts/fetch-official-boundaries.mjs (Cape Town, Pretoria) and
// scripts/fetch-suburb-boundaries.mjs (OpenStreetMap, for the gaps), and saved
// per city in src/site-content/<city>/suburb-boundaries.json.
import site from '../site';

export interface OutlineGeometry {
  type: 'Polygon' | 'MultiPolygon';
  coordinates: unknown;
}

const all = import.meta.glob('../site-content/*/suburb-boundaries.json', { eager: true, import: 'default' }) as Record<string, Record<string, OutlineGeometry>>;

export const suburbBoundaries: Record<string, OutlineGeometry> = all[`../site-content/${site.slug}/suburb-boundaries.json`] ?? {};
