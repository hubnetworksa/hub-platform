#!/usr/bin/env node
// Temporary, throwaway diagnostic: live query-level breakdown for one page,
// to answer a live user question. Deleted after use.
const URL_TO_CHECK = 'https://thecapetownhub.com/business/checkers-westgate-mall-westgate/';
const SITE_URL = 'sc-domain:thecapetownhub.com';

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

console.log('=== Every query that found this page, last 28 days (sorted by impressions) ===');
const byQuery = await (
  await fetch(`https://www.googleapis.com/webmasters/v3/sites/${encodeURIComponent(SITE_URL)}/searchAnalytics/query`, {
    method: 'POST',
    headers,
    body: JSON.stringify({
      startDate: day(28),
      endDate: day(1),
      dimensions: ['query'],
      dimensionFilterGroups: [{ filters: [{ dimension: 'page', operator: 'equals', expression: URL_TO_CHECK }] }],
      rowLimit: 25,
    }),
  })
).json();
for (const r of byQuery.rows ?? []) {
  console.log(`  query="${r.keys[0]}"  impressions=${r.impressions} clicks=${r.clicks} position=${r.position.toFixed(1)}`);
}
if (!byQuery.rows?.length) console.log('  (no rows)', JSON.stringify(byQuery));

console.log('\n=== Live URL Inspection ===');
const inspect = await (
  await fetch('https://searchconsole.googleapis.com/v1/urlInspection/index:inspect', {
    method: 'POST',
    headers,
    body: JSON.stringify({ inspectionUrl: URL_TO_CHECK, siteUrl: SITE_URL, languageCode: 'en-US' }),
  })
).json();
console.log(JSON.stringify(inspect.inspectionResult?.indexStatusResult ?? inspect, null, 2));
