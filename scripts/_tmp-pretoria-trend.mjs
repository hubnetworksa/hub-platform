#!/usr/bin/env node
// Temporary, throwaway diagnostic: Pretoria's real site-wide daily
// impressions/clicks for the last 60 days, to check whether a drop really
// happened around Sept 24-25 specifically, not just one low-volume query.
const SITE_URL = 'sc-domain:pretoriahub.com';

const { GOOGLE_CLIENT_ID: id, GOOGLE_CLIENT_SECRET: secret, GOOGLE_REFRESH_TOKEN: refresh } = process.env;
const tok = await (
  await fetch('https://oauth2.googleapis.com/token', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({ client_id: id, client_secret: secret, refresh_token: refresh, grant_type: 'refresh_token' }),
  })
).json();
if (!tok.access_token) throw new Error('Google token refresh failed.');
const headers = { Authorization: `Bearer ${tok.access_token}`, 'Content-Type': 'application/json' };
const day = (offset) => new Date(Date.now() - offset * 864e5).toISOString().slice(0, 10);

const byDate = await (
  await fetch(`https://www.googleapis.com/webmasters/v3/sites/${encodeURIComponent(SITE_URL)}/searchAnalytics/query`, {
    method: 'POST',
    headers,
    body: JSON.stringify({ startDate: day(65), endDate: day(1), dimensions: ['date'], rowLimit: 100 }),
  })
).json();
const rows = (byDate.rows ?? []).sort((a, b) => a.keys[0].localeCompare(b.keys[0]));
for (const r of rows) {
  console.log(`${r.keys[0]}: impressions=${r.impressions} clicks=${r.clicks} position=${r.position.toFixed(1)}`);
}
