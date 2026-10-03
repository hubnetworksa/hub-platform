import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { jsonBody, str } from '../../_lib/body';

// Turns notifications off for a device: by its endpoint (this device) or id
// (removing another device from the list). Body: { endpoint } or { id }
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const body = await jsonBody(context.request);
  const endpoint = str(body?.endpoint, 1000);
  const id = Number(body?.id);
  const db = context.env.ADMIN_DB;
  if (endpoint) await db.prepare('DELETE FROM push_subscriptions WHERE endpoint = ?').bind(endpoint).run();
  else if (id) await db.prepare('DELETE FROM push_subscriptions WHERE id = ?').bind(id).run();
  else return json({ ok: false, error: 'Nothing to remove.' }, 400);
  return json({ ok: true });
};
