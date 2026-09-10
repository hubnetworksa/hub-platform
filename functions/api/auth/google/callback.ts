import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { createSession, sessionCookie, isAdminEmail } from '../../../_lib/auth';
import { sendEmail } from '../../../_lib/send-email';
import { getSite } from '../../../_lib/site';

interface Env {
  DB: D1Database;
  SITE: string;
  GOOGLE_OAUTH_CLIENT_ID: string;
  GOOGLE_OAUTH_CLIENT_SECRET: string;
  RESEND_API_KEY?: string;
}

function readCookie(request: Request, name: string): string | null {
  const header = request.headers.get('Cookie');
  if (!header) return null;
  for (const part of header.split(';')) {
    const [k, ...v] = part.trim().split('=');
    if (k === name) return v.join('=');
  }
  return null;
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const url = new URL(context.request.url);
  const code = url.searchParams.get('code');
  const state = url.searchParams.get('state');
  const expectedCsrf = readCookie(context.request, 'oauth_state');
  const [csrf, next] = (state ?? '').split('|');

  if (!code || !state || !expectedCsrf || csrf !== expectedCsrf) {
    return new Response('Sign-in failed — the request expired or was tampered with. Please try again.', { status: 400 });
  }
  const redirectTo = next && next.startsWith('/') ? next : '/my-businesses/';

  const redirectUri = `${url.origin}/api/auth/google/callback`;
  const tokenRes = await fetch('https://oauth2.googleapis.com/token', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({
      code,
      client_id: context.env.GOOGLE_OAUTH_CLIENT_ID,
      client_secret: context.env.GOOGLE_OAUTH_CLIENT_SECRET,
      redirect_uri: redirectUri,
      grant_type: 'authorization_code',
    }),
  });
  if (!tokenRes.ok) return new Response('Sign-in failed — could not exchange code with Google.', { status: 502 });
  const tokenData = await tokenRes.json<{ id_token: string }>();

  // Verify the id_token via Google's tokeninfo endpoint rather than
  // implementing JWKS/RS256 verification by hand — Google explicitly
  // documents this as a valid (if slightly slower) server-side verification
  // path for apps that don't want to manage the signing keys themselves.
  const verifyRes = await fetch(`https://oauth2.googleapis.com/tokeninfo?id_token=${encodeURIComponent(tokenData.id_token)}`);
  if (!verifyRes.ok) return new Response('Sign-in failed — could not verify Google token.', { status: 502 });
  const claims = await verifyRes.json<{ aud: string; sub: string; email: string; email_verified: string }>();

  if (claims.aud !== context.env.GOOGLE_OAUTH_CLIENT_ID || claims.email_verified !== 'true') {
    return new Response('Sign-in failed — token did not verify.', { status: 401 });
  }

  const email = claims.email.toLowerCase();
  const db = context.env.DB;

  let user = await db.prepare('SELECT id FROM users WHERE google_sub = ? OR email = ?').bind(claims.sub, email).first<{ id: number }>();
  if (!user) {
    const insert = await db.prepare('INSERT INTO users (email, google_sub) VALUES (?, ?)').bind(email, claims.sub).run();
    user = { id: insert.meta.last_row_id };
    await sendEmail(context.env, {
      from: `${site.siteName} <${site.contactEmail}>`,
      to: site.contactEmail,
      subject: `New account created: ${email}`,
      text: `A new ${site.siteName} account was just created via Google sign-in: ${email}`,
    });
  } else {
    await db.prepare('UPDATE users SET google_sub = ? WHERE id = ? AND google_sub IS NULL').bind(claims.sub, user.id).run();
  }

  const token = await createSession(db, user.id);
  // The admin account always lands on the admin dashboard, regardless of
  // whatever `next` the login page carried through.
  const finalRedirect = isAdminEmail(email) ? '/admin/' : redirectTo;
  return new Response(null, {
    status: 302,
    headers: {
      Location: finalRedirect,
      'Set-Cookie': sessionCookie(token),
    },
  });
};
