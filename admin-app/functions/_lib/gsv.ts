import type { D1Database } from '@cloudflare/workers-types';
import { rows, type Env, type HubSite } from './sites';
import { getAccessToken } from './google-token';
import { getSetting, setSetting } from './alerts';

// Shared by admin-app/functions/api/gsv/run.ts (the batch worker) and
// admin-app/functions/api/gsv.ts ("Check now" / "Recheck selected"), so
// there's exactly one place that calls Search Console's URL Inspection API
// and one place that maps its verdict to Hub Admin's status model.

export type GsvStatus = 'pending' | 'indexed' | 'not_indexed' | 'unknown';

export interface GsvConfig {
  enabled: boolean;
  batchSizePerSite: number;
  intervalHours: number;
}

const DEFAULT_CONFIG: GsvConfig = { enabled: true, batchSizePerSite: 50, intervalHours: 3 };

export async function getGsvConfig(db: D1Database): Promise<GsvConfig> {
  const raw = await getSetting(db, 'gsv_config');
  if (!raw) return { ...DEFAULT_CONFIG };
  try {
    const v = JSON.parse(raw) as Partial<GsvConfig>;
    return {
      enabled: typeof v.enabled === 'boolean' ? v.enabled : DEFAULT_CONFIG.enabled,
      batchSizePerSite: Number.isInteger(v.batchSizePerSite) && (v.batchSizePerSite as number) > 0 ? (v.batchSizePerSite as number) : DEFAULT_CONFIG.batchSizePerSite,
      intervalHours: Number.isInteger(v.intervalHours) && (v.intervalHours as number) > 0 ? (v.intervalHours as number) : DEFAULT_CONFIG.intervalHours,
    };
  } catch {
    return { ...DEFAULT_CONFIG };
  }
}

export async function setGsvConfig(db: D1Database, patch: Partial<GsvConfig>): Promise<GsvConfig> {
  const next = { ...(await getGsvConfig(db)), ...patch };
  await setSetting(db, 'gsv_config', JSON.stringify(next));
  return next;
}

/** Today's (or any day's) Inspection-API call count for a site, kept in `settings`. */
export async function getGsvQuota(db: D1Database, site: string, day: string): Promise<number> {
  return Number((await getSetting(db, `gsv_quota:${site}:${day}`)) ?? '0') || 0;
}

export async function bumpGsvQuota(db: D1Database, site: string, day: string, n: number): Promise<void> {
  if (!n) return;
  const key = `gsv_quota:${site}:${day}`;
  const current = Number((await getSetting(db, key)) ?? '0') || 0;
  await setSetting(db, key, String(current + n));
}

// ── Inspection call & status mapping ──

export interface InspectionOutcome {
  status: GsvStatus;
  coverageState: string | null;
  quotaOrRate: boolean;
  errorMessage: string | null;
}

/**
 * Maps a raw Search Console URL Inspection response (or its error shape) to
 * Hub Admin's status model:
 *   - verdict === 'PASS'            -> indexed
 *   - any other valid verdict       -> not_indexed (coverageState carries the reason)
 *   - API error / unparseable shape -> unknown
 * Exported standalone (no network call) so it's easy to sanity-check against
 * sample Google responses.
 */
export function mapInspectionResponse(r: unknown): InspectionOutcome {
  const obj = r as { error?: { message?: unknown }; inspectionResult?: { indexStatusResult?: { verdict?: unknown; coverageState?: unknown } } } | null | undefined;
  if (obj?.error) {
    const message = typeof obj.error.message === 'string' ? obj.error.message : 'Inspection API error.';
    return { status: 'unknown', coverageState: null, quotaOrRate: /quota|rate/i.test(message), errorMessage: message };
  }
  const st = obj?.inspectionResult?.indexStatusResult;
  if (!st || typeof st !== 'object') {
    return { status: 'unknown', coverageState: null, quotaOrRate: false, errorMessage: 'No indexStatusResult in response.' };
  }
  const coverageState = typeof st.coverageState === 'string' ? st.coverageState : null;
  const status: GsvStatus = st.verdict === 'PASS' ? 'indexed' : 'not_indexed';
  return { status, coverageState, quotaOrRate: false, errorMessage: null };
}

// ── Coverage-state reasons, plain-language ──
// Google's own documented coverage states for the URL Inspection API
// (indexStatusResult.coverageState), lowercase-trimmed keys so lookup is
// case/whitespace-insensitive. Used by the "By site" tab's reason breakdown
// to explain *why* a page is not_indexed without making the owner read
// Google's jargon.
export const COVERAGE_REASON_LABELS: Record<string, string> = {
  'url is unknown to google': 'Google has never seen this page.',
  'discovered - currently not indexed': "Google found the link but hasn't crawled it yet — usually a crawl-priority issue.",
  'crawled - currently not indexed': 'Google crawled it but chose not to index it — usually a content-quality decision.',
  "excluded by 'noindex' tag": 'The page itself tells Google not to index it.',
  'page with redirect': 'This URL redirects elsewhere, so Google indexes the destination instead.',
  'duplicate, submitted url not selected as canonical': 'Google treats this as a duplicate of another page and indexed that one instead.',
  'duplicate without user-selected canonical': 'Google sees this as a duplicate and picked a different canonical page.',
  'soft 404': 'Google thinks this page looks empty or like an error page.',
  'not found (404)': 'The page returned a real 404 when Google tried to crawl it.',
  'blocked by robots.txt': 'robots.txt tells Google not to crawl this page.',
  'blocked due to unauthorized request (401)': 'The page asked for a login or returned a 401, so Google could not read it.',
  'blocked due to access forbidden (403)': 'The server returned a 403 and refused Google access to this page.',
  'server error (5xx)': "The server was erroring when Google tried to crawl it — Google will retry, but it hasn't indexed it yet.",
  'redirect error': "The page's redirect was broken or looped, so Google couldn't follow it to a final destination.",
  'blocked by page removal tool': "Someone used Search Console's removal tool to temporarily hide this page from results.",
  "excluded by 'unavailable_after' tag": "The page set an expiry date telling Google to stop showing it, and that date has passed.",
  'not found (404) and other 4xx/5xx': 'The page returned an error when Google tried to crawl it.',
};

/**
 * Plain-language explanation for a raw coverage_state string (case/whitespace
 * insensitive). Falls back to the raw string when it's not a state we've
 * mapped, and to a fixed message when there's no coverage_state at all
 * (indexed/pending/unknown rows, or a not_indexed row from before this map
 * covered that state).
 */
export function reasonLabel(coverageState: string | null): string {
  if (!coverageState || !coverageState.trim()) return 'No reason recorded';
  const key = coverageState.trim().toLowerCase();
  return COVERAGE_REASON_LABELS[key] ?? coverageState;
}

const sleep = (ms: number) => new Promise((r) => setTimeout(r, ms));

const INSPECT_TIMEOUT_MS = 12_000;
// One retry only, short fixed delay — unlike scripts/search-console-daily.mjs's
// patient exponential backoff (fine in a leisurely GitHub Actions job), this
// runs inside a request /api/gsv/run must keep small and predictable; a slow
// URL should fall back to 'unknown' quickly, not spend a minute retrying,
// since the outer per-call budget (MAX_CHECKS_PER_CALL in run.ts) and the
// trigger script's own retry-by-looping already cover it on the next call.
const MAX_ATTEMPTS = 2;
const RETRY_DELAY_MS = 1500;

/**
 * POST with a hard per-attempt timeout (Cloudflare Pages Functions cannot
 * afford an indefinitely-hanging subrequest — a single stuck fetch here would
 * otherwise wedge the whole /api/gsv/run invocation past what the trigger
 * script and the platform can tolerate).
 */
async function inspect(token: string, url: string, siteUrl: string): Promise<unknown> {
  for (let attempt = 1; ; attempt++) {
    const controller = new AbortController();
    const timer = setTimeout(() => controller.abort(), INSPECT_TIMEOUT_MS);
    let res: Response;
    try {
      res = await fetch('https://searchconsole.googleapis.com/v1/urlInspection/index:inspect', {
        method: 'POST',
        headers: { Authorization: `Bearer ${token}`, 'Content-Type': 'application/json' },
        body: JSON.stringify({ inspectionUrl: url, siteUrl, languageCode: 'en-US' }),
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

/** One live Inspection API call for one URL. Never throws: failures map to 'unknown'. */
export async function inspectUrl(env: Env, url: string, siteUrl: string): Promise<InspectionOutcome & { durationMs: number }> {
  const start = Date.now();
  try {
    const token = await getAccessToken(env);
    const r = await inspect(token, url, siteUrl);
    return { ...mapInspectionResponse(r), durationMs: Date.now() - start };
  } catch (e) {
    return { status: 'unknown', coverageState: null, quotaOrRate: false, errorMessage: e instanceof Error ? e.message : String(e), durationMs: Date.now() - start };
  }
}

// ── Claim / check / rollup, shared between the batch worker and the admin API ──

export interface GsvCheckRow {
  id: number;
  site: string;
  url: string;
  consecutive_not_indexed: number;
  total_indexed_checks: number;
  total_not_indexed_checks: number;
}

/** Takes the in-flight claim on one URL (stale claims older than 10 minutes are retaken). */
export async function claimUrl(db: D1Database, id: number): Promise<boolean> {
  const r = await db
    .prepare(`UPDATE gsv_urls SET claimed_at = datetime('now') WHERE id = ? AND (claimed_at IS NULL OR claimed_at < datetime('now', '-10 minutes'))`)
    .bind(id)
    .run();
  return !!r.meta.changes;
}

/**
 * Inspects one URL live, writes a gsv_checks row and updates the gsv_urls
 * row (status, coverage_state, last_attempt_at always; last_success_at only
 * when the Inspection call itself succeeded — i.e. status isn't 'unknown';
 * consecutive_not_indexed / total_*_checks; clears claimed_at). Caller is
 * responsible for claimUrl() first.
 */
export async function checkOne(env: Env, db: D1Database, row: GsvCheckRow, siteUrl: string): Promise<InspectionOutcome & { durationMs: number }> {
  const outcome = await inspectUrl(env, row.url, siteUrl);
  await db
    .prepare(`INSERT INTO gsv_checks (gsv_url_id, status, coverage_state, duration_ms, error) VALUES (?, ?, ?, ?, ?)`)
    .bind(row.id, outcome.status, outcome.coverageState, outcome.durationMs, outcome.errorMessage)
    .run();
  const succeeded = outcome.status !== 'unknown';
  const consecutiveNotIndexed = outcome.status === 'not_indexed' ? row.consecutive_not_indexed + 1 : outcome.status === 'indexed' ? 0 : row.consecutive_not_indexed;
  const totalIndexed = row.total_indexed_checks + (outcome.status === 'indexed' ? 1 : 0);
  const totalNotIndexed = row.total_not_indexed_checks + (outcome.status === 'not_indexed' ? 1 : 0);
  await db
    .prepare(
      `UPDATE gsv_urls SET status = ?, coverage_state = ?, last_attempt_at = datetime('now'),
         last_success_at = CASE WHEN ? THEN datetime('now') ELSE last_success_at END,
         consecutive_not_indexed = ?, total_indexed_checks = ?, total_not_indexed_checks = ?,
         claimed_at = NULL, updated_at = datetime('now')
       WHERE id = ?`
    )
    .bind(outcome.status, outcome.coverageState, succeeded ? 1 : 0, consecutiveNotIndexed, totalIndexed, totalNotIndexed, row.id)
    .run();
  return outcome;
}

/** Discovers newly published business URLs and inserts them as 'pending' (existing rows untouched). */
export async function discoverUrls(adminDb: D1Database, site: HubSite): Promise<number> {
  const bizRows = await rows<{ id: number; slug: string; name: string }>(
    site.db,
    `SELECT id, slug, name FROM businesses WHERE status = 'published' AND closed_at IS NULL AND is_test = 0`
  );
  let inserted = 0;
  // D1 caps bound parameters at 100 per query; 5 columns per row means at
  // most 20 rows fit, so 18 leaves headroom.
  const CHUNK = 18;
  for (let i = 0; i < bizRows.length; i += CHUNK) {
    const chunk = bizRows.slice(i, i + CHUNK);
    const placeholders = chunk.map(() => '(?, ?, ?, ?, ?)').join(', ');
    const binds: unknown[] = [];
    for (const b of chunk) binds.push(site.slug, b.id, b.slug, b.name, `https://${site.domain}/business/${b.slug}/`);
    const r = await adminDb.prepare(`INSERT OR IGNORE INTO gsv_urls (site, business_id, slug, name, url) VALUES ${placeholders}`).bind(...binds).run();
    inserted += r.meta.changes ?? 0;
  }
  return inserted;
}

/** Upserts today's gsv_daily rollup (counts by status, checked in the last 24h) for one site. */
export async function upsertGsvDaily(db: D1Database, site: HubSite, day: string): Promise<void> {
  const counts = await rows<{ status: string; n: number }>(db, `SELECT status, COUNT(*) n FROM gsv_urls WHERE site = ? GROUP BY status`, site.slug);
  const by: Record<string, number> = { pending: 0, indexed: 0, not_indexed: 0, unknown: 0 };
  for (const r of counts) by[r.status] = r.n;
  const checkedRow = await db
    .prepare(`SELECT COUNT(*) n FROM gsv_checks c JOIN gsv_urls u ON u.id = c.gsv_url_id WHERE u.site = ? AND c.checked_at >= datetime('now', '-1 day')`)
    .bind(site.slug)
    .first<{ n: number }>();
  await db
    .prepare(
      `INSERT INTO gsv_daily (day, site, indexed, not_indexed, unknown, pending, checked) VALUES (?, ?, ?, ?, ?, ?, ?)
       ON CONFLICT(day, site) DO UPDATE SET indexed = excluded.indexed, not_indexed = excluded.not_indexed, unknown = excluded.unknown, pending = excluded.pending, checked = excluded.checked`
    )
    .bind(day, site.slug, by.indexed, by.not_indexed, by.unknown, by.pending, checkedRow?.n ?? 0)
    .run();
}

/** Deletes gsv_checks rows older than 180 days. Returns how many were removed. */
export async function pruneGsvChecks(db: D1Database): Promise<number> {
  const r = await db.prepare(`DELETE FROM gsv_checks WHERE checked_at < datetime('now', '-180 days')`).run();
  return r.meta.changes ?? 0;
}
