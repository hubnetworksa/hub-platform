import type { D1Database } from '@cloudflare/workers-types';
import { pushToSubscribers } from './webpush';

/** Records one notification and pushes it to every device that wants any of `types`. */
export async function alert(db: D1Database, title: string, body: string, url: string, types: string[]): Promise<number> {
  await db.prepare('INSERT INTO notifications (title, body, url, types) VALUES (?, ?, ?, ?)').bind(title.slice(0, 120), body.slice(0, 300), url, JSON.stringify(types)).run();
  const { sent } = await pushToSubscribers(db, types);
  return sent;
}

export async function getSetting(db: D1Database, key: string): Promise<string | null> {
  const r = await db.prepare('SELECT value FROM settings WHERE key = ?').bind(key).first<{ value: string }>();
  return r?.value ?? null;
}

export async function setSetting(db: D1Database, key: string, value: string): Promise<void> {
  await db
    .prepare(`INSERT INTO settings (key, value) VALUES (?, ?) ON CONFLICT(key) DO UPDATE SET value = excluded.value, updated_at = datetime('now')`)
    .bind(key, value)
    .run();
}

export async function readReport<T>(db: D1Database, kind: string): Promise<{ data: T; updated_at: string } | null> {
  const r = await db.prepare('SELECT data, updated_at FROM reports WHERE kind = ?').bind(kind).first<{ data: string; updated_at: string }>();
  if (!r) return null;
  try {
    return { data: JSON.parse(r.data) as T, updated_at: r.updated_at };
  } catch {
    return null;
  }
}

export async function writeReport(db: D1Database, kind: string, data: unknown): Promise<void> {
  await db
    .prepare(`INSERT INTO reports (kind, data) VALUES (?, ?) ON CONFLICT(kind) DO UPDATE SET data = excluded.data, updated_at = datetime('now')`)
    .bind(kind, JSON.stringify(data))
    .run();
}

/** Logs something an admin did from Hub Admin. */
export async function logActivity(db: D1Database, actor: string, site: string | null, action: string, target: string | null, detail: string | null = null): Promise<void> {
  await db.prepare('INSERT INTO activity (actor, site, action, target, detail) VALUES (?, ?, ?, ?, ?)').bind(actor, site, action, target, detail).run();
}
