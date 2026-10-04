#!/usr/bin/env node
// Turns one agent's content-upgrade output into the guarded SQL the deploy
// applies (content-upgrade/README.md). The agent writes only what it decided:
//
//   content-upgrade/out/<city>/chunk-NNN.json
//   { "items": [ { "slug": "...", "description": "...", "status": "researched", "sources": ["https://..."] }, ... ] }
//
// This script checks every item (all listings in the chunk present once,
// 100-250 words and at most 1,500 characters (the site's description limit,
// LONG_DESC_MAX in src/lib/rich-text.ts), no phone/email/link in the text,
// no sales filler) and
// writes db/routine-updates/<city>/content-NNN.sql: one UPDATE per listing
// behind the guard that leaves owned, claimed, paid and hand-curated listings
// alone. It uses the existing description_enriched_at column, which the
// content-upgrade migration cleared for every listing: a listing is changed
// only while that is empty, and the update sets it to now, so a file applied
// twice changes nothing.
// No schema change; the undo point is the database backup taken before the
// run (see scripts/content-upgrade/undo.mjs).
//
//   node scripts/content-upgrade/to-sql.mjs <city> <chunk number>
import { readFileSync, writeFileSync, mkdirSync } from 'node:fs';

const [city, chunkArg] = process.argv.slice(2);
if (!['pretoria', 'polokwane', 'capetown'].includes(city) || !/^\d{1,3}$/.test(chunkArg ?? '')) {
  console.error('Usage: node scripts/content-upgrade/to-sql.mjs <pretoria|polokwane|capetown> <chunk number>');
  process.exit(2);
}
const nnn = String(Number(chunkArg)).padStart(3, '0');
const chunk = JSON.parse(readFileSync(`content-upgrade/${city}/chunk-${nnn}.json`, 'utf8'));
let out;
try {
  out = JSON.parse(readFileSync(`content-upgrade/out/${city}/chunk-${nnn}.json`, 'utf8'));
} catch (e) {
  console.error(`Can't read content-upgrade/out/${city}/chunk-${nnn}.json: ${e.message}`);
  process.exit(1);
}

const words = (t) => (t.match(/[A-Za-z0-9'’&-]+/g) ?? []).length;
const FILLER = /\b(one[- ]stop[- ]shop|look no further|best in (town|the city|pretoria|polokwane|cape town)|second to none|unbeatable|world[- ]class|top[- ]notch|your go-to)\b/i;
const PHONE = /(\+27|\b0\d{2})[\s-]?\d{3}[\s-]?\d{4}\b/;
const EMAIL = /[^\s@]+@[^\s@]+\.[a-z]{2,}/i;
const LINK = /(https?:\/\/|www\.|\b[a-z0-9-]+\.(co\.za|com|org\.za|net)\b)/i;

const expected = new Set(chunk.listings.map((l) => l.slug));
const seen = new Set();
const errors = [];
const items = Array.isArray(out.items) ? out.items : [];
for (const [i, it] of items.entries()) {
  const at = `item ${i + 1} (${it?.slug ?? '?'})`;
  if (!it || !expected.has(it.slug)) { errors.push(`${at}: slug isn't in chunk-${nnn}`); continue; }
  if (seen.has(it.slug)) errors.push(`${at}: listed twice`);
  seen.add(it.slug);
  const d = typeof it.description === 'string' ? it.description.trim() : '';
  const w = words(d);
  if (w < 100) errors.push(`${at}: only ${w} words: rewrite it to 110-150 words (more sourced detail, more on what it offers and the area) and run this again`);
  if (w > 250) errors.push(`${at}: ${w} words: trim it to 110-150 words and run this again`);
  if (d.length > 1500) errors.push(`${at}: ${d.length} characters (the site's limit is 1,500)`);
  if (PHONE.test(d)) errors.push(`${at}: phone number in the text`);
  if (EMAIL.test(d)) errors.push(`${at}: email address in the text`);
  if (LINK.test(d)) errors.push(`${at}: link in the text`);
  if (FILLER.test(d)) errors.push(`${at}: sales filler ("${d.match(FILLER)[0]}")`);
  if (/[<>]/.test(d)) errors.push(`${at}: no HTML in the text`);
  if (!['researched', 'from_known_details'].includes(it.status)) errors.push(`${at}: status must be researched or from_known_details`);
  const src = Array.isArray(it.sources) ? it.sources : [];
  if (src.some((u) => typeof u !== 'string' || !/^https:\/\/[^\s'"]+$/.test(u) || u.length > 400)) errors.push(`${at}: sources must be https links`);
  if (it.status === 'researched' && !src.length) errors.push(`${at}: researched needs at least one source`);
}
for (const s of expected) if (!seen.has(s)) errors.push(`${s}: missing (every listing in the chunk needs a description)`);
if (errors.length) {
  console.error(`${errors.length} description(s) to fix in content-upgrade/out/${city}/chunk-${nnn}.json (nothing was written; fix them all, then run this again):\n- ${errors.join('\n- ')}`);
  process.exit(1);
}

const q = (s) => `'${String(s).replace(/'/g, "''")}'`;
// Owned, claimed, paid, owner-submitted, photographed or hand-built listings
// never change; a listing is upgraded once, and only while its text is short.
const guard = (slug) => `slug = ${q(slug)} AND description_enriched_at IS NULL AND length(COALESCE(description, '')) < 700
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id)`;

const run = `content-upgrade:${city}:${nnn}`;
const sql = [`-- ${run}: ${items.length} descriptions, generated by scripts/content-upgrade/to-sql.mjs`];
for (const it of items) {
  const src = (it.sources ?? []).map((u) => `'$[#]', ${q(u)}`).join(', ');
  sql.push(
    `-- ${it.slug} (${it.status})`,
    `UPDATE businesses SET description = ${q(it.description.trim())},${src ? ` source_urls = json_insert(CASE WHEN json_valid(source_urls) AND json_type(source_urls) = 'array' THEN source_urls ELSE '[]' END, ${src}),` : ''} description_enriched_at = datetime('now') WHERE ${guard(it.slug)};`
  );
}
mkdirSync(`db/routine-updates/${city}`, { recursive: true });
writeFileSync(`db/routine-updates/${city}/content-${nnn}.sql`, sql.join('\n') + '\n');
const researched = items.filter((i) => i.status === 'researched').length;
console.log(`ok: db/routine-updates/${city}/content-${nnn}.sql (${items.length} listings: ${researched} researched, ${items.length - researched} from known details)`);
