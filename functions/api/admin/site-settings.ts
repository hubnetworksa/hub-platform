import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';

interface Env {
  DB: D1Database;
}

const EDITABLE_KEYS = [
  'price_verified_cents',
  'price_featured_cents',
  'price_sponsor_category_cents',
  'price_sponsor_suburb_cents',
  'price_sponsor_banner_cents',
  'price_sponsor_centre_cents',
];

// Backs the "Plans & pricing" admin page. These are the only prices the
// whole Premium Listings system reads from (subscribe/start.ts, the
// public Pricing page at the next rebuild, the plan picker on
// list-your-business.astro) — never hardcoded elsewhere.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const rows = await context.env.DB.prepare('SELECT key, value FROM site_settings').all<{ key: string; value: string }>();
  return json({ ok: true, settings: rows.results });
};

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }
  const key = String(body.key ?? '');
  const cents = Number(body.cents);
  if (!EDITABLE_KEYS.includes(key) || !Number.isInteger(cents) || cents < 0) {
    return json({ ok: false, error: 'Invalid key or amount.' }, 400);
  }

  await context.env.DB
    .prepare(`UPDATE site_settings SET value = ?, updated_at = datetime('now') WHERE key = ?`)
    .bind(String(cents), key)
    .run();

  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
