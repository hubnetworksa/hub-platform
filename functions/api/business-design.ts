import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../_lib/auth';
import { triggerRebuild } from '../_lib/deploy-hook';
import { logActivity } from '../_lib/activity-log';
import { BLOCK_TYPES, GRID_COLUMNS, BG_STYLES, TEXT_COLORS, FONT_STYLES, SPACING_STYLES } from '../../src/lib/blockRenderer';
import type { BlockLayout, BlockStyle } from '../../src/lib/blockRenderer';

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
}

async function loadOwned(db: D1Database, businessId: number, userId: number, isAdmin: boolean): Promise<BusinessRow | null> {
  const row = await db
    .prepare(
      `SELECT id, name, owner_user_id, subscription_tier, subscription_status, template_id, custom_blocks, draft_template_id, draft_blocks, draft_updated_at
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

// The builder is Premium (4) only — the block editor itself. Template
// *choice* (not the builder) is Featured (3) and up, unchanged from before.
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

  const liveBlocks = row.custom_blocks ? JSON.parse(row.custom_blocks) : [];
  const draftBlocks = blocks ? JSON.parse(blocks) : [];
  const hasUnpublishedChanges = row.draft_blocks !== null && row.draft_blocks !== row.custom_blocks;

  return json({
    ok: true,
    tier,
    canChooseTemplate: tier >= TIER_TEMPLATE,
    canUseBuilder: tier >= TIER_BUILDER,
    templateId,
    liveTemplateId: row.template_id,
    blocks: draftBlocks,
    liveBlocks,
    hasUnpublishedChanges,
    draftUpdatedAt: row.draft_updated_at,
  });
};

function clamp(n: unknown, min: number, max: number, fallback: number): number {
  const v = Number(n);
  return Number.isFinite(v) ? Math.min(max, Math.max(min, Math.round(v))) : fallback;
}

function sanitizeLayout(input: unknown, index: number): BlockLayout {
  if (typeof input !== 'object' || input === null) return { row: index + 1, col: 0, w: GRID_COLUMNS };
  const l = input as Record<string, unknown>;
  return {
    row: clamp(l.row, 1, 500, index + 1),
    col: clamp(l.col, 0, GRID_COLUMNS - 1, 0),
    w: clamp(l.w, 1, GRID_COLUMNS, GRID_COLUMNS),
  };
}

function sanitizeStyle(input: unknown): BlockStyle | undefined {
  if (typeof input !== 'object' || input === null) return undefined;
  const s = input as Record<string, unknown>;
  const style: BlockStyle = {};
  if (typeof s.bg === 'string' && s.bg in BG_STYLES) style.bg = s.bg as BlockStyle['bg'];
  if (typeof s.color === 'string' && s.color in TEXT_COLORS) style.color = s.color as BlockStyle['color'];
  if (typeof s.font === 'string' && s.font in FONT_STYLES) style.font = s.font as BlockStyle['font'];
  if (typeof s.spacing === 'string' && s.spacing in SPACING_STYLES) style.spacing = s.spacing as BlockStyle['spacing'];
  return Object.keys(style).length ? style : undefined;
}

function sanitizeBlocks(input: unknown): { type: string; title: string; body: string; imageKey?: string; layout?: BlockLayout; style?: BlockStyle }[] {
  if (!Array.isArray(input)) return [];
  return input
    .slice(0, 10)
    .filter((b): b is Record<string, unknown> => typeof b === 'object' && b !== null)
    .map((b, i) => ({
      type: (BLOCK_TYPES as readonly string[]).includes(String(b.type)) ? String(b.type) : 'story',
      title: typeof b.title === 'string' ? b.title.slice(0, 60) : '',
      body: typeof b.body === 'string' ? b.body.slice(0, 800) : '',
      ...(typeof b.imageKey === 'string' ? { imageKey: b.imageKey.slice(0, 300) } : {}),
      layout: sanitizeLayout(b.layout, i),
      ...(sanitizeStyle(b.style) ? { style: sanitizeStyle(b.style) } : {}),
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
    const templateId = typeof body.templateId === 'string' && ['classic', 'gallery', 'services'].includes(body.templateId) ? body.templateId : row.template_id;
    // A business below Premium can still hold template_id via Featured,
    // but the block list only ever comes from a Premium builder session —
    // never trust a lapsed/lower tier's request to write blocks.
    const blocks = tier >= TIER_BUILDER ? sanitizeBlocks(body.blocks) : (row.draft_blocks ? JSON.parse(row.draft_blocks) : []);
    await db
      .prepare(`UPDATE businesses SET draft_template_id = ?, draft_blocks = ?, draft_updated_at = datetime('now') WHERE id = ?`)
      .bind(templateId, JSON.stringify(blocks), businessId)
      .run();
    return json({ ok: true, draftUpdatedAt: new Date().toISOString() });
  }

  if (action === 'publish') {
    const templateId = row.draft_template_id ?? row.template_id;
    const blocks = row.draft_blocks ?? row.custom_blocks ?? '[]';
    await db
      .prepare(`UPDATE businesses SET template_id = ?, custom_blocks = ?, updated_at = datetime('now') WHERE id = ?`)
      .bind(templateId, blocks, businessId)
      .run();
    await triggerRebuild(context.env.GITHUB_DISPATCH_TOKEN);
    await logActivity(db, 'design_published', row.name, 'Owner published page design changes.');
    return json({ ok: true });
  }

  if (action === 'revert') {
    await db
      .prepare(`UPDATE businesses SET draft_template_id = ?, draft_blocks = ?, draft_updated_at = datetime('now') WHERE id = ?`)
      .bind(row.template_id, row.custom_blocks, businessId)
      .run();
    return json({ ok: true });
  }

  return json({ ok: false, error: 'Unknown action.' }, 400);
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
