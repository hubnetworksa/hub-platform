import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { jsonBody, str } from '../../_lib/body';
import { sendPush, vapidKeys } from '../../_lib/webpush';

// Sends a test notification to this device. Body: { endpoint }
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const body = await jsonBody(context.request);
  const endpoint = str(body?.endpoint, 1000);
  const db = context.env.ADMIN_DB;
  const sub = await db.prepare('SELECT id, endpoint FROM push_subscriptions WHERE endpoint = ?').bind(endpoint).first<{ id: number; endpoint: string }>();
  if (!sub) return json({ ok: false, error: 'Turn notifications on for this device first.' }, 400);
  await db
    .prepare(`INSERT INTO notifications (title, body, url, types) VALUES (?, ?, '/#/alerts', '["test"]')`)
    .bind('Hub Admin test', 'Notifications are working on this device.')
    .run();
  const r = await sendPush(sub, await vapidKeys(db));
  if (r === 'gone') await db.prepare('DELETE FROM push_subscriptions WHERE id = ?').bind(sub.id).run();
  return r === 'ok' ? json({ ok: true }) : json({ ok: false, error: r === 'gone' ? 'This device’s subscription has expired. Turn notifications off and on again.' : 'The push service didn’t accept the notification. Try again in a minute.' }, 502);
};
