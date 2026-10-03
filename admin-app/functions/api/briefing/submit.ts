import type { PagesFunction } from '@cloudflare/workers-types';
import { json, hubSites, type Env } from '../../_lib/sites';
import { gatherFacts, storeBriefing, validateBriefing } from '../../_lib/briefing';
import { briefingKeyOk } from '../../_lib/briefing-key';
import { pushToSubscribers } from '../../_lib/webpush';

// The routine posts the briefing it wrote: { headline, needs_you, sites,
// worth_knowing }. Checked, saved for today, and announced to devices with
// "Morning briefing" alerts on (first delivery of the day only).
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const auth = await briefingKeyOk(context.request, context.env);
  if (auth !== 'ok') return json({ ok: false }, auth === 'limited' ? 429 : 403);
  let raw: unknown;
  try {
    raw = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Body must be JSON.' }, 400);
  }
  const checked = validateBriefing(raw, hubSites(context.env).map((s) => s.slug));
  if ('error' in checked) return json({ ok: false, error: checked.error }, 400);
  const db = context.env.ADMIN_DB;
  const before = await db.prepare('SELECT 1 FROM daily_briefings WHERE day = ?').bind(new Date(Date.now() + 2 * 3600000).toISOString().slice(0, 10)).first();
  const day = await storeBriefing(context.env, checked.briefing, await gatherFacts(context.env));
  if (!before) {
    await db.prepare(`INSERT INTO notifications (title, body, url, types) VALUES ('Your morning briefing', ?, '/#/', '["briefing"]')`).bind(checked.briefing.headline.slice(0, 300)).run();
    await pushToSubscribers(db, ['briefing']);
  }
  return json({ ok: true, day, saved: checked.briefing });
};
