#!/usr/bin/env node
// Historical one-off tool from PretoriaHub, carried over as-is — hardcoded
// to the pretoriahub-db database name below; adjust that before running
// against another site's database.
// Links each business to a shopping_center only when the business's OWN
// address text names that center. GPS proximity alone is not evidence of
// membership -- a business can be the closest point on the map to a mall
// without being a tenant of it (this project shipped that exact bug: see
// db/seed-data/fix-shopping-center-mislinks-2026-09-01.sql, where
// businesses whose address literally said "Brooklyn Mall" or "Menlyn Park
// Shopping Centre" got linked to a different, merely-nearer center
// instead). Re-run any time addresses or the shopping_centers list change;
// safe to run repeatedly -- it recomputes every business's link from
// scratch rather than only filling in blanks.

import { execFileSync } from 'node:child_process';
import { writeFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import path from 'node:path';

const WRANGLER_JS = path.join(path.dirname(fileURLToPath(import.meta.url)), '..', 'node_modules', 'wrangler', 'bin', 'wrangler.js');

function d1Query(sql) {
  const args = [WRANGLER_JS, 'd1', 'execute', 'pretoriahub-db', '--remote', '--json', '--command', sql];
  const raw = execFileSync(process.execPath, args, { encoding: 'utf8', maxBuffer: 64 * 1024 * 1024 });
  return JSON.parse(raw.slice(raw.indexOf('['))) [0]?.results ?? [];
}

function normalize(s) {
  return s.toLowerCase().replace(/[^a-z0-9 ]/g, ' ').replace(/\s+/g, ' ').trim();
}

// Whole-word/phrase match only -- a naive .includes() would match "Equest"
// (a real, badly-named shopping_centers row) inside "Equestria".
function escapeRegex(s) {
  return s.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}
function containsPhrase(haystack, phrase) {
  if (!phrase) return false;
  return new RegExp(`\\b${escapeRegex(phrase)}\\b`).test(haystack);
}

// Deliberately no "strip generic suffix words and match the remaining
// core" fallback -- that was tried and produced real false positives:
// "Central Square" -> core "central" matched "223 Central Street" (a
// business 5km away with nothing to do with that mall, and 70 others like
// it); "Bloed Street Mall" -> core "bloed street" matched businesses
// whose entire address is just "Bloed Street" with no indication they're
// actually inside the mall building versus a stall along the street. Full
// phrase match only means a business address must contain the shopping
// center's real, complete name -- lower recall, but nothing gets linked
// without that business's own address actually saying so.
async function main() {
  const businesses = d1Query('SELECT id, name, address, shopping_center_id FROM businesses;');
  const centersRaw = d1Query('SELECT id, name FROM shopping_centers;');
  const centers = centersRaw.map((c) => ({ ...c, norm: normalize(c.name) }));

  process.stderr.write(`${businesses.length} businesses, ${centers.length} shopping centers.\n`);

  const updates = [];
  const ambiguous = [];
  let linked = 0, unlinked = 0, unchanged = 0;

  for (const b of businesses) {
    const addrNorm = b.address ? normalize(b.address) : '';
    let matches = [];
    if (addrNorm) {
      matches = centers.filter((c) => containsPhrase(addrNorm, c.norm));
    }

    let confirmedId = null;
    if (matches.length === 1) {
      confirmedId = matches[0].id;
    } else if (matches.length > 1) {
      // Genuinely ambiguous (e.g. two centers with overlapping names) --
      // left unlinked rather than guessed.
      ambiguous.push({ id: b.id, name: b.name, address: b.address, candidates: matches.map((c) => c.name) });
    }

    if (confirmedId !== b.shopping_center_id) {
      updates.push(`UPDATE businesses SET shopping_center_id = ${confirmedId ?? 'NULL'} WHERE id = ${b.id};`);
      if (confirmedId) linked++; else unlinked++;
    } else {
      unchanged++;
    }
  }

  writeFileSync('db/seed-data/shopping-center-links.sql', updates.join('\n') + (updates.length ? '\n' : ''));
  process.stderr.write(`\nNewly/re-linked: ${linked}. Unlinked (no address confirmation): ${unlinked}. Unchanged: ${unchanged}.\n`);
  if (ambiguous.length) {
    process.stderr.write(`\nAmbiguous (multiple centers matched, left unlinked):\n`);
    for (const a of ambiguous) process.stderr.write(`  #${a.id} ${a.name} -- "${a.address}" -> ${a.candidates.join(' / ')}\n`);
  }
  process.stderr.write(`\nWrote ${updates.length} statement(s) to db/seed-data/shopping-center-links.sql\n`);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
