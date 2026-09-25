// Constant-time string comparison for secrets (cron secrets, webhook
// tokens, confirmation tokens). A plain `a === b` short-circuits on the
// first differing character, which leaks the length of the matching prefix
// to anyone who can time the response — enough, over enough requests, to
// recover a secret one character at a time.

/** Constant-time compare. The lengths are compared up front (an
 *  unavoidable leak without hashing — use safeEqualDigest where the
 *  secret's own length is worth hiding too), then every character position
 *  is XORed with no early exit. */
export function safeEqual(a: string, b: string): boolean {
  if (typeof a !== 'string' || typeof b !== 'string') return false;
  let diff = a.length ^ b.length;
  const len = Math.max(a.length, b.length);
  for (let i = 0; i < len; i++) {
    diff |= (a.charCodeAt(i) || 0) ^ (b.charCodeAt(i) || 0);
  }
  return diff === 0;
}

/** Same guarantee, but over SHA-256 digests so the comparison loop is a
 *  fixed 32 bytes whatever the inputs' lengths are. */
export async function safeEqualDigest(a: string, b: string): Promise<boolean> {
  const enc = new TextEncoder();
  const [da, dbn] = await Promise.all([
    crypto.subtle.digest('SHA-256', enc.encode(a)),
    crypto.subtle.digest('SHA-256', enc.encode(b)),
  ]);
  const va = new Uint8Array(da);
  const vb = new Uint8Array(dbn);
  let diff = 0;
  for (let i = 0; i < va.length; i++) diff |= va[i] ^ vb[i];
  return diff === 0;
}
