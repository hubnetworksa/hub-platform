import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, rows, type Env } from '../_lib/sites';
import { readReport } from '../_lib/alerts';

// The Activity log: every city's own log (approvals, claims, payments,
// renewals, settings changes, ...) together with what admins did in Hub
// Admin (upgrades, invites, ...), newest first.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const hub = (
    await env.ADMIN_DB.prepare('SELECT actor, site, action, target, detail, created_at FROM activity ORDER BY id DESC LIMIT 200').all<{
      actor: string;
      site: string | null;
      action: string;
      target: string | null;
      detail: string | null;
      created_at: string;
    }>()
  ).results ?? [];
  const cities = await Promise.all(
    hubSites(env).map(async (s) =>
      (await rows<{ kind: string; business_name: string | null; detail: string | null; created_at: string }>(s.db, 'SELECT kind, business_name, detail, created_at FROM activity_log ORDER BY id DESC LIMIT 200')).map((r) => ({
        source: 'site',
        site: s.slug,
        actor: null as string | null,
        action: r.kind,
        target: r.business_name,
        detail: r.detail,
        created_at: r.created_at,
      }))
    )
  );
  const items = [...hub.map((r) => ({ source: 'hub', ...r })), ...cities.flat()].sort((a, b) => b.created_at.localeCompare(a.created_at)).slice(0, 500);
  const weekly = await readReport<unknown>(env.ADMIN_DB, 'weekly');
  return json({ ok: true, items, weekly: weekly ? { ...(weekly.data as object), created_at: weekly.updated_at } : null });
};
