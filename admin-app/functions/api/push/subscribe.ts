import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { QUEUE_TYPES } from '../../_lib/queues';
import { jsonBody, str } from '../../_lib/body';

// Saves (or updates) this device's push subscription and the alert types it
// wants. Body: { subscription: { endpoint, keys: { p256dh, auth } }, types: [...], label }
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const body = await jsonBody(context.request);
  const sub = body?.subscription as { endpoint?: unknown; keys?: { p256dh?: unknown; auth?: unknown } } | undefined;
  const endpoint = str(sub?.endpoint, 1000);
  const p256dh = str(sub?.keys?.p256dh, 200);
  const auth = str(sub?.keys?.auth, 100);
  if (!endpoint.startsWith('https://') || !p256dh || !auth) return json({ ok: false, error: 'Invalid subscription.' }, 400);
  const types = (Array.isArray(body?.types) ? body!.types : QUEUE_TYPES).filter((t): t is string => typeof t === 'string' && QUEUE_TYPES.includes(t));
  const label = str(body?.label, 60) || 'This device';
  await context.env.ADMIN_DB.prepare(
    `INSERT INTO push_subscriptions (endpoint, p256dh, auth, email, label, types) VALUES (?, ?, ?, ?, ?, ?)
     ON CONFLICT(endpoint) DO UPDATE SET p256dh = excluded.p256dh, auth = excluded.auth, email = excluded.email, label = excluded.label, types = excluded.types, fail_count = 0`
  )
    .bind(endpoint, p256dh, auth, String(context.data.email), label, JSON.stringify(types))
    .run();
  return json({ ok: true, types });
};
