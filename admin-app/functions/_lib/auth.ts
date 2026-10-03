import type { D1Database } from '@cloudflare/workers-types';

// Hub Admin's own login: username + password (PBKDF2-SHA256, salted, the same
// strength as the city sites' accounts) and passkeys (see webauthn.ts).
// Sessions live in a __Host- cookie (HTTPS only, this exact host, not
// readable by scripts); only a SHA-256 of the token is stored.

const PBKDF2_ITERATIONS = 100_000; // Workers' maximum
const SESSION_DAYS = 30;
export const SESSION_COOKIE = '__Host-hub_admin';
export const MIN_PASSWORD = 10;

export function b64url(bytes: ArrayBuffer | Uint8Array): string {
  let s = '';
  for (const b of new Uint8Array(bytes)) s += String.fromCharCode(b);
  return btoa(s).replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
}

export function fromB64url(s: string): Uint8Array {
  const b64 = s.replace(/-/g, '+').replace(/_/g, '/').padEnd(Math.ceil(s.length / 4) * 4, '=');
  return Uint8Array.from(atob(b64), (c) => c.charCodeAt(0));
}

const hex = (buf: ArrayBuffer | Uint8Array) => [...new Uint8Array(buf)].map((b) => b.toString(16).padStart(2, '0')).join('');
const fromHex = (h: string) => Uint8Array.from(h.match(/../g) ?? [], (x) => parseInt(x, 16));

export async function sha256(data: string | Uint8Array): Promise<Uint8Array> {
  return new Uint8Array(await crypto.subtle.digest('SHA-256', typeof data === 'string' ? new TextEncoder().encode(data) : data));
}

/** Constant-time comparison (no early exit that leaks how much matched). */
export function safeEqual(a: string, b: string): boolean {
  let diff = a.length ^ b.length;
  for (let i = 0; i < Math.max(a.length, b.length); i++) diff |= (a.charCodeAt(i) || 0) ^ (b.charCodeAt(i) || 0);
  return diff === 0;
}

async function pbkdf2(password: string, salt: Uint8Array, iterations: number): Promise<ArrayBuffer> {
  const key = await crypto.subtle.importKey('raw', new TextEncoder().encode(password), 'PBKDF2', false, ['deriveBits']);
  return crypto.subtle.deriveBits({ name: 'PBKDF2', salt, iterations, hash: 'SHA-256' }, key, 256);
}

export async function hashPassword(password: string): Promise<string> {
  const salt = crypto.getRandomValues(new Uint8Array(16));
  return `${PBKDF2_ITERATIONS}:${hex(salt)}:${hex(await pbkdf2(password, salt, PBKDF2_ITERATIONS))}`;
}

export async function verifyPassword(password: string, stored: string): Promise<boolean> {
  const [it, salt, hash] = stored.split(':');
  if (!Number(it) || !salt || !hash) return false;
  return safeEqual(hex(await pbkdf2(password, fromHex(salt), Number(it))), hash);
}

// A fixed hash to check against when the username doesn't exist, so a wrong
// username takes as long as a wrong password (no "which usernames exist" timing).
const DUMMY_HASH = `${PBKDF2_ITERATIONS}:00000000000000000000000000000000:${'0'.repeat(64)}`;
export const dummyVerify = (password: string) => verifyPassword(password, DUMMY_HASH);

export function passwordProblem(password: string, username: string): string | null {
  if (password.length < MIN_PASSWORD) return `Use at least ${MIN_PASSWORD} characters.`;
  if (password.length > 200) return 'That password is too long.';
  if (password.toLowerCase().includes(username.toLowerCase())) return 'The password can’t contain the username.';
  return null;
}

export function validUsername(u: string): boolean {
  return /^[a-zA-Z0-9._@-]{3,60}$/.test(u);
}

// ── Sessions ──────────────────────────────────────────────────────────────
export interface AdminUser {
  id: number;
  username: string;
}

function readCookie(request: Request, name: string): string | null {
  for (const part of (request.headers.get('Cookie') ?? '').split(';')) {
    const [k, ...v] = part.trim().split('=');
    if (k === name) return v.join('=');
  }
  return null;
}

/** Starts a session; returns the Set-Cookie header value. */
export async function startSession(db: D1Database, userId: number, method: 'password' | 'passkey'): Promise<string> {
  const token = b64url(crypto.getRandomValues(new Uint8Array(32)));
  const expires = new Date(Date.now() + SESSION_DAYS * 86400000).toISOString();
  await db.batch([
    db.prepare('INSERT INTO admin_sessions (token_hash, user_id, expires_at, method) VALUES (?, ?, ?, ?)').bind(b64url(await sha256(token)), userId, expires, method),
    db.prepare(`UPDATE admin_users SET last_login_at = datetime('now') WHERE id = ?`).bind(userId),
    db.prepare(`DELETE FROM admin_sessions WHERE expires_at < ?`).bind(new Date().toISOString()),
  ]);
  return `${SESSION_COOKIE}=${token}; Path=/; HttpOnly; Secure; SameSite=Lax; Max-Age=${SESSION_DAYS * 86400}`;
}

export const clearSessionCookie = `${SESSION_COOKIE}=; Path=/; HttpOnly; Secure; SameSite=Lax; Max-Age=0`;

export async function sessionUser(request: Request, db: D1Database): Promise<AdminUser | null> {
  const token = readCookie(request, SESSION_COOKIE);
  if (!token || token.length > 100) return null;
  const tokenHash = b64url(await sha256(token));
  const row = await db
    .prepare('SELECT u.id, u.username, s.expires_at, s.last_seen_at FROM admin_sessions s JOIN admin_users u ON u.id = s.user_id WHERE s.token_hash = ?')
    .bind(tokenHash)
    .first<{ id: number; username: string; expires_at: string; last_seen_at: string }>();
  if (!row) return null;
  if (row.expires_at < new Date().toISOString()) {
    await db.prepare('DELETE FROM admin_sessions WHERE token_hash = ?').bind(tokenHash).run();
    return null;
  }
  // Note activity at most every 10 minutes (keeps writes down).
  if (Date.now() - new Date(`${row.last_seen_at.replace(' ', 'T')}Z`).getTime() > 600000) {
    await db.prepare(`UPDATE admin_sessions SET last_seen_at = datetime('now') WHERE token_hash = ?`).bind(tokenHash).run();
  }
  return { id: row.id, username: row.username };
}

export async function endSession(request: Request, db: D1Database): Promise<void> {
  const token = readCookie(request, SESSION_COOKIE);
  if (token) await db.prepare('DELETE FROM admin_sessions WHERE token_hash = ?').bind(b64url(await sha256(token))).run();
}

// ── Rate limiting ─────────────────────────────────────────────────────────
export async function ipHash(request: Request): Promise<string> {
  const ip = request.headers.get('CF-Connecting-IP') ?? 'unknown';
  return b64url(await sha256(`hub-admin:${ip}`)).slice(0, 22);
}

/** True when this IP has had `max` failures of `kind` in the last `minutes`. */
export async function tooManyAttempts(db: D1Database, kind: string, ip: string, max: number, minutes: number): Promise<boolean> {
  const since = new Date(Date.now() - minutes * 60000).toISOString().replace('T', ' ').slice(0, 19);
  const r = await db.prepare('SELECT COUNT(*) AS n FROM auth_attempts WHERE kind = ? AND ip_hash = ? AND created_at > ?').bind(kind, ip, since).first<{ n: number }>();
  return (r?.n ?? 0) >= max;
}

export async function recordFailure(db: D1Database, kind: string, ip: string, username?: string): Promise<void> {
  await db.batch([
    db.prepare('INSERT INTO auth_attempts (kind, ip_hash, username) VALUES (?, ?, ?)').bind(kind, ip, username ?? null),
    db.prepare(`DELETE FROM auth_attempts WHERE created_at < datetime('now', '-2 days')`),
  ]);
}

/** Failures for one username across all IPs in the last hour (slows down guessing from many addresses). */
export async function userFailures(db: D1Database, username: string): Promise<number> {
  const r = await db
    .prepare(`SELECT COUNT(*) AS n FROM auth_attempts WHERE kind = 'login' AND username = ? COLLATE NOCASE AND created_at > datetime('now', '-1 hour')`)
    .bind(username)
    .first<{ n: number }>();
  return r?.n ?? 0;
}
