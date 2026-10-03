import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';

// What the push that just woke this device was about. Called by the service
// worker with ?endpoint=<this device's subscription>; returns the newest
// notification (last 24 hours) that matches the device's chosen types, or a
// test notification.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const endpoint = new URL(context.request.url).searchParams.get('endpoint') ?? '';
  const db = context.env.ADMIN_DB;
  const sub = await db.prepare('SELECT types FROM push_subscriptions WHERE endpoint = ?').bind(endpoint).first<{ types: string }>();
  const wants: string[] = sub ? [...(JSON.parse(sub.types) as string[]), 'test'] : ['test'];
  const recent =
    (await db.prepare(`SELECT id, title, body, url, types FROM notifications WHERE created_at >= datetime('now', '-1 day') ORDER BY id DESC LIMIT 20`).all<{ id: number; title: string; body: string; url: string; types: string }>()).results ?? [];
  const hit = recent.find((n) => (JSON.parse(n.types) as string[]).some((t) => wants.includes(t)));
  if (!hit) return json({ ok: true, notification: null });
  const { types: _types, ...notification } = hit;
  return json({ ok: true, notification });
};
