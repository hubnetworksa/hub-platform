#!/usr/bin/env node
// The mechanical gate for the tourism refresh routine (routines/tourism-refresh.md). That
// routine never writes SQL or code; it appends a dated proposal section to
// status/<city>/tourism-proposals.md for a person to review. This checks the newest section.
//
//   node scripts/routines/check-tourism.mjs --city <city> [--online]
//
// Fails (exit 1) when the newest section: has no "## YYYY-MM-DD" heading, a future date, or
// the same date as an earlier section; is missing any of the three required subsections;
// suggests more than 3 new attractions; gives a suggestion without "(Category, area, price,
// time)" or with a category outside Landmark / Heritage / Outdoors / Family / Day trip; backs a
// suggestion with fewer than 2 https sources on 2 different sites; suggests something already on
// the page; states a changed price or time without an https source (unless it says "could not
// confirm"); or contains HTML. --online also fetches every cited source and fails a suggestion
// when fewer than 2 of its sources can be read.
import { existsSync, readFileSync } from 'node:fs';
import path from 'node:path';
import { ROOT, parseArgs, requireCity, slugify } from './lib.mjs';

const { flags } = parseArgs(process.argv.slice(2));
const city = requireCity(flags);
const online = Boolean(flags.online);
const file = path.join(ROOT, 'status', city, 'tourism-proposals.md');
const CATEGORIES = ['Landmark', 'Heritage', 'Outdoors', 'Family', 'Day trip'];
const errors = [];
const err = (m) => errors.push(m);

if (!existsSync(file)) {
  console.log(`No proposals file at status/${city}/tourism-proposals.md yet; nothing to check.`);
  process.exit(0);
}
const text = readFileSync(file, 'utf8').replace(/\r\n/g, '\n');
const sections = text.split(/\n(?=## \d{4}-\d{2}-\d{2}\s*$)/m).map((s) => s.trim()).filter((s) => /^## /.test(s));
if (sections.length === 0) {
  console.log('FAIL no "## YYYY-MM-DD" section found');
  process.exit(1);
}
const latest = sections[sections.length - 1];
const date = latest.match(/^## (\d{4}-\d{2}-\d{2})/)[1];
const today = new Date(Date.now() + 2 * 3600_000).toISOString().slice(0, 10);
if (date > today) err(`section date ${date} is in the future`);
if (sections.slice(0, -1).some((s) => s.startsWith(`## ${date}`))) err(`there is already a section for ${date}; add to it instead of starting a second one`);
if (/<[a-z/][^>]*>/i.test(latest)) err('contains HTML; proposals are plain Markdown');

function sub(title) {
  const m = latest.match(new RegExp(`^### ${title}\\s*\\n([\\s\\S]*?)(?=^### |(?![\\s\\S]))`, 'mi'));
  return m ? m[1].trim() : null;
}
const changes = sub('Changes to existing attractions');
const closures = sub('Closures and notices');
const suggested = sub('Suggested new attractions');
if (changes === null) err('missing "### Changes to existing attractions"');
if (closures === null) err('missing "### Closures and notices"');
if (suggested === null) err('missing "### Suggested new attractions"');

const urlsIn = (s) => [...s.matchAll(/https:\/\/[^\s),]+/g)].map((m) => m[0].replace(/[.;]+$/, ''));
const hostOf = (u) => { try { return new URL(u).hostname.replace(/^www\./, ''); } catch { return null; } };

// Names already on the Things to do page, when the page has a block for this city.
const onPage = new Set();
for (const p of ['src/site-content/tourism.ts', `src/site-content/${city}/tourism.ts`]) {
  const f = path.join(ROOT, p);
  if (!existsSync(f)) continue;
  for (const m of readFileSync(f, 'utf8').matchAll(/name:\s*'([^']+)'/g)) onPage.add(slugify(m[1]));
}

// Changed figures need a source.
for (const line of (changes ?? '').split('\n').filter((l) => /^\s*-\s/.test(l))) {
  const claimsChange = /\bR\s?\d|now shows|changed|increased|decreased|new hours|opening hours/i.test(line);
  if (claimsChange && !/could not confirm/i.test(line) && urlsIn(line).length === 0) err(`a change is stated without an https source: ${line.trim().slice(0, 90)}…`);
}
for (const line of (closures ?? '').split('\n').filter((l) => /^\s*-\s/.test(l))) {
  if (!/^\s*-\s*none\b/i.test(line) && urlsIn(line).length === 0) err(`a closure or notice is stated without an https source: ${line.trim().slice(0, 90)}…`);
}

// Suggested new attractions.
const picks = [];
for (const line of (suggested ?? '').split('\n').filter((l) => /^\s*-\s/.test(l))) {
  if (/^\s*-\s*none\b/i.test(line)) continue;
  const m = line.match(/^\s*-\s*\*\*(.+?)\*\*\s*\(([^)]*(?:\([^)]*\)[^)]*)*)\)\s*:\s*(.+)$/);
  if (!m) { err(`suggestion is not in the "- **Name** (Category, area, price, time): blurb. Sources: …" shape: ${line.trim().slice(0, 90)}…`); continue; }
  const [, name, facts, rest] = m;
  const e = [];
  const category = facts.split(',')[0].trim();
  if (!CATEGORIES.includes(category)) e.push(`category '${category}' is not one of ${CATEGORIES.join(', ')}`);
  if (facts.split(',').length < 4) e.push('needs category, area, price and time in the brackets');
  const urls = urlsIn(rest);
  const hosts = new Set(urls.map(hostOf).filter(Boolean));
  if (hosts.size < 2) e.push(`needs at least 2 https sources on different sites (has ${hosts.size})`);
  if (onPage.has(slugify(name))) e.push('already on the Things to do page');
  picks.push({ name, urls, e });
}
if (picks.length > 3) err(`${picks.length} new attractions suggested; the limit is 3 per run`);

async function readable(u) {
  try {
    const res = await fetch(u, { signal: AbortSignal.timeout(20000), redirect: 'follow', headers: { 'User-Agent': 'Mozilla/5.0 (compatible; HubTourismCheck/1.0)' } });
    return res.ok;
  } catch {
    return false;
  }
}
if (online) {
  for (const p of picks) {
    if (p.e.length) continue;
    let ok = 0;
    for (const u of p.urls) if (await readable(u)) ok++;
    if (ok < 2) p.e.push(`only ${ok} of its sources could be read; needs 2`);
  }
}

for (const m of errors) console.log(`FAIL ${m}`);
for (const p of picks) {
  if (p.e.length) {
    console.log(`FAIL suggestion: ${p.name}`);
    for (const m of p.e) console.log(`   - ${m}`);
  } else console.log(`ok   suggestion: ${p.name}${online ? ' (sources readable)' : ''}`);
}
const failed = errors.length + picks.filter((p) => p.e.length).length;
console.log(`\nSection ${date}: ${picks.length} suggestion(s), ${failed ? `${failed} problem(s)` : 'no problems'}.`);
process.exit(failed ? 1 : 0);
