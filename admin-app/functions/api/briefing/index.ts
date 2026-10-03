import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { gatherFacts, plainSummary, readBriefing } from '../../_lib/briefing';

// Today's briefing for the Overview: the routine's, once it has arrived;
// until then a plain summary from the current numbers (not stored).
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const stored = await readBriefing(context.env.ADMIN_DB);
  if (stored) return json({ ok: true, ...stored });
  const facts = await gatherFacts(context.env);
  return json({ ok: true, day: facts.date, briefing: plainSummary(facts), ai: false, model: null, created_at: new Date().toISOString().replace('T', ' ').slice(0, 19), pending: true });
};
