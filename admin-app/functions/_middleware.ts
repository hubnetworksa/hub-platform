import type { PagesFunction } from '@cloudflare/workers-types';
import { accessConfig, verifiedEmail } from './_lib/access';
import type { Env } from './_lib/sites';

// Gates every request to the admin app: pages, scripts, icons and API alike.
// Fails closed: with Access not yet configured (ACCESS_TEAM_DOMAIN,
// ACCESS_AUD, ADMIN_EMAILS unset), nothing but the "locked" notice is served.
export const onRequest: PagesFunction<Env> = async (context) => {
  const url = new URL(context.request.url);
  const isApi = url.pathname.startsWith('/api/');
  const cfg = accessConfig(context.env);
  if (!cfg) return locked(isApi, 'Hub Admin is locked until Cloudflare Access is set up for it.', 503);

  const email = await verifiedEmail(context.request, cfg);
  if (!email) return locked(isApi, 'You need to sign in with an allowed account to use Hub Admin.', 401);

  context.data.email = email;
  const res = await context.next();
  const out = new Response(res.body, res);
  out.headers.set('X-Frame-Options', 'DENY');
  out.headers.set('X-Content-Type-Options', 'nosniff');
  out.headers.set('Referrer-Policy', 'no-referrer');
  out.headers.set('X-Robots-Tag', 'noindex, nofollow');
  out.headers.set(
    'Content-Security-Policy',
    "default-src 'self'; img-src 'self' data:; style-src 'self' 'unsafe-inline'; script-src 'self'; connect-src 'self'; frame-ancestors 'none'; base-uri 'none'; form-action 'self'"
  );
  return out;
};

function locked(isApi: boolean, message: string, status: number): Response {
  const headers = { 'Cache-Control': 'no-store', 'X-Robots-Tag': 'noindex, nofollow', 'X-Frame-Options': 'DENY' };
  if (isApi) return new Response(JSON.stringify({ ok: false, error: message }), { status, headers: { ...headers, 'Content-Type': 'application/json' } });
  const html = `<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Hub Admin</title><meta name="robots" content="noindex"></head>
<body style="margin:0;min-height:100vh;display:flex;align-items:center;justify-content:center;background:#0f1b3d;color:#fff;font-family:system-ui,-apple-system,'Segoe UI',sans-serif;padding:24px;text-align:center">
<div style="max-width:380px"><div style="font-size:40px">🔒</div><h1 style="font-size:22px;margin:12px 0 8px">Hub Admin</h1>
<p style="opacity:.8;line-height:1.5;margin:0">${message}</p></div></body></html>`;
  return new Response(html, { status, headers: { ...headers, 'Content-Type': 'text/html; charset=utf-8' } });
}
