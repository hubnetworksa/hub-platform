import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, type Env } from '../_lib/sites';
import { jsonBody } from '../_lib/body';
import { logActivity } from '../_lib/alerts';
import { cityAdmin } from '../_lib/city-api';

// Hides (or publishes again) several listings at once from the Listings
// screen: POST { site, slugs: [...], status: 'hidden' | 'published' }, at most
// 25 at a time. Each goes through the site's own admin endpoint
// (toggle-business-status), so sponsor spots are cleared and the site
// rebuilds exactly as when done from that site's admin.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const actor = String(context.data.email);
  const body = await jsonBody(context.request);
  const site = hubSites(env).find((s) => s.slug === body?.site);
  const slugs = Array.isArray(body?.slugs) ? [...new Set(body!.slugs.filter((x): x is string => typeof x === 'string' && /^[a-z0-9-]{1,200}$/.test(x)))] : [];
  const status = body?.status === 'published' ? 'published' : body?.status === 'hidden' ? 'hidden' : null;
  if (!site || !status || !slugs.length) return json({ ok: false, error: 'Invalid request.' }, 400);
  if (slugs.length > 25) return json({ ok: false, error: 'At most 25 listings at a time.' }, 400);
  const done: string[] = [];
  const failed: { slug: string; error: string }[] = [];
  for (const slug of slugs) {
    const b = await site.db.prepare('SELECT id, name FROM businesses WHERE slug = ?').bind(slug).first<{ id: number; name: string }>();
    if (!b) {
      failed.push({ slug, error: 'Not found.' });
      continue;
    }
    const r = await cityAdmin(env.ADMIN_DB, site, actor, '/api/admin/toggle-business-status', { businessId: b.id, status: status === 'published' ? 'published' : 'rejected' });
    if (r.ok) {
      done.push(slug);
      await logActivity(env.ADMIN_DB, actor, site.slug, status === 'hidden' ? 'business_hidden' : 'business_published', b.name);
    } else failed.push({ slug, error: r.error || `HTTP ${r.status}` });
  }
  // The quality report is out of date now: rebuild it next time it's opened.
  if (done.length) await env.ADMIN_DB.prepare('DELETE FROM reports WHERE kind = ?').bind(`quality:${site.slug}`).run();
  return json({ ok: failed.length === 0, done, failed, error: failed.length ? `${failed.length} couldn’t be changed: ${failed[0].error}` : undefined });
};
