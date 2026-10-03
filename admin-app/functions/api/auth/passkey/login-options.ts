import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../../_lib/sites';
import { newChallenge } from '../../../_lib/webauthn';
import { originOf } from '../../../_lib/request';
import { ipHash, tooManyAttempts } from '../../../_lib/auth';

// Options for signing in with a passkey. No username needed: the device
// offers the passkeys it holds for this app.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  if (await tooManyAttempts(db, 'passkey', await ipHash(context.request), 20, 15)) return json({ ok: false, error: 'Too many attempts. Wait 15 minutes.' }, 429);
  return json({ ok: true, options: { challenge: await newChallenge(db, 'login', null), rpId: originOf(context.request).rpId, userVerification: 'required', timeout: 120000 } });
};
