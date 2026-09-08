#!/usr/bin/env node
// Historical one-off tool from PretoriaHub, carried over as-is — hardcoded
// to the pretoriahub-db database name below; adjust that before running
// against another site's database.
// One-off fix for GSC "Duplicate, Google chose different canonical" reports
// on chain-branch listings (Clicks, KFC, PEP, Chicken Licken, Dis-Chem,
// Mr Price, Woolworths) that were imported with just the bare brand name
// and an auto-incremented numeric suffix — indistinguishable from each
// other to Google. Every one of them already has a real street address
// from OSM, so this needs no new research: fold the street into `name`
// (matching the sasol-amkor-road-lyttelton / spar-celtis-ridge pattern
// already used elsewhere), and regenerate `slug` from the *current*
// suburb (many of these were reassigned to a granular suburb after
// import but never got a matching slug update).
//
// Un-enriched descriptions (description_enriched_at IS NULL) still say
// "is a business in pretoria central" even though the real suburb has
// since changed — those get rewritten too, preserving any "Opening
// hours: ..." suffix already present. Already-enriched descriptions are
// left untouched.
//
// Usage: node scripts/disambiguate-chain-branches.mjs
// Writes db/seed-data/chain-branch-disambiguation-2026-09-07.sql — review
// it, then apply with:
//   npx wrangler d1 execute pretoriahub-db --remote --file=db/seed-data/chain-branch-disambiguation-2026-09-07.sql

import { readFileSync, writeFileSync } from 'node:fs';

const TARGET_SLUGS = [
  'clicks-pretoria-central-3', 'clicks-pretoria-central-4', 'clicks-pretoria-central-5',
  'clicks-pretoria-central-9', 'clicks-pretoria-central-11', 'clicks-menlyn-2', 'clicks-waterkloof-3',
  'kfc-pretoria-central-2', 'kfc-pretoria-central-3', 'kfc-pretoria-central-5', 'kfc-pretoria-central-6',
  'kfc-pretoria-central-8', 'kfc-pretoria-central-10', 'kfc-pretoria-central-11', 'kfc-menlyn-2',
  'pep-pretoria-central-2', 'pep-pretoria-central-3', 'pep-pretoria-central-5', 'pep-pretoria-central-6',
  'pep-pretoria-central-7', 'pep-pretoria-central-9', 'pep-pretoria-central-11',
  'chicken-licken-pretoria-central-3', 'chicken-licken-pretoria-central-7', 'chicken-licken-pretoria-central-8',
  'dis-chem-menlyn-2', 'dis-chem-menlyn-3', 'dis-chem-waterkloof-2',
  'mr-price-pretoria-central-2', 'mr-price-pretoria-central-6', 'mr-price-menlyn-2',
  'woolworths-centurion-2', 'woolworths-centurion-3', 'woolworths-menlyn-6',
];

function slugify(s) {
  return s.toLowerCase().trim().replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '').slice(0, 80);
}
function sqlEscape(v) {
  if (v === null || v === undefined) return 'NULL';
  return `'${String(v).replace(/'/g, "''")}'`;
}
function cleanStreet(address) {
  return address.replace(/^\s*\d+\s*,?\s*/, '').trim();
}

const businesses = JSON.parse(readFileSync('src/data/businesses.json', 'utf8'));
const suburbs = JSON.parse(readFileSync('src/data/suburbs.json', 'utf8'));
const suburbById = new Map(suburbs.map((s) => [s.id, s]));
const existingSlugs = new Set(businesses.map((b) => b.slug));

const statements = [];
const summary = [];

for (const oldSlug of TARGET_SLUGS) {
  const b = businesses.find((x) => x.slug === oldSlug);
  if (!b) {
    console.error(`SKIP (not found, already handled?): ${oldSlug}`);
    continue;
  }
  const suburb = suburbById.get(b.suburb_id);
  const street = cleanStreet(b.address);
  const newName = `${b.name} ${street}`;

  let candidate = `${slugify(newName)}-${suburb.slug}`;
  let attempt = 1;
  while (existingSlugs.has(candidate) && candidate !== oldSlug) {
    attempt++;
    candidate = `${slugify(newName)}-${suburb.slug}-${attempt}`;
  }
  existingSlugs.delete(oldSlug);
  existingSlugs.add(candidate);

  let newDescription = null;
  if (!b.description_enriched_at) {
    const hoursMatch = b.description.match(/Opening hours: (.+?)\.?$/);
    const hoursSuffix = hoursMatch ? ` Opening hours: ${hoursMatch[1]}.` : '';
    newDescription = `${newName} is a business on ${street} in ${suburb.name}, part of the Pretoria/Tshwane metro.${hoursSuffix}`;
  }

  const setClauses = [`name = ${sqlEscape(newName)}`, `slug = ${sqlEscape(candidate)}`];
  if (newDescription) setClauses.push(`description = ${sqlEscape(newDescription)}`);
  statements.push(`UPDATE businesses SET ${setClauses.join(', ')} WHERE slug = ${sqlEscape(oldSlug)};`);
  summary.push({ oldSlug, newSlug: candidate, newName, suburb: suburb.name, descriptionChanged: Boolean(newDescription) });
}

const outPath = 'db/seed-data/chain-branch-disambiguation-2026-09-07.sql';
writeFileSync(
  outPath,
  `-- Disambiguates chain-branch listings (Clicks/KFC/PEP/Chicken Licken/
-- Dis-Chem/Mr Price/Woolworths) flagged by Google Search Console as
-- "Duplicate, Google chose different canonical" -- each was imported
-- with just the bare brand name, auto-numbered, indistinguishable from
-- its siblings. Folds each one's real (already-known, OSM-sourced)
-- street address into the name, matching the sasol-amkor-road-lyttelton
-- pattern, and regenerates the slug from its current (already correctly
-- reassigned) suburb. See scripts/disambiguate-chain-branches.mjs.

${statements.join('\n')}
`
);

console.log(`Wrote ${statements.length} statements to ${outPath}\n`);
console.table(summary);
