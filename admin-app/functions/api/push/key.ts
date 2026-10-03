import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { vapidKeys } from '../../_lib/webpush';

// The public half of the push key pair, which a browser needs to subscribe.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const keys = await vapidKeys(context.env.ADMIN_DB);
  return json({ ok: true, publicKey: keys.publicKey });
};
