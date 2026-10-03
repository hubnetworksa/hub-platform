import type { D1Database } from '@cloudflare/workers-types';
import { b64url, fromB64url, sha256 } from './auth';

// Passkeys (WebAuthn) for Hub Admin: fingerprint / face unlock on a phone or
// laptop. Registration uses "none" attestation (the browser hands over the
// new public key; we only ever trust it because the person registering is
// already signed in). Every sign-in then proves possession of the matching
// private key, which never leaves the device.
//
// Checks on every ceremony (W3C WebAuthn Level 2, §7.1 and §7.2):
//   clientData.type, a one-time server challenge, the exact origin;
//   authenticatorData RP ID hash = SHA-256(this host); User Present and
//   User Verified flags (the fingerprint/face/PIN actually happened);
//   on sign-in, the signature over authenticatorData || SHA-256(clientData)
//   and the signature counter.

const CHALLENGE_MINUTES = 5;
export const ES256 = -7;
export const RS256 = -257;

export async function newChallenge(db: D1Database, kind: 'register' | 'login', userId: number | null): Promise<string> {
  const challenge = b64url(crypto.getRandomValues(new Uint8Array(32)));
  const expires = new Date(Date.now() + CHALLENGE_MINUTES * 60000).toISOString();
  await db.batch([
    db.prepare('INSERT INTO auth_challenges (challenge, kind, user_id, expires_at) VALUES (?, ?, ?, ?)').bind(challenge, kind, userId, expires),
    db.prepare('DELETE FROM auth_challenges WHERE expires_at < ?').bind(new Date().toISOString()),
  ]);
  return challenge;
}

/** Uses up a challenge; returns it only if it was issued for this kind (and user) and hasn't expired. */
async function takeChallenge(db: D1Database, challenge: string, kind: string, userId: number | null): Promise<boolean> {
  const row = await db.prepare('DELETE FROM auth_challenges WHERE challenge = ? RETURNING kind, user_id, expires_at').bind(challenge).first<{ kind: string; user_id: number | null; expires_at: string }>();
  if (!row || row.kind !== kind || row.expires_at < new Date().toISOString()) return false;
  return userId === null || row.user_id === userId;
}

interface ClientData {
  type: string;
  challenge: string;
  origin: string;
  crossOrigin?: boolean;
}

function parseClientData(b64: string): { raw: Uint8Array; data: ClientData } | null {
  try {
    const raw = fromB64url(b64);
    return { raw, data: JSON.parse(new TextDecoder().decode(raw)) as ClientData };
  } catch {
    return null;
  }
}

interface AuthData {
  rpIdHash: Uint8Array;
  flags: number;
  signCount: number;
  credentialId?: Uint8Array;
}

function parseAuthData(bytes: Uint8Array): AuthData | null {
  if (bytes.length < 37) return null;
  const view = new DataView(bytes.buffer, bytes.byteOffset, bytes.byteLength);
  const out: AuthData = { rpIdHash: bytes.slice(0, 32), flags: bytes[32], signCount: view.getUint32(33) };
  if (out.flags & 0x40) {
    // Attested credential data: aaguid(16) | credIdLen(2) | credId | publicKey(COSE)
    if (bytes.length < 55) return null;
    const len = view.getUint16(53);
    if (bytes.length < 55 + len) return null;
    out.credentialId = bytes.slice(55, 55 + len);
  }
  return out;
}

const UP = 0x01;
const UV = 0x04;

function sameBytes(a: Uint8Array, b: Uint8Array): boolean {
  if (a.length !== b.length) return false;
  let d = 0;
  for (let i = 0; i < a.length; i++) d |= a[i] ^ b[i];
  return d === 0;
}

async function checkCommon(cd: ClientData, type: string, origin: string, authData: AuthData, rpId: string): Promise<string | null> {
  if (cd.type !== type) return 'Wrong ceremony type.';
  if (cd.origin !== origin || cd.crossOrigin) return 'Wrong origin.';
  if (!sameBytes(authData.rpIdHash, await sha256(rpId))) return 'Wrong site.';
  if (!(authData.flags & UP)) return 'You must confirm on the device.';
  if (!(authData.flags & UV)) return 'Your fingerprint, face or device PIN is required.';
  return null;
}

async function importKey(spki: Uint8Array, alg: number): Promise<CryptoKey> {
  if (alg === ES256) return crypto.subtle.importKey('spki', spki, { name: 'ECDSA', namedCurve: 'P-256' }, false, ['verify']);
  if (alg === RS256) return crypto.subtle.importKey('spki', spki, { name: 'RSASSA-PKCS1-v1_5', hash: 'SHA-256' }, false, ['verify']);
  throw new Error('Unsupported key type.');
}

/** WebAuthn ES256 signatures are ASN.1 DER; WebCrypto wants raw r||s (32+32 bytes). */
function derToRaw(der: Uint8Array): Uint8Array | null {
  try {
    let i = 0;
    if (der[i++] !== 0x30) return null;
    if (der[i] & 0x80) i += (der[i] & 0x7f) + 1;
    else i++;
    const out = new Uint8Array(64);
    for (let part = 0; part < 2; part++) {
      if (der[i++] !== 0x02) return null;
      const len = der[i++];
      let v = der.slice(i, i + len);
      i += len;
      while (v.length > 32 && v[0] === 0) v = v.slice(1);
      if (v.length > 32) return null;
      out.set(v, part * 32 + (32 - v.length));
    }
    return out;
  } catch {
    return null;
  }
}

export interface RegistrationInput {
  rawId: string;
  clientDataJSON: string;
  authenticatorData: string;
  publicKey: string; // SPKI from response.getPublicKey()
  publicKeyAlgorithm: number;
}

export async function verifyRegistration(db: D1Database, input: RegistrationInput, userId: number, origin: string, rpId: string): Promise<{ id: string; publicKey: string; alg: number; signCount: number } | { error: string }> {
  const cd = parseClientData(input.clientDataJSON);
  if (!cd) return { error: 'Invalid response.' };
  let authBytes: Uint8Array;
  let spki: Uint8Array;
  let rawId: Uint8Array;
  try {
    authBytes = fromB64url(input.authenticatorData);
    spki = fromB64url(input.publicKey);
    rawId = fromB64url(input.rawId);
  } catch {
    return { error: 'Invalid response.' };
  }
  const ad = parseAuthData(authBytes);
  if (!ad || !ad.credentialId) return { error: 'Invalid response.' };
  if (!(await takeChallenge(db, cd.data.challenge, 'register', userId))) return { error: 'This request expired. Please try again.' };
  const problem = await checkCommon(cd.data, 'webauthn.create', origin, ad, rpId);
  if (problem) return { error: problem };
  if (!sameBytes(ad.credentialId, rawId) || rawId.length < 16 || rawId.length > 1023) return { error: 'Invalid credential.' };
  if (input.publicKeyAlgorithm !== ES256 && input.publicKeyAlgorithm !== RS256) return { error: 'This device’s key type isn’t supported.' };
  try {
    await importKey(spki, input.publicKeyAlgorithm);
  } catch {
    return { error: 'Invalid key.' };
  }
  return { id: b64url(rawId), publicKey: b64url(spki), alg: input.publicKeyAlgorithm, signCount: ad.signCount };
}

export interface AssertionInput {
  id: string;
  clientDataJSON: string;
  authenticatorData: string;
  signature: string;
}

export async function verifyAssertion(db: D1Database, input: AssertionInput, origin: string, rpId: string): Promise<{ userId: number; passkeyId: string } | { error: string }> {
  const cd = parseClientData(input.clientDataJSON);
  if (!cd || typeof input.id !== 'string' || input.id.length > 1400) return { error: 'Invalid response.' };
  if (!(await takeChallenge(db, cd.data.challenge, 'login', null))) return { error: 'This sign-in request expired. Please try again.' };
  const pk = await db.prepare('SELECT id, user_id, public_key, alg, sign_count FROM passkeys WHERE id = ?').bind(input.id).first<{ id: string; user_id: number; public_key: string; alg: number; sign_count: number }>();
  if (!pk) return { error: 'This passkey isn’t registered (it may have been removed). Sign in with your password.' };
  let authBytes: Uint8Array;
  let sig: Uint8Array;
  try {
    authBytes = fromB64url(input.authenticatorData);
    sig = fromB64url(input.signature);
  } catch {
    return { error: 'Invalid response.' };
  }
  const ad = parseAuthData(authBytes);
  if (!ad) return { error: 'Invalid response.' };
  const problem = await checkCommon(cd.data, 'webauthn.get', origin, ad, rpId);
  if (problem) return { error: problem };
  const signed = new Uint8Array(authBytes.length + 32);
  signed.set(authBytes);
  signed.set(await sha256(cd.raw), authBytes.length);
  const key = await importKey(fromB64url(pk.public_key), pk.alg);
  let ok = false;
  if (pk.alg === ES256) {
    const raw = derToRaw(sig);
    ok = !!raw && (await crypto.subtle.verify({ name: 'ECDSA', hash: 'SHA-256' }, key, raw, signed));
  } else {
    ok = await crypto.subtle.verify('RSASSA-PKCS1-v1_5', key, sig, signed);
  }
  if (!ok) return { error: 'The passkey signature didn’t check out.' };
  // A counter that goes backwards means a cloned key; 0 means the device doesn't count (common for synced passkeys).
  if (ad.signCount !== 0 && pk.sign_count !== 0 && ad.signCount <= pk.sign_count) return { error: 'This passkey looks like a copy. Sign in with your password.' };
  await db.prepare(`UPDATE passkeys SET sign_count = ?, last_used_at = datetime('now') WHERE id = ?`).bind(ad.signCount, pk.id).run();
  return { userId: pk.user_id, passkeyId: pk.id };
}

/** Stable, non-identifying WebAuthn user handle for an account. */
export async function userHandle(userId: number): Promise<string> {
  return b64url((await sha256(`hub-admin-user:${userId}`)).slice(0, 16));
}
