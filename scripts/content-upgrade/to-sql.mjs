#!/usr/bin/env node
// Turns one agent's content-upgrade output into the guarded SQL the deploy
// applies (content-upgrade/README.md). The agent writes only what it decided:
//
//   content-upgrade/out/<city>/chunk-NNN.json
//   { "items": [ { "slug": "...", "description": "...", "status": "researched", "sources": ["https://..."] }, ... ] }
//
// Every listing in the chunk must appear once, with one of two statuses:
//   researched: a proper description, 100-250 words (target 110-150), at most
//     1,500 characters (the site's limit, LONG_DESC_MAX in src/lib/rich-text.ts),
//     no phone/email/link in the text, no sales filler, at least one source URL
//     that the research file holds for that listing.
//   deferred: NO description. The research found nothing real about the
//     business yet, so it is held back for a deeper pass. It needs a `reason`
//     (what was tried / why nothing was usable). Nothing generic is ever written:
//     the owner's rule is that padded or boilerplate text is worse than the
//     current one-liner, because Google treats it as low-value content.
// The script writes db/routine-updates/<city>/content-NNN.sql: one UPDATE per
// researched listing behind the guard that leaves owned, claimed, paid and
// hand-curated listings alone. It uses the existing description_enriched_at
// column, which the content-upgrade migration cleared for every listing: a
// listing is changed only while that is empty, and the update sets it to now,
// so a file applied twice changes nothing. Deferred listings get no SQL.
// It also writes content-upgrade/<city>/done-NNN.json (slug, status, sources or
// reason per listing): there is no database column for this, so the sidecar is
// how the deeper pass later lists the deferred listings.
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

// Sources of a researched description must be URLs the research file holds for
// that slug (pages, search results, website, existing_sources), so nobody cites
// a page they never saw.
const normUrl = (u) => String(u).trim().replace(/#.*$/, '').replace(/^https?:\/\/(www\.|m\.)?/i, '').replace(/\/+$/, '').toLowerCase();
let research = null;
const researchUrls = new Map();
try {
  research = JSON.parse(readFileSync(`content-upgrade/research/${city}/chunk-${nnn}.json`, 'utf8'));
  const base = new Map(chunk.listings.map((l) => [l.slug, l]));
  for (const r of research.listings ?? []) {
    const l = base.get(r.slug) ?? {};
    researchUrls.set(r.slug, new Set([l.website, ...(l.existing_sources ?? []), ...(r.pages ?? []).map((p) => p.url), ...(r.search ?? []).map((x) => x.url)].filter(Boolean).map(normUrl)));
  }
} catch { console.error(`note: no research file at content-upgrade/research/${city}/chunk-${nnn}.json; source URLs not cross-checked`); }

const expected = new Set(chunk.listings.map((l) => l.slug));
const seen = new Set();
const errors = [];
const items = Array.isArray(out.items) ? out.items : [];
for (const [i, it] of items.entries()) {
  const at = `item ${i + 1} (${it?.slug ?? '?'})`;
  if (!it || !expected.has(it.slug)) { errors.push(`${at}: slug isn't in chunk-${nnn}`); continue; }
  if (seen.has(it.slug)) errors.push(`${at}: listed twice`);
  seen.add(it.slug);
  if (it.status === 'from_known_details') {
    errors.push(`${at}: from_known_details is no longer allowed (generic text is forbidden). Either write a proper researched description from real sources, or mark it {"status": "deferred", "reason": "..."} with no description`);
    continue;
  }
  if (it.status === 'deferred') {
    if (typeof it.description === 'string' && it.description.trim()) errors.push(`${at}: deferred items carry no description (nothing generic is published; the listing is held back for a deeper pass)`);
    if (typeof it.reason !== 'string' || it.reason.trim().length < 10) errors.push(`${at}: deferred needs a reason (what was tried / why nothing was usable)`);
    continue;
  }
  if (it.status !== 'researched') { errors.push(`${at}: status must be researched or deferred`); continue; }
  const d = typeof it.description === 'string' ? it.description.trim() : '';
  const w = words(d);
  if (w < 100) errors.push(`${at}: only ${w} words: rewrite it to 110-150 words from the sources (more on what it offers) and run this again; if the sources don't support 100 real words, mark it deferred instead`);
  if (w > 250) errors.push(`${at}: ${w} words: trim it to 110-150 words and run this again`);
  if (d.length > 1500) errors.push(`${at}: ${d.length} characters (the site's limit is 1,500)`);
  if (PHONE.test(d)) errors.push(`${at}: phone number in the text`);
  if (EMAIL.test(d)) errors.push(`${at}: email address in the text`);
  if (LINK.test(d)) errors.push(`${at}: link in the text`);
  if (FILLER.test(d)) errors.push(`${at}: sales filler ("${d.match(FILLER)[0]}")`);
  if (/[<>]/.test(d)) errors.push(`${at}: no HTML in the text`);
  const src = Array.isArray(it.sources) ? it.sources : [];
  if (src.some((u) => typeof u !== 'string' || !/^https?:\/\/[^\s'"]+$/.test(u) || u.length > 400)) errors.push(`${at}: sources must be http(s) links`);
  if (src.length && research) {
    const allowed = researchUrls.get(it.slug) ?? new Set();
    const bad = src.filter((u) => !allowed.has(normUrl(u)));
    if (bad.length) errors.push(`${at}: source(s) not in the research file for this listing (cite only pages you were given): ${bad.join(', ')}`);
  }
  if (!src.length) errors.push(`${at}: researched needs at least one source`);
}
for (const s of expected) if (!seen.has(s)) errors.push(`${s}: missing (every listing in the chunk must appear, as researched or deferred)`);
// The same sentence in 3+ descriptions is templated filler.
const sentences = new Map();
for (const it of items) {
  const mine = new Set();
  for (const raw of String(it?.description ?? '').split(/(?<=[.!?])\s+/)) {
    const n = raw.toLowerCase().replace(/[^a-z0-9 ]+/g, ' ').replace(/\s+/g, ' ').trim();
    if (n.split(' ').length < 4 || mine.has(n)) continue;
    mine.add(n);
    if (!sentences.has(n)) sentences.set(n, { text: raw.trim(), slugs: [] });
    sentences.get(n).slugs.push(it.slug);
  }
}
for (const { text, slugs } of sentences.values()) {
  if (slugs.length >= 3) errors.push(`templated filler, remove it: "${text}" appears in ${slugs.length} descriptions (${slugs.join(', ')})`);
}
if (errors.length) {
  console.error(`${errors.length} description(s) to fix in content-upgrade/out/${city}/chunk-${nnn}.json (nothing was written; fix them all, then run this again):\n- ${errors.join('\n- ')}`);
  process.exit(1);
}

const q = (s) => `'${String(s).replace(/'/g, "''")}'`;
// Owned, claimed, paid, owner-submitted, photographed or hand-built listings
// never change; a listing is upgraded once, and only while its text is short.
// The text-unchanged condition (description = the batch file's
// current_description) matters because admin edits made through the Edit modal
// don't stamp description_enriched_at, so without it a hand-written rewrite made
// after the batch was prepared would be overwritten by this update.
const current = new Map(chunk.listings.map((l) => [l.slug, l.current_description]));
const sameText = (slug) => {
  const c = current.get(slug);
  return c == null || String(c) === '' ? `COALESCE(description, '') = ''` : `description = ${q(c)}`;
};
const guard = (slug) => `slug = ${q(slug)} AND ${sameText(slug)} AND description_enriched_at IS NULL AND length(COALESCE(description, '')) < 700
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id)`;

const run = `content-upgrade:${city}:${nnn}`;
const written = items.filter((i) => i.status === 'researched');
const deferred = items.filter((i) => i.status === 'deferred');
const sql = [`-- ${run}: ${written.length} descriptions (${deferred.length} deferred, no SQL), generated by scripts/content-upgrade/to-sql.mjs`];
for (const it of written) {
  const src = (it.sources ?? []).map((u) => `'$[#]', ${q(u)}`).join(', ');
  sql.push(
    `-- ${it.slug} (${it.status})`,
    `UPDATE businesses SET description = ${q(it.description.trim())},${src ? ` source_urls = json_insert(CASE WHEN json_valid(source_urls) AND json_type(source_urls) = 'array' THEN source_urls ELSE '[]' END, ${src}),` : ''} description_enriched_at = datetime('now') WHERE ${guard(it.slug)};`
  );
}
mkdirSync(`db/routine-updates/${city}`, { recursive: true });
writeFileSync(`db/routine-updates/${city}/content-${nnn}.sql`, sql.join('\n') + '\n');
writeFileSync(`content-upgrade/${city}/done-${nnn}.json`, JSON.stringify({
  city, chunk: Number(nnn), generated_at: new Date().toISOString(),
  items: items.map((i) => i.status === 'deferred'
    ? { slug: i.slug, status: 'deferred', reason: i.reason.trim() }
    : { slug: i.slug, status: 'researched', sources: i.sources ?? [] }),
}, null, 2) + '\n');
console.log(`ok: db/routine-updates/${city}/content-${nnn}.sql (${items.length} listings: ${written.length} researched, ${deferred.length} deferred)`);
