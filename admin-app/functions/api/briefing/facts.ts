import type { PagesFunction } from '@cloudflare/workers-types';
import { json, hubSites, type Env } from '../../_lib/sites';
import { gatherFacts } from '../../_lib/briefing';
import { briefingKeyOk } from '../../_lib/briefing-key';

// For the morning-briefing routine (X-Briefing-Key): the morning's facts,
// plus the order the site summaries must come in.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const auth = await briefingKeyOk(context.request, context.env);
  if (auth !== 'ok') return json({ ok: false }, auth === 'limited' ? 429 : 403);
  return json({ ok: true, site_order: hubSites(context.env).map((s) => s.slug), facts: await gatherFacts(context.env) });
};
