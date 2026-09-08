// Simple HTTP Basic Auth gate for the hosted dev environment — a stopgap
// login page until Cloudflare Access is set up (see SETUP.md "Hosted dev
// environment"). Credentials default to the values the owner gave directly
// (2026-09-08) but can be overridden per Pages project without a code
// change via DEV_AUTH_USER/DEV_AUTH_PASSWORD environment variables
// (Settings → Environment variables — set as a Secret, not a plain var).
const DEFAULT_USER = 'Admin';
const DEFAULT_PASSWORD = 'hubnetwork3010!';

interface AuthEnv {
  DEV_AUTH_USER?: string;
  DEV_AUTH_PASSWORD?: string;
}

export function requireBasicAuth(request: Request, env: AuthEnv): Response | null {
  const expectedUser = env.DEV_AUTH_USER || DEFAULT_USER;
  const expectedPassword = env.DEV_AUTH_PASSWORD || DEFAULT_PASSWORD;
  const expected = 'Basic ' + btoa(`${expectedUser}:${expectedPassword}`);

  if (request.headers.get('Authorization') === expected) {
    return null;
  }

  return new Response('Authentication required.', {
    status: 401,
    headers: { 'WWW-Authenticate': 'Basic realm="Hub Platform Dev"' },
  });
}
