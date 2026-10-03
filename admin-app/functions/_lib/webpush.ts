import type { D1Database } from '@cloudflare/workers-types';

// Web Push for Hub Admin, used by the Alerts screen (test pushes) and the
// notifier Worker (new-item pushes).
//
// Pushes are sent WITHOUT a payload: a push only wakes the device, and the
// service worker then fetches what it's about from /api/notifications/latest
// (behind the same Cloudflare Access login). That keeps item details off the
// push services entirely and needs no payload encryption, only the VAPID
// signature (RFC 8292) that proves the push comes from this app.
//
// The VAPID key pair is generated on first use and kept in the admin
// database's settings table, so there is no secret to set up or commit.

const SUBJECT = 'mailto:hubnetworksa@gmail.com';

function b64url(bytes: ArrayBuffer | Uint8Array): string {
  let s = '';
  for (const b of new Uint8Array(bytes)) s += String.fromCharCode(b);
  return btoa(s).replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
}

interface VapidKeys {
  publicKey: string; // uncompressed P-256 point, base64url (what the browser subscribes with)
  privateJwk: JsonWebKey;
}

export async function vapidKeys(db: D1Database): Promise<VapidKeys> {
  const row = await db.prepare(`SELECT value FROM settings WHERE key = 'vapid'`).first<{ value: string }>();
  if (row) return JSON.parse(row.value) as VapidKeys;
  const pair = (await crypto.subtle.generateKey({ name: 'ECDSA', namedCurve: 'P-256' }, true, ['sign', 'verify'])) as CryptoKeyPair;
  const raw = (await crypto.subtle.exportKey('raw', pair.publicKey)) as ArrayBuffer;
  const keys: VapidKeys = { publicKey: b64url(raw), privateJwk: (await crypto.subtle.exportKey('jwk', pair.privateKey)) as JsonWebKey };
  // INSERT OR IGNORE: if two first requests race, both read back the winner.
  await db.prepare(`INSERT OR IGNORE INTO settings (key, value) VALUES ('vapid', ?)`).bind(JSON.stringify(keys)).run();
  const stored = await db.prepare(`SELECT value FROM settings WHERE key = 'vapid'`).first<{ value: string }>();
  return JSON.parse(stored!.value) as VapidKeys;
}

async function vapidHeader(endpoint: string, keys: VapidKeys): Promise<string> {
  const aud = new URL(endpoint).origin;
  const enc = (o: unknown) => b64url(new TextEncoder().encode(JSON.stringify(o)));
  const unsigned = `${enc({ typ: 'JWT', alg: 'ES256' })}.${enc({ aud, exp: Math.floor(Date.now() / 1000) + 12 * 3600, sub: SUBJECT })}`;
  const key = await crypto.subtle.importKey('jwk', keys.privateJwk, { name: 'ECDSA', namedCurve: 'P-256' }, false, ['sign']);
  // WebCrypto returns ECDSA signatures as raw r||s, which is exactly JWS ES256.
  const sig = await crypto.subtle.sign({ name: 'ECDSA', hash: 'SHA-256' }, key, new TextEncoder().encode(unsigned));
  return `vapid t=${unsigned}.${b64url(sig)}, k=${keys.publicKey}`;
}

export interface PushTarget {
  id: number;
  endpoint: string;
}

/** Wakes one device. Returns 'ok', 'gone' (subscription expired: delete it) or 'error'. */
export async function sendPush(target: PushTarget, keys: VapidKeys): Promise<'ok' | 'gone' | 'error'> {
  // Only real push services: a stored endpoint must never turn this into a
  // request to an arbitrary host.
  let host: string;
  try {
    const u = new URL(target.endpoint);
    if (u.protocol !== 'https:') return 'gone';
    host = u.hostname;
  } catch {
    return 'gone';
  }
  const allowed = ['fcm.googleapis.com', 'updates.push.services.mozilla.com', 'web.push.apple.com', 'notify.windows.com'];
  if (!allowed.some((d) => host === d || host.endsWith(`.${d}`))) return 'gone';
  try {
    const res = await fetch(target.endpoint, {
      method: 'POST',
      headers: { TTL: String(24 * 3600), Urgency: 'high', Authorization: await vapidHeader(target.endpoint, keys) },
    });
    if (res.status === 404 || res.status === 410) return 'gone';
    return res.ok ? 'ok' : 'error';
  } catch {
    return 'error';
  }
}

/** Sends to every device whose chosen types overlap `types`; drops dead subscriptions. */
export async function pushToSubscribers(db: D1Database, types: string[]): Promise<{ sent: number; removed: number }> {
  const subs = (await db.prepare('SELECT id, endpoint, types FROM push_subscriptions').all<{ id: number; endpoint: string; types: string }>()).results ?? [];
  const keys = await vapidKeys(db);
  let sent = 0;
  let removed = 0;
  for (const s of subs) {
    let wants: string[] = [];
    try {
      wants = JSON.parse(s.types);
    } catch {
      /* treat as wanting nothing */
    }
    if (types.length && !types.some((t) => wants.includes(t))) continue;
    const r = await sendPush(s, keys);
    if (r === 'ok') {
      sent++;
      await db.prepare(`UPDATE push_subscriptions SET last_sent_at = datetime('now'), fail_count = 0 WHERE id = ?`).bind(s.id).run();
    } else if (r === 'gone') {
      removed++;
      await db.prepare('DELETE FROM push_subscriptions WHERE id = ?').bind(s.id).run();
    } else {
      await db.prepare('UPDATE push_subscriptions SET fail_count = fail_count + 1 WHERE id = ?').bind(s.id).run();
    }
  }
  // A device that has failed many times in a row is almost certainly gone.
  await db.prepare('DELETE FROM push_subscriptions WHERE fail_count >= 20').run();
  return { sent, removed };
}
