#!/usr/bin/env node
// Historical one-off tool from PretoriaHub, carried over as-is — hardcoded
// to the pretoriahub-db database name below; adjust that before running
// against another site's database.
// Reassigns each business to its nearest suburb centroid, now that the
// suburb list has grown from 16 broad areas to ~217 (16 broad + ~201
// granular, see db/migrations/0011_granular_suburbs.sql). Same
// nearest-centroid pattern as scripts/link-businesses-to-shopping-centers.mjs
// — a business already filed under the broad "Centurion" suburb will
// naturally move to a closer, more specific granular suburb (e.g.
// Wierdapark) if one exists nearby; otherwise it stays put. Suburbs that
// failed geocoding (NULL lat/lng) simply can't be matched against — no harm,
// they just don't compete for any business.

import { execFileSync } from 'node:child_process';
import { writeFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import path from 'node:path';

const WRANGLER_JS = path.join(path.dirname(fileURLToPath(import.meta.url)), '..', 'node_modules', 'wrangler', 'bin', 'wrangler.js');
const MAX_REASSIGN_RADIUS_M = 5000; // don't reassign across an implausible distance

function d1Query(sql) {
  const args = [WRANGLER_JS, 'd1', 'execute', 'pretoriahub-db', '--remote', '--json', '--command', sql];
  const raw = execFileSync(process.execPath, args, { encoding: 'utf8', maxBuffer: 64 * 1024 * 1024 });
  return JSON.parse(raw.slice(raw.indexOf('[')))[0]?.results ?? [];
}

// Equirectangular approximation — plenty accurate at this scale (<20km).
function distanceMeters(lat1, lng1, lat2, lng2) {
  const R = 6371000;
  const x = ((lng2 - lng1) * Math.PI) / 180 * Math.cos(((lat1 + lat2) / 2 * Math.PI) / 180);
  const y = ((lat2 - lat1) * Math.PI) / 180;
  return Math.sqrt(x * x + y * y) * R;
}

async function main() {
  const businesses = d1Query('SELECT id, suburb_id, lat, lng FROM businesses WHERE lat IS NOT NULL AND lng IS NOT NULL;');
  const suburbs = d1Query('SELECT id, slug, lat, lng FROM suburbs WHERE lat IS NOT NULL AND lng IS NOT NULL;');
  process.stderr.write(`${businesses.length} businesses to check against ${suburbs.length} geocoded suburbs.\n`);

  const suburbById = new Map(suburbs.map((s) => [s.id, s]));
  const updates = [];
  let moved = 0;
  let keptNoCloserMatch = 0;
  let keptOutOfRadius = 0;

  for (const b of businesses) {
    let best = null;
    let bestDist = Infinity;
    for (const s of suburbs) {
      const d = distanceMeters(b.lat, b.lng, s.lat, s.lng);
      if (d < bestDist) {
        bestDist = d;
        best = s;
      }
    }
    if (!best || bestDist > MAX_REASSIGN_RADIUS_M) {
      keptOutOfRadius++;
      continue;
    }
    if (best.id === b.suburb_id) {
      keptNoCloserMatch++;
      continue;
    }
    updates.push(`UPDATE businesses SET suburb_id = ${best.id} WHERE id = ${b.id};`);
    moved++;
  }

  writeFileSync('db/seed-data/suburb-reassignment.sql', updates.join('\n') + '\n');
  process.stderr.write(
    `Reassigning ${moved} businesses to a closer suburb. ${keptNoCloserMatch} already on their nearest suburb. ${keptOutOfRadius} had no suburb within ${MAX_REASSIGN_RADIUS_M}m.\n` +
    `Wrote db/seed-data/suburb-reassignment.sql\n`
  );
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
