import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { hubSites, json, rows, count, type Env } from '../_lib/sites';
import { jsonBody } from '../_lib/body';
import { logActivity } from '../_lib/alerts';
import { getGsvConfig, setGsvConfig, getGsvQuota, claimUrl, checkOne, reasonLabel, type GsvCheckRow, type GsvConfig } from '../_lib/gsv';

// Google Visibility screen API (session-gated like every other admin-app
// handler — not in _middleware.ts's PUBLIC_API list). One file, query-param
// branching on GET since there's no /api/gsv/<sub> route file:
//   GET /api/gsv?summary=1                       -> KPI totals, last run, quota, config
//   GET /api/gsv?bySite=1                          -> per-site status totals + not_indexed reason breakdown
//   GET /api/gsv?history=<id>                     -> recent gsv_checks for one URL
//   GET /api/gsv?trend=1&site=&from=&to=           -> gsv_daily rows for the chart
//   GET /api/gsv?site=&status=&q=&sort=&page=      -> the URLs table (default mode)
//   POST { action: 'check', id }                   -> immediate live inspection
//   POST { action: 'recheck', ids: [...] }         -> up to 25 ids per call
//   POST { action: 'pause' | 'resume' }            -> gsv_config.enabled
//   POST { action: 'set-config', batchSizePerSite?, intervalHours? }
// The single-URL-check logic (claim + Inspection call + write) lives in
// _lib/gsv.ts's checkOne, shared with the batch worker at api/gsv/run.ts.

const SITES = ['pretoria', 'polokwane', 'capetown'];
const PER_PAGE = 20;

interface UrlRow {
  id: number;
  site: string;
  slug: string;
  name: string;
  url: string;
  status: string;
  coverage_state: string | null;
  last_attempt_at: string | null;
  last_success_at: string | null;
  consecutive_not_indexed: number;
  total_indexed_checks: number;
  total_not_indexed_checks: number;
}

function toApiRow(r: UrlRow) {
  return {
    id: r.id,
    site: r.site,
    name: r.name,
    slug: r.slug,
    url: r.url,
    status: r.status,
    coverageState: r.coverage_state,
    lastAttemptAt: r.last_attempt_at,
    lastSuccessAt: r.last_success_at,
    consecutiveNotIndexed: r.consecutive_not_indexed,
    totalIndexed: r.total_indexed_checks,
    totalNotIndexed: r.total_not_indexed_checks,
  };
}

const SORT_COLUMNS: Record<string, string> = {
  name: 'name',
  status: 'status',
  lastAttemptAt: 'last_attempt_at',
  lastSuccessAt: 'last_success_at',
  consecutiveNotIndexed: 'consecutive_not_indexed',
};

function sortClause(sort: string | null): string {
  const raw = sort ?? '-lastAttemptAt';
  const desc = raw.startsWith('-');
  const col = SORT_COLUMNS[desc ? raw.slice(1) : raw];
  return col ? `ORDER BY ${col} ${desc ? 'DESC' : 'ASC'}` : `ORDER BY last_attempt_at DESC`;
}

function buildWhere(q: URLSearchParams): { clause: string; params: unknown[] } {
  const clauses: string[] = [];
  const params: unknown[] = [];
  const site = q.get('site');
  if (site && site !== 'all') {
    clauses.push('site = ?');
    params.push(site);
  }
  const status = q.get('status');
  if (status && ['pending', 'indexed', 'not_indexed', 'unknown'].includes(status)) {
    clauses.push('status = ?');
    params.push(status);
  }
  const search = q.get('q');
  if (search) {
    const like = `%${search.replace(/[%_]/g, '')}%`;
    clauses.push('(name LIKE ? OR url LIKE ?)');
    params.push(like, like);
  }
  return { clause: clauses.length ? `WHERE ${clauses.join(' AND ')}` : '', params };
}

async function listMode(db: D1Database, q: URLSearchParams): Promise<Response> {
  const { clause, params } = buildWhere(q);
  const page = Math.max(1, Number.parseInt(q.get('page') ?? '1', 10) || 1);
  const total = await count(db, `SELECT COUNT(*) FROM gsv_urls ${clause}`, ...params);
  const order = sortClause(q.get('sort'));
  const rowsOut = await rows<UrlRow>(db, `SELECT * FROM gsv_urls ${clause} ${order} LIMIT ? OFFSET ?`, ...params, PER_PAGE, (page - 1) * PER_PAGE);
  return json({ ok: true, total, rows: rowsOut.map(toApiRow) });
}

async function summaryMode(db: D1Database): Promise<Response> {
  const counts = await rows<{ status: string; n: number }>(db, `SELECT status, COUNT(*) n FROM gsv_urls GROUP BY status`);
  const by: Record<string, number> = { pending: 0, indexed: 0, not_indexed: 0, unknown: 0 };
  for (const r of counts) by[r.status] = r.n;
  const base = by.indexed + by.not_indexed;
  const pctIndexed = base > 0 ? Math.round((by.indexed / base) * 1000) / 10 : 0;
  const checked24h = await count(db, `SELECT COUNT(*) FROM gsv_checks WHERE checked_at >= datetime('now', '-1 day')`);
  const lastRunRow = await db.prepare(`SELECT MAX(last_attempt_at) t FROM gsv_urls`).first<{ t: string | null }>();
  const config = await getGsvConfig(db);
  const today = new Date().toISOString().slice(0, 10);
  const quota: Record<string, number> = {};
  for (const slug of SITES) quota[slug] = await getGsvQuota(db, slug, today);
  return json({
    ok: true,
    indexed: by.indexed,
    notIndexed: by.not_indexed,
    pending: by.pending,
    unknown: by.unknown,
    pctIndexed,
    checked24h,
    lastRun: lastRunRow?.t ?? null,
    quota,
    config,
  });
}

function titleCase(slug: string): string {
  return slug.replace(/(^|-)([a-z])/g, (_m, sep, c) => (sep ? ' ' : '') + c.toUpperCase());
}

async function bySiteMode(env: Env, db: D1Database): Promise<Response> {
  const names = new Map(hubSites(env).map((s) => [s.slug, s.name]));
  const sites = [] as Array<{
    slug: string;
    name: string;
    indexed: number;
    notIndexed: number;
    pending: number;
    unknown: number;
    pctIndexed: number;
    reasons: { coverageState: string; label: string; count: number }[];
  }>;
  for (const slug of SITES) {
    const counts = await rows<{ status: string; n: number }>(db, `SELECT status, COUNT(*) n FROM gsv_urls WHERE site = ? GROUP BY status`, slug);
    const by: Record<string, number> = { pending: 0, indexed: 0, not_indexed: 0, unknown: 0 };
    for (const r of counts) by[r.status] = r.n;
    const base = by.indexed + by.not_indexed;
    const pctIndexed = base > 0 ? Math.round((by.indexed / base) * 1000) / 10 : 0;
    const reasonRows = await rows<{ coverage_state: string | null; n: number }>(
      db,
      `SELECT coverage_state, COUNT(*) n FROM gsv_urls WHERE site = ? AND status = 'not_indexed' GROUP BY coverage_state ORDER BY n DESC LIMIT 12`,
      slug
    );
    sites.push({
      slug,
      name: names.get(slug) ?? titleCase(slug),
      indexed: by.indexed,
      notIndexed: by.not_indexed,
      pending: by.pending,
      unknown: by.unknown,
      pctIndexed,
      reasons: reasonRows.map((r) => ({ coverageState: r.coverage_state ?? '', label: reasonLabel(r.coverage_state), count: r.n })),
    });
  }
  return json({ ok: true, sites });
}

async function historyMode(db: D1Database, idRaw: string | null): Promise<Response> {
  const id = Number.parseInt(idRaw ?? '', 10);
  if (!Number.isInteger(id) || id <= 0) return json({ ok: false, error: 'Invalid id.' }, 400);
  const rowsOut = await rows<{ id: number; checked_at: string; status: string; coverage_state: string | null; duration_ms: number | null; error: string | null }>(
    db,
    `SELECT id, checked_at, status, coverage_state, duration_ms, error FROM gsv_checks WHERE gsv_url_id = ? ORDER BY checked_at DESC LIMIT 50`,
    id
  );
  return json({ ok: true, rows: rowsOut.map((r) => ({ id: r.id, checkedAt: r.checked_at, status: r.status, coverageState: r.coverage_state, durationMs: r.duration_ms, error: r.error })) });
}

async function trendMode(db: D1Database, q: URLSearchParams): Promise<Response> {
  const site = q.get('site');
  const from = q.get('from') || new Date(Date.now() - 30 * 86_400_000).toISOString().slice(0, 10);
  const to = q.get('to') || new Date().toISOString().slice(0, 10);
  const clauses = ['day >= ?', 'day <= ?'];
  const params: unknown[] = [from, to];
  if (site && site !== 'all') {
    clauses.push('site = ?');
    params.push(site);
  }
  const rowsOut = await rows<{ day: string; site: string; indexed: number; not_indexed: number; unknown: number; pending: number; checked: number }>(
    db,
    `SELECT * FROM gsv_daily WHERE ${clauses.join(' AND ')} ORDER BY day ASC`,
    ...params
  );
  return json({ ok: true, rows: rowsOut.map((r) => ({ day: r.day, site: r.site, indexed: r.indexed, notIndexed: r.not_indexed, unknown: r.unknown, pending: r.pending, checked: r.checked })) });
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  const q = new URL(context.request.url).searchParams;
  if (q.get('summary') === '1') return summaryMode(db);
  if (q.get('bySite') === '1') return bySiteMode(context.env, db);
  if (q.has('history')) return historyMode(db, q.get('history'));
  if (q.get('trend') === '1') return trendMode(db, q);
  return listMode(db, q);
};

async function doCheck(env: Env, actor: string, body: Record<string, unknown>): Promise<Response> {
  const id = Number(body.id);
  if (!Number.isInteger(id) || id <= 0) return json({ ok: false, error: 'Invalid id.' }, 400);
  const db = env.ADMIN_DB;
  const row = await db
    .prepare(`SELECT id, site, url, consecutive_not_indexed, total_indexed_checks, total_not_indexed_checks FROM gsv_urls WHERE id = ?`)
    .bind(id)
    .first<GsvCheckRow>();
  if (!row) return json({ ok: false, error: 'Not found.' }, 404);
  const site = hubSites(env).find((s) => s.slug === row.site);
  if (!site) return json({ ok: false, error: 'Unknown site.' }, 400);
  if (!(await claimUrl(db, id))) return json({ ok: false, error: 'A check for this URL is already in progress.' }, 409);
  const outcome = await checkOne(env, db, row, `sc-domain:${site.domain}`);
  await logActivity(db, actor, site.slug, 'gsv_check', row.url, outcome.status);
  const updated = await db.prepare(`SELECT * FROM gsv_urls WHERE id = ?`).bind(id).first<UrlRow>();
  return json({ ok: true, row: updated ? toApiRow(updated) : null });
}

async function doRecheck(env: Env, actor: string, body: Record<string, unknown>): Promise<Response> {
  const ids = Array.isArray(body.ids) ? [...new Set(body.ids.filter((x): x is number => Number.isInteger(x) && x > 0))] : [];
  if (!ids.length) return json({ ok: false, error: 'No ids given.' }, 400);
  if (ids.length > 25) return json({ ok: false, error: 'At most 25 at a time.' }, 400);
  const db = env.ADMIN_DB;
  const sites = hubSites(env);
  const done: number[] = [];
  const failed: { id: number; error: string }[] = [];
  for (const id of ids) {
    const row = await db
      .prepare(`SELECT id, site, url, consecutive_not_indexed, total_indexed_checks, total_not_indexed_checks FROM gsv_urls WHERE id = ?`)
      .bind(id)
      .first<GsvCheckRow>();
    if (!row) {
      failed.push({ id, error: 'Not found.' });
      continue;
    }
    const site = sites.find((s) => s.slug === row.site);
    if (!site) {
      failed.push({ id, error: 'Unknown site.' });
      continue;
    }
    if (!(await claimUrl(db, id))) {
      failed.push({ id, error: 'Already in progress.' });
      continue;
    }
    await checkOne(env, db, row, `sc-domain:${site.domain}`);
    done.push(id);
  }
  if (done.length) await logActivity(db, actor, null, 'gsv_recheck', `${done.length} URL(s)`);
  return json({ ok: failed.length === 0, done, failed });
}

async function doSetConfig(env: Env, actor: string, body: Record<string, unknown>): Promise<Response> {
  const db = env.ADMIN_DB;
  const patch: Partial<GsvConfig> = {};
  if (typeof body.enabled === 'boolean') patch.enabled = body.enabled;
  if (body.batchSizePerSite !== undefined) {
    const n = Number(body.batchSizePerSite);
    if (!Number.isInteger(n) || n < 1 || n > 500) return json({ ok: false, error: 'batchSizePerSite must be between 1 and 500.' }, 400);
    patch.batchSizePerSite = n;
  }
  if (body.intervalHours !== undefined) {
    const n = Number(body.intervalHours);
    if (!Number.isInteger(n) || n < 1 || n > 24) return json({ ok: false, error: 'intervalHours must be between 1 and 24.' }, 400);
    patch.intervalHours = n;
  }
  const next = await setGsvConfig(db, patch);
  await logActivity(db, actor, null, 'gsv_config_set', JSON.stringify(next));
  return json({ ok: true, config: next });
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const actor = String(context.data.email);
  const body = await jsonBody(context.request);
  if (!body || typeof body.action !== 'string') return json({ ok: false, error: 'Invalid request.' }, 400);
  switch (body.action) {
    case 'check':
      return doCheck(env, actor, body);
    case 'recheck':
      return doRecheck(env, actor, body);
    case 'pause':
      return doSetConfig(env, actor, { enabled: false });
    case 'resume':
      return doSetConfig(env, actor, { enabled: true });
    case 'set-config':
      return doSetConfig(env, actor, body);
    default:
      return json({ ok: false, error: 'Unknown action.' }, 400);
  }
};
