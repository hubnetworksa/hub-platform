import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import type { AdminUser } from '../../_lib/auth';
import { jsonBody, str } from '../../_lib/body';

// The signed-in admin's weekly summary email: GET their settings (and whether
// the app can send email at all), POST { email, weekly } to change them.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const me = context.data.user as AdminUser;
  const row = await context.env.ADMIN_DB.prepare('SELECT email, weekly_email FROM admin_users WHERE id = ?').bind(me.id).first<{ email: string | null; weekly_email: number }>();
  return json({ ok: true, email: row?.email ?? '', weekly: !!row?.weekly_email, can_send: !!context.env.RESEND_API_KEY });
};

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const me = context.data.user as AdminUser;
  const body = await jsonBody(context.request);
  if (!body) return json({ ok: false, error: 'Invalid request.' }, 400);
  const email = str(body.email, 200).toLowerCase();
  if (email && !/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.test(email)) return json({ ok: false, error: 'That email address doesn’t look right.' }, 400);
  const weekly = !!body.weekly && !!email;
  await context.env.ADMIN_DB.prepare('UPDATE admin_users SET email = ?, weekly_email = ? WHERE id = ?').bind(email || null, weekly ? 1 : 0, me.id).run();
  return json({ ok: true, email, weekly });
};
