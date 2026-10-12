#!/usr/bin/env node
// Temporary, throwaway diagnostic: for each site, find the most recent date
// Search Console has any impression data for, then list a few real
// (page, query) pairs from that date — a concrete "yes, Google is still
// showing pages" or "no, here's exactly what's missing" answer. Deleted
// after use; not part of the shipped system.
const CITIES = [
  ['pretoria', 'pretoriahub.com'],
  ['polokwane', 'polokwanehub.com'],
  ['capetown', 'thecapetownhub.com'],
];

const { GOOGLE_CLIENT_ID: id, GOOGLE_CLIENT_SECRET: secret, GOOGLE_REFRESH_TOKEN: refresh } = process.env;
if (!id || !secret || !refresh) throw new Error('GOOGLE_CLIENT_ID, GOOGLE_CLIENT_SECRET and GOOGLE_REFRESH_TOKEN are required.');
const tok = await (
  await fetch('https://oauth2.googleapis.com/token', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams({ client_id: id, client_secret: secret, refresh_token: refresh, grant_type: 'refresh_token' }),
  })
).json();
if (!tok.access_token) throw new Error('Google token refresh failed.');

async function g(prop, body) {
  const url = `https://www.googleapis.com/webmasters/v3/sites/${encodeURIComponent(prop)}/searchAnalytics/query`;
  const res = await fetch(url, { method: 'POST', headers: { Authorization: `Bearer ${tok.access_token}`, 'Content-Type': 'application/json' }, body: JSON.stringify(body) });
  return res.json();
}

const day = (offset) => new Date(Date.now() - offset * 864e5).toISOString().slice(0, 10);

for (const [slug, domain] of CITIES) {
  const prop = `sc-domain:${domain}`;
  console.log(`\n=== ${slug} (${domain}) ===`);
  const byDate = await g(prop, { startDate: day(10), endDate: day(0), dimensions: ['date'], rowLimit: 10 });
  const rows = (byDate.rows ?? []).filter((r) => r.impressions > 0).sort((a, b) => b.keys[0].localeCompare(a.keys[0]));
  if (!rows.length) {
    console.log('No impressions recorded in the last 10 days at all.');
    continue;
  }
  const latestDate = rows[0].keys[0];
  console.log(`Most recent date with any impressions: ${latestDate} (${rows[0].impressions} impressions, ${rows[0].clicks} clicks that day)`);
  const detail = await g(prop, { startDate: latestDate, endDate: latestDate, dimensions: ['page', 'query'], rowLimit: 10 });
  const examples = detail.rows ?? [];
  if (!examples.length) {
    console.log('(could not break that day down by page/query — unusual, flagging)');
    continue;
  }
  for (const r of examples.slice(0, 5)) {
    console.log(`  page=${r.keys[0]}  query="${r.keys[1]}"  impressions=${r.impressions} clicks=${r.clicks} position=${r.position.toFixed(1)}`);
  }
}
