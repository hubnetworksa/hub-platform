import type { D1Database } from '@cloudflare/workers-types';
import pretoria from '../../../sites/pretoria.json';
import polokwane from '../../../sites/polokwane.json';
import capetown from '../../../sites/capetown.json';

// Every city the admin app manages, in display order. Adding a city:
//   1. add its D1 binding (DB_<SLUG>) to admin-app/wrangler.jsonc
//   2. import its sites/<slug>.json above and add a row here
// The order is also the chart colour order (series slot 1, 2, 3, ...), so a
// city keeps its colour on every chart and filter.
const REGISTRY = [
  { config: pretoria, binding: 'DB_PRETORIA' },
  { config: polokwane, binding: 'DB_POLOKWANE' },
  { config: capetown, binding: 'DB_CAPETOWN' },
] as const;

export interface HubSite {
  slug: string;
  name: string;
  city: string;
  domain: string;
  accent: string;
  db: D1Database;
}

export type Env = Record<string, unknown> & {
  ACCESS_TEAM_DOMAIN?: string;
  ACCESS_AUD?: string;
  ADMIN_EMAILS?: string;
};

/** The managed sites whose database is bound in this deployment. */
export function hubSites(env: Env): HubSite[] {
  return REGISTRY.flatMap(({ config, binding }) => {
    const db = env[binding] as D1Database | undefined;
    if (!db) return [];
    return [{ slug: config.slug, name: config.siteName, city: config.cityLabel, domain: config.domain, accent: config.theme.accent, db }];
  });
}

/** One site by slug, or all of them for "all" / a missing value. */
export function selectSites(env: Env, slug: string | null): HubSite[] {
  const sites = hubSites(env);
  if (!slug || slug === 'all') return sites;
  return sites.filter((s) => s.slug === slug);
}

/** Runs a query and returns its rows, or [] when this site's database
 *  doesn't have the table/column yet (cities can be a migration apart). */
export async function rows<T>(db: D1Database, sql: string, ...binds: unknown[]): Promise<T[]> {
  try {
    const r = await db.prepare(sql).bind(...binds).all<T>();
    return r.results ?? [];
  } catch {
    return [];
  }
}

/** First column of the first row as a number, 0 when missing. */
export async function count(db: D1Database, sql: string, ...binds: unknown[]): Promise<number> {
  const r = await rows<Record<string, number>>(db, sql, ...binds);
  const first = r[0];
  return first ? Number(Object.values(first)[0]) || 0 : 0;
}

export function json(data: unknown, status = 200, headers: Record<string, string> = {}): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'Content-Type': 'application/json', 'Cache-Control': 'no-store', ...headers },
  });
}
