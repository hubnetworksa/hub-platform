import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../_lib/auth';
import { triggerRebuild } from '../_lib/deploy-hook';
import { logActivity } from '../_lib/activity-log';
import { BLOCK_TYPES, MIN_BLOCK_HEIGHT, MAX_BLOCK_HEIGHT, MIN_COL_SPAN, MAX_COL_SPAN } from '../../src/lib/blockRenderer';

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
  custom_blocks: string | null;
  draft_template_id: string | null;
  draft_blocks: string | null;
  draft_updated_at: string | null;
  page_colors: string | null;
  draft_page_colors: string | null;
}

async function loadOwned(db: D1Database, businessId: number, userId: number, isAdmin: boolean): Promise<BusinessRow | null> {
  const row = await db
    .prepare(
      `SELECT id, name, owner_user_id, subscription_tier, subscription_status, template_id, custom_blocks, draft_template_id, draft_blocks, draft_updated_at, page_colors, draft_page_colors
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

// Extra sections (Premium, 4) and up. Template *choice* (not sections) is
// Featured (3) and up, unchanged.
const TIER_BUILDER = 4;
const TIER_TEMPLATE = 3;

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user) return json({ ok: false }, 401);

  const businessId = Number(new URL(context.request.url).searchParams.get('businessId'));
  const row = businessId && (await loadOwned(db, businessId, user.id, isAdminEmail(user.email)));
  if (!row) return json({ ok: false, error: 'You do not own this business.' }, 403);

  const tier = tierOf(row);
  // No draft started yet — seed the response from the live/published
  // values so the builder opens showing what's actually live.
  const templateId = row.draft_template_id ?? row.template_id;
  const blocks = row.draft_blocks ?? row.custom_blocks;
  const pageColors = row.draft_page_colors ?? row.page_colors;

  // Defensive: drop any leftover "core" kind item (the page's fixed
  // info, briefly stored as a movable block during an earlier build of
  // this feature that's since been reverted) rather than hand the client
  // something it no longer knows how to render.
  const dropStrayCoreItems = (arr: unknown): unknown[] => (Array.isArray(arr) ? arr.filter((b) => !(b && typeof b === 'object' && (b as { kind?: string }).kind === 'core')) : []);
  const liveBlocks = dropStrayCoreItems(row.custom_blocks ? JSON.parse(row.custom_blocks) : []);
  const draftBlocks = dropStrayCoreItems(blocks ? JSON.parse(blocks) : []);
  const livePageColors = row.page_colors ? JSON.parse(row.page_colors) : {};
  const draftPageColors = pageColors ? JSON.parse(pageColors) : {};
  const hasUnpublishedChanges =
    (row.draft_template_id !== null && row.draft_template_id !== row.template_id) ||
    (row.draft_blocks !== null && row.draft_blocks !== row.custom_blocks) ||
    (row.draft_page_colors !== null && row.draft_page_colors !== row.page_colors);

  return json({
    ok: true,
    tier,
    canChooseTemplate: tier >= TIER_TEMPLATE,
    canUseBuilder: tier >= TIER_BUILDER,
    templateId,
    liveTemplateId: row.template_id,
    blocks: draftBlocks,
    liveBlocks,
    pageColors: draftPageColors,
    livePageColors,
    hasUnpublishedChanges,
    draftUpdatedAt: row.draft_updated_at,
  });
};

const HEX_COLOR = /^#[0-9a-f]{6}$|^#[0-9a-f]{3}$/i;

// Owner-chosen page-wide colors — a raw hex value, not a fixed palette key,
// since this is a genuine color picker. Only three keys exist; anything
// else in the request body is ignored.
function sanitizePageColors(input: unknown): Record<string, string> {
  if (typeof input !== 'object' || input === null) return {};
  const s = input as Record<string, unknown>;
  const out: Record<string, string> = {};
  for (const key of ['primary', 'secondary', 'background']) {
    const v = s[key];
    if (typeof v === 'string' && HEX_COLOR.test(v)) out[key] = v;
  }
  return out;
}

type SanitizedBlock = { type: string; title: string; body: string; imageKey?: string; side?: 'left' | 'right'; heightPx?: number; colSpan?: number; bleed?: 'full' | 'left' | 'right' };

function sanitizeBlocks(input: unknown): SanitizedBlock[] {
  if (!Array.isArray(input)) return [];
  return input
    .slice(0, 10)
    .filter((b): b is Record<string, unknown> => typeof b === 'object' && b !== null)
    .map((b): SanitizedBlock => ({
      type: (BLOCK_TYPES as readonly string[]).includes(String(b.type)) ? String(b.type) : 'story',
      title: typeof b.title === 'string' ? b.title.slice(0, 60) : '',
      body: typeof b.body === 'string' ? b.body.slice(0, 800) : '',
      ...(typeof b.imageKey === 'string' ? { imageKey: b.imageKey.slice(0, 300) } : {}),
      ...(b.side === 'left' || b.side === 'right' ? { side: b.side } : {}),
      ...(typeof b.heightPx === 'number' && Number.isFinite(b.heightPx)
        ? { heightPx: Math.round(Math.min(MAX_BLOCK_HEIGHT, Math.max(MIN_BLOCK_HEIGHT, b.heightPx))) }
        : {}),
      ...(typeof b.colSpan === 'number' && Number.isFinite(b.colSpan)
        ? { colSpan: Math.round(Math.min(MAX_COL_SPAN, Math.max(MIN_COL_SPAN, b.colSpan))) }
        : {}),
      ...(b.bleed === 'full' || b.bleed === 'left' || b.bleed === 'right' ? { bleed: b.bleed } : {}),
    }));
}

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
    // Sections/colors autosave from the business page itself and template
    // autosave from customize.astro are two separate callers that never
    // send all three fields at once — omitting one must preserve whatever
    // is already in the draft (falling back to live only if no draft
    // exists yet), never silently reset it to the live value.
    const templateId = typeof body.templateId === 'string' && ['classic', 'gallery', 'services'].includes(body.templateId) ? body.templateId : (row.draft_template_id ?? row.template_id);
    // A business below Premium can still hold template_id via Featured,
    // but sections and page colors only ever come from a Premium session —
    // never trust a lapsed/lower tier's request to write them.
    const blocks = tier >= TIER_BUILDER ? sanitizeBlocks(body.blocks) : (row.draft_blocks ? JSON.parse(row.draft_blocks) : []);
    const pageColors = tier >= TIER_BUILDER ? sanitizePageColors(body.pageColors) : (row.draft_page_colors ? JSON.parse(row.draft_page_colors) : {});
    await db
      .prepare(`UPDATE businesses SET draft_template_id = ?, draft_blocks = ?, draft_page_colors = ?, draft_updated_at = datetime('now') WHERE id = ?`)
      .bind(templateId, JSON.stringify(blocks), JSON.stringify(pageColors), businessId)
      .run();
    return json({ ok: true, draftUpdatedAt: new Date().toISOString() });
  }

  if (action === 'publish') {
    const templateId = row.draft_template_id ?? row.template_id;
    const blocks = row.draft_blocks ?? row.custom_blocks ?? '[]';
    const pageColors = row.draft_page_colors ?? row.page_colors ?? '{}';
    await db
      .prepare(`UPDATE businesses SET template_id = ?, custom_blocks = ?, page_colors = ?, updated_at = datetime('now') WHERE id = ?`)
      .bind(templateId, blocks, pageColors, businessId)
      .run();
    await triggerRebuild(context.env.GITHUB_DISPATCH_TOKEN);
    await logActivity(db, 'design_published', row.name, 'Owner published page design changes.');
    return json({ ok: true });
  }

  if (action === 'revert') {
    await db
      .prepare(`UPDATE businesses SET draft_template_id = ?, draft_blocks = ?, draft_page_colors = ?, draft_updated_at = datetime('now') WHERE id = ?`)
      .bind(row.template_id, row.custom_blocks, row.page_colors, businessId)
      .run();
    return json({ ok: true });
  }

  return json({ ok: false, error: 'Unknown action.' }, 400);
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
