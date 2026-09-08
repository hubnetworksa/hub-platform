#!/usr/bin/env node
// Retry pass for suburbs that failed geocoding in add-granular-suburbs.mjs.
// Turns out including a "Centurion, Gauteng, South Africa" hint in the
// query was actively hurting matches (Nominatim's free-text parser wants
// the address hierarchy to line up exactly, and these suburb nodes are
// tagged directly under "City of Tshwane Metropolitan Municipality", not
// "Centurion"/"Gauteng"). Plain "<name>, South Africa" with limit=5,
// picking the first result inside the Tshwane bounding box, works far
// better and still avoids similarly-named suburbs elsewhere in the country
// (e.g. there's also an "Amberfield" in Cape Town).

import { readFile, writeFile } from 'node:fs/promises';

const USER_AGENT = 'PretoriaHub-SuburbGeocode/1.0 (contact: ethanmglindeque@gmail.com)';
const BBOX = { latMin: -26.3, latMax: -25.2, lngMin: 27.6, lngMax: 28.9 };
const REQUEST_DELAY_MS = 1100;
const MIGRATION_FILE = 'db/migrations/0011_granular_suburbs.sql';

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

async function geocode(name) {
  const url = `https://nominatim.openstreetmap.org/search?format=jsonv2&limit=5&q=${encodeURIComponent(`${name}, South Africa`)}`;
  const res = await fetch(url, { headers: { 'User-Agent': USER_AGENT } });
  if (!res.ok) return null;
  const results = await res.json();
  for (const r of results) {
    const lat = Number(r.lat);
    const lng = Number(r.lon);
    if (lat >= BBOX.latMin && lat <= BBOX.latMax && lng >= BBOX.lngMin && lng <= BBOX.lngMax) {
      return { lat, lng };
    }
  }
  return null;
}

async function main() {
  const sql = await readFile(MIGRATION_FILE, 'utf8');
  const lines = sql.split('\n');

  let recovered = 0;
  let stillFailed = [];
  const newLines = [];

  for (const line of lines) {
    const match = line.match(/^INSERT OR IGNORE INTO suburbs \(slug, name, region, lat, lng\) VALUES \('([^']+)', '([^']*(?:''[^']*)*)', '([^']+)', (NULL|[-\d.]+), (NULL|[-\d.]+)\);$/);
    if (!match) {
      newLines.push(line);
      continue;
    }
    const [, slug, rawName, region, lat, lng] = match;
    const name = rawName.replace(/''/g, "'");

    if (lat !== 'NULL') {
      newLines.push(line);
      continue;
    }

    process.stderr.write(`Retrying "${name}"...\n`);
    let coords = null;
    try {
      coords = await geocode(name);
    } catch (err) {
      process.stderr.write(`  error: ${err.message}\n`);
    }
    await sleep(REQUEST_DELAY_MS);

    if (coords) {
      recovered++;
      newLines.push(
        `INSERT OR IGNORE INTO suburbs (slug, name, region, lat, lng) VALUES ('${slug}', '${rawName}', '${region}', ${coords.lat}, ${coords.lng});`
      );
    } else {
      stillFailed.push(name);
      newLines.push(line);
    }
  }

  await writeFile(MIGRATION_FILE, newLines.join('\n'));
  process.stderr.write(`\nRecovered ${recovered} more. Still NULL: ${stillFailed.length}\n`);
  if (stillFailed.length) process.stderr.write(`${stillFailed.join(', ')}\n`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
