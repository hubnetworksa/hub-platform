import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';

// Recent notifications, for the Alerts screen's history.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const rows = (await context.env.ADMIN_DB.prepare(`SELECT id, title, body, url, created_at FROM notifications WHERE types != '["test"]' ORDER BY id DESC LIMIT 40`).all()).results ?? [];
  return json({ ok: true, notifications: rows });
};
