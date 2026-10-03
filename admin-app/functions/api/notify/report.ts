import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { notifyKeyOk } from '../../_lib/notify-key';
import { writeReport } from '../../_lib/alerts';

// Reports sent by the scheduled GitHub workflows (X-Notify-Key):
//   ?kind=links  the weekly broken-links crawl (scripts/admin-links.mjs)
const KINDS = ['links'];

export const onRequestPost: PagesFunction<Env> = async (context) => {
  if (!(await notifyKeyOk(context.request, context.env.ADMIN_DB))) return json({ ok: false }, 403);
  const kind = new URL(context.request.url).searchParams.get('kind') ?? '';
  if (!KINDS.includes(kind)) return json({ ok: false, error: 'Unknown report.' }, 400);
  const text = await context.request.text();
  if (text.length > 900_000) return json({ ok: false, error: 'Report too large.' }, 413);
  let data: unknown;
  try {
    data = JSON.parse(text);
  } catch {
    return json({ ok: false, error: 'Body must be JSON.' }, 400);
  }
  if (!data || typeof data !== 'object' || Array.isArray(data)) return json({ ok: false, error: 'Report must be an object.' }, 400);
  await writeReport(context.env.ADMIN_DB, kind, data);
  return json({ ok: true });
};
