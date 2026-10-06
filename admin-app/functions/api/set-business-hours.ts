import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, type Env } from '../_lib/sites';
import { jsonBody } from '../_lib/body';
import { logActivity } from '../_lib/alerts';
import { cityAdmin } from '../_lib/city-api';
import { qualityReportKey } from '../_lib/quality';

// Sets a business's opening hours from the Listings screen's "No opening
// hours" check: POST { site, slug, hours }. Goes through the site's own
// admin endpoint (set-business-hours.ts) the same as every other city write.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const actor = String(context.data.email);
  const body = await jsonBody(context.request);
  const site = hubSites(env).find((s) => s.slug === body?.site);
  const slug = typeof body?.slug === 'string' ? body.slug : '';
  const hours = typeof body?.hours === 'string' ? body.hours.trim() : '';
  if (!site || !slug || !hours) return json({ ok: false, error: 'Invalid request.' }, 400);

  const r = await cityAdmin(env.ADMIN_DB, site, actor, '/api/admin/set-business-hours', { slug, hours });
  if (!r.ok) return json({ ok: false, error: r.error || `${site.name} said no (${r.status}).` }, 502);
  await logActivity(env.ADMIN_DB, actor, site.slug, 'business_hours_set', slug);
  await env.ADMIN_DB.prepare('DELETE FROM reports WHERE kind = ?').bind(qualityReportKey(site.slug)).run();
  return json({ ok: true });
};
