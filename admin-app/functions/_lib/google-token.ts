import type { Env } from './sites';

// Google OAuth access token from the stored refresh token (ported from
// scripts/search-console-daily.mjs). Cached in module memory until 60 s
// before it expires; one retry on a 5xx.
let cached: { token: string; expiresAt: number } | null = null;

export async function getAccessToken(env: Env): Promise<string> {
  if (cached && Date.now() < cached.expiresAt - 60_000) return cached.token;
  const { GOOGLE_CLIENT_ID: id, GOOGLE_CLIENT_SECRET: secret, GOOGLE_REFRESH_TOKEN: refresh } = env;
  if (!id || !secret || !refresh) throw new Error('Google credentials not configured');
  const body = new URLSearchParams({ client_id: id, client_secret: secret, refresh_token: refresh, grant_type: 'refresh_token' });
  let res!: Response;
  for (let attempt = 0; attempt < 2; attempt++) {
    res = await fetch('https://oauth2.googleapis.com/token', { method: 'POST', headers: { 'Content-Type': 'application/x-www-form-urlencoded' }, body });
    if (res.status < 500) break;
  }
  const j = (await res.json().catch(() => ({}))) as { access_token?: string; expires_in?: number };
  if (!res.ok || !j.access_token) throw new Error('Google token refresh failed');
  cached = { token: j.access_token, expiresAt: Date.now() + (j.expires_in ?? 3600) * 1000 };
  return cached.token;
}
