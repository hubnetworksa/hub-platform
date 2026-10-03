import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { safeEqual } from '../../_lib/auth';
import { checkAndNotify } from '../../_lib/notifier';
import { readBriefing, writeBriefing } from '../../_lib/briefing';
import { pushToSubscribers } from '../../_lib/webpush';

// Runs the new-item check (see _lib/notifier.ts). Called every 5 minutes by
// .github/workflows/admin-notify.yml with X-Notify-Key: the random key in
// this app's own database (settings 'notify_key'), which that workflow reads
// with the Cloudflare API and never prints. No key stored = refused.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  const row = await db.prepare(`SELECT value FROM settings WHERE key = 'notify_key'`).first<{ value: string }>();
  const given = context.request.headers.get('X-Notify-Key') ?? '';
  if (!row || row.value.length < 32 || !safeEqual(given, row.value)) return json({ ok: false }, 403);
  const result = await checkAndNotify(context.env);
  // From 06:00 South African time, write the day's briefing once and let
  // devices that want it know it's ready.
  let briefing = false;
  const saHour = new Date(Date.now() + 2 * 3600000).getUTCHours();
  if (saHour >= 6 && !(await readBriefing(db))) {
    const b = await writeBriefing(context.env);
    await db
      .prepare(`INSERT INTO notifications (title, body, url, types) VALUES (?, ?, '/#/', '["briefing"]')`)
      .bind('Your morning briefing', b.briefing.headline.slice(0, 300))
      .run();
    await pushToSubscribers(db, ['briefing']);
    briefing = true;
  }
  return json({ ok: true, ...result, briefing });
};
