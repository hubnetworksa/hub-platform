import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { safeEqual } from '../../_lib/auth';
import { checkAndNotify } from '../../_lib/notifier';

// Runs the new-item check (see _lib/notifier.ts). Called every 5 minutes by
// .github/workflows/admin-notify.yml with X-Notify-Key: the random key in
// this app's own database (settings 'notify_key'), which that workflow reads
// with the Cloudflare API and never prints. No key stored = refused.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  const row = await db.prepare(`SELECT value FROM settings WHERE key = 'notify_key'`).first<{ value: string }>();
  const given = context.request.headers.get('X-Notify-Key') ?? '';
  if (!row || row.value.length < 32 || !safeEqual(given, row.value)) return json({ ok: false }, 403);
  return json({ ok: true, ...(await checkAndNotify(context.env)) });
};
