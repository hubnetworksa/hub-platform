import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { readBriefing, writeBriefing } from '../../_lib/briefing';

// Today's morning briefing; written now if the morning job hasn't yet.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const existing = await readBriefing(context.env.ADMIN_DB);
  if (existing) return json({ ok: true, ...existing });
  await writeBriefing(context.env);
  return json({ ok: true, ...(await readBriefing(context.env.ADMIN_DB)) });
};
