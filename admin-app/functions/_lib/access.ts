// Cloudflare Access verification. Access sits in front of hub-admin and only
// lets through people on its allow-list; every request it forwards carries a
// signed JWT (Cf-Access-Jwt-Assertion header, also the CF_Authorization
// cookie). This checks that token ourselves on every request, so the app is
// still locked if Access is ever misconfigured, switched off, or bypassed
// (e.g. a preview URL Access doesn't cover):
//   - RS256 signature against the team's published keys
//   - audience = this Access application's AUD tag
//   - issuer = the team domain, not expired
//   - email on ADMIN_EMAILS (a second allow-list, independent of Access)
// Docs: https://developers.cloudflare.com/cloudflare-one/identity/authorization-cookie/validating-json/

interface Jwk {
  kid: string;
  kty: string;
  n: string;
  e: string;
  alg?: string;
}

let certCache: { team: string; keys: Jwk[]; at: number } | null = null;

async function teamKeys(team: string): Promise<Jwk[]> {
  if (certCache && certCache.team === team && Date.now() - certCache.at < 60 * 60 * 1000) return certCache.keys;
  const res = await fetch(`https://${team}/cdn-cgi/access/certs`);
  if (!res.ok) throw new Error(`Access certs ${res.status}`);
  const body = (await res.json()) as { keys: Jwk[] };
  certCache = { team, keys: body.keys, at: Date.now() };
  return body.keys;
}

function b64urlBytes(s: string): Uint8Array {
  const b64 = s.replace(/-/g, '+').replace(/_/g, '/').padEnd(Math.ceil(s.length / 4) * 4, '=');
  return Uint8Array.from(atob(b64), (c) => c.charCodeAt(0));
}

function b64urlJson<T>(s: string): T {
  return JSON.parse(new TextDecoder().decode(b64urlBytes(s))) as T;
}

function readCookie(request: Request, name: string): string | null {
  for (const part of (request.headers.get('Cookie') ?? '').split(';')) {
    const [k, ...v] = part.trim().split('=');
    if (k === name) return v.join('=');
  }
  return null;
}

export interface AccessConfig {
  team: string;
  aud: string;
  emails: string[];
}

/** The Access settings, or null while any of them is missing (app stays locked). */
export function accessConfig(env: { ACCESS_TEAM_DOMAIN?: string; ACCESS_AUD?: string; ADMIN_EMAILS?: string }): AccessConfig | null {
  const team = (env.ACCESS_TEAM_DOMAIN ?? '').trim().replace(/^https?:\/\//, '').replace(/\/$/, '');
  const aud = (env.ACCESS_AUD ?? '').trim();
  const emails = (env.ADMIN_EMAILS ?? '').split(',').map((e) => e.trim().toLowerCase()).filter(Boolean);
  if (!team || !aud || !emails.length) return null;
  return { team, aud, emails };
}

/** The signed-in admin's email, or null if the request isn't a valid Access login for an allowed person. */
export async function verifiedEmail(request: Request, cfg: AccessConfig): Promise<string | null> {
  const token = request.headers.get('Cf-Access-Jwt-Assertion') ?? readCookie(request, 'CF_Authorization');
  if (!token) return null;
  const parts = token.split('.');
  if (parts.length !== 3) return null;
  try {
    const header = b64urlJson<{ kid?: string; alg?: string }>(parts[0]);
    if (header.alg !== 'RS256' || !header.kid) return null;
    const jwk = (await teamKeys(cfg.team)).find((k) => k.kid === header.kid);
    if (!jwk) return null;
    const key = await crypto.subtle.importKey('jwk', { kty: jwk.kty, n: jwk.n, e: jwk.e, alg: 'RS256', ext: true }, { name: 'RSASSA-PKCS1-v1_5', hash: 'SHA-256' }, false, ['verify']);
    const ok = await crypto.subtle.verify('RSASSA-PKCS1-v1_5', key, b64urlBytes(parts[2]), new TextEncoder().encode(`${parts[0]}.${parts[1]}`));
    if (!ok) return null;
    const claims = b64urlJson<{ aud?: string | string[]; iss?: string; exp?: number; nbf?: number; email?: string }>(parts[1]);
    const now = Math.floor(Date.now() / 1000);
    const auds = Array.isArray(claims.aud) ? claims.aud : [claims.aud];
    if (!auds.includes(cfg.aud)) return null;
    if (claims.iss !== `https://${cfg.team}`) return null;
    if (!claims.exp || claims.exp < now || (claims.nbf && claims.nbf > now + 60)) return null;
    const email = (claims.email ?? '').toLowerCase();
    return cfg.emails.includes(email) ? email : null;
  } catch {
    return null;
  }
}
