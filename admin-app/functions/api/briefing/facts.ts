import type { PagesFunction } from '@cloudflare/workers-types';
import { json, hubSites, type Env } from '../../_lib/sites';
import { gatherFullFacts } from '../../_lib/briefing-facts';
import { briefingKeyOk } from '../../_lib/briefing-key';

// For the morning-briefing routine (X-Briefing-Key): the morning's facts in
// full (every site in depth plus the whole operation, _lib/briefing-facts.ts),
// plus the order the site summaries must come in.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const auth = await briefingKeyOk(context.request, context.env);
  if (auth !== 'ok') return json({ ok: false }, auth === 'limited' ? 429 : 403);
  return json({ ok: true, site_order: hubSites(context.env).map((s) => s.slug), facts: await gatherFullFacts(context.env) });
};
