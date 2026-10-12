import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { hubSites, json, rows, count, type Env } from '../_lib/sites';
import { jsonBody } from '../_lib/body';
import { logActivity } from '../_lib/alerts';
import { getNamePositionConfig, setNamePositionConfig, type NamePositionConfig } from '../_lib/name-position';

// "Name position" screen API — Google's own recorded position for a search
// of each business's exact NAME (see admin-app/migrations/0011_name_position.sql
// and _lib/name-position.ts for why). Session-gated like every other
// admin-app handler EXCEPT its /run sibling, which checks its own notify
// key instead (not in _middleware.ts's PUBLIC_API list; api/name-position/run.ts is).
//   GET /api/name-position?summary=1                 -> totals, avg position, last run, config
//   GET /api/name-position?site=&q=&sort=&page=       -> the businesses table (default mode)
//   POST { action: 'set-config', batchSizePerSite?, intervalHours? }
//   POST { action: 'pause' | 'resume' }               -> name_position_config.enabled
// The single-business check logic (claim + Performance API call + write)
// lives in _lib/name-position.ts's checkOnePosition, shared with the batch
// worker at api/name-position/run.ts.

const PER_PAGE = 20;

interface PositionRow {
  id: number;
  site: string;
  business_id: number;
  slug: string;
  name: string;
  position: number | null;
  impressions: number | null;
  clicks: number | null;
  checked_at: string | null;
}

function toApiRow(r: PositionRow, domainBySite: Map<string, string>) {
  const domain = domainBySite.get(r.site) ?? '';
  return {
    id: r.id,
    site: r.site,
    name: r.name,
    slug: r.slug,
    url: domain ? `https://${domain}/business/${r.slug}/` : '',
    position: r.position,
    impressions: r.impressions,
    clicks: r.clicks,
    checkedAt: r.checked_at,
  };
}

const SORT_COLUMNS: Record<string, string> = {
  name: 'name',
  position: 'position',
  impressions: 'impressions',
  clicks: 'clicks',
  checkedAt: 'checked_at',
};

function sortClause(sort: string | null): string {
  const raw = sort ?? '-checkedAt';
  const desc = raw.startsWith('-');
  const col = SORT_COLUMNS[desc ? raw.slice(1) : raw];
  return col ? `ORDER BY ${col} ${desc ? 'DESC' : 'ASC'}` : `ORDER BY checked_at DESC`;
}

function buildWhere(q: URLSearchParams): { clause: string; params: unknown[] } {
  const clauses: string[] = [];
  const params: unknown[] = [];
  const site = q.get('site');
  if (site && site !== 'all') {
    clauses.push('site = ?');
    params.push(site);
  }
  const search = q.get('q');
  if (search) {
    const like = `%${search.replace(/[%_]/g, '')}%`;
    clauses.push('name LIKE ?');
    params.push(like);
  }
  return { clause: clauses.length ? `WHERE ${clauses.join(' AND ')}` : '', params };
}

async function listMode(env: Env, db: D1Database, q: URLSearchParams): Promise<Response> {
  const { clause, params } = buildWhere(q);
  const page = Math.max(1, Number.parseInt(q.get('page') ?? '1', 10) || 1);
  const total = await count(db, `SELECT COUNT(*) FROM name_position ${clause}`, ...params);
  const order = sortClause(q.get('sort'));
  const rowsOut = await rows<PositionRow>(db, `SELECT * FROM name_position ${clause} ${order} LIMIT ? OFFSET ?`, ...params, PER_PAGE, (page - 1) * PER_PAGE);
  const domainBySite = new Map(hubSites(env).map((s) => [s.slug, s.domain]));
  return json({ ok: true, total, rows: rowsOut.map((r) => toApiRow(r, domainBySite)) });
}

async function summaryMode(db: D1Database): Promise<Response> {
  const total = await count(db, `SELECT COUNT(*) FROM name_position`);
  const withData = await count(db, `SELECT COUNT(*) FROM name_position WHERE position IS NOT NULL`);
  const noData = await count(db, `SELECT COUNT(*) FROM name_position WHERE checked_at IS NOT NULL AND position IS NULL`);
  const neverChecked = await count(db, `SELECT COUNT(*) FROM name_position WHERE checked_at IS NULL`);
  const avgRow = await db.prepare(`SELECT AVG(position) avg FROM name_position WHERE position IS NOT NULL`).first<{ avg: number | null }>();
  const lastRunRow = await db.prepare(`SELECT MAX(checked_at) t FROM name_position`).first<{ t: string | null }>();
  const config = await getNamePositionConfig(db);
  return json({
    ok: true,
    total,
    withData,
    noData,
    neverChecked,
    avgPosition: avgRow?.avg != null ? Math.round(avgRow.avg * 10) / 10 : null,
    lastRun: lastRunRow?.t ?? null,
    config,
  });
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  const q = new URL(context.request.url).searchParams;
  if (q.get('summary') === '1') return summaryMode(db);
  return listMode(context.env, db, q);
};

async function doSetConfig(db: D1Database, actor: string, body: Record<string, unknown>): Promise<Response> {
  const patch: Partial<NamePositionConfig> = {};
  if (typeof body.enabled === 'boolean') patch.enabled = body.enabled;
  if (body.batchSizePerSite !== undefined) {
    const n = Number(body.batchSizePerSite);
    if (!Number.isInteger(n) || n < 1 || n > 2000) return json({ ok: false, error: 'batchSizePerSite must be between 1 and 2000.' }, 400);
    patch.batchSizePerSite = n;
  }
  if (body.intervalHours !== undefined) {
    const n = Number(body.intervalHours);
    if (!Number.isInteger(n) || n < 1 || n > 24) return json({ ok: false, error: 'intervalHours must be between 1 and 24.' }, 400);
    patch.intervalHours = n;
  }
  const next = await setNamePositionConfig(db, patch);
  await logActivity(db, actor, null, 'name_position_config_set', JSON.stringify(next));
  return json({ ok: true, config: next });
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const actor = String(context.data.email);
  const db = env.ADMIN_DB;
  const body = await jsonBody(context.request);
  if (!body || typeof body.action !== 'string') return json({ ok: false, error: 'Invalid request.' }, 400);
  switch (body.action) {
    case 'pause':
      return doSetConfig(db, actor, { enabled: false });
    case 'resume':
      return doSetConfig(db, actor, { enabled: true });
    case 'set-config':
      return doSetConfig(db, actor, body);
    default:
      return json({ ok: false, error: 'Unknown action.' }, 400);
  }
};
