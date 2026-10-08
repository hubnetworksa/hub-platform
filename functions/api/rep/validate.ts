import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { json, rateLimited } from '../../_lib/messages';
import { getSite } from '../../_lib/site';
import { normalizeRepCode } from '../../_lib/reps';

interface Env {
  DB: D1Database;
  SITE: string;
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const db = context.env.DB;
  const site = getSite(context.env.SITE);
  if (await rateLimited(db, context.request, site.slug, 'rep-validate', 60)) return json({ ok: false, error: 'rate_limited' }, 429);

  const code = normalizeRepCode(new URL(context.request.url).searchParams.get('code'));
  if (!code) return json({ ok: true, valid: false });
  const row = await db
    .prepare('SELECT s.code, s.status, u.email FROM sales_reps s JOIN users u ON u.id = s.user_id WHERE s.code = ?')
    .bind(code)
    .first<{ code: string; status: string; email: string }>();
  if (!row || row.status !== 'active') return json({ ok: true, valid: false });
  const initial = (row.email?.[0] ?? '?').toUpperCase();
  return json({ ok: true, valid: true, code: row.code, label: `Rep ${initial}.` });
};
