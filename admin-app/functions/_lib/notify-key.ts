import type { D1Database } from '@cloudflare/workers-types';
import { safeEqual } from './auth';

// The key the GitHub workflows (admin-notify.yml, admin-weekly.yml) send in
// X-Notify-Key: random, kept only in this app's database (settings
// 'notify_key'), read by the workflows with the Cloudflare API.
export async function notifyKeyOk(request: Request, db: D1Database): Promise<boolean> {
  const row = await db.prepare(`SELECT value FROM settings WHERE key = 'notify_key'`).first<{ value: string }>();
  const given = request.headers.get('X-Notify-Key') ?? '';
  return !!row && row.value.length >= 32 && safeEqual(given, row.value);
}
