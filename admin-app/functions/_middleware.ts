import type { PagesFunction } from '@cloudflare/workers-types';
import { sessionUser } from './_lib/auth';
import type { Env } from './_lib/sites';

// Gates the admin app with its own login (username + password, or a passkey).
//   - The app's files (HTML, CSS, JS, icons) load without a session: they
//     hold no data, and the sign-in screen is part of the app.
//   - /api/* needs a valid session, except the sign-in endpoints below and
//     the notifier trigger (which checks its own key).
//   - Anything that changes data must also carry X-Hub-Admin: 1. The app's
//     own pages send it; another website can't add a custom header to a
//     request without a CORS preflight this app never answers, so a
//     signed-in admin's browser can't be used to change things from elsewhere.
const PUBLIC_API = new Set([
  '/api/auth/state',
  '/api/auth/setup',
  '/api/auth/login',
  '/api/auth/recover',
  '/api/auth/join',
  '/api/auth/passkey/login-options',
  '/api/auth/passkey/login',
  '/api/notify/run',
  '/api/notify/report',
  '/api/briefing/facts',
  '/api/briefing/submit',
]);

export const onRequest: PagesFunction<Env> = async (context) => {
  const { request } = context;
  const url = new URL(request.url);
  const isApi = url.pathname.startsWith('/api/');

  if (request.method !== 'GET' && request.method !== 'HEAD' && request.headers.get('X-Hub-Admin') !== '1') {
    return withHeaders(new Response(JSON.stringify({ ok: false, error: 'Missing app header.' }), { status: 403, headers: { 'Content-Type': 'application/json' } }));
  }

  if (isApi && !PUBLIC_API.has(url.pathname)) {
    const user = await sessionUser(request, context.env.ADMIN_DB);
    if (!user) return withHeaders(new Response(JSON.stringify({ ok: false, signedOut: true, error: 'Please sign in.' }), { status: 401, headers: { 'Content-Type': 'application/json' } }));
    context.data.user = user;
    context.data.email = user.username; // recorded as "created by" / device owner
  }

  return withHeaders(await context.next());
};

function withHeaders(res: Response): Response {
  const out = new Response(res.body, res);
  out.headers.set('X-Frame-Options', 'DENY');
  out.headers.set('X-Content-Type-Options', 'nosniff');
  out.headers.set('Referrer-Policy', 'no-referrer');
  out.headers.set('X-Robots-Tag', 'noindex, nofollow');
  out.headers.set('Permissions-Policy', 'camera=(), microphone=(), geolocation=(), publickey-credentials-get=(self), publickey-credentials-create=(self)');
  out.headers.set(
    'Content-Security-Policy',
    "default-src 'self'; img-src 'self' data:; style-src 'self' 'unsafe-inline'; script-src 'self'; connect-src 'self'; frame-ancestors 'none'; base-uri 'none'; form-action 'self'"
  );
  return out;
}
