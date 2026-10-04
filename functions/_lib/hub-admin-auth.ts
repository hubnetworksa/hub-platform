import type { D1Database } from '@cloudflare/workers-types';

// Lets Hub Admin (hub-admin-b4x.pages.dev, admin-app/) act on this site's
// admin API (approve a review, resolve a report, reply to a message, hide a
// listing, ...) without an admin browser session. Hub Admin signs each
// request with its private key (ECDSA P-256, kept only in Hub Admin's own
// database); this is the matching public key, so nothing secret is in the
// repository.
//
// A signed request carries:
//   X-Hub-Admin-Time       unix seconds (must be within 2 minutes of now)
//   X-Hub-Admin-Actor      the Hub Admin username (for logs)
//   X-Hub-Admin-Signature  base64url ES256 signature (raw r||s) over
//     "hub-admin-v1\n<METHOD>\n<host>\n<path+query>\n<time>\n<actor>\n<sha256 hex of the body>"
// It's only accepted for /api/admin/ paths, and each signature works once.
// Rotating the key: delete the 'city_key' setting in hub-admin-db, open
// https://hub-admin-b4x.pages.dev/api/city-key, paste the new key below and
// redeploy the sites.
export const HUB_ADMIN_PUBLIC_KEY: JsonWebKey | null = {
  kty: 'EC',
  crv: 'P-256',
  x: 'vzQaKbmd1zJ-3QOCGygKcq70m6HieF0pJN9pkQITE_I',
  y: 'Fi5pEDMy-Qayxf_Epa6U1hvs_5bfX0nZNysAFXApDUs',
};

const MAX_SKEW_S = 120;

function fromB64url(s: string): Uint8Array {
  const b = atob(s.replace(/-/g, '+').replace(/_/g, '/') + '==='.slice((s.length + 3) % 4));
  return Uint8Array.from(b, (c) => c.charCodeAt(0));
}

async function sha256Hex(data: ArrayBuffer | Uint8Array): Promise<string> {
  return [...new Uint8Array(await crypto.subtle.digest('SHA-256', data))].map((b) => b.toString(16).padStart(2, '0')).join('');
}

// Imported keys, by their x coordinate (one in practice).
const keys = new Map<string, Promise<CryptoKey>>();

/** True when the request is a valid, fresh, unused Hub Admin signature for an admin API path. */
export async function verifyHubAdminRequest(request: Request, db: D1Database, publicKey: JsonWebKey | null = HUB_ADMIN_PUBLIC_KEY): Promise<boolean> {
  if (!publicKey) return false;
  const url = new URL(request.url);
  if (!url.pathname.startsWith('/api/admin/')) return false;
  const time = request.headers.get('X-Hub-Admin-Time') ?? '';
  const actor = request.headers.get('X-Hub-Admin-Actor') ?? '';
  const sig = request.headers.get('X-Hub-Admin-Signature') ?? '';
  if (!/^\d{9,11}$/.test(time) || !/^[A-Za-z0-9._-]{1,40}$/.test(actor) || !/^[A-Za-z0-9_-]{80,100}$/.test(sig)) return false;
  if (Math.abs(Date.now() / 1000 - Number(time)) > MAX_SKEW_S) return false;
  const body = request.method === 'GET' || request.method === 'HEAD' ? new Uint8Array() : new Uint8Array(await request.clone().arrayBuffer());
  const message = `hub-admin-v1\n${request.method}\n${url.host}\n${url.pathname}${url.search}\n${time}\n${actor}\n${await sha256Hex(body)}`;
  try {
    const id = String(publicKey.x);
    if (!keys.has(id)) keys.set(id, crypto.subtle.importKey('jwk', publicKey, { name: 'ECDSA', namedCurve: 'P-256' }, false, ['verify']));
    const ok = await crypto.subtle.verify({ name: 'ECDSA', hash: 'SHA-256' }, await keys.get(id)!, fromB64url(sig), new TextEncoder().encode(message));
    if (!ok) return false;
  } catch {
    keys.delete(String(publicKey.x));
    return false;
  }
  // One use per signature: remember it for longer than the time window
  // (rate_limits already has an index on action + ip_hash + created_at).
  const tag = sig.slice(0, 43);
  const seen = await db
    .prepare(`SELECT 1 FROM rate_limits WHERE action = 'hub-admin-sig' AND ip_hash = ? AND created_at > datetime('now', '-10 minutes')`)
    .bind(tag)
    .first();
  if (seen) return false;
  await db.prepare(`INSERT INTO rate_limits (action, ip_hash) VALUES ('hub-admin-sig', ?)`).bind(tag).run();
  return true;
}
