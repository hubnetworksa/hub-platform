import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../../_lib/sites';
import type { AdminUser } from '../../../_lib/auth';
import { jsonBody, str } from '../../../_lib/body';
import { verifyRegistration } from '../../../_lib/webauthn';
import { originOf } from '../../../_lib/request';

// Saves a new passkey after the device created it. Body: { rawId, clientDataJSON,
// authenticatorData, publicKey, publicKeyAlgorithm, name }
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  const user = context.data.user as AdminUser;
  const b = (await jsonBody(context.request)) ?? {};
  const { origin, rpId } = originOf(context.request);
  const r = await verifyRegistration(
    db,
    { rawId: str(b.rawId, 1400), clientDataJSON: str(b.clientDataJSON, 4000), authenticatorData: str(b.authenticatorData, 4000), publicKey: str(b.publicKey, 2000), publicKeyAlgorithm: Number(b.publicKeyAlgorithm) },
    user.id,
    origin,
    rpId
  );
  if ('error' in r) return json({ ok: false, error: r.error }, 400);
  const count = await db.prepare('SELECT COUNT(*) AS n FROM passkeys WHERE user_id = ?').bind(user.id).first<{ n: number }>();
  if ((count?.n ?? 0) >= 20) return json({ ok: false, error: 'You already have 20 passkeys. Remove one first.' }, 400);
  await db
    .prepare('INSERT INTO passkeys (id, user_id, public_key, alg, sign_count, name) VALUES (?, ?, ?, ?, ?, ?)')
    .bind(r.id, user.id, r.publicKey, r.alg, r.signCount, str(b.name, 60) || 'Passkey')
    .run();
  return json({ ok: true, id: r.id });
};
