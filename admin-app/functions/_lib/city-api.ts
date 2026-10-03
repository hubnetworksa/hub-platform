import type { D1Database } from '@cloudflare/workers-types';
import { b64url } from './auth';
import type { HubSite } from './sites';

// Hub Admin acts on a city site's admin API by signing each request with its
// own private key (ECDSA P-256), generated here on first use and kept only in
// this app's database (settings 'city_key'). The city sites hold the public
// half (functions/_lib/hub-admin-auth.ts in the main repo) and accept a
// signature once, within 2 minutes, and only for /api/admin/ paths.

interface KeyPair {
  privateJwk: JsonWebKey;
  publicJwk: JsonWebKey;
}

async function keyPair(db: D1Database): Promise<KeyPair> {
  const row = await db.prepare(`SELECT value FROM settings WHERE key = 'city_key'`).first<{ value: string }>();
  if (row) return JSON.parse(row.value) as KeyPair;
  const kp = (await crypto.subtle.generateKey({ name: 'ECDSA', namedCurve: 'P-256' }, true, ['sign', 'verify'])) as CryptoKeyPair;
  const pair: KeyPair = {
    privateJwk: (await crypto.subtle.exportKey('jwk', kp.privateKey)) as JsonWebKey,
    publicJwk: (await crypto.subtle.exportKey('jwk', kp.publicKey)) as JsonWebKey,
  };
  // INSERT OR IGNORE + re-read, so two first calls at once agree on one key.
  await db.prepare(`INSERT OR IGNORE INTO settings (key, value) VALUES ('city_key', ?)`).bind(JSON.stringify(pair)).run();
  const again = await db.prepare(`SELECT value FROM settings WHERE key = 'city_key'`).first<{ value: string }>();
  return JSON.parse(again!.value) as KeyPair;
}

/** The public half, for the city sites' code. */
export async function cityPublicKey(db: D1Database): Promise<JsonWebKey> {
  const { publicJwk } = await keyPair(db);
  return { kty: publicJwk.kty, crv: publicJwk.crv, x: publicJwk.x, y: publicJwk.y };
}

async function sha256Hex(data: Uint8Array): Promise<string> {
  return [...new Uint8Array(await crypto.subtle.digest('SHA-256', data))].map((b) => b.toString(16).padStart(2, '0')).join('');
}

export interface CityResult {
  ok: boolean;
  status: number;
  error?: string;
  body?: unknown;
}

/** POSTs JSON to a city's admin API as Hub Admin, signed. */
export async function cityAdmin(db: D1Database, site: HubSite, actor: string, path: string, payload: unknown): Promise<CityResult> {
  if (!path.startsWith('/api/admin/')) throw new Error('Only admin API paths can be signed.');
  const { privateJwk } = await keyPair(db);
  const key = await crypto.subtle.importKey('jwk', privateJwk, { name: 'ECDSA', namedCurve: 'P-256' }, false, ['sign']);
  const body = new TextEncoder().encode(JSON.stringify(payload));
  const time = String(Math.floor(Date.now() / 1000));
  const who = actor.replace(/[^A-Za-z0-9._-]/g, '').slice(0, 40) || 'hub-admin';
  const message = `hub-admin-v1\nPOST\n${site.domain}\n${path}\n${time}\n${who}\n${await sha256Hex(body)}`;
  const sig = b64url(new Uint8Array(await crypto.subtle.sign({ name: 'ECDSA', hash: 'SHA-256' }, key, new TextEncoder().encode(message))));
  let res: Response;
  try {
    res = await fetch(`https://${site.domain}${path}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'X-Hub-Admin-Time': time, 'X-Hub-Admin-Actor': who, 'X-Hub-Admin-Signature': sig },
      body,
    });
  } catch {
    return { ok: false, status: 0, error: `${site.name} didn’t answer.` };
  }
  const out = (await res.json().catch(() => null)) as { ok?: boolean; error?: string } | null;
  if (res.status === 403 && !out?.error) return { ok: false, status: 403, error: `${site.name} didn’t accept Hub Admin’s signature (has the site been redeployed with Hub Admin’s key?).` };
  return { ok: res.ok && out?.ok !== false, status: res.status, error: out?.error, body: out };
}

/** The emailed-link actions (approve a listing / claim) take the row's own token, like the review email. */
export async function cityTokenAction(site: HubSite, path: string, token: string, action: string): Promise<CityResult> {
  let res: Response;
  try {
    res = await fetch(`https://${site.domain}${path}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: new URLSearchParams({ token, action }),
    });
  } catch {
    return { ok: false, status: 0, error: `${site.name} didn’t answer.` };
  }
  // These answer with a small HTML page; its heading says what happened.
  const html = await res.text();
  const heading = (html.match(/<h1[^>]*>([\s\S]*?)<\/h1>/i)?.[1] ?? '').replace(/<[^>]+>/g, '').trim();
  const para = (html.match(/<p[^>]*>([\s\S]*?)<\/p>/i)?.[1] ?? '').replace(/<[^>]+>/g, '').trim();
  const failed = !res.ok || /couldn|expired|already handled|not found/i.test(heading);
  return { ok: !failed, status: res.status, error: failed ? `${heading}${para ? `: ${para}` : ''}` || `HTTP ${res.status}` : undefined, body: { heading, message: para } };
}
