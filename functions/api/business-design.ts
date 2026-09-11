import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../_lib/auth';
import { triggerRebuild } from '../_lib/deploy-hook';
import { logActivity } from '../_lib/activity-log';
import { sanitizeOwnerHtml } from '../_lib/sanitize-html';

interface Env {
  DB: D1Database;
  GITHUB_DISPATCH_TOKEN?: string;
}

interface BusinessRow {
  id: number;
  name: string;
  owner_user_id: number | null;
  subscription_tier: number;
  subscription_status: string | null;
  template_id: string;
  draft_template_id: string | null;
  page_design: string | null;
  draft_page_design: string | null;
  page_html: string | null;
  page_css: string | null;
  draft_updated_at: string | null;
}

async function loadOwned(db: D1Database, businessId: number, userId: number, isAdmin: boolean): Promise<BusinessRow | null> {
  const row = await db
    .prepare(
      `SELECT id, name, owner_user_id, subscription_tier, subscription_status, template_id, draft_template_id,
              page_design, draft_page_design, page_html, page_css, draft_updated_at
       FROM businesses WHERE id = ?`
    )
    .bind(businessId)
    .first<BusinessRow>();
  if (!row || (row.owner_user_id !== userId && !isAdmin)) return null;
  return row;
}

function tierOf(row: BusinessRow): number {
  return row.subscription_status === 'active' ? row.subscription_tier : 0;
}

// The full free-form builder is Premium (4) only. Template *choice* (not
// the builder) is Featured (3) and up — a business that later upgrades to
// Premium leaves template_id behind entirely; the builder is its own page
// design regardless of whatever template was last chosen.
const TIER_BUILDER = 4;
const TIER_TEMPLATE = 3;

// Generous but bounded — a real page's design JSON/HTML/CSS is a few KB to
// a few hundred KB; this just guards against something pathological.
const MAX_DESIGN_JSON_LENGTH = 1_500_000;
const MAX_HTML_LENGTH = 400_000;
const MAX_CSS_LENGTH = 300_000;

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false }, 401);

  const businessId = Number(new URL(context.request.url).searchParams.get('businessId'));
  const row = businessId && (await loadOwned(db, businessId, user.id, isAdminEmail(user.email)));
  if (!row) return json({ ok: false, error: 'You do not own this business.' }, 403);

  const tier = tierOf(row);
  const templateId = row.draft_template_id ?? row.template_id;
  // No draft started yet — seed from the live design so the builder opens
  // showing what's actually live.
  const designJson = row.draft_page_design ?? row.page_design;
  const hasUnpublishedChanges =
    (row.draft_template_id !== null && row.draft_template_id !== row.template_id) ||
    (row.draft_page_design !== null && row.draft_page_design !== row.page_design);

  function parseJson(s: string | null): unknown {
    if (!s) return null;
    try {
      return JSON.parse(s);
    } catch {
      return null;
    }
  }
  const pageDesign = parseJson(designJson);
  // Separate from pageDesign above (which is draft-seeded-from-live) —
  // "Revert to published" needs the *actual* live project JSON, not
  // whatever the draft currently holds.
  const livePageDesign = parseJson(row.page_design);

  return json({
    ok: true,
    tier,
    canChooseTemplate: tier >= TIER_TEMPLATE,
    canUseBuilder: tier >= TIER_BUILDER,
    templateId,
    liveTemplateId: row.template_id,
    pageDesign,
    livePageDesign,
    livePageHtml: row.page_html,
    livePageCss: row.page_css,
    hasUnpublishedChanges,
    draftUpdatedAt: row.draft_updated_at,
  });
};

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false }, 401);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  const businessId = Number(body.businessId);
  const action = String(body.action ?? '');
  const row = businessId && (await loadOwned(db, businessId, user.id, isAdminEmail(user.email)));
  if (!row) return json({ ok: false, error: 'You do not own this business.' }, 403);

  const tier = tierOf(row);

  if (action === 'autosave') {
    if (tier < TIER_TEMPLATE) return json({ ok: false, error: 'Not available on your tier.' }, 403);

    if (tier >= TIER_BUILDER) {
      // Below Premium, template_id is a simple three-way choice; the
      // builder is a different, richer thing entirely, so it gets its own
      // branch rather than trying to share validation with the template
      // dropdown below.
      let designJson: string | null = null;
      if (body.pageDesign !== undefined && body.pageDesign !== null) {
        const serialized = JSON.stringify(body.pageDesign);
        if (serialized.length > MAX_DESIGN_JSON_LENGTH) {
          return json({ ok: false, error: 'That page design is too large to save.' }, 400);
        }
        designJson = serialized;
      }
      await db
        .prepare(`UPDATE businesses SET draft_page_design = ?, draft_updated_at = datetime('now') WHERE id = ?`)
        .bind(designJson, businessId)
        .run();
      return json({ ok: true, draftUpdatedAt: new Date().toISOString() });
    }

    const templateId = typeof body.templateId === 'string' && ['classic', 'gallery', 'services'].includes(body.templateId) ? body.templateId : row.template_id;
    await db
      .prepare(`UPDATE businesses SET draft_template_id = ?, draft_updated_at = datetime('now') WHERE id = ?`)
      .bind(templateId, businessId)
      .run();
    return json({ ok: true, draftUpdatedAt: new Date().toISOString() });
  }

  if (action === 'publish') {
    if (tier >= TIER_BUILDER) {
      const rawHtml = typeof body.pageHtml === 'string' ? body.pageHtml.slice(0, MAX_HTML_LENGTH) : '';
      const rawCss = typeof body.pageCss === 'string' ? body.pageCss.slice(0, MAX_CSS_LENGTH) : '';
      const safeHtml = await sanitizeOwnerHtml(rawHtml);
      const designJson = row.draft_page_design ?? row.page_design;
      await db
        .prepare(`UPDATE businesses SET page_design = ?, page_html = ?, page_css = ?, updated_at = datetime('now') WHERE id = ?`)
        .bind(designJson, safeHtml, rawCss, businessId)
        .run();
    } else {
      const templateId = row.draft_template_id ?? row.template_id;
      await db
        .prepare(`UPDATE businesses SET template_id = ?, updated_at = datetime('now') WHERE id = ?`)
        .bind(templateId, businessId)
        .run();
    }
    await triggerRebuild(context.env.GITHUB_DISPATCH_TOKEN);
    await logActivity(db, 'design_published', row.name, 'Owner published page design changes.');
    return json({ ok: true });
  }

  if (action === 'revert') {
    if (tier >= TIER_BUILDER) {
      await db
        .prepare(`UPDATE businesses SET draft_page_design = ?, draft_updated_at = datetime('now') WHERE id = ?`)
        .bind(row.page_design, businessId)
        .run();
    } else {
      await db
        .prepare(`UPDATE businesses SET draft_template_id = ?, draft_updated_at = datetime('now') WHERE id = ?`)
        .bind(row.template_id, businessId)
        .run();
    }
    return json({ ok: true });
  }

  return json({ ok: false, error: 'Unknown action.' }, 400);
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
