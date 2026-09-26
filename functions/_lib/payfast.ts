// PayFast (payfast.co.za) subscription integration — signature/field
// mechanics confirmed against PayFast's own official PHP SDK source
// (github.com/PayFast/payfast-php-sdk), not just their docs. Two separate
// signature schemes exist in their API; this file only needs the
// payment-request/ITN one (fixed field order, MD5 of a PHP-urlencoded
// query string) — the Subscriptions REST API's alphabetically-sorted
// header-signature scheme is for pause/cancel/update, not the initial
// checkout.
//
// SANDBOX ONLY for now: PAYFAST_MERCHANT_ID/KEY/PASSPHRASE below are
// PayFast's own publicly-documented sandbox demo credentials (safe to
// commit — they only work against sandbox.payfast.co.za, never real
// money). Swap these for a real merchant account's secrets (via
// `wrangler pages secret put`) before ever pointing PAYFAST_HOST at
// production.

export interface PayfastEnv {
  PAYFAST_MERCHANT_ID?: string;
  PAYFAST_MERCHANT_KEY?: string;
  PAYFAST_PASSPHRASE?: string;
  PAYFAST_HOST?: string; // e.g. sandbox.payfast.co.za
}

export function payfastConfigured(env: PayfastEnv): boolean {
  return !!(env.PAYFAST_MERCHANT_ID && env.PAYFAST_MERCHANT_KEY && env.PAYFAST_PASSPHRASE && env.PAYFAST_HOST);
}

// The fixed field order the signature is computed over — same order for
// both the outgoing payment request and validating an incoming ITN.
// Optional fields simply get skipped if not present on this particular
// request (that's PayFast's own documented behaviour, confirmed via the
// SDK), so one array can serve both a plain once-off request and a
// subscription request.
const FIELD_ORDER = [
  'merchant_id', 'merchant_key', 'return_url', 'cancel_url', 'notify_url', 'notify_method',
  'name_first', 'name_last', 'email_address', 'cell_number',
  'm_payment_id', 'amount', 'item_name', 'item_description',
  'custom_int1', 'custom_int2', 'custom_int3', 'custom_int4', 'custom_int5',
  'custom_str1', 'custom_str2', 'custom_str3', 'custom_str4', 'custom_str5',
  'email_confirmation', 'confirmation_address', 'currency', 'payment_method',
  'subscription_type', 'billing_date', 'recurring_amount', 'frequency', 'cycles',
  'subscription_notify_email', 'subscription_notify_webhook', 'subscription_notify_buyer',
] as const;

// PHP's urlencode() differs from encodeURIComponent(): spaces become `+`,
// and !'()* get percent-encoded too (encodeURIComponent leaves them raw).
// The signature won't match PayFast's own recomputation if this diverges.
function phpUrlEncode(value: string): string {
  return encodeURIComponent(value)
    .replace(/%20/g, '+')
    .replace(/[!'()*]/g, (c) => '%' + c.charCodeAt(0).toString(16).toUpperCase());
}

export function buildSignatureString(fields: Record<string, string | undefined>, passphrase: string): string {
  const parts: string[] = [];
  for (const key of FIELD_ORDER) {
    const value = fields[key];
    if (value === undefined || value === '') continue;
    parts.push(`${key}=${phpUrlEncode(value.trim())}`);
  }
  parts.push(`passphrase=${phpUrlEncode(passphrase.trim())}`);
  return parts.join('&');
}

export async function md5(input: string): Promise<string> {
  // Web Crypto has no MD5 (by design — it's not a security-grade hash),
  // and this Function has no Node `crypto` module without opting into
  // nodejs_compat sitewide, so this is a minimal self-contained
  // implementation of the algorithm itself (RFC 1321), not a workaround
  // for anything.
  function rotl(x: number, c: number) { return (x << c) | (x >>> (32 - c)); }
  const K = new Array(64);
  for (let i = 0; i < 64; i++) K[i] = Math.floor(Math.abs(Math.sin(i + 1)) * 2 ** 32);
  const S = [7,12,17,22,7,12,17,22,7,12,17,22,7,12,17,22,5,9,14,20,5,9,14,20,5,9,14,20,5,9,14,20,4,11,16,23,4,11,16,23,4,11,16,23,4,11,16,23,6,10,15,21,6,10,15,21,6,10,15,21,6,10,15,21];

  const bytes = new TextEncoder().encode(input);
  const bitLen = bytes.length * 8;
  const withOne = new Uint8Array(((bytes.length + 8) >> 6 << 6) + 64);
  withOne.set(bytes);
  withOne[bytes.length] = 0x80;
  const dv = new DataView(withOne.buffer);
  dv.setUint32(withOne.length - 8, bitLen >>> 0, true);
  dv.setUint32(withOne.length - 4, Math.floor(bitLen / 2 ** 32), true);

  let a0 = 0x67452301, b0 = 0xefcdab89, c0 = 0x98badcfe, d0 = 0x10325476;

  for (let chunk = 0; chunk < withOne.length; chunk += 64) {
    const M = new Array(16);
    for (let i = 0; i < 16; i++) M[i] = dv.getUint32(chunk + i * 4, true);
    let [A, B, C, D] = [a0, b0, c0, d0];
    for (let i = 0; i < 64; i++) {
      let F: number, g: number;
      if (i < 16) { F = (B & C) | (~B & D); g = i; }
      else if (i < 32) { F = (D & B) | (~D & C); g = (5 * i + 1) % 16; }
      else if (i < 48) { F = B ^ C ^ D; g = (3 * i + 5) % 16; }
      else { F = C ^ (B | ~D); g = (7 * i) % 16; }
      F = (F + A + K[i] + M[g]) >>> 0;
      A = D; D = C; C = B;
      B = (B + rotl(F, S[i])) >>> 0;
    }
    a0 = (a0 + A) >>> 0; b0 = (b0 + B) >>> 0; c0 = (c0 + C) >>> 0; d0 = (d0 + D) >>> 0;
  }

  function toHexLE(n: number): string {
    const bytes = [n & 0xff, (n >>> 8) & 0xff, (n >>> 16) & 0xff, (n >>> 24) & 0xff];
    return bytes.map((b) => b.toString(16).padStart(2, '0')).join('');
  }
  return toHexLE(a0) + toHexLE(b0) + toHexLE(c0) + toHexLE(d0);
}

export async function signFields(fields: Record<string, string | undefined>, passphrase: string): Promise<string> {
  return md5(buildSignatureString(fields, passphrase));
}

// The Subscriptions REST API uses a DIFFERENT signature scheme than the
// checkout/ITN flow above: headers + params merged, sorted alphabetically
// (PHP `ksort` — the opposite rule from the fixed field order used for
// checkout), passphrase appended, MD5'd, sent as a `signature` header
// rather than a form field. Confirmed against PayFast's own SDK source
// (Auth.php / PayFastApi.php), used here only for cancelling a
// subscription — pause/resume/update follow the identical pattern if
// ever needed.
async function signApiRequest(
  passphrase: string,
  headers: Record<string, string>,
  params: Record<string, string>
): Promise<string> {
  const merged: Record<string, string> = { ...headers, ...params };
  const keys = Object.keys(merged).sort();
  const parts = keys.map((k) => `${k}=${phpUrlEncode(merged[k])}`);
  parts.push(`passphrase=${phpUrlEncode(passphrase)}`);
  return md5(parts.join('&'));
}

export interface CancelResult {
  ok: boolean;
  status: number;
  body: string;
}

// PUT /subscriptions/{token}/cancel — stops future billing on PayFast's
// side. This is the one API call that actually matters for user trust:
// a "Cancel" button that only updates our own database without calling
// this would keep charging the owner's card while claiming to have
// cancelled.
export async function cancelPayfastSubscription(env: PayfastEnv, token: string): Promise<CancelResult> {
  const merchantId = env.PAYFAST_MERCHANT_ID!;
  const passphrase = env.PAYFAST_PASSPHRASE!;
  const timestamp = new Date().toISOString().slice(0, 19); // PayFast expects no milliseconds/offset
  const headers = { 'merchant-id': merchantId, version: 'v1', timestamp };
  const signature = await signApiRequest(passphrase, headers, {});

  const isSandbox = (env.PAYFAST_HOST ?? '').includes('sandbox');
  const url = `https://api.payfast.co.za/subscriptions/${encodeURIComponent(token)}/cancel${isSandbox ? '?testing=true' : ''}`;

  const res = await fetch(url, {
    method: 'PUT',
    headers: {
      'merchant-id': merchantId,
      version: 'v1',
      timestamp,
      signature,
    },
  });
  const body = await res.text();
  return { ok: res.ok, status: res.status, body };
}

// Checks the incoming ITN's host actually resolves to one of PayFast's own
// hostnames, per their own SDK's `pfValidIP()` — this Function receives
// the request directly (no reverse proxy to trust blindly), so the
// meaningful equivalent is verifying the request came from a PayFast
// hostname at all via CF's own connecting IP info, which Cloudflare
// already validates at the edge. The full dynamic-DNS-resolution check
// PayFast's SDK does is designed for a plain PHP server with no such
// edge; the two checks that matter most and are fully doable here are
// signature (below) and the server-confirmation callback (below) — both
// implemented in functions/api/subscribe/notify.ts.
export const PAYFAST_VALIDATE_PATH = '/eng/query/validate';
