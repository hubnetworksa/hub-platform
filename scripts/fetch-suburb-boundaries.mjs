#!/usr/bin/env node
// Fetches each suburb's real outline from OpenStreetMap (Nominatim, free) and
// saves it for the interactive suburb map:
//
//   node scripts/fetch-suburb-boundaries.mjs <capetown|pretoria|polokwane>
//
// Output: src/site-content/<city>/suburb-boundaries.json  ({ slug: GeoJSON geometry }).
// Polite use: one request a second, identifying User-Agent, and a re-run only
// looks up suburbs that are not saved yet. Only polygon results that sit in the
// right part of the city are kept; suburbs OSM has no outline for are simply
// left out (the map draws a dot for those from their coordinates).
import { execFileSync } from 'node:child_process';
import { existsSync, readFileSync, writeFileSync } from 'node:fs';
import path from 'node:path';

const CITIES = {
  capetown: { db: 'thecapetownhub-db', place: 'Cape Town', bbox: [-34.45, -33.45, 18.2, 19.05] },
  pretoria: { db: 'pretoriahub-db', place: 'Pretoria', bbox: [-26.2, -25.3, 27.9, 28.65] },
  polokwane: { db: 'polokwanehub-db', place: 'Polokwane', bbox: [-24.4, -23.6, 29.2, 29.85] },
};
const city = process.argv[2];
const cfg = CITIES[city];
if (!cfg) {
  console.error('Usage: node scripts/fetch-suburb-boundaries.mjs <capetown|pretoria|polokwane>');
  process.exit(2);
}
const REPO = process.cwd();
const WRANGLER = path.join(REPO, 'node_modules/wrangler/bin/wrangler.js');
const OUT = path.join(REPO, 'src/site-content', city, 'suburb-boundaries.json');
const saved = existsSync(OUT) ? JSON.parse(readFileSync(OUT, 'utf8')) : {};
const misses = existsSync(OUT + '.misses') ? new Set(JSON.parse(readFileSync(OUT + '.misses', 'utf8'))) : new Set();

const out = execFileSync(process.execPath, [WRANGLER, 'd1', 'execute', cfg.db, '--config', `wrangler.${city}.jsonc`, '--remote', '--json', '--command', 'SELECT slug, name, lat, lng FROM suburbs ORDER BY name'], { encoding: 'utf8', maxBuffer: 32 * 1024 * 1024 });
const suburbs = JSON.parse(out.slice(out.indexOf('[')))[0].results;

const km = (a, b, c, d) => {
  const rad = Math.PI / 180;
  const x = (d - b) * rad * Math.cos(((a + c) / 2) * rad), y = (c - a) * rad;
  return Math.sqrt(x * x + y * y) * 6371;
};
const sleep = (ms) => new Promise((r) => setTimeout(r, ms));
const round = (n) => Math.round(n * 1e5) / 1e5;
const roundGeom = (g) => (Array.isArray(g) ? (typeof g[0] === 'number' ? g.map(round) : g.map(roundGeom)) : g);
const areaKm2 = (bb) => km(+bb[0], +bb[2], +bb[1], +bb[2]) * km(+bb[0], +bb[2], +bb[0], +bb[3]);

async function lookup(q) {
  const u = new URL('https://nominatim.openstreetmap.org/search');
  u.search = new URLSearchParams({
    q, format: 'jsonv2', limit: '5', countrycodes: 'za', polygon_geojson: '1', polygon_threshold: '0.0004',
    viewbox: `${cfg.bbox[2]},${cfg.bbox[1]},${cfg.bbox[3]},${cfg.bbox[0]}`, bounded: '1',
  }).toString();
  await sleep(1150);
  for (let i = 0; i < 3; i++) {
    try {
      const res = await fetch(u, { headers: { 'User-Agent': 'HubDirectories-boundary-fetch/1.0 (hello@thecapetownhub.com)' } });
      if (res.status === 429 || res.status >= 500) { await sleep(8000 * (i + 1)); continue; }
      return await res.json();
    } catch {
      await sleep(5000);
    }
  }
  return [];
}

let found = 0, todo = 0;
for (const s of suburbs) {
  if (saved[s.slug] || misses.has(s.slug)) continue;
  todo++;
  const names = [s.name, s.name.replace(/ (Estate|Estates|Smallholdings|Residential Estate|Lifestyle Estate|Waterfront Estate|Farm Villages|Manor|Central|Park)$/i, '')].filter((v, i, a) => a.indexOf(v) === i);
  let geom = null;
  for (const n of names) {
    const res = await lookup(`${n}, ${cfg.place}, South Africa`);
    const hit = res.find((h) => {
      if (!h.geojson || !/Polygon/.test(h.geojson.type)) return false;
      if (!['place', 'boundary', 'landuse'].includes(h.category)) return false;
      const lat = +h.lat, lon = +h.lon;
      if (lat < cfg.bbox[0] || lat > cfg.bbox[1] || lon < cfg.bbox[2] || lon > cfg.bbox[3]) return false;
      if (areaKm2(h.boundingbox) > 400) return false; // a whole municipality, not a suburb
      return s.lat == null || km(lat, lon, s.lat, s.lng) <= 8;
    });
    if (hit) { geom = hit.geojson; break; }
  }
  if (geom) {
    saved[s.slug] = { type: geom.type, coordinates: roundGeom(geom.coordinates) };
    found++;
  } else {
    misses.add(s.slug);
  }
  if (todo % 25 === 0) {
    writeFileSync(OUT, JSON.stringify(saved));
    writeFileSync(OUT + '.misses', JSON.stringify([...misses]));
    console.log(`  ${city}: ${todo} looked up, ${found} outlines`);
  }
}
writeFileSync(OUT, JSON.stringify(saved));
writeFileSync(OUT + '.misses', JSON.stringify([...misses]));
console.log(`${city}: ${Object.keys(saved).length}/${suburbs.length} suburbs have an outline (${found} new)`);
