import type { D1Database } from '@cloudflare/workers-types';
import { rows, type Env, type HubSite } from './sites';
import { getAccessToken } from './google-token';
import { getSetting, setSetting } from './alerts';

// Shared by admin-app/functions/api/name-position/run.ts (the batch worker)
// and admin-app/functions/api/name-position.ts (the admin screen), so
// there's exactly one place that calls Search Console's Performance API
// (searchAnalytics.query) filtered to a business's exact name and one place
// that writes the result. See admin-app/migrations/0011_name_position.sql
// for why this exists: Google's own "average position" KPI is blended
// across every query that ever found the page, which can say "position 3"
// while a search for the business's own name finds nothing. This is the
// honest, free alternative — Google's own recorded reading for that exact
// query string — not a live SERP check (ruled out; see _lib/gsv.ts's header).

export interface NamePositionConfig {
  enabled: boolean;
  batchSizePerSite: number;
  intervalHours: number;
}

// This API's quota is a "load" cost (per Google's Search Console docs), not
// a clean daily count like URL Inspection's 2,000/day, so the real safe
// throughput isn't known yet — default conservatively and let the admin UI
// raise it later without a redeploy, same as GSV's own config.
const DEFAULT_CONFIG: NamePositionConfig = { enabled: true, batchSizePerSite: 300, intervalHours: 3 };

export async function getNamePositionConfig(db: D1Database): Promise<NamePositionConfig> {
  const raw = await getSetting(db, 'name_position_config');
  if (!raw) return { ...DEFAULT_CONFIG };
  try {
    const v = JSON.parse(raw) as Partial<NamePositionConfig>;
    return {
      enabled: typeof v.enabled === 'boolean' ? v.enabled : DEFAULT_CONFIG.enabled,
      batchSizePerSite: Number.isInteger(v.batchSizePerSite) && (v.batchSizePerSite as number) > 0 ? (v.batchSizePerSite as number) : DEFAULT_CONFIG.batchSizePerSite,
      intervalHours: Number.isInteger(v.intervalHours) && (v.intervalHours as number) > 0 ? (v.intervalHours as number) : DEFAULT_CONFIG.intervalHours,
    };
  } catch {
    return { ...DEFAULT_CONFIG };
  }
}

export async function setNamePositionConfig(db: D1Database, patch: Partial<NamePositionConfig>): Promise<NamePositionConfig> {
  const next = { ...(await getNamePositionConfig(db)), ...patch };
  await setSetting(db, 'name_position_config', JSON.stringify(next));
  return next;
}

/** Today's (or any day's) Performance-API call count for a site, kept in `settings`. */
export async function getNamePositionQuota(db: D1Database, site: string, day: string): Promise<number> {
  return Number((await getSetting(db, `name_position_quota:${site}:${day}`)) ?? '0') || 0;
}

export async function bumpNamePositionQuota(db: D1Database, site: string, day: string, n: number): Promise<void> {
  if (!n) return;
  const key = `name_position_quota:${site}:${day}`;
  const current = Number((await getSetting(db, key)) ?? '0') || 0;
  await setSetting(db, key, String(current + n));
}

// ── Performance API call & response mapping ──

export interface NamePositionOutcome {
  position: number | null;
  impressions: number | null;
  clicks: number | null;
  lastImpressionDate: string | null;
  quotaOrRate: boolean;
  errorMessage: string | null;
}

/**
 * Maps a raw searchAnalytics.query response (or its error shape) to a
 * reading. The query now asks for one row per day (`dimensions: ['date']`,
 * see queryPerformance), so this aggregates across rows instead of reading
 * one: rows with real impressions -> summed impressions/clicks, the
 * impressions-weighted average position (the same math Google's own
 * aggregate "position" already uses internally, so this reproduces what the
 * old single-row call returned), and the most recent date among them; no
 * rows, OR every row has zero impressions (confirmed in production: a
 * non-matching dimensionFilterGroups filter still comes back as one
 * degenerate `{impressions:0, clicks:0, position:0}` row per day rather than
 * an absent row) -> position null, impressions/clicks 0, lastImpressionDate
 * null, NOT an error, since "no recorded searches for this exact name" is
 * itself meaningful and a literal position of 0 would be nonsensical (a page
 * can't rank "0th"); an API error -> null fields with errorMessage set so
 * the caller can tell the two apart (see checkOnePosition).
 */
export function mapPerformanceResponse(r: unknown): NamePositionOutcome {
  const obj = r as {
    error?: { message?: unknown };
    rows?: Array<{ keys?: unknown; position?: unknown; impressions?: unknown; clicks?: unknown }>;
  } | null | undefined;
  if (obj?.error) {
    const message = typeof obj.error.message === 'string' ? obj.error.message : 'Performance API error.';
    return { position: null, impressions: null, clicks: null, lastImpressionDate: null, quotaOrRate: /quota|rate/i.test(message), errorMessage: message };
  }
  const noData = { position: null, impressions: 0, clicks: 0, lastImpressionDate: null, quotaOrRate: false, errorMessage: null };
  const rowsIn = obj?.rows ?? [];
  const withData = rowsIn.filter((row) => (typeof row?.impressions === 'number' ? row.impressions : 0) > 0);
  if (!withData.length) return noData;
  let impressions = 0;
  let clicks = 0;
  let weightedPosition = 0;
  let lastImpressionDate: string | null = null;
  for (const row of withData) {
    const rowImpressions = row.impressions as number;
    impressions += rowImpressions;
    clicks += typeof row.clicks === 'number' ? row.clicks : 0;
    if (typeof row.position === 'number') weightedPosition += row.position * rowImpressions;
    const date = Array.isArray(row.keys) ? row.keys[0] : undefined;
    if (typeof date === 'string' && (lastImpressionDate === null || date > lastImpressionDate)) lastImpressionDate = date;
  }
  return {
    position: impressions > 0 ? weightedPosition / impressions : null,
    impressions,
    clicks,
    lastImpressionDate,
    quotaOrRate: false,
    errorMessage: null,
  };
}

const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));

const QUERY_TIMEOUT_MS = 12_000;
// Same one-retry, short-fixed-delay shape as _lib/gsv.ts's inspect() and for
// the same reason: this runs inside a request /api/name-position/run must
// keep small and predictable, not scripts/search-console-daily.mjs's
// patient exponential backoff (fine in a leisurely GitHub Actions job).
const MAX_ATTEMPTS = 2;
const RETRY_DELAY_MS = 1500;

/** Yesterday back 28 days — Search Console's data lags a few days, so
 *  "yesterday" may still be thin/absent; that's fine, it's the same window
 *  scripts/search-console-daily.mjs already uses for its own queries. */
function windowDates(): { startDate: string; endDate: string } {
  const day = (offset: number) => new Date(Date.now() - offset * 86_400_000).toISOString().slice(0, 10);
  return { startDate: day(28), endDate: day(1) };
}

/**
 * POST with a hard per-attempt timeout — same reasoning as _lib/gsv.ts's
 * inspect(): Cloudflare Pages Functions cannot afford an indefinitely
 * hanging subrequest.
 */
async function queryPerformance(token: string, siteUrl: string, name: string): Promise<unknown> {
  const { startDate, endDate } = windowDates();
  const body = {
    startDate,
    endDate,
    // dimensions: ['date'] -> one row per day with any data (days with zero
    // impressions for this filtered query are simply absent, not returned as
    // zero-rows), so we can read the last real impression date, not just the
    // 28-day blend. rowLimit 28 covers the whole window with no pagination.
    dimensions: ['date'],
    dimensionFilterGroups: [{ filters: [{ dimension: 'query', operator: 'equals', expression: name }] }],
    rowLimit: 28,
  };
  for (let attempt = 1; ; attempt++) {
    const controller = new AbortController();
    const timer = setTimeout(() => controller.abort(), QUERY_TIMEOUT_MS);
    let res: Response;
    try {
      res = await fetch(`https://www.googleapis.com/webmasters/v3/sites/${encodeURIComponent(siteUrl)}/searchAnalytics/query`, {
        method: 'POST',
        headers: { Authorization: `Bearer ${token}`, 'Content-Type': 'application/json' },
        body: JSON.stringify(body),
        signal: controller.signal,
      });
    } catch (e) {
      clearTimeout(timer);
      if (attempt < MAX_ATTEMPTS) {
        await sleep(RETRY_DELAY_MS);
        continue;
      }
      return { error: { message: e instanceof Error ? `${e.name}: ${e.message}` : String(e) } };
    }
    clearTimeout(timer);
    const j = (await res.json().catch(() => ({ error: { message: `HTTP ${res.status}` } }))) as { error?: { message?: string } };
    if ((res.status === 429 || res.status >= 500) && attempt < MAX_ATTEMPTS) {
      await sleep(RETRY_DELAY_MS);
      continue;
    }
    if (!res.ok) j.error ||= { message: `HTTP ${res.status}` };
    return j;
  }
}

// ── Claim / check, shared between the batch worker and the admin API ──

export interface NamePositionRow {
  id: number;
  site: string;
  business_id: number;
  slug: string;
  name: string;
}

/** Takes the in-flight claim on one row (stale claims older than 10 minutes are retaken). */
export async function claimPositionRow(db: D1Database, id: number): Promise<boolean> {
  const r = await db
    .prepare(`UPDATE name_position SET claimed_at = datetime('now') WHERE id = ? AND (claimed_at IS NULL OR claimed_at < datetime('now', '-10 minutes'))`)
    .bind(id)
    .run();
  return !!r.meta.changes;
}

/**
 * Queries the Performance API for one business's exact name and writes the
 * result. Caller is responsible for claimPositionRow() first. Never throws.
 *
 * On a real failure (timeout/5xx/429/token error — errorMessage set), the
 * previous position/impressions/clicks are left alone: a transient fetch
 * failure must never overwrite a known-good reading with a false "no data"
 * (that would conflate "the API call failed" with "Google has no searches
 * for this name", which position=NULL is reserved for). checked_at still
 * advances so the row isn't stuck at the front of the due queue forever.
 */
export async function checkOnePosition(env: Env, db: D1Database, row: NamePositionRow, siteUrl: string): Promise<NamePositionOutcome> {
  let outcome: NamePositionOutcome;
  try {
    const token = await getAccessToken(env);
    outcome = mapPerformanceResponse(await queryPerformance(token, siteUrl, row.name));
  } catch (e) {
    outcome = { position: null, impressions: null, clicks: null, lastImpressionDate: null, quotaOrRate: false, errorMessage: e instanceof Error ? e.message : String(e) };
  }
  if (outcome.errorMessage) {
    await db
      .prepare(`UPDATE name_position SET checked_at = datetime('now'), claimed_at = NULL, updated_at = datetime('now') WHERE id = ?`)
      .bind(row.id)
      .run();
  } else {
    await db
      .prepare(
        `UPDATE name_position SET position = ?, impressions = ?, clicks = ?, last_impression_date = ?, checked_at = datetime('now'), claimed_at = NULL, updated_at = datetime('now') WHERE id = ?`
      )
      .bind(outcome.position, outcome.impressions, outcome.clicks, outcome.lastImpressionDate, row.id)
      .run();
  }
  return outcome;
}

/** Discovers newly published businesses and inserts them as never-checked rows (existing rows untouched). */
export async function discoverNamePositions(adminDb: D1Database, site: HubSite): Promise<number> {
  const bizRows = await rows<{ id: number; slug: string; name: string }>(
    site.db,
    `SELECT id, slug, name FROM businesses WHERE status = 'published' AND closed_at IS NULL AND is_test = 0`
  );
  let inserted = 0;
  // D1 caps bound parameters at 100 per query; 4 columns per row (site,
  // business_id, slug, name — this table has no url column like gsv_urls
  // does, since the URL is derived from slug+domain at read time) means at
  // most 25 rows fit, so 20 leaves headroom.
  const CHUNK = 20;
  for (let i = 0; i < bizRows.length; i += CHUNK) {
    const chunk = bizRows.slice(i, i + CHUNK);
    const placeholders = chunk.map(() => '(?, ?, ?, ?)').join(', ');
    const binds: unknown[] = [];
    for (const b of chunk) binds.push(site.slug, b.id, b.slug, b.name);
    const r = await adminDb.prepare(`INSERT OR IGNORE INTO name_position (site, business_id, slug, name) VALUES ${placeholders}`).bind(...binds).run();
    inserted += r.meta.changes ?? 0;
  }
  return inserted;
}
