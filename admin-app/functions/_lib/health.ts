import { hubSites, checkSite, rows, type Env, type HubSite } from './sites';
import { alert, getSetting, setSetting, writeReport } from './alerts';

// Site health, GitHub workflow runs, Cloudflare D1 usage and routine health:
// recorded by the 5-minute notifier run (api/notify/run.ts) and shown on the
// Health screen. Each problem raises one push alert when it starts and one
// when it clears, never one every 5 minutes.

// Cloudflare's free plan, per account per UTC day.
export const D1_FREE_ROWS_READ = 5_000_000;
export const D1_FREE_ROWS_WRITTEN = 100_000;
const SLOW_MS = 4000;

interface SiteState {
  state: 'up' | 'down';
  since: string;
  fails: number;
}

async function checkOne(site: HubSite) {
  const web = await checkSite(site.domain);
  let dbOk = true;
  try {
    await site.db.prepare('SELECT 1 AS x').first();
  } catch {
    dbOk = false;
  }
  const problems: string[] = [];
  if (!web.ok) problems.push(web.status ? `Homepage answered ${web.status}` : 'Homepage did not answer');
  else if (web.ms > SLOW_MS) problems.push(`Slow: ${(web.ms / 1000).toFixed(1)} s`);
  if (!dbOk) problems.push('Database not answering (daily limit reached?)');
  return { site, ok: web.ok && dbOk, status: web.status, ms: web.ms, dbOk, problem: problems.join('; ') || null };
}

/** Checks every site, stores the result and alerts on down / back up. */
export async function runHealthChecks(env: Env): Promise<number> {
  const db = env.ADMIN_DB;
  const results = await Promise.all(hubSites(env).map(checkOne));
  let sent = 0;
  const now = new Date().toISOString();
  for (const r of results) {
    await db
      .prepare('INSERT INTO health_checks (site, ok, status, ms, db_ok, problem) VALUES (?, ?, ?, ?, ?, ?)')
      .bind(r.site.slug, r.ok ? 1 : 0, r.status, r.ms, r.dbOk ? 1 : 0, r.problem)
      .run();
    const key = `health:${r.site.slug}`;
    let st: SiteState = { state: 'up', since: now, fails: 0 };
    try {
      st = { ...st, ...JSON.parse((await getSetting(db, key)) ?? '{}') };
    } catch {
      /* start fresh */
    }
    if (!r.ok) {
      st.fails += 1;
      // Two failures in a row (about 5 minutes) before calling it down, so one
      // dropped request never wakes anyone.
      if (st.state === 'up' && st.fails >= 2) {
        st = { state: 'down', since: now, fails: st.fails };
        sent += await alert(db, `${r.site.name} is down`, r.problem ?? 'The site is not answering.', '/#/health', ['health']);
      }
    } else {
      if (st.state === 'down') {
        const mins = Math.max(1, Math.round((Date.now() - new Date(st.since).getTime()) / 60000));
        sent += await alert(db, `${r.site.name} is back up`, `It was down for about ${mins} minute${mins === 1 ? '' : 's'}.`, '/#/health', ['health']);
        st = { state: 'up', since: now, fails: 0 };
      } else st.fails = 0;
    }
    await setSetting(db, key, JSON.stringify(st));
  }
  if (Math.random() < 0.05) await db.prepare(`DELETE FROM health_checks WHERE checked_at < datetime('now', '-14 days')`).run();
  return sent;
}

export interface WorkflowRun {
  id: number;
  name: string;
  path: string;
  status: string;
  conclusion: string | null;
  branch: string;
  event: string;
  title: string;
  created_at: string;
  updated_at: string;
  url: string;
  error?: { job?: string; step?: string; message?: string } | null;
}

// Workflows whose failure is reported elsewhere or isn't actionable here.
const QUIET_WORKFLOWS = ['.github/workflows/admin-notify.yml', '.github/workflows/routine-health.yml'];

function cleanRun(x: unknown): WorkflowRun | null {
  if (!x || typeof x !== 'object') return null;
  const r = x as Record<string, unknown>;
  const s = (v: unknown, n = 200) => (typeof v === 'string' ? v.slice(0, n) : '');
  const id = Number(r.id);
  if (!Number.isSafeInteger(id) || id <= 0) return null;
  const url = s(r.url, 300);
  const e = r.error && typeof r.error === 'object' ? (r.error as Record<string, unknown>) : null;
  return {
    id,
    name: s(r.name, 120),
    path: s(r.path, 200),
    status: s(r.status, 30),
    conclusion: r.conclusion == null ? null : s(r.conclusion, 30),
    branch: s(r.branch, 100),
    event: s(r.event, 40),
    title: s(r.title, 200),
    created_at: s(r.created_at, 40),
    updated_at: s(r.updated_at, 40),
    url: url.startsWith('https://github.com/') ? url : '',
    error: e ? { job: s(e.job, 120), step: s(e.step, 120), message: s(e.message, 600) } : null,
  };
}

/** Stores the latest GitHub workflow runs and alerts on new failures. */
export async function ingestRuns(env: Env, input: unknown): Promise<number> {
  if (!Array.isArray(input)) return 0;
  const db = env.ADMIN_DB;
  const runs = input.slice(0, 60).map(cleanRun).filter((r): r is WorkflowRun => !!r);
  await writeReport(db, 'github_runs', runs);
  const failed = runs.filter((r) => r.status === 'completed' && (r.conclusion === 'failure' || r.conclusion === 'timed_out') && !QUIET_WORKFLOWS.includes(r.path));
  // Failed run ids already announced (the first look records them silently).
  let seen: number[] | null = null;
  try {
    seen = JSON.parse((await getSetting(db, 'runs_alerted_ids')) ?? 'null');
  } catch {
    seen = null;
  }
  const fresh = seen ? failed.filter((r) => !seen!.includes(r.id)) : [];
  await setSetting(db, 'runs_alerted_ids', JSON.stringify([...new Set([...failed.map((r) => r.id), ...(seen ?? [])])].slice(0, 200)));
  if (!fresh.length) return 0;
  const title = fresh.length === 1 ? `Failed: ${fresh[0].name}` : `${fresh.length} workflow runs failed`;
  const body = fresh.map((r) => (r.error?.step ? `${r.name} (step "${r.error.step}")` : r.name)).join(' · ');
  return alert(db, title, body, '/#/health', ['deploy']);
}

interface UsageRow {
  day: string;
  database: string;
  rows_read: number;
  rows_written: number;
  read_queries: number;
  write_queries: number;
  size_bytes: number | null;
}

/** Stores Cloudflare D1 usage (per database per UTC day) and alerts near the free limit. */
export async function ingestD1(env: Env, input: unknown): Promise<number> {
  const db = env.ADMIN_DB;
  if (!input || typeof input !== 'object') return 0;
  const d = input as { usage?: unknown; error?: unknown };
  if (typeof d.error === 'string') {
    await writeReport(db, 'd1_error', { error: d.error.slice(0, 300) });
    return 0;
  }
  if (!Array.isArray(d.usage)) return 0;
  await db.prepare(`DELETE FROM reports WHERE kind = 'd1_error'`).run();
  const n = (v: unknown) => (Number.isFinite(Number(v)) ? Math.max(0, Math.round(Number(v))) : 0);
  const list: UsageRow[] = d.usage.slice(0, 500).flatMap((x) => {
    const r = x as Record<string, unknown>;
    if (typeof r.day !== 'string' || !/^\d{4}-\d{2}-\d{2}$/.test(r.day) || typeof r.database !== 'string') return [];
    return [{ day: r.day, database: r.database.slice(0, 80), rows_read: n(r.rows_read), rows_written: n(r.rows_written), read_queries: n(r.read_queries), write_queries: n(r.write_queries), size_bytes: r.size_bytes == null ? null : n(r.size_bytes) }];
  });
  for (const r of list) {
    await db
      .prepare(
        `INSERT INTO d1_usage (day, database, rows_read, rows_written, read_queries, write_queries, size_bytes) VALUES (?, ?, ?, ?, ?, ?, ?)
         ON CONFLICT(day, database) DO UPDATE SET rows_read = excluded.rows_read, rows_written = excluded.rows_written,
           read_queries = excluded.read_queries, write_queries = excluded.write_queries, size_bytes = COALESCE(excluded.size_bytes, size_bytes)`
      )
      .bind(r.day, r.database, r.rows_read, r.rows_written, r.read_queries, r.write_queries, r.size_bytes)
      .run();
  }
  await db.prepare(`DELETE FROM d1_usage WHERE day < date('now', '-60 days')`).run();
  await setSetting(db, 'd1_seen', new Date().toISOString());

  const today = new Date().toISOString().slice(0, 10);
  const t = list.filter((r) => r.day === today);
  const read = t.reduce((a, r) => a + r.rows_read, 0);
  const written = t.reduce((a, r) => a + r.rows_written, 0);
  const pct = Math.max(read / D1_FREE_ROWS_READ, written / D1_FREE_ROWS_WRITTEN);
  const level = pct >= 0.9 ? 90 : pct >= 0.7 ? 70 : 0;
  const key = `usage_alert:${today}`;
  const done = Number(await getSetting(db, key)) || 0;
  if (level <= done) return 0;
  await setSetting(db, key, String(level));
  const top = Object.entries(
    t.reduce<Record<string, number>>((m, r) => ((m[r.database] = (m[r.database] ?? 0) + r.rows_read), m), {})
  ).sort((a, b) => b[1] - a[1])[0];
  const which = read / D1_FREE_ROWS_READ >= written / D1_FREE_ROWS_WRITTEN ? `${(read / 1e6).toFixed(2)}M of 5M rows read` : `${Math.round(written / 1000)}k of 100k rows written`;
  return alert(db, `Database usage at ${Math.round(pct * 100)}% of today’s free limit`, `${which} so far today (UTC)${top ? `; most from ${top[0]}` : ''}. The sites stop answering at 100% until midnight UTC.`, '/#/health', ['usage']);
}

export interface RoutineRow {
  routine: string;
  city: string;
  lastRun: string | null;
  daysAgo: number | null;
  status: string;
}

/** Each city's routine health (saved daily into its site_settings by routine-health.yml). */
export async function routineHealth(env: Env): Promise<{ site: string; checkedAt: string | null; rows: RoutineRow[] }[]> {
  return Promise.all(
    hubSites(env).map(async (s) => {
      const r = await rows<{ value: string }>(s.db, `SELECT value FROM site_settings WHERE key = 'routine_health'`);
      try {
        const v = JSON.parse(r[0]?.value ?? 'null') as { checkedAt: string; rows: RoutineRow[] } | null;
        return { site: s.slug, checkedAt: v?.checkedAt ?? null, rows: Array.isArray(v?.rows) ? v!.rows : [] };
      } catch {
        return { site: s.slug, checkedAt: null, rows: [] };
      }
    })
  );
}

/** Alerts once when a routine becomes late (and remembers which ones are). */
export async function checkRoutines(env: Env): Promise<number> {
  const db = env.ADMIN_DB;
  const all = await routineHealth(env);
  const late = new Set<string>();
  for (const s of all) for (const r of s.rows) if (r.status === 'late') late.add(`${r.routine} (${r.city})`);
  let before: string[] | null = null;
  try {
    before = JSON.parse((await getSetting(db, 'routines_late')) ?? 'null');
  } catch {
    before = null;
  }
  await setSetting(db, 'routines_late', JSON.stringify([...late]));
  if (!before) return 0; // first look: just record
  const fresh = [...late].filter((x) => !before!.includes(x));
  if (!fresh.length) return 0;
  return alert(db, fresh.length === 1 ? `Routine late: ${fresh[0]}` : `${fresh.length} routines are late`, fresh.join(' · '), '/#/health', ['routine']);
}
