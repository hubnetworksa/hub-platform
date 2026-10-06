import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, type Env } from '../_lib/sites';
import { jsonBody } from '../_lib/body';
import { logActivity } from '../_lib/alerts';
import { cityAdmin } from '../_lib/city-api';
import { qualityReportKey } from '../_lib/quality';

// Marks a business closed (or reopens it) from the Listings screen, by
// slug — POST { site, slug, closed }. Same /api/admin/toggle-business-closed
// endpoint the native Manage Businesses page uses, just resolved by slug
// instead of id, since that's all a quality.ts Listing carries.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const actor = String(context.data.email);
  const body = await jsonBody(context.request);
  const site = hubSites(env).find((s) => s.slug === body?.site);
  const slug = typeof body?.slug === 'string' ? body.slug : '';
  const closed = body?.closed === true;
  if (!site || !slug) return json({ ok: false, error: 'Invalid request.' }, 400);

  const r = await cityAdmin(env.ADMIN_DB, site, actor, '/api/admin/toggle-business-closed', { slug, closed });
  if (!r.ok) return json({ ok: false, error: r.error || `${site.name} said no (${r.status}).` }, 502);
  await logActivity(env.ADMIN_DB, actor, site.slug, closed ? 'business_closed' : 'business_reopened', slug);
  await env.ADMIN_DB.prepare('DELETE FROM reports WHERE kind = ?').bind(qualityReportKey(site.slug)).run();
  return json({ ok: true });
};
