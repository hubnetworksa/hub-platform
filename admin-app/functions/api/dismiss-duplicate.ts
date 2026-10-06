import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, type Env } from '../_lib/sites';
import { jsonBody } from '../_lib/body';
import { logActivity } from '../_lib/alerts';
import { cityAdmin } from '../_lib/city-api';
import { qualityReportKey } from '../_lib/quality';

// Marks a "possible duplicate" group as not actually a duplicate, from the
// Listings screen: POST { site, groupKey }. Goes through the site's own
// admin endpoint (dismiss-duplicate.ts), which is where group_key is
// actually persisted (dismissed_duplicates).
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const actor = String(context.data.email);
  const body = await jsonBody(context.request);
  const site = hubSites(env).find((s) => s.slug === body?.site);
  const groupKey = typeof body?.groupKey === 'string' ? body.groupKey : '';
  if (!site || !groupKey) return json({ ok: false, error: 'Invalid request.' }, 400);

  const r = await cityAdmin(env.ADMIN_DB, site, actor, '/api/admin/dismiss-duplicate', { groupKey });
  if (!r.ok) return json({ ok: false, error: r.error || `${site.name} said no (${r.status}).` }, 502);
  await logActivity(env.ADMIN_DB, actor, site.slug, 'duplicate_dismissed', groupKey);
  // The quality report is out of date now: rebuild it next time it's opened.
  await env.ADMIN_DB.prepare('DELETE FROM reports WHERE kind = ?').bind(qualityReportKey(site.slug)).run();
  return json({ ok: true });
};
