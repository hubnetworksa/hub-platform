import type { PagesFunction } from '@cloudflare/workers-types';

interface Env {
  GOOGLE_OAUTH_CLIENT_ID: string;
}

// Kicks off the OAuth Authorization Code flow. The CSRF `state` value is
// stored in a short-lived cookie and re-checked in callback.ts against the
// value Google echoes back in the redirect. Each site has its own separate
// Google OAuth Client (its own CLIENT_ID/SECRET secrets) since the redirect
// URI is domain-specific.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  if (!context.env.GOOGLE_OAUTH_CLIENT_ID) {
    return new Response('Google sign-in is not configured yet.', { status: 503 });
  }

  // `next` is folded into `state` (not just CSRF-checked) so the redirect
  // survives the round trip to Google and back without a second cookie.
  // Only ever a same-site path (validated again in callback.ts), never an
  // absolute URL, to avoid becoming an open redirect.
  const nextParam = new URL(context.request.url).searchParams.get('next');
  const next = nextParam && /^\/(?![\/\\])/.test(nextParam) ? nextParam : '/my-businesses/';
  const csrf = crypto.randomUUID();
  const state = `${csrf}|${next}`;
  const redirectUri = `${new URL(context.request.url).origin}/api/auth/google/callback`;

  const params = new URLSearchParams({
    client_id: context.env.GOOGLE_OAUTH_CLIENT_ID,
    redirect_uri: redirectUri,
    response_type: 'code',
    scope: 'openid email',
    state,
    prompt: 'select_account',
  });

  return new Response(null, {
    status: 302,
    headers: {
      Location: `https://accounts.google.com/o/oauth2/v2/auth?${params.toString()}`,
      'Set-Cookie': `oauth_state=${csrf}; HttpOnly; Secure; SameSite=Lax; Path=/; Max-Age=600`,
    },
  });
};
