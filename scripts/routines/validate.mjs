#!/usr/bin/env node
// The mechanical gate for routine SQL files (replaces the checks agents used to do by hand).
//
//   node scripts/routines/validate.mjs <file.sql> --routine <discovery|centres|enrichment|closed-check> --city <city> [--max N]
//
// Fails (exit 1) on anything a routine must never write: statements outside the routine's
// narrow allow-list, unknown suburb/category slugs, missing phone or address, fewer than two
// independent sources, duplicate slugs or phone numbers (across ALL suburbs, not just the
// searched one), UPDATEs without their one-time guard, source lists that drop existing entries,
// and files with more records than the checkpoint cap. Prints WARN lines for softer concerns.
import { readFileSync } from 'node:fs';
import { digits, loadConfig, loadSnapshot, parseArgs, requireCity, slugify } from './lib.mjs';

const { positional, flags } = parseArgs(process.argv.slice(2));
const file = positional[0];
const routine = flags.routine;
const city = requireCity(flags);
if (!file || !['discovery', 'centres', 'enrichment', 'closed-check'].includes(routine)) {
  console.error('Usage: node scripts/routines/validate.mjs <file.sql> --routine <discovery|centres|enrichment|closed-check> --city <city> [--max N]');
  process.exit(2);
}
const cfg = loadConfig(city);
const snap = loadSnapshot(city);
const maxRecords = Number(flags.max ?? (routine === 'enrichment' ? cfg.enrichment.maxRecordsPerFile : routine === 'centres' ? cfg.centres.maxRecordsPerFile : cfg.discovery.maxRecordsPerFile));

const errors = [];
const warns = [];
const err = (m) => errors.push(m);
const warn = (m) => warns.push(m);

// ---------- SQL tokenising ----------
const raw = readFileSync(file, 'utf8').replace(/\r\n/g, '\n');
const noComments = raw.split('\n').filter((l) => !/^\s*--/.test(l)).join('\n');

function splitStatements(sql) {
  const out = [];
  let cur = '', q = false;
  for (let i = 0; i < sql.length; i++) {
    const c = sql[i];
    if (c === "'") { if (q && sql[i + 1] === "'") { cur += "''"; i++; continue; } q = !q; }
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
const unq = (v) => (v && v.startsWith("'") && v.endsWith("'") ? v.slice(1, -1).replace(/''/g, "'") : v === 'NULL' ? null : v);
const subSlug = (v, table) => {
  const m = new RegExp(`^\\(\\s*SELECT\\s+id\\s+FROM\\s+${table}\\s+WHERE\\s+slug\\s*=\\s*'([^']+)'\\s*\\)$`, 'i').exec(v ?? '');
  return m ? m[1] : null;
};
const hostOf = (u) => { try { return new URL(u).hostname.replace(/^www\./, ''); } catch { return null; } };
const parseUrls = (json, label) => {
  try {
    const a = JSON.parse(json);
    if (Array.isArray(a) && a.every((x) => typeof x === 'string')) return a;
  } catch { /* fall through */ }
  err(`${label}: source_urls is not a JSON array of strings`);
  return [];
};

// ---------- reference data ----------
const suburbSlugs = new Set(snap.suburbs.map((s) => s.slug));
const categorySlugs = new Set(snap.categories.map((c) => c.slug));
const centreSlugs = new Set(snap.shopping_centers.map((c) => c.slug));
const bizBySlug = new Map(snap.businesses.map((b) => [b.slug, b]));
const phoneOwner = new Map();
const addrOwner = new Map();
for (const b of snap.businesses) {
  const p = digits(b.phone).slice(-9);
  if (p.length >= 9) phoneOwner.set(p, b.slug);
  const a = String(b.address ?? '').toLowerCase().replace(/[^a-z0-9]/g, '');
  if (a.length > 8) addrOwner.set(a, b.slug);
}

// ---------- allow-lists ----------
const INSERT_TABLES = { discovery: ['businesses', 'business_categories', 'shopping_centers'], centres: ['businesses', 'business_categories', 'shopping_centers'] };
const stmts = splitStatements(noComments);
if (!stmts.length) err('The file contains no statements.');

const newBiz = new Map();       // slug -> { categories: n }
const newCentres = new Set();
const filePhones = new Map();
let records = 0;
const isDangerous = (s) => /\b(DELETE|DROP|ALTER|TRUNCATE|PRAGMA|ATTACH|REPLACE\s+INTO)\b/i.test(s.replace(/'(?:[^']|'')*'/g, "''"));

for (const s of stmts) {
  const head = s.slice(0, 70).replace(/\s+/g, ' ');
  if (isDangerous(s)) { err(`Forbidden statement: ${head}…`); continue; }

  // ----- INSERT -----
  const ins = /^INSERT\s+OR\s+IGNORE\s+INTO\s+(\w+)\s*\(([^)]*)\)\s*VALUES\s*\(([\s\S]*)\)\s*$/i.exec(s);
  if (/^INSERT\b/i.test(s)) {
    if (!ins) { err(`INSERT must be "INSERT OR IGNORE INTO <table> (cols) VALUES (...)": ${head}…`); continue; }
    const table = ins[1].toLowerCase();
    if (!(INSERT_TABLES[routine] ?? []).includes(table)) { err(`The ${routine} routine may not INSERT into ${table}.`); continue; }
    const cols = ins[2].split(',').map((c) => c.trim());
    const vals = splitTop(ins[3]);
    if (cols.length !== vals.length) { err(`Column/value count mismatch in INSERT INTO ${table}: ${head}…`); continue; }
    const row = Object.fromEntries(cols.map((c, i) => [c, vals[i]]));

    if (table === 'businesses') {
      records++;
      const slug = unq(row.slug), name = unq(row.name);
      const label = `business ${slug ?? '?'}`;
      const suburb = subSlug(row.suburb_id, 'suburbs');
      if (!slug || !/^[a-z0-9-]+$/.test(slug)) err(`${label}: slug missing or not lowercase-hyphenated`);
      if (!name) err(`${label}: name missing`);
      if (!suburb || !suburbSlugs.has(suburb)) err(`${label}: suburb slug "${suburb}" is not in the snapshot`);
      if (slug && name && suburb) {
        const expected = `${slugify(name)}-${suburb}`;
        if (slug !== expected && !new RegExp(`^${expected.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')}-\\d+$`).test(slug)) err(`${label}: slug should be "${expected}" (or with -2, -3…)`);
      }
      if (slug && bizBySlug.has(slug)) err(`${label}: already exists in the snapshot`);
      if (slug && newBiz.has(slug)) err(`${label}: appears twice in this file`);
      const phone = unq(row.phone), address = unq(row.address);
      if (!address) err(`${label}: street address is mandatory`);
      if (!phone || digits(phone).length < 9) err(`${label}: a real phone number is mandatory`);
      else {
        const p = digits(phone).slice(-9);
        if (phoneOwner.has(p)) err(`${label}: phone ${phone} already belongs to existing business "${phoneOwner.get(p)}" (possible duplicate under another suburb)`);
        if (filePhones.has(p)) err(`${label}: same phone as "${filePhones.get(p)}" in this file`);
        filePhones.set(p, slug);
      }
      if (address) {
        const a = address.toLowerCase().replace(/[^a-z0-9]/g, '');
        if (addrOwner.has(a)) warn(`${label}: same address as existing business "${addrOwner.get(a)}" (check it is not the same business)`);
      }
      if (unq(row.status) !== 'published') err(`${label}: status must be 'published'`);
      if (unq(row.origin) !== 'agent_research') err(`${label}: origin must be 'agent_research'`);
      const urls = parseUrls(unq(row.source_urls) ?? '[]', label);
      const hosts = new Set(urls.map(hostOf).filter(Boolean));
      if (urls.some((u) => !/^https:\/\//.test(u))) err(`${label}: every source must be an https link`);
      if (hosts.size < 2) err(`${label}: needs at least 2 independent sources on different websites`);
      const desc = unq(row.description) ?? '';
      if (desc.length < 20) err(`${label}: description is missing or too short`);
      if (/\b(?:[Ff]ounded|[Oo]wned|[Rr]un|[Mm]anaged|[Ss]tarted|[Ee]stablished)\s+by\s+[A-Z][a-z]+/.test(desc) || /\b(owner|founder|director)\s+[A-Z][a-z]+\s+[A-Z][a-z]+/.test(desc)) warn(`${label}: description may name an individual; descriptions must not`);
      const email = unq(row.email);
      if (email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) err(`${label}: email is not a valid address`);
      const centre = subSlug(row.shopping_center_id, 'shopping_centers');
      if (row.shopping_center_id && !centre) err(`${label}: shopping_center_id must be (SELECT id FROM shopping_centers WHERE slug = '…')`);
      if (centre && !centreSlugs.has(centre)) newCentres.has(centre) || err(`${label}: shopping centre "${centre}" is not in the snapshot or this file (insert the centre first)`);
      if (slug) newBiz.set(slug, { categories: 0 });
    } else if (table === 'business_categories') {
      const bslug = subSlug(row.business_id, 'businesses'), cslug = subSlug(row.category_id, 'categories');
      if (!bslug || !newBiz.has(bslug)) err(`business_categories: business "${bslug}" must be inserted earlier in this file`);
      else newBiz.get(bslug).categories++;
      if (!cslug || !categorySlugs.has(cslug)) err(`business_categories: category slug "${cslug}" is not in the snapshot`);
      if (row.is_primary !== '1') err(`business_categories: is_primary must be 1 for ${bslug}`);
    } else if (table === 'shopping_centers') {
      records++;
      const slug = unq(row.slug), suburb = subSlug(row.suburb_id, 'suburbs');
      const label = `shopping centre ${slug ?? '?'}`;
      if (!slug || centreSlugs.has(slug)) err(`${label}: slug missing or already exists`);
      if (!suburb || !suburbSlugs.has(suburb)) err(`${label}: suburb slug "${suburb}" is not in the snapshot`);
      if (!unq(row.address)) err(`${label}: address is mandatory`);
      if (unq(row.type) !== 'mall') err(`${label}: type must be 'mall'`);
      const urls = parseUrls(unq(row.source_urls) ?? '[]', label);
      if (new Set(urls.map(hostOf).filter(Boolean)).size < 2) err(`${label}: needs at least 2 independent sources on different websites`);
      if (slug) newCentres.add(slug);
    }
    continue;
  }

  // ----- UPDATE -----
  if (!/^UPDATE\b/i.test(s)) { err(`Only INSERT OR IGNORE and the routine's own UPDATEs are allowed: ${head}…`); continue; }
  records++;

  if (routine === 'centres') {
    const link = /^UPDATE\s+businesses\s+SET\s+shopping_center_id\s*=\s*(NULL|\(\s*SELECT\s+id\s+FROM\s+shopping_centers\s+WHERE\s+slug\s*=\s*'([^']+)'\s*\))\s+WHERE\s+slug\s*=\s*'([^']+)'$/i.exec(s);
    if (!link) { err(`The centres routine may only change shopping_center_id (link or unlink one business by slug): ${head}…`); continue; }
    const [, , cslug, bslug] = link;
    if (!bizBySlug.has(bslug) && !newBiz.has(bslug)) err(`link: business "${bslug}" is not in the snapshot`);
    if (cslug && !centreSlugs.has(cslug) && !newCentres.has(cslug)) err(`link: centre "${cslug}" is not in the snapshot or this file`);
    continue;
  }

  if (routine === 'closed-check') {
    const m = /^UPDATE\s+businesses\s+SET\s+closed_at\s*=\s*datetime\('now'\)\s+WHERE\s+slug\s*=\s*'([^']+)'\s+AND\s+closed_at\s+IS\s+NULL$/i.exec(s);
    if (!m) { err(`The closed-check routine may only run: UPDATE businesses SET closed_at = datetime('now') WHERE slug = '…' AND closed_at IS NULL: ${head}…`); continue; }
    if (!bizBySlug.has(m[1])) err(`closed_at: business "${m[1]}" is not in the snapshot`);
    continue;
  }

  if (routine === 'enrichment') {
    const email = /^UPDATE\s+businesses\s+SET\s+email\s*=\s*'([^']+)'\s+WHERE\s+slug\s*=\s*'([^']+)'\s+AND\s+\(\s*email\s+IS\s+NULL\s+OR\s+email\s*=\s*''\s*\)$/i.exec(s);
    if (email) {
      const [, addr, slug] = email;
      const label = `email for ${slug}`;
      if (!/^[^\s@']+@[^\s@']+\.[^\s@']+$/.test(addr)) err(`${label}: "${addr}" is not a valid address`);
      if (/@(gmail|yahoo|hotmail|outlook|live|icloud|webmail)\./i.test(addr)) warn(`${label}: ${addr} is a free-mail address; only keep it if the business publishes it as its contact address`);
      if (/^[a-z]+\.[a-z]+@/i.test(addr) && !/^(info|admin|sales|hello|contact|office|enquiries|accounts|bookings|reception|support)/i.test(addr)) warn(`${label}: ${addr} looks like a named individual's address; only company contact addresses are allowed`);
      const b = bizBySlug.get(slug);
      if (!b) err(`${label}: business is not in the snapshot`);
      else if (b.has_email === true) err(`${label}: the business already has an email`);
      continue;
    }
    const m = /^UPDATE\s+businesses\s+SET\s+([\s\S]+?)\s+WHERE\s+slug\s*=\s*'([^']+)'\s+AND\s+description_enriched_at\s+IS\s+NULL$/i.exec(s);
    if (!m) { err(`Enrichment UPDATE must end with "WHERE slug = '…' AND description_enriched_at IS NULL" (or be the guarded email UPDATE): ${head}…`); continue; }
    const slug = m[2];
    const label = `enrichment of ${slug}`;
    const assigns = Object.fromEntries(splitTop(m[1]).map((a) => { const i = a.indexOf('='); return [a.slice(0, i).trim(), a.slice(i + 1).trim()]; }));
    for (const c of Object.keys(assigns)) if (!['description', 'description_enriched_at', 'hours', 'source_urls'].includes(c)) err(`${label}: may not change column "${c}"`);
    if (!assigns.description) err(`${label}: description is required`);
    if (assigns.description_enriched_at !== "datetime('now')") err(`${label}: must set description_enriched_at = datetime('now')`);
    if (assigns.hours && /NULL/i.test(assigns.hours)) err(`${label}: omit hours entirely when none were found, never set it to NULL`);
    const b = bizBySlug.get(slug);
    if (!b) err(`${label}: business is not in the snapshot`);
    else if (b.description_enriched_at != null) err(`${label}: already enriched`);
    if (assigns.source_urls && b) {
      const next = parseUrls(unq(assigns.source_urls), label);
      let prev = [];
      try { prev = JSON.parse(b.source_urls ?? '[]'); } catch { /* ignore */ }
      const missing = prev.filter((u) => !next.includes(u));
      if (missing.length) err(`${label}: source_urls must append, not replace (dropped ${missing.length} existing entr${missing.length === 1 ? 'y' : 'ies'})`);
    }
    continue;
  }

  err(`The ${routine} routine writes no UPDATE statements: ${head}…`);
}

for (const [slug, v] of newBiz) if (v.categories !== 1) err(`business ${slug}: needs exactly one primary business_categories row (found ${v.categories})`);
if (records > maxRecords) err(`${records} records in one file; the cap for this routine is ${maxRecords}. Split it into more checkpoints.`);

for (const w of warns) console.log(`WARN  ${w}`);
for (const e of errors) console.log(`FAIL  ${e}`);
console.log(errors.length ? `\n${errors.length} problem(s). Fix the file and re-run; never push a file that fails.` : `ok (${records} record${records === 1 ? '' : 's'}${warns.length ? `, ${warns.length} warning${warns.length === 1 ? '' : 's'}` : ''})`);
process.exit(errors.length ? 1 : 0);
