import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { b64url, sha256, validUsername, type AdminUser } from '../../_lib/auth';
import { jsonBody, str } from '../../_lib/body';
import { originOf } from '../../_lib/request';

const INVITE_HOURS = 48;

// Creates a one-time invite link for a new admin (POST { username }), or
// cancels the pending invites for a username (POST { username, revoke: true }).
// The token is in the link's #fragment, so it never reaches server logs.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  const me = context.data.user as AdminUser;
  const b = (await jsonBody(context.request)) ?? {};
  const username = str(b.username, 60);
  if (b.revoke) {
    await db.prepare('DELETE FROM admin_invites WHERE username = ? AND used_at IS NULL').bind(username).run();
    return json({ ok: true });
  }
  if (!validUsername(username)) return json({ ok: false, error: 'Usernames are 3–60 characters: letters, numbers, dot, dash, underscore or @.' }, 400);
  const taken = await db.prepare('SELECT 1 FROM admin_users WHERE username = ?').bind(username).first();
  if (taken) return json({ ok: false, error: `There’s already an admin called “${username}”.` }, 409);
  const pending = await db.prepare(`SELECT COUNT(*) AS n FROM admin_invites WHERE used_at IS NULL AND expires_at > ?`).bind(new Date().toISOString()).first<{ n: number }>();
  if ((pending?.n ?? 0) >= 10) return json({ ok: false, error: 'Too many open invites. Cancel some first.' }, 400);
  const token = b64url(crypto.getRandomValues(new Uint8Array(32)));
  const expires = new Date(Date.now() + INVITE_HOURS * 3600000).toISOString();
  await db.batch([
    // One live invite per username: a new link replaces the old one.
    db.prepare('DELETE FROM admin_invites WHERE username = ? AND used_at IS NULL').bind(username),
    db.prepare('INSERT INTO admin_invites (token_hash, username, created_by, expires_at) VALUES (?, ?, ?, ?)').bind(b64url(await sha256(token)), username, me.id, expires),
  ]);
  return json({ ok: true, link: `${originOf(context.request).origin}/#/join?t=${token}`, expires_at: expires });
};
