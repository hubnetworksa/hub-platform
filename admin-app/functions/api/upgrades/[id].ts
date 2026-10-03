import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { jsonBody } from '../../_lib/body';
import { parseUpgrade } from '../../_lib/upgrades';
import { toUpgrade } from './index';

// Editing (PATCH, any subset of fields) and deleting one upgrade.
export const onRequestPatch: PagesFunction<Env> = async (context) => {
  const id = Number(context.params.id);
  const body = await jsonBody(context.request);
  if (!id || !body) return json({ ok: false, error: 'Invalid request.' }, 400);
  const parsed = parseUpgrade(context.env, body, true);
  if ('error' in parsed) return json({ ok: false, error: parsed.error }, 400);
  const u = parsed.value;
  // Fixed column list; values always bound.
  const sets: string[] = [];
  const binds: unknown[] = [];
  if (u.title !== undefined) (sets.push('title = ?'), binds.push(u.title));
  if (u.details !== undefined) (sets.push('details = ?'), binds.push(u.details));
  if (u.sites !== undefined) (sets.push('sites = ?'), binds.push(JSON.stringify(u.sites)));
  if (u.priority !== undefined) (sets.push('priority = ?'), binds.push(u.priority));
  if (u.status !== undefined) {
    sets.push('status = ?', `done_at = CASE WHEN ? = 'done' THEN COALESCE(done_at, datetime('now')) END`);
    binds.push(u.status, u.status);
  }
  if (!sets.length) return json({ ok: false, error: 'Nothing to change.' }, 400);
  const row = await context.env.ADMIN_DB.prepare(`UPDATE upgrades SET ${sets.join(', ')}, updated_at = datetime('now') WHERE id = ? RETURNING *`)
    .bind(...binds, id)
    .first<Parameters<typeof toUpgrade>[0]>();
  if (!row) return json({ ok: false, error: 'That upgrade no longer exists.' }, 404);
  return json({ ok: true, upgrade: toUpgrade(row) });
};

export const onRequestDelete: PagesFunction<Env> = async (context) => {
  const id = Number(context.params.id);
  if (!id) return json({ ok: false, error: 'Invalid request.' }, 400);
  await context.env.ADMIN_DB.prepare('DELETE FROM upgrades WHERE id = ?').bind(id).run();
  return json({ ok: true });
};
