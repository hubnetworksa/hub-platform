import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, type Env } from '../../_lib/sites';
import { jsonBody, str } from '../../_lib/body';
import { logActivity } from '../../_lib/alerts';
import { cityAdmin, cityTokenAction, type CityResult } from '../../_lib/city-api';

// Acts on one Inbox item: POST { site, type, id, action, text? }. Each action
// goes through that site's own endpoint, the same one its admin uses, so
// emails, rebuilds and the site's activity log all happen exactly as before:
//   submission   approve / reject      the review link's endpoint, with the row's token
//   claim        approve / reject      the same, or dismiss (claims over 14 days old)
//   report       resolve
//   message      resolve / reply (text)
//   review       approve / reject
//   event        approve / reject
//   event-claim  approve / reject
const ACTIONS: Record<string, string[]> = {
  submission: ['approve', 'reject'],
  claim: ['approve', 'reject', 'dismiss'],
  report: ['resolve'],
  message: ['resolve', 'reply'],
  review: ['approve', 'reject'],
  event: ['approve', 'reject'],
  'event-claim': ['approve', 'reject'],
};

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const actor = String(context.data.email);
  const body = await jsonBody(context.request);
  const site = hubSites(env).find((s) => s.slug === body?.site);
  const type = String(body?.type ?? '');
  const action = String(body?.action ?? '');
  const id = Number(body?.id);
  if (!body || !site || !ACTIONS[type]?.includes(action) || !Number.isSafeInteger(id) || id <= 0) return json({ ok: false, error: 'Invalid request.' }, 400);
  const db = site.db;
  let r: CityResult;
  let target = '';

  if (type === 'submission') {
    const row = await db.prepare('SELECT name, token FROM pending_submissions WHERE id = ? AND owner_confirm_token IS NULL AND admin_approved_at IS NULL').bind(id).first<{ name: string; token: string }>();
    if (!row) return json({ ok: false, error: 'That listing was already handled.' }, 404);
    target = row.name;
    r = await cityTokenAction(site, '/api/confirm-listing', row.token, action);
  } else if (type === 'claim') {
    const row = await db
      .prepare(`SELECT b.name, bc.review_token AS token FROM business_claims bc JOIN businesses b ON b.id = bc.business_id WHERE bc.id = ? AND bc.status = 'pending'`)
      .bind(id)
      .first<{ name: string; token: string }>();
    if (!row) return json({ ok: false, error: 'That claim was already handled.' }, 404);
    target = row.name;
    r = action === 'dismiss' ? await cityAdmin(env.ADMIN_DB, site, actor, '/api/admin/claims', { id, action: 'dismiss' }) : await cityTokenAction(site, '/api/review-claim', row.token, action);
  } else if (type === 'report') {
    target = (await db.prepare('SELECT business_name FROM reports WHERE id = ?').bind(id).first<{ business_name: string }>())?.business_name ?? '';
    r = await cityAdmin(env.ADMIN_DB, site, actor, '/api/admin/resolve-report', { reportId: id });
  } else if (type === 'message') {
    const row = await db.prepare('SELECT COALESCE(business_name, name, contact) AS t FROM messages WHERE id = ?').bind(id).first<{ t: string }>();
    target = row?.t ?? '';
    if (action === 'reply') {
      const text = str(body.text, 5000);
      if (text.length < 2) return json({ ok: false, error: 'Write a reply first.' }, 400);
      r = await cityAdmin(env.ADMIN_DB, site, actor, '/api/admin/messages', { id, action: 'reply', text });
    } else r = await cityAdmin(env.ADMIN_DB, site, actor, '/api/admin/messages', { id, action: 'resolve' });
  } else if (type === 'review') {
    target = (await db.prepare('SELECT b.name FROM reviews r JOIN businesses b ON b.id = r.business_id WHERE r.id = ?').bind(id).first<{ name: string }>())?.name ?? '';
    r = await cityAdmin(env.ADMIN_DB, site, actor, '/api/admin/reviews', { id, action });
  } else if (type === 'event') {
    target = (await db.prepare('SELECT title FROM event_submissions WHERE id = ?').bind(id).first<{ title: string }>())?.title ?? '';
    r = await cityAdmin(env.ADMIN_DB, site, actor, '/api/admin/events', { id, action: `${action}-submission` });
  } else {
    target = (await db.prepare('SELECT e.title FROM event_claims ec JOIN events e ON e.id = ec.event_id WHERE ec.id = ?').bind(id).first<{ title: string }>())?.title ?? '';
    r = await cityAdmin(env.ADMIN_DB, site, actor, '/api/admin/event-claims', { id, action });
  }

  if (!r.ok) return json({ ok: false, error: r.error || `${site.name} said no (${r.status}).` }, 502);
  await logActivity(env.ADMIN_DB, actor, site.slug, `${type.replace('-', '_')}_${action}`, target || null);
  const heading = (r.body as { heading?: string } | undefined)?.heading;
  return json({ ok: true, message: heading || 'Done.' });
};
