import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, type Env } from '../_lib/sites';
import { jsonBody } from '../_lib/body';
import { logActivity } from '../_lib/alerts';
import { cityAdmin } from '../_lib/city-api';
import { qualityReportKey } from '../_lib/quality';

// Dismisses a "what's missing" quality flag for one business from the
// Listings screen: POST { site, checkKey, slug }. Goes through the site's
// own admin endpoint (dismiss-check.ts), which is where the (check_key,
// slug) pair is actually persisted (dismissed_checks).
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const actor = String(context.data.email);
  const body = await jsonBody(context.request);
  const site = hubSites(env).find((s) => s.slug === body?.site);
  const checkKey = typeof body?.checkKey === 'string' ? body.checkKey : '';
  const slug = typeof body?.slug === 'string' ? body.slug : '';
  if (!site || !checkKey || !slug) return json({ ok: false, error: 'Invalid request.' }, 400);

  const r = await cityAdmin(env.ADMIN_DB, site, actor, '/api/admin/dismiss-check', { checkKey, slug });
  if (!r.ok) return json({ ok: false, error: r.error || `${site.name} said no (${r.status}).` }, 502);
  await logActivity(env.ADMIN_DB, actor, site.slug, 'check_dismissed', `${checkKey}: ${slug}`);
  await env.ADMIN_DB.prepare('DELETE FROM reports WHERE kind = ?').bind(qualityReportKey(site.slug)).run();
  return json({ ok: true });
};
