import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { logActivity } from '../../_lib/activity-log';
import { requestRebuild } from '../../_lib/deploy-hook';
import { safeEqual } from '../../_lib/timing';
import { allSites, type Site } from '../../_lib/site';
import { slugify } from '../../../src/lib/slug';
import { CATEGORY_GROUPS } from '../../../src/lib/categoryGroups';
import { KNOWN_SCHEMA_TYPES, DEFAULT_SCHEMA_TYPE } from '../../../src/lib/categorySchemaTypes';

interface Env {
  DB: D1Database;
  SITE: string;
  CRON_SECRET?: string;
  GITHUB_DISPATCH_TOKEN?: string;
  REBUILD_WORKFLOW?: string;
  REBUILD_REF?: string;
}

interface CategoryRow {
  id: number;
  slug: string;
  name: string;
  group_name: string | null;
  schema_type: string | null;
}

// Lets the admin add a category from the admin dashboard — no developer,
// no code change (see db/migrations/<city>/*_category_group_schema.sql for
// why that's possible now: group_name/schema_type live on the categories
// row itself, with src/lib/categoryGroups.ts / categorySchemaTypes.ts as
// the fallback for every category that predates those columns).
//
// Each of the 3 sites is its own Cloudflare Pages project with its own D1
// and no shared admin session, so a category added on one site's dashboard
// doesn't just appear on the other two — propagateToSisterSites() below
// fans the same create out to their own /api/admin/categories over HTTPS,
// authenticated with CRON_SECRET (same bearer-token pattern already used
// for the cross-job endpoints, see process-owner-reminders.ts and
// resend-owner-confirm.ts). A propagated request (CRON_SECRET auth, not an
// admin session) never re-propagates — only the original human submission
// fans out, so three sites can't end up calling each other in a loop.

type Actor = { kind: 'admin'; email: string } | { kind: 'cron' };

// 401 for "no credentials at all" (no session cookie, no Authorization
// header, or a wrong/garbled bearer token — there's nothing to tell apart
// there), 403 for "a real session, just not the admin's" — matches
// getSessionUser/isAdminEmail's usual two-step check elsewhere.
type AuthResult = { ok: true; actor: Actor } | { ok: false; status: 401 | 403 };

async function authorise(request: Request, env: Env): Promise<AuthResult> {
  const auth = request.headers.get('Authorization') ?? '';
  if (auth) {
    if (env.CRON_SECRET && safeEqual(auth, `Bearer ${env.CRON_SECRET}`)) return { ok: true, actor: { kind: 'cron' } };
    return { ok: false, status: 401 };
  }
  const user = await getSessionUser(request, env.DB);
  if (!user) return { ok: false, status: 401 };
  if (!isAdminEmail(user.email)) return { ok: false, status: 403 };
  return { ok: true, actor: { kind: 'admin', email: user.email } };
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const auth = await authorise(context.request, context.env);
  if (!auth.ok) return json({ ok: false }, auth.status);
  // GET is only ever used by the admin UI itself, never the cross-site
  // propagation (that's POST-only) — still fine to allow a CRON_SECRET GET,
  // it just never happens in practice.

  const rows = await context.env.DB
    .prepare('SELECT id, slug, name, group_name, schema_type FROM categories ORDER BY name')
    .all<CategoryRow>();

  // Known groups to offer in the admin UI's dropdown: every DB group_name
  // actually in use on this site, union categoryGroups.ts's hardcoded
  // section names (a category added here might as well slot into one of
  // those existing, already-iconed sections rather than always minting a
  // new one).
  const groupNames = new Set<string>(CATEGORY_GROUPS.map((g) => g.name));
  for (const row of rows.results) {
    if (row.group_name) groupNames.add(row.group_name);
  }

  return json({
    ok: true,
    categories: rows.results,
    groups: [...groupNames].sort((a, b) => a.localeCompare(b)),
    schemaTypes: KNOWN_SCHEMA_TYPES,
  });
};

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const auth = await authorise(context.request, context.env);
  if (!auth.ok) return json({ ok: false, error: auth.status === 403 ? 'Admin access required.' : 'Not signed in.' }, auth.status);
  const actor = auth.actor;

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  const db = context.env.DB;

  const name = typeof body.name === 'string' ? body.name.trim() : '';
  if (!name) return json({ ok: false, error: 'Name is required.' }, 400);
  if (name.length > 80) return json({ ok: false, error: 'That name is too long (80 characters max).' }, 400);

  const groupName = typeof body.groupName === 'string' ? body.groupName.trim() : '';
  if (!groupName) return json({ ok: false, error: 'Pick or type a group for this category.' }, 400);
  if (groupName.length > 80) return json({ ok: false, error: 'That group name is too long (80 characters max).' }, 400);

  let schemaType = typeof body.schemaType === 'string' ? body.schemaType.trim() : '';
  if (!schemaType) {
    schemaType = DEFAULT_SCHEMA_TYPE;
  } else if (!KNOWN_SCHEMA_TYPES.includes(schemaType)) {
    return json({ ok: false, error: `Unknown schema type. Pick one of: ${KNOWN_SCHEMA_TYPES.join(', ')}.` }, 400);
  }

  // A propagated create always carries the exact slug the originating site
  // resolved (so the same category has the identical URL on all 3 sites);
  // only a human typing into the admin form on THIS site, with no slug
  // given, gets one auto-generated.
  let slug = typeof body.slug === 'string' ? body.slug.trim().toLowerCase() : '';
  if (!slug) slug = slugify(name);
  if (!/^[a-z0-9-]+$/.test(slug)) {
    return json({ ok: false, error: 'Slug can only contain lowercase letters, numbers and hyphens.' }, 400);
  }

  const existing = await db.prepare('SELECT 1 FROM categories WHERE slug = ?').bind(slug).first();
  if (existing) {
    return json({ ok: false, error: `A category with the slug "${slug}" already exists.` }, 409);
  }

  const inserted = await db
    .prepare('INSERT INTO categories (slug, name, group_name, schema_type) VALUES (?, ?, ?, ?)')
    .bind(slug, name, groupName, schemaType)
    .run();
  const categoryId = inserted.meta.last_row_id as number;

  const actorLabel = actor.kind === 'admin' ? actor.email : 'cross-site propagation (CRON_SECRET)';
  await logActivity(db, 'category_added', name, `Added by ${actorLabel}. Slug: ${slug}. Group: ${groupName}. Schema type: ${schemaType}.`);

  // Every successful insert needs this site's own build to pick the new row
  // up — a rebuild request per site, same as every other admin create that
  // changes public output (see functions/api/admin/events.ts).
  await requestRebuild(context.env, 'category added');

  const category = { id: categoryId, slug, name, group_name: groupName, schema_type: schemaType };

  // Only the original human submission fans out — a propagated request
  // (CRON_SECRET auth) stops here, so the 3 sites can't call each other in
  // a loop.
  if (actor.kind !== 'admin') {
    return json({ ok: true, category });
  }

  const propagated = await propagateToSisterSites(context.env, { name, slug, groupName, schemaType });
  return json({ ok: true, created: context.env.SITE, category, propagated });
};

/** POSTs the same create to the other two sites' own /api/admin/categories,
 *  authenticated as CRON_SECRET (not an admin session — there isn't one on
 *  the other domains). A 409 there (the slug already exists on that site)
 *  is reported as "already existed", not a failure: the goal is "this
 *  category exists on all 3 sites," which is already true in that case. */
async function propagateToSisterSites(
  env: Env,
  payload: { name: string; slug: string; groupName: string; schemaType: string }
): Promise<Record<string, string>> {
  const result: Record<string, string> = {};
  if (!env.CRON_SECRET) {
    // No shared secret configured: can't authenticate to the other sites
    // at all. Don't pretend it worked.
    for (const site of allSites()) {
      if (site.slug !== env.SITE) result[site.slug] = 'failed: CRON_SECRET is not configured on this site';
    }
    return result;
  }

  const others = allSites().filter((s) => s.slug !== env.SITE);

  await Promise.all(
    others.map(async (site: Site) => {
      try {
        const res = await fetch(`https://${site.domain}/api/admin/categories`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${env.CRON_SECRET}` },
          body: JSON.stringify(payload),
        });
        if (res.ok) {
          result[site.slug] = 'created';
        } else if (res.status === 409) {
          result[site.slug] = 'already existed';
        } else {
          const text = await res.text().catch(() => '');
          result[site.slug] = `failed: ${site.domain} responded ${res.status}${text ? ` — ${text.slice(0, 200)}` : ''}`;
        }
      } catch (err) {
        result[site.slug] = `failed: ${err instanceof Error ? err.message : 'network error'}`;
      }
    })
  );

  return result;
}

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
