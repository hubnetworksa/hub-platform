import { b64url, ipHash, recordFailure, safeEqual, sha256, tooManyAttempts } from './auth';
import type { Env } from './sites';

// The morning-briefing routine's key. Only its SHA-256 is in the repo
// (BRIEFING_KEY_HASH in wrangler.jsonc); the key itself lives only in the
// routine's prompt on the owner's Claude account.
export async function briefingKeyOk(request: Request, env: Env): Promise<'ok' | 'denied' | 'limited'> {
  const db = env.ADMIN_DB;
  const ip = await ipHash(request);
  if (await tooManyAttempts(db, 'briefing-key', ip, 10, 60)) return 'limited';
  const expected = typeof env.BRIEFING_KEY_HASH === 'string' ? env.BRIEFING_KEY_HASH : '';
  const given = request.headers.get('X-Briefing-Key') ?? '';
  if (expected.length < 40 || !given || given.length > 100 || !safeEqual(b64url(await sha256(given)), expected)) {
    await recordFailure(db, 'briefing-key', ip);
    return 'denied';
  }
  return 'ok';
}
