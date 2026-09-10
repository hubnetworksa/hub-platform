import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { clearSessionCookie } from '../_lib/auth';

interface Env {
  DB: D1Database;
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const cookieHeader = context.request.headers.get('Cookie') ?? '';
  const match = cookieHeader.split(';').map((p) => p.trim()).find((p) => p.startsWith('session='));
  const token = match?.split('=')[1];
  if (token) await context.env.DB.prepare('DELETE FROM sessions WHERE token = ?').bind(token).run();

  return new Response(JSON.stringify({ ok: true }), {
    headers: { 'Content-Type': 'application/json', 'Set-Cookie': clearSessionCookie() },
  });
};
