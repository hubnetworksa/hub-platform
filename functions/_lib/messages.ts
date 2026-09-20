import type { D1Database } from '@cloudflare/workers-types';

// Shared by the endpoints that take free-text messages from visitors
// (/api/contact, /api/enquiry): input cleaning and a per-visitor rate limit.

export function cleanText(v: unknown, maxLen: number): string | null {
  if (typeof v !== 'string') return null;
  const trimmed = v.trim();
  if (!trimmed || trimmed.length > maxLen) return null;
  // Same rule as the other public forms: no raw HTML tags.
  if (/<[a-z\/!]/i.test(trimmed)) return null;
  return trimmed;
}

export function looksLikeEmail(v: string): boolean {
  return /^[^\s@<>]+@[^\s@<>]+\.[^\s@<>]+$/.test(v);
}

/** A stable, non-reversible id for the visitor's IP address (never store the IP itself). */
export async function visitorHash(request: Request, siteSlug: string): Promise<string> {
  const ip = request.headers.get('CF-Connecting-IP') ?? 'unknown';
  const data = new TextEncoder().encode(`${siteSlug}:${ip}`);
  const digest = await crypto.subtle.digest('SHA-256', data);
  return [...new Uint8Array(digest)].map((b) => b.toString(16).padStart(2, '0')).join('').slice(0, 32);
}

/** True if this visitor has already sent `max` messages in the last hour. */
export async function overMessageLimit(db: D1Database, ipHash: string, max = 5): Promise<boolean> {
  const row = await db
    .prepare(`SELECT COUNT(*) AS n FROM messages WHERE ip_hash = ? AND created_at > datetime('now', '-1 hour')`)
    .bind(ipHash)
    .first<{ n: number }>();
  return (row?.n ?? 0) >= max;
}

export function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
