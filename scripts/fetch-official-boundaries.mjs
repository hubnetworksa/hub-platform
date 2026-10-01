#!/usr/bin/env node
// Downloads each city's OFFICIAL suburb outlines from the municipality's own
// free public map services and matches them to our suburbs by name:
//
//   node scripts/fetch-official-boundaries.mjs <capetown|pretoria>
//
//   Cape Town: City of Cape Town "Official Planning Suburbs" (gis.westerncape.gov.za)
//   Pretoria:  City of Tshwane "Suburb" layer (e-gis003.tshwane.gov.za)
//
// Writes src/site-content/<city>/suburb-boundaries.json ({ slug: GeoJSON geometry }),
// merging with anything already saved (official outlines replace older ones).
import { execFileSync } from 'node:child_process';
import { existsSync, readFileSync, writeFileSync, rmSync } from 'node:fs';
import path from 'node:path';

const SOURCES = {
  capetown: {
    db: 'thecapetownhub-db',
    layers: [
      { url: 'https://gis.westerncape.gov.za/server2/rest/services/SpatialDataWarehouse/CoCT_Management_Boundaries/MapServer/23', field: 'OFC_SBRB_N' },
      { url: 'https://gis.westerncape.gov.za/server2/rest/services/SpatialDataWarehouse/CoCT_Management_Boundaries/MapServer/15', field: 'SBRB_NAME' },
    ],
  },
  pretoria: {
    db: 'pretoriahub-db',
    layers: [
      { url: 'https://e-gis003.tshwane.gov.za/server/rest/services/BaseMaps/GeoWeb_Basemap_WM/MapServer/5', field: 'NAME' },
      { url: 'https://e-gis003.tshwane.gov.za/server/rest/services/BaseMaps/GeoWeb_Basemap_WM/MapServer/14', field: 'name' },
      { url: 'https://e-gis003.tshwane.gov.za/server/rest/services/BaseMaps/GeoWeb_Basemap_WM/MapServer/29', field: 'name' },
    ],
  },
};
const city = process.argv[2];
const src = SOURCES[city];
if (!src) {
  console.error('Usage: node scripts/fetch-official-boundaries.mjs <capetown|pretoria>');
  process.exit(2);
}
const REPO = process.cwd();
const WRANGLER = path.join(REPO, 'node_modules/wrangler/bin/wrangler.js');
const OUT = path.join(REPO, 'src/site-content', city, 'suburb-boundaries.json');
const saved = existsSync(OUT) ? JSON.parse(readFileSync(OUT, 'utf8')) : {};

const dbOut = execFileSync(process.execPath, [WRANGLER, 'd1', 'execute', src.db, '--config', `wrangler.${city}.jsonc`, '--remote', '--json', '--command', 'SELECT slug, name FROM suburbs ORDER BY name'], { encoding: 'utf8', maxBuffer: 32 * 1024 * 1024, env: Object.fromEntries(Object.entries(process.env).filter(([k]) => k !== 'NODE_TLS_REJECT_UNAUTHORIZED')) });
const suburbs = JSON.parse(dbOut.slice(dbOut.indexOf('[')))[0].results;

const norm = (s) =>
  s.toLowerCase().replace(/&/g, ' and ').replace(/(extension|ext|estate|estates|park|village|gardens|heights|hills|manor|smallholdings|residential|lifestyle|eco game|waterfront|country|central|north|south|east|west)/g, ' ').replace(/[^a-z0-9]+/g, '');
const exact = (s) => s.toLowerCase().replace(/&/g, ' and ').replace(/[^a-z0-9]+/g, '');
const merge = (geoms) => {
  const polys = [];
  for (const g of geoms) {
    if (g.type === 'Polygon') polys.push(g.coordinates);
    else if (g.type === 'MultiPolygon') polys.push(...g.coordinates);
  }
  return polys.length === 1 ? { type: 'Polygon', coordinates: polys[0] } : { type: 'MultiPolygon', coordinates: polys };
};

const official = new Set(); // suburbs matched this run, so a later layer only fills gaps
const looseUsed = new Set();
let tierExact = 0, tierLoose = 0;
for (const layer of src.layers) {
  const features = [];
  for (let offset = 0; ; offset += 1000) {
    const u = `${layer.url}/query?where=1%3D1&outFields=${layer.field}&outSR=4326&maxAllowableOffset=0.0002&geometryPrecision=5&resultOffset=${offset}&resultRecordCount=1000&orderByFields=OBJECTID&f=geojson`;
    const res = await (await fetch(u)).json();
    features.push(...(res.features ?? []));
    if ((res.features ?? []).length < 1000) break;
  }
  console.log(`${city}: ${features.length} outlines from ${layer.url.split('/').slice(-3).join('/')}`);
  const byExact = new Map();
  const byLoose = new Map();
  for (const f of features) {
    const name = String(f.properties?.[layer.field] ?? '').trim();
    if (!name || !f.geometry) continue;
    for (const [map, key] of [[byExact, exact(name)], [byLoose, norm(name)]]) {
      if (!key) continue;
      if (!map.has(key)) map.set(key, []);
      map.get(key).push(f.geometry);
    }
  }
  for (const s of suburbs) {
    const e = exact(s.name);
    if (!official.has(s.slug) && byExact.has(e)) {
      saved[s.slug] = merge(byExact.get(e));
      official.add(s.slug);
      tierExact++;
    }
  }
  for (const s of suburbs) {
    if (official.has(s.slug)) continue;
    const l = norm(s.name);
    if (l && byLoose.has(l) && !looseUsed.has(l)) {
      saved[s.slug] = merge(byLoose.get(l));
      looseUsed.add(l);
      official.add(s.slug);
      tierLoose++;
    }
  }
}

writeFileSync(OUT, JSON.stringify(saved));
if (existsSync(OUT + '.misses')) rmSync(OUT + '.misses');
console.log(`${city}: ${tierExact} matched by exact name, ${tierLoose} by close name; ${Object.keys(saved).length}/${suburbs.length} suburbs now have an outline`);
console.log('still without:', suburbs.filter((s) => !saved[s.slug]).map((s) => s.name).join(', '));
