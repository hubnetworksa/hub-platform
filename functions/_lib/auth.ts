import type { D1Database } from '@cloudflare/workers-types';
import { DEMO_ADMIN_ENABLED } from './demo-flags';

// Password hashing via PBKDF2-SHA256 (Workers' native crypto.subtle) — no
// external dependency needed. Stored as "iterations:saltHex:hashHex" so the
// iteration count can be bumped later without invalidating existing hashes
// (needsRehash + login.ts upgrade old hashes on the next login). 100k is the
// ceiling: Cloudflare Workers' crypto.subtle throws for PBKDF2 above 100,000
// iterations, so raising this would break every signup and login.
const PBKDF2_ITERATIONS = 100_000;

function toHex(buf: ArrayBuffer | Uint8Array): string {
  return [...new Uint8Array(buf)].map((b) => b.toString(16).padStart(2, '0')).join('');
}

function fromHex(hex: string): Uint8Array {
  const bytes = new Uint8Array(hex.length / 2);
  for (let i = 0; i < bytes.length; i++) bytes[i] = parseInt(hex.slice(i * 2, i * 2 + 2), 16);
  return bytes;
}

async function pbkdf2(password: string, salt: Uint8Array, iterations: number): Promise<ArrayBuffer> {
  const keyMaterial = await crypto.subtle.importKey('raw', new TextEncoder().encode(password), 'PBKDF2', false, ['deriveBits']);
  return crypto.subtle.deriveBits({ name: 'PBKDF2', salt, iterations, hash: 'SHA-256' }, keyMaterial, 256);
}

export async function hashPassword(password: string): Promise<string> {
  const salt = crypto.getRandomValues(new Uint8Array(16));
  const hash = await pbkdf2(password, salt, PBKDF2_ITERATIONS);
  return `${PBKDF2_ITERATIONS}:${toHex(salt)}:${toHex(hash)}`;
}

// Constant-time comparison of two hex strings — a plain === leaks, through
// how long it takes to fail, how many leading characters matched.
function hexEquals(a: string, b: string): boolean {
  if (a.length !== b.length) return false;
  let diff = 0;
  for (let i = 0; i < a.length; i++) diff |= a.charCodeAt(i) ^ b.charCodeAt(i);
  return diff === 0;
}

export async function verifyPassword(password: string, stored: string): Promise<boolean> {
  const [iterationsStr, saltHex, hashHex] = stored.split(':');
  const iterations = Number(iterationsStr);
  if (!iterations || !saltHex || !hashHex) return false;
  const hash = await pbkdf2(password, fromHex(saltHex), iterations);
  return hexEquals(toHex(hash), hashHex);
}

/** True when `stored` was made with fewer iterations than we now use. */
export function needsRehash(stored: string): boolean {
  const iterations = Number(stored.split(':')[0]);
  return !iterations || iterations < PBKDF2_ITERATIONS;
}

/** A single-use secret for an emailed link: 32 random bytes, hex-encoded. */
export function randomToken(): string {
  return toHex(crypto.getRandomValues(new Uint8Array(32)));
}

/** Only the SHA-256 of a link token is stored, so a database copy can't be
 *  replayed as a live password-reset or verification link. */
export async function hashToken(token: string): Promise<string> {
  return toHex(await crypto.subtle.digest('SHA-256', new TextEncoder().encode(token)));
}

const SESSION_COOKIE = 'session';
const SESSION_DAYS = 30;

export async function createSession(db: D1Database, userId: number): Promise<string> {
  const token = crypto.randomUUID();
  const expiresAt = new Date(Date.now() + SESSION_DAYS * 24 * 60 * 60 * 1000).toISOString();
  await db.prepare('INSERT INTO sessions (user_id, token, expires_at) VALUES (?, ?, ?)').bind(userId, token, expiresAt).run();
  return token;
}

export function sessionCookie(token: string): string {
  return `${SESSION_COOKIE}=${token}; HttpOnly; Secure; SameSite=Lax; Path=/; Max-Age=${SESSION_DAYS * 24 * 60 * 60}`;
}

export function clearSessionCookie(): string {
  return `${SESSION_COOKIE}=; HttpOnly; Secure; SameSite=Lax; Path=/; Max-Age=0`;
}

export function readSessionToken(request: Request): string | null {
  return readCookie(request, SESSION_COOKIE);
}

// Issues a fresh session and drops whatever session the request arrived with,
// so a session id fixed by an attacker before login can't survive it.
export async function rotateSession(db: D1Database, request: Request, userId: number): Promise<string> {
  const previous = readSessionToken(request);
  if (previous) await db.prepare('DELETE FROM sessions WHERE token = ?').bind(previous).run();
  return createSession(db, userId);
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

export interface SessionUser {
  id: number;
  email: string;
}

// Single hardcoded admin account shared across all 3 sites — matches how
// the rest of this project is already consolidated onto one Cloudflare/
// Google account (hubnetworksa@gmail.com), rather than a per-site admin.
const ADMIN_EMAIL = 'hubnetworksa@gmail.com';

// A second, clearly-labeled demo admin account (admin@admin.com / "admin")
// for trying out the admin console on the dev preview without the real
// credentials. Deliberately weak (a fixed, guessable password), so it is only
// honoured when DEMO_ADMIN_ENABLED is true — which only the Ethan preview
// workflow sets (see functions/_lib/demo-flags.ts). Production deploys ignore
// it even though its user row exists in the shared database; delete that row
// before launch.
const DEMO_ADMIN_EMAIL = 'admin@admin.com';

export function isAdminEmail(email: string): boolean {
  const lower = email.toLowerCase();
  return lower === ADMIN_EMAIL || (DEMO_ADMIN_ENABLED && lower === DEMO_ADMIN_EMAIL);
}

// Reads the session cookie, validates it against D1, and returns the user —
// or null if there's no cookie, it's unknown, or expired. Lazily deletes
// expired rows on the way out rather than running a separate cleanup job.
export async function getSessionUser(request: Request, db: D1Database): Promise<SessionUser | null> {
  const token = readCookie(request, SESSION_COOKIE);
  if (!token) return null;

  const row = await db
    .prepare('SELECT users.id AS id, users.email AS email, sessions.expires_at AS expires_at FROM sessions JOIN users ON users.id = sessions.user_id WHERE sessions.token = ?')
    .bind(token)
    .first<{ id: number; email: string; expires_at: string }>();

  if (!row) return null;
  if (new Date(row.expires_at).getTime() < Date.now()) {
    await db.prepare('DELETE FROM sessions WHERE token = ?').bind(token).run();
    return null;
  }
  // Now and then sweep every expired row, not just the one that was touched —
  // sessions belonging to people who never come back are otherwise never
  // cleaned up.
  if (Math.random() < 0.02) await db.prepare(`DELETE FROM sessions WHERE datetime(expires_at) < datetime('now')`).run();
  return { id: row.id, email: row.email };
}
