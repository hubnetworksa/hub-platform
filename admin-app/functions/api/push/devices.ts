import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';

// Devices with notifications on. ?endpoint= marks which one is "this device"
// (endpoints themselves are never sent back: they're capability URLs).
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const mine = new URL(context.request.url).searchParams.get('endpoint') ?? '';
  const rows =
    (
      await context.env.ADMIN_DB.prepare('SELECT id, endpoint, label, email, types, created_at, last_sent_at FROM push_subscriptions ORDER BY created_at DESC').all<{
        id: number;
        endpoint: string;
        label: string | null;
        email: string;
        types: string;
        created_at: string;
        last_sent_at: string | null;
      }>()
    ).results ?? [];
  return json({
    ok: true,
    devices: rows.map(({ endpoint, types, ...r }) => ({ ...r, types: JSON.parse(types) as string[], current: !!mine && endpoint === mine })),
  });
};
