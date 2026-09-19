import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { logActivity } from '../../_lib/activity-log';

interface Env {
  DB: D1Database;
}

// Money settings — stored as integer cents.
const PRICE_KEYS = [
  'price_verified_cents',
  'price_featured_cents',
  'price_sponsor_category_cents',
  'price_sponsor_suburb_cents',
  'price_sponsor_banner_cents',
  'price_sponsor_centre_cents',
  'price_event_feature_cents',
  // Rate-card entries for the two display-ad placements that don't have a
  // sponsorship product of their own (the homepage in-content and suburb
  // sidebar placements reuse price_sponsor_banner_cents / _suburb_cents).
  'price_ad_search_cents',
  'price_ad_profile_cents',
];

// Text overrides for the "Site settings" admin tab. Applied to the public
// site at the next build (src/lib/site-overrides.ts reads them out of the
// site_settings snapshot). An empty value removes the override.
const TEXT_KEYS: Record<string, number> = {
  site_name: 60,
  site_city_label: 40,
  site_footer_tagline: 160,
};

// Global display-ads switch: '1' on, '0' off (unset = on).
const FLAG_KEYS = ['ads_enabled'];

// Backs the "Plans & pricing", "Ads & sponsors" and "Site settings" admin
// pages. Prices are the only prices the whole Premium Listings system reads
// from (subscribe/start.ts, the public Pricing page at the next rebuild,
// the plan picker on list-your-business.astro) — never hardcoded elsewhere.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const rows = await context.env.DB.prepare('SELECT key, value FROM site_settings').all<{ key: string; value: string }>();
  return json({ ok: true, settings: rows.results });
};

async function upsert(db: D1Database, key: string, value: string): Promise<void> {
  // INSERT OR REPLACE so keys that don't exist yet (everything but the
  // original six prices) get created on first save.
  await db.prepare(`INSERT OR REPLACE INTO site_settings (key, value, updated_at) VALUES (?, ?, datetime('now'))`).bind(key, value).run();
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  let body: Record<string, unknown>;
  try {
    body = await context.request.json();
  } catch {
    return json({ ok: false, error: 'Invalid request body.' }, 400);
  }

  // Reset the text overrides back to the values in this site's config.
  if (body.action === 'reset') {
    const keys = Object.keys(TEXT_KEYS);
    await db.prepare(`DELETE FROM site_settings WHERE key IN (${keys.map(() => '?').join(',')})`).bind(...keys).run();
    await logActivity(db, 'settings_reset', null, `Site text overrides cleared by admin (${user.email}).`);
    return json({ ok: true });
  }

  // Bulk save of the Site settings tab's three text fields.
  if (body.action === 'save-text' && body.values && typeof body.values === 'object') {
    const values = body.values as Record<string, unknown>;
    for (const [key, raw] of Object.entries(values)) {
      const max = TEXT_KEYS[key];
      if (!max) return json({ ok: false, error: 'Unknown setting.' }, 400);
      const text = typeof raw === 'string' ? raw.trim() : '';
      if (text.length > max) return json({ ok: false, error: `That's too long (max ${max} characters).` }, 400);
      if (!text) await db.prepare('DELETE FROM site_settings WHERE key = ?').bind(key).run();
      else await upsert(db, key, text);
    }
    await logActivity(db, 'settings_saved', null, `Site text settings saved by admin (${user.email}).`);
    return json({ ok: true });
  }

  const key = String(body.key ?? '');

  if (FLAG_KEYS.includes(key)) {
    await upsert(db, key, body.value === '0' || body.value === false || body.value === 0 ? '0' : '1');
    await logActivity(db, 'settings_saved', null, `${key} set to ${body.value === '0' || body.value === false || body.value === 0 ? 'off' : 'on'} by admin (${user.email}).`);
    return json({ ok: true });
  }

  const cents = Number(body.cents);
  if (!PRICE_KEYS.includes(key) || !Number.isInteger(cents) || cents < 0) {
    return json({ ok: false, error: 'Invalid key or amount.' }, 400);
  }

  await upsert(db, key, String(cents));
  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
