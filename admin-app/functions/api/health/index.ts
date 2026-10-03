import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, type Env } from '../../_lib/sites';
import { readReport } from '../../_lib/alerts';
import { D1_FREE_ROWS_READ, D1_FREE_ROWS_WRITTEN, routineHealth, type WorkflowRun } from '../../_lib/health';
import { securityChecks } from '../../_lib/security';

// Everything on the Health screen: uptime per site (from the 5-minute
// checks), GitHub workflow runs, Cloudflare D1 usage, routine health,
// security checks and the weekly broken-links report.
// ?refresh=security re-runs the security checks now.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const db = env.ADMIN_DB;
  const refresh = new URL(context.request.url).searchParams.get('refresh');

  const checks =
    (
      await db
        .prepare(
          `SELECT site, ok, status, ms, db_ok, problem, checked_at FROM health_checks WHERE checked_at > datetime('now', '-7 days') ORDER BY checked_at`
        )
        .all<{ site: string; ok: number; status: number; ms: number; db_ok: number; problem: string | null; checked_at: string }>()
    ).results ?? [];
  const dayAgo = new Date(Date.now() - 86400_000).toISOString().replace('T', ' ').slice(0, 19);
  const sites = hubSites(env).map((s) => {
    const mine = checks.filter((c) => c.site === s.slug);
    const day = mine.filter((c) => c.checked_at >= dayAgo);
    const pct = (list: typeof mine) => (list.length ? Math.round((list.filter((c) => c.ok).length / list.length) * 10000) / 100 : null);
    const okDay = day.filter((c) => c.ok && c.status);
    // Hourly buckets for the last 24 hours: share of good checks and average speed.
    const hours = Array.from({ length: 24 }, (_, i) => {
      const from = new Date(Date.now() - (24 - i) * 3600_000).toISOString().replace('T', ' ').slice(0, 19);
      const to = new Date(Date.now() - (23 - i) * 3600_000).toISOString().replace('T', ' ').slice(0, 19);
      const b = day.filter((c) => c.checked_at >= from && c.checked_at < to);
      return { at: to, checks: b.length, ok: b.filter((c) => c.ok).length, ms: b.length ? Math.round(b.reduce((a, c) => a + c.ms, 0) / b.length) : null };
    });
    // Down periods in the last 7 days: runs of failed checks.
    const incidents: { from: string; to: string | null; checks: number; problem: string | null }[] = [];
    for (const c of mine) {
      const last = incidents[incidents.length - 1];
      if (!c.ok) {
        if (last && last.to === null) last.checks++;
        else incidents.push({ from: c.checked_at, to: null, checks: 1, problem: c.problem });
      } else if (last && last.to === null) last.to = c.checked_at;
    }
    const latest = mine[mine.length - 1] ?? null;
    return {
      slug: s.slug,
      name: s.name,
      city: s.city,
      domain: s.domain,
      latest,
      uptime_24h: pct(day),
      uptime_7d: pct(mine),
      avg_ms_24h: okDay.length ? Math.round(okDay.reduce((a, c) => a + c.ms, 0) / okDay.length) : null,
      hours,
      incidents: incidents.filter((i) => i.checks >= 2 || i.to === null).slice(-10).reverse(),
    };
  });

  const runs = await readReport<WorkflowRun[]>(db, 'github_runs');
  // The latest run of each workflow, plus the recent list.
  const byWorkflow = new Map<string, WorkflowRun>();
  for (const r of runs?.data ?? []) if (!byWorkflow.has(r.path)) byWorkflow.set(r.path, r);

  const usage =
    (
      await db
        .prepare(`SELECT day, database, rows_read, rows_written, read_queries, write_queries, size_bytes FROM d1_usage WHERE day >= date('now', '-30 days') ORDER BY day`)
        .all<{ day: string; database: string; rows_read: number; rows_written: number; read_queries: number; write_queries: number; size_bytes: number | null }>()
    ).results ?? [];
  const days = [...new Set(usage.map((u) => u.day))];
  const today = new Date().toISOString().slice(0, 10);
  const d1Error = await readReport<{ error: string }>(db, 'd1_error');
  const d1Updated = await db.prepare(`SELECT MAX(updated_at) AS t FROM settings WHERE key = 'd1_seen'`).first<{ t: string | null }>();

  const [routines, security, links] = await Promise.all([
    routineHealth(env),
    securityChecks(env, refresh === 'security'),
    readReport<unknown>(db, 'links'),
  ]);

  return json({
    ok: true,
    sites,
    workflows: [...byWorkflow.values()],
    runs: (runs?.data ?? []).slice(0, 25),
    runs_updated_at: runs?.updated_at ?? null,
    d1: {
      limits: { rows_read: D1_FREE_ROWS_READ, rows_written: D1_FREE_ROWS_WRITTEN },
      today: usage.filter((u) => u.day === today),
      daily: days.map((d) => {
        const l = usage.filter((u) => u.day === d);
        return { day: d, rows_read: l.reduce((a, u) => a + u.rows_read, 0), rows_written: l.reduce((a, u) => a + u.rows_written, 0) };
      }),
      error: d1Error?.data.error ?? null,
      updated_at: d1Updated?.t ?? null,
    },
    routines,
    security,
    links: links ? { ...((links.data as object) ?? {}), updated_at: links.updated_at } : null,
  });
};
