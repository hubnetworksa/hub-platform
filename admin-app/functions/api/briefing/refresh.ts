import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { readBriefing, writeBriefing } from '../../_lib/briefing';

const MAX_PER_DAY = 5; // keeps the AI cost predictable

// Rewrites today's briefing from fresh numbers.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const existing = await readBriefing(context.env.ADMIN_DB);
  if (existing && existing.regenerations >= MAX_PER_DAY) return json({ ok: false, error: `The briefing can be refreshed ${MAX_PER_DAY} times a day. It updates again tomorrow morning.` }, 429);
  await writeBriefing(context.env);
  return json({ ok: true, ...(await readBriefing(context.env.ADMIN_DB)) });
};
