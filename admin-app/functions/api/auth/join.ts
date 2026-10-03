import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { b64url, hashPassword, ipHash, passwordProblem, recordFailure, sha256, startSession, tooManyAttempts } from '../../_lib/auth';
import { jsonBody, str } from '../../_lib/body';

// Accepting an invite link.
//   POST { token }            → { username } if the link is valid (to greet them)
//   POST { token, password }  → creates the account and signs them in
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  const ip = await ipHash(context.request);
  if (await tooManyAttempts(db, 'join', ip, 10, 60)) return json({ ok: false, error: 'Too many attempts. Try again in an hour.' }, 429);
  const b = (await jsonBody(context.request)) ?? {};
  const tokenHash = b64url(await sha256(str(b.token, 100)));
  const invite = await db
    .prepare('SELECT username, expires_at FROM admin_invites WHERE token_hash = ? AND used_at IS NULL')
    .bind(tokenHash)
    .first<{ username: string; expires_at: string }>();
  if (!invite || invite.expires_at < new Date().toISOString()) {
    await recordFailure(db, 'join', ip);
    return json({ ok: false, error: 'This invite link has expired or was already used. Ask for a new one.' }, 410);
  }
  if (typeof b.password !== 'string') return json({ ok: true, username: invite.username });
  const problem = passwordProblem(b.password, invite.username);
  if (problem) return json({ ok: false, error: problem }, 400);
  // Mark used first (only one request can win), then create the account.
  const used = await db.prepare(`UPDATE admin_invites SET used_at = datetime('now') WHERE token_hash = ? AND used_at IS NULL`).bind(tokenHash).run();
  if (!used.meta.changes) return json({ ok: false, error: 'This invite link was already used.' }, 410);
  const res = await db.prepare('INSERT OR IGNORE INTO admin_users (username, password_hash) VALUES (?, ?)').bind(invite.username, await hashPassword(b.password)).run();
  if (!res.meta.changes) return json({ ok: false, error: `The username “${invite.username}” is already taken. Ask for a new invite.` }, 409);
  return json({ ok: true, username: invite.username }, 200, { 'Set-Cookie': await startSession(db, Number(res.meta.last_row_id), 'password') });
};
