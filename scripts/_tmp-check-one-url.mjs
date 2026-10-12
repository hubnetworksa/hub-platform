#!/usr/bin/env node
// Temporary, throwaway diagnostic: live URL Inspection + Performance check
// for one specific page, to answer a live user question. Deleted after use.
const URL_TO_CHECK = 'https://polokwanehub.com/shopping-center/limpopo-mall-polokwane-central/';
const SITE_URL = 'sc-domain:polokwanehub.com';

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

console.log('=== Live URL Inspection ===');
const inspect = await (
  await fetch('https://searchconsole.googleapis.com/v1/urlInspection/index:inspect', {
    method: 'POST',
    headers,
    body: JSON.stringify({ inspectionUrl: URL_TO_CHECK, siteUrl: SITE_URL, languageCode: 'en-US' }),
  })
).json();
console.log(JSON.stringify(inspect.inspectionResult?.indexStatusResult ?? inspect, null, 2));

console.log('\n=== Performance for exact query "limpopo mall polokwane", last 90 days ===');
const day = (offset) => new Date(Date.now() - offset * 864e5).toISOString().slice(0, 10);
const perf = await (
  await fetch(`https://www.googleapis.com/webmasters/v3/sites/${encodeURIComponent(SITE_URL)}/searchAnalytics/query`, {
    method: 'POST',
    headers,
    body: JSON.stringify({
      startDate: day(90),
      endDate: day(1),
      dimensions: ['date'],
      dimensionFilterGroups: [{ filters: [{ dimension: 'query', operator: 'equals', expression: 'limpopo mall polokwane' }] }],
      rowLimit: 90,
    }),
  })
).json();
console.log(JSON.stringify(perf.rows ?? perf, null, 2));

console.log('\n=== Which page(s) rank for "limpopo mall polokwane", last 28 days ===');
const byPage = await (
  await fetch(`https://www.googleapis.com/webmasters/v3/sites/${encodeURIComponent(SITE_URL)}/searchAnalytics/query`, {
    method: 'POST',
    headers,
    body: JSON.stringify({
      startDate: day(28),
      endDate: day(1),
      dimensions: ['page'],
      dimensionFilterGroups: [{ filters: [{ dimension: 'query', operator: 'equals', expression: 'limpopo mall polokwane' }] }],
      rowLimit: 20,
    }),
  })
).json();
console.log(JSON.stringify(byPage.rows ?? byPage, null, 2));
