import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../../_lib/sites';
import { jsonBody, str } from '../../../_lib/body';
import { verifyAssertion } from '../../../_lib/webauthn';
import { originOf } from '../../../_lib/request';
import { ipHash, recordFailure, startSession } from '../../../_lib/auth';

// Passkey sign-in. Body: { id, clientDataJSON, authenticatorData, signature }
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  const b = (await jsonBody(context.request)) ?? {};
  const { origin, rpId } = originOf(context.request);
  const r = await verifyAssertion(db, { id: str(b.id, 1400), clientDataJSON: str(b.clientDataJSON, 4000), authenticatorData: str(b.authenticatorData, 4000), signature: str(b.signature, 2000) }, origin, rpId);
  if ('error' in r) {
    await recordFailure(db, 'passkey', await ipHash(context.request));
    return json({ ok: false, error: r.error }, 401);
  }
  return json({ ok: true }, 200, { 'Set-Cookie': await startSession(db, r.userId, 'passkey') });
};
