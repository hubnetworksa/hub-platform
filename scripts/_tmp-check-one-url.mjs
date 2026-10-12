#!/usr/bin/env node
// Temporary, throwaway diagnostic: daily history for one query against one
// page, to answer a live user question. Deleted after use.
const URL_TO_CHECK = 'https://pretoriahub.com/business/arrie-nel-kilner-park-kilner-park/';
const SITE_URL = 'sc-domain:pretoriahub.com';
const QUERY = 'arrie nel kilner park';

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

console.log(`=== Daily history for query "${QUERY}", last 90 days (non-zero days only) ===`);
const byDate = await (
  await fetch(`https://www.googleapis.com/webmasters/v3/sites/${encodeURIComponent(SITE_URL)}/searchAnalytics/query`, {
    method: 'POST',
    headers,
    body: JSON.stringify({
      startDate: day(90),
      endDate: day(0),
      dimensions: ['date'],
      dimensionFilterGroups: [{ filters: [{ dimension: 'query', operator: 'equals', expression: QUERY }] }],
      rowLimit: 90,
    }),
  })
).json();
const nonZero = (byDate.rows ?? []).filter((r) => r.impressions > 0);
for (const r of nonZero) console.log(`  ${r.keys[0]}: impressions=${r.impressions} clicks=${r.clicks} position=${r.position.toFixed(1)}`);
if (!nonZero.length) console.log('  (zero impressions every day in the last 90 days)');
console.log(`Total days with data: ${nonZero.length} of ${byDate.rows?.length ?? 0} days returned.`);

console.log('\n=== Which page(s) rank for this query, all-time available (last 16 months) ===');
const byPage = await (
  await fetch(`https://www.googleapis.com/webmasters/v3/sites/${encodeURIComponent(SITE_URL)}/searchAnalytics/query`, {
    method: 'POST',
    headers,
    body: JSON.stringify({
      startDate: day(480),
      endDate: day(0),
      dimensions: ['page'],
      dimensionFilterGroups: [{ filters: [{ dimension: 'query', operator: 'equals', expression: QUERY }] }],
      rowLimit: 20,
    }),
  })
).json();
console.log(JSON.stringify(byPage.rows ?? byPage, null, 2));

console.log('\n=== Live URL Inspection for this page ===');
const inspect = await (
  await fetch('https://searchconsole.googleapis.com/v1/urlInspection/index:inspect', {
    method: 'POST',
    headers,
    body: JSON.stringify({ inspectionUrl: URL_TO_CHECK, siteUrl: SITE_URL, languageCode: 'en-US' }),
  })
).json();
console.log(JSON.stringify(inspect.inspectionResult?.indexStatusResult ?? inspect, null, 2));
