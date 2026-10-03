import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../../_lib/sites';
import type { AdminUser } from '../../../_lib/auth';
import { newChallenge, userHandle, ES256, RS256 } from '../../../_lib/webauthn';
import { originOf } from '../../../_lib/request';

// Options for adding a passkey on this device (signed in).
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  const user = context.data.user as AdminUser;
  const existing = (await db.prepare('SELECT id FROM passkeys WHERE user_id = ?').bind(user.id).all<{ id: string }>()).results ?? [];
  return json({
    ok: true,
    options: {
      challenge: await newChallenge(db, 'register', user.id),
      rp: { id: originOf(context.request).rpId, name: 'Hub Admin' },
      user: { id: await userHandle(user.id), name: user.username, displayName: user.username },
      pubKeyCredParams: [
        { type: 'public-key', alg: ES256 },
        { type: 'public-key', alg: RS256 },
      ],
      excludeCredentials: existing.map((e) => ({ type: 'public-key', id: e.id })),
      authenticatorSelection: { residentKey: 'required', requireResidentKey: true, userVerification: 'required' },
      attestation: 'none',
      timeout: 120000,
    },
  });
};
