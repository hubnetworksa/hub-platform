#!/usr/bin/env node
// The mechanical gate for the events routine's SQL files (routines/events.md), the events
// counterpart of scripts/check-news.mjs.
//
//   node scripts/routines/check-events.mjs <file.sql> --city <city> [--online]
//
// Fails (exit 1) on: any statement other than INSERT OR IGNORE INTO events; missing required
// fields; a type outside the allowed list; a date in the past, badly formed or more than a year
// out; a slug that doesn't follow slugify(title)-date; an event already on the site (same slug,
// or same title on the same date); fewer than 3 verification sources on 3 different sites; any
// ticket-resale site counted as a verification source; non-https links; HTML in any text field;
// an image_source other than NULL, 'stock' or 'official'; and more than 10 events in one file.
// --online also fetches every verification source and fails an event when fewer than 3 of them
// can be read and mention both a word of the title and the event's date.
import { readFileSync } from 'node:fs';
import { loadSnapshot, parseArgs, requireCity, slugify } from './lib.mjs';

const { positional, flags } = parseArgs(process.argv.slice(2));
const file = positional[0];
const city = requireCity(flags);
if (!file) {
  console.error('Usage: node scripts/routines/check-events.mjs <file.sql> --city <city> [--online]');
  process.exit(2);
}
const online = Boolean(flags.online);
const snap = loadSnapshot(city);
const known = snap.events ?? [];

const TYPES = ['Music', 'Market', 'Sport', 'Theatre', 'Food & Drink', 'Family', 'Other'];
const RESALE = /(^|\.)(quicket|computicket|webtickets|ticketpro|howler|eventbrite|ticketmaster|plankton|tixsa|itickets|ticketlab|nightsbridge)\./i;
const MAX_EVENTS = 10;

// ---------- SQL parsing (same approach as validate.mjs) ----------
const raw = readFileSync(file, 'utf8').replace(/\r\n/g, '\n');
const sql = raw.split('\n').filter((l) => !/^\s*--/.test(l)).join('\n');
function splitStatements(s) {
  const out = [];
  let cur = '', q = false;
  for (let i = 0; i < s.length; i++) {
    const c = s[i];
    if (c === "'") { if (q && s[i + 1] === "'") { cur += "''"; i++; continue; } q = !q; }
    if (c === ';' && !q) { if (cur.trim()) out.push(cur.trim()); cur = ''; continue; }
    cur += c;
  }
  if (cur.trim()) out.push(cur.trim());
  return out;
}
function splitTop(s) {
  const out = [];
  let cur = '', q = false, depth = 0;
  for (let i = 0; i < s.length; i++) {
    const c = s[i];
    if (c === "'") { if (q && s[i + 1] === "'") { cur += "''"; i++; continue; } q = !q; }
    if (!q) { if (c === '(') depth++; if (c === ')') depth--; }
    if (c === ',' && !q && depth === 0) { out.push(cur.trim()); cur = ''; continue; }
    cur += c;
  }
  if (cur.trim()) out.push(cur.trim());
  return out;
}
const unq = (v) => (v == null ? null : /^NULL$/i.test(v) ? null : v.startsWith("'") && v.endsWith("'") ? v.slice(1, -1).replace(/''/g, "'") : v);

const today = new Date(Date.now() + 2 * 3600_000).toISOString().slice(0, 10); // South African date
const inAYear = new Date(Date.now() + 366 * 86_400_000).toISOString().slice(0, 10);
const results = [];
const fileErrors = [];
const seenSlugs = new Set();

for (const stmt of splitStatements(sql)) {
  const m = stmt.match(/^INSERT\s+OR\s+IGNORE\s+INTO\s+events\s*\(([\s\S]*?)\)\s*VALUES\s*\(([\s\S]*)\)$/i);
  if (!m) { fileErrors.push(`Only INSERT OR IGNORE INTO events is allowed: ${stmt.slice(0, 70).replace(/\s+/g, ' ')}…`); continue; }
  const cols = m[1].split(',').map((c) => c.trim());
  const vals = splitTop(m[2]);
  if (cols.length !== vals.length) { fileErrors.push(`Column/value count mismatch (${cols.length} columns, ${vals.length} values)`); continue; }
  const r = Object.fromEntries(cols.map((c, i) => [c, unq(vals[i])]));
  const e = [];
  const label = r.slug ?? '(no slug)';

  for (const f of ['slug', 'title', 'type', 'event_date', 'venue', 'description', 'verification_json']) if (!r[f]) e.push(`missing ${f}`);
  if (r.type && !TYPES.includes(r.type)) e.push(`type '${r.type}' is not one of ${TYPES.join(', ')}`);
  if (r.event_date) {
    if (!/^\d{4}-\d{2}-\d{2}$/.test(r.event_date)) e.push(`event_date '${r.event_date}' is not YYYY-MM-DD`);
    else if (r.event_date < today) e.push(`event_date ${r.event_date} is in the past`);
    else if (r.event_date > inAYear) e.push(`event_date ${r.event_date} is more than a year away`);
  }
  if (r.slug && r.title && r.event_date) {
    const base = `${slugify(r.title)}-${r.event_date}`;
    if (r.slug !== base && !new RegExp(`^${base.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')}-\\d+$`).test(r.slug)) e.push(`slug should be '${base}' (or '${base}-2' if taken)`);
  }
  if (r.slug && seenSlugs.has(r.slug)) e.push('slug appears twice in this file');
  if (r.slug) seenSlugs.add(r.slug);
  if (r.slug && known.some((k) => k.slug === r.slug)) e.push('already on the site (same slug)');
  if (r.title && r.event_date && known.some((k) => k.event_date === r.event_date && slugify(k.title) === slugify(r.title))) e.push('already on the site (same title on the same date)');

  for (const f of ['title', 'venue', 'suburb', 'address', 'price', 'host', 'organiser', 'organiser_note', 'doors', 'ages', 'parking', 'traders', 'description', 'event_time', 'image_credit']) {
    if (r[f] && /[<>]/.test(r[f])) e.push(`${f} contains HTML`);
  }
  if (r.title && (r.title.length < 4 || r.title.length > 160)) e.push('title should be 4 to 160 characters');
  if (r.description && (r.description.length < 40 || r.description.length > 1200)) e.push('description should be 40 to 1,200 characters');
  for (const f of ['ticket_url', 'image_url']) {
    if (r[f] && !/^https:\/\//.test(r[f]) && !(f === 'image_url' && r[f].startsWith('/media/'))) e.push(`${f} must be an https link`);
  }
  if (r.image_source != null && !['stock', 'official'].includes(r.image_source)) e.push(`image_source must be NULL, 'stock' or 'official' (AI images are added later by the deploy)`);
  if (r.image_url && !r.image_source) e.push('image_url is set but image_source is not');

  let urls = [];
  try { urls = JSON.parse(r.verification_json ?? '[]'); } catch { e.push('verification_json is not valid JSON'); }
  if (!Array.isArray(urls)) { e.push('verification_json must be a JSON array'); urls = []; }
  const hosts = new Set();
  for (const u of urls) {
    let host = '';
    try { const p = new URL(u); if (p.protocol !== 'https:') e.push(`verification source is not https: ${u}`); host = p.hostname.replace(/^www\./, ''); } catch { e.push(`verification source is not a URL: ${u}`); continue; }
    if (RESALE.test(`.${host}`)) e.push(`ticket-resale site does not count as verification: ${host}`);
    else hosts.add(host);
  }
  if (hosts.size < 3) e.push(`needs at least 3 non-resale verification sources on different sites (has ${hosts.size})`);

  results.push({ label, r, urls, e });
}

if (results.length > MAX_EVENTS) fileErrors.push(`${results.length} events in one file; the cap is ${MAX_EVENTS}`);

// ---------- optional online check ----------
async function read(url) {
  const ctl = AbortSignal.timeout(20000);
  const res = await fetch(url, { signal: ctl, redirect: 'follow', headers: { 'User-Agent': 'Mozilla/5.0 (compatible; HubEventsCheck/1.0)', Accept: 'text/html,*/*' } });
  if (!res.ok) throw new Error(`HTTP ${res.status}`);
  return (await res.text()).replace(/<script[\s\S]*?<\/script>|<style[\s\S]*?<\/style>/gi, ' ').replace(/<[^>]+>/g, ' ').replace(/&nbsp;/g, ' ').replace(/\s+/g, ' ').toLowerCase();
}
function dateForms(iso) {
  const d = new Date(`${iso}T12:00:00Z`);
  const day = d.getUTCDate();
  const months = ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december'];
  const mon = months[d.getUTCMonth()];
  return [iso, `${day} ${mon}`, `${day} ${mon.slice(0, 3)}`, `${mon} ${day}`, `${mon.slice(0, 3)} ${day}`, `${String(day).padStart(2, '0')}/${String(d.getUTCMonth() + 1).padStart(2, '0')}`];
}
if (online) {
  for (const x of results) {
    if (x.e.length) continue;
    const words = slugify(x.r.title).split('-').filter((w) => w.length >= 4);
    const forms = dateForms(x.r.event_date);
    let confirmed = 0;
    const notes = [];
    for (const u of x.urls) {
      if (RESALE.test(`.${new URL(u).hostname}`)) continue;
      try {
        const text = await read(u);
        const hasTitle = words.length === 0 || words.some((w) => text.includes(w));
        const hasDate = forms.some((f) => text.includes(f));
        if (hasTitle && hasDate) confirmed++;
        else notes.push(`${u}: ${hasTitle ? '' : 'no title word'}${!hasTitle && !hasDate ? ', ' : ''}${hasDate ? '' : 'no date'}`);
      } catch (err) {
        notes.push(`${u}: could not read (${err.message})`);
      }
    }
    if (confirmed < 3) x.e.push(`only ${confirmed} source(s) could be read and mention the event and its date; needs 3${notes.length ? ` (${notes.join('; ')})` : ''}`);
  }
}

// ---------- report ----------
for (const m of fileErrors) console.log(`FAIL file: ${m}`);
for (const x of results) {
  if (x.e.length) {
    console.log(`FAIL ${x.label}`);
    for (const m of x.e) console.log(`   - ${m}`);
  } else console.log(`ok   ${x.label}${online ? ' (online checks passed)' : ''}`);
}
const failed = fileErrors.length + results.filter((x) => x.e.length).length;
console.log(`\n${results.length} event(s) checked, ${results.filter((x) => x.e.length).length} failed.`);
process.exit(failed ? 1 : 0);
