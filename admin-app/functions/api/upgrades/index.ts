import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { jsonBody } from '../../_lib/body';
import { parseUpgrade } from '../../_lib/upgrades';
import { logActivity } from '../../_lib/alerts';

interface Row {
  id: number;
  title: string;
  details: string;
  sites: string;
  priority: string;
  status: string;
  created_by: string;
  created_at: string;
  updated_at: string;
  done_at: string | null;
}

export const toUpgrade = (r: Row) => ({ ...r, sites: JSON.parse(r.sites) as string[] });

// The upgrades list (most urgent first within each status) and adding one.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const rows =
    (
      await context.env.ADMIN_DB.prepare(
        `SELECT * FROM upgrades ORDER BY
           CASE status WHEN 'in_progress' THEN 0 WHEN 'planned' THEN 1 WHEN 'idea' THEN 2 ELSE 3 END,
           CASE priority WHEN 'urgent' THEN 0 WHEN 'high' THEN 1 WHEN 'normal' THEN 2 ELSE 3 END,
           COALESCE(done_at, created_at) DESC`
      ).all<Row>()
    ).results ?? [];
  return json({ ok: true, upgrades: rows.map(toUpgrade) });
};

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const body = await jsonBody(context.request);
  if (!body) return json({ ok: false, error: 'Invalid request.' }, 400);
  const parsed = parseUpgrade(context.env, body, false);
  if ('error' in parsed) return json({ ok: false, error: parsed.error }, 400);
  const u = parsed.value;
  const row = await context.env.ADMIN_DB.prepare(
    `INSERT INTO upgrades (title, details, sites, priority, status, created_by, done_at)
     VALUES (?, ?, ?, ?, ?, ?, CASE WHEN ? = 'done' THEN datetime('now') END) RETURNING *`
  )
    .bind(u.title, u.details ?? '', JSON.stringify(u.sites), u.priority, u.status, String(context.data.email), u.status)
    .first<Row>();
  await logActivity(context.env.ADMIN_DB, String(context.data.email), null, 'upgrade_added', u.title ?? null);
  return json({ ok: true, upgrade: toUpgrade(row!) });
};
