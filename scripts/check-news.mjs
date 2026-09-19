// Mechanical quality gate for news articles proposed by the daily news
// routine (ROUTINE.news.<city>.md). Run it on every SQL file before pushing:
//
//   node scripts/check-news.mjs <file.sql> --city capetown [--online] [--export out.json]
//   node scripts/check-news.mjs --all --city capetown        (every db/routine-updates/<city>/*.sql that touches `news`)
//
// Offline checks: the file only inserts into `news`, every row is well
// formed, recent, has >= 2 distinct source hosts, no HTML, sane lengths.
// --online additionally fetches every source and checks that (a) at least
// two sources are reachable, (b) no run of 8 words is copied verbatim from
// a source, and (c) every number in the article appears in a source.
// Exits non-zero if any article fails, so a bad article never gets pushed.

import { DatabaseSync } from 'node:sqlite';
import { readFileSync, readdirSync, writeFileSync, existsSync } from 'node:fs';

const args = process.argv.slice(2);
const flag = (name) => args.includes(`--${name}`);
const opt = (name) => {
  const i = args.indexOf(`--${name}`);
  return i >= 0 ? args[i + 1] : undefined;
};
const city = opt('city');
const online = flag('online');
const exportPath = opt('export');
const maxAgeDays = Number(opt('max-age-days') ?? 10);
const CATEGORIES = ['Traffic', 'Utilities', 'Business', 'Sport', 'Tourism', 'Community'];

if (!city) {
  console.error('Missing --city <capetown|pretoria|polokwane>');
  process.exit(2);
}

const files = [];
if (flag('all')) {
  const dir = `db/routine-updates/${city}`;
  if (existsSync(dir)) {
    for (const f of readdirSync(dir).sort()) {
      if (!f.endsWith('.sql')) continue;
      if (/INTO\s+news\b/i.test(readFileSync(`${dir}/${f}`, 'utf8'))) files.push(`${dir}/${f}`);
    }
  }
} else {
  const f = args.find((a) => a.endsWith('.sql'));
  if (!f) {
    console.error('Give a .sql file or --all');
    process.exit(2);
  }
  files.push(f);
}
if (files.length === 0) {
  console.log('No news SQL files to check.');
  process.exit(0);
}

const migration = readdirSync(`db/migrations/${city}`).find((f) => f.endsWith('_news.sql'));
if (!migration) {
  console.error(`No *_news.sql migration in db/migrations/${city}`);
  process.exit(2);
}
const schema = readFileSync(`db/migrations/${city}/${migration}`, 'utf8');

const snapshotPath = `status/${city}/db-snapshot.json`;
const existing = existsSync(snapshotPath) ? (JSON.parse(readFileSync(snapshotPath, 'utf8')).news ?? []) : [];

const host = (u) => new URL(u).hostname.replace(/^www\./, '').toLowerCase();
const words = (t) => t.toLowerCase().replace(/[^a-z0-9\s]/g, ' ').split(/\s+/).filter(Boolean);

function stripHtml(html) {
  return html
    .replace(/<script[\s\S]*?<\/script>/gi, ' ')
    .replace(/<style[\s\S]*?<\/style>/gi, ' ')
    .replace(/<[^>]+>/g, ' ')
    .replace(/&nbsp;|&#160;/g, ' ')
    .replace(/&amp;/g, '&')
    .replace(/\s+/g, ' ');
}

async function fetchText(url) {
  const ctl = new AbortController();
  const timer = setTimeout(() => ctl.abort(), 20000);
  try {
    const res = await fetch(url, { signal: ctl.signal, redirect: 'follow', headers: { 'User-Agent': 'Mozilla/5.0 (compatible; HubNewsCheck/1.0)', Accept: 'text/html,*/*' } });
    if (!res.ok) return { ok: false, status: res.status, text: '' };
    return { ok: true, status: res.status, text: stripHtml(await res.text()) };
  } catch (e) {
    return { ok: false, status: String(e.message ?? e), text: '' };
  } finally {
    clearTimeout(timer);
  }
}

let failed = 0;
let checked = 0;
const exported = [];

for (const file of files) {
  const sql = readFileSync(file, 'utf8');
  const problems = [];

  // Only news inserts — a news file must not be able to touch anything else.
  const statements = sql
    .replace(/--.*$/gm, '')
    .split(/;\s*(?:\n|$)/)
    .map((s) => s.trim())
    .filter(Boolean);
  for (const s of statements) {
    if (!/^INSERT\s+(OR\s+IGNORE\s+)?INTO\s+(news|fuel_prices)\b/i.test(s)) problems.push(`Statement is not an INSERT INTO news / fuel_prices: ${s.slice(0, 60)}…`);
  }

  const db = new DatabaseSync(':memory:');
  db.exec(schema);
  try {
    db.exec(sql);
  } catch (e) {
    problems.push(`SQL does not run: ${e.message}`);
  }

  const rows = problems.length ? [] : db.prepare('SELECT * FROM news ORDER BY id').all();
  const fuelRows = problems.length ? [] : db.prepare('SELECT * FROM fuel_prices ORDER BY id').all();
  if (!problems.length && rows.length === 0 && fuelRows.length === 0) problems.push('File inserts no rows.');

  // Fuel prices: regulated monthly pump prices. Sanity ranges, >= 2 source
  // sites, and (online) every price must literally appear in a source.
  const FUEL_REGION = { capetown: 'coastal', pretoria: 'inland', polokwane: 'inland' };
  const FUEL_GRADES = ['Petrol 95', 'Petrol 93', 'Diesel 50ppm', 'Diesel 500ppm'];
  for (const f of fuelRows) {
    checked++;
    const p = [];
    const label = `fuel ${f.period} ${f.grade}`;
    if (!/^\d{4}-(0[1-9]|1[0-2])$/.test(f.period)) p.push('period must be YYYY-MM');
    if (f.region !== FUEL_REGION[city]) p.push(`region must be '${FUEL_REGION[city]}' for ${city}`);
    if (!FUEL_GRADES.includes(f.grade)) p.push(`grade must be one of ${FUEL_GRADES.join(', ')}`);
    if (f.price_cents < 1000 || f.price_cents > 4500) p.push('price_cents out of range (R10-R45 per litre)');
    if (Math.abs(f.change_cents) > 600) p.push('change_cents out of range (+/- R6)');
    if (!/^https:\/\//.test(f.source_url)) p.push('source_url must be https');
    let furls = [];
    try {
      furls = JSON.parse(f.verification_json);
      if (!Array.isArray(furls) || !furls.every((u) => typeof u === 'string' && /^https:\/\//.test(u))) throw new Error();
    } catch {
      p.push('verification_json must be a JSON array of https URLs');
      furls = [];
    }
    if (new Set(furls.map((u) => { try { return host(u); } catch { return u; } })).size < 2) p.push('fuel price needs sources from at least 2 different sites');
    if (online && !p.length) {
      const results = await Promise.all(furls.map(async (u) => ({ u, ...(await fetchText(u)) })));
      const corpus = results.filter((x) => x.ok).map((x) => x.text).join(' ');
      if (results.filter((x) => x.ok).length < 2) p.push('fewer than 2 fuel sources could be fetched and read');
      const price = (f.price_cents / 100).toFixed(2);
      if (corpus && !corpus.replace(/,/g, '.').includes(price)) p.push(`price R${price} not found in any source`);
    }
    if (p.length) {
      failed++;
      console.log(`FAIL ${label}`);
      for (const x of p) console.log(`   - ${x}`);
    } else {
      console.log(`ok   ${label}`);
    }
  }
  const seenSlugs = new Set();
  const today = new Date();
  const todayStr = today.toISOString().slice(0, 10);

  for (const r of rows) {
    checked++;
    const p = [];
    const label = r.slug || `row ${r.id}`;
    if (!/^[a-z0-9]+(-[a-z0-9]+)*$/.test(r.slug) || r.slug.length > 90) p.push('slug must be lowercase-hyphen, <= 90 chars');
    if (seenSlugs.has(r.slug)) p.push('duplicate slug in file');
    seenSlugs.add(r.slug);
    if (existing.some((e) => e.slug === r.slug || e.source_url === r.source_url)) p.push('already published (slug or main source URL in db-snapshot)');
    if (r.title.length < 15 || r.title.length > 140) p.push('title must be 15-140 chars');
    if (!CATEGORIES.includes(r.category)) p.push(`category must be one of ${CATEGORIES.join(', ')}`);
    if (!/^\d{4}-\d{2}-\d{2}$/.test(r.published_date) || Number.isNaN(Date.parse(r.published_date))) p.push('published_date must be YYYY-MM-DD');
    else {
      const age = (Date.parse(todayStr) - Date.parse(r.published_date)) / 86400000;
      if (age < 0) p.push('published_date is in the future');
      if (age > maxAgeDays) p.push(`published_date is ${age} days old (max ${maxAgeDays})`);
    }
    if (!r.source_name.trim()) p.push('source_name missing');
    if (!/^https:\/\//.test(r.source_url)) p.push('source_url must be https');
    if (r.summary.length < 40 || r.summary.length > 240) p.push('summary must be 40-240 chars');
    const paras = r.body.split(/\n{2,}/).map((x) => x.trim()).filter(Boolean);
    if (paras.length < 2) p.push('body needs at least 2 paragraphs (separated by a blank line)');
    if (r.body.length < 350 || r.body.length > 3500) p.push('body must be 350-3500 chars');
    for (const field of ['title', 'summary', 'body', 'source_name']) {
      if (/[<>]/.test(r[field])) p.push(`${field} must not contain < or >`);
    }
    if (r.source !== 'agent') p.push("source must be 'agent'");

    let urls = [];
    try {
      urls = JSON.parse(r.verification_json);
      if (!Array.isArray(urls) || !urls.every((u) => typeof u === 'string' && /^https:\/\//.test(u))) throw new Error();
    } catch {
      p.push('verification_json must be a JSON array of https URLs');
      urls = [];
    }
    const hosts = new Set(urls.map((u) => { try { return host(u); } catch { return u; } }));
    if (hosts.size < 2) p.push('verification_json needs sources from at least 2 different sites');
    if (!urls.includes(r.source_url)) p.push('verification_json must include source_url');

    if (r.image_url) {
      if (!/^https:\/\//.test(r.image_url)) p.push('image_url must be https');
      if (!r.image_credit) p.push('image_credit required when image_url is set');
      if (!['official', 'stock'].includes(r.image_source)) p.push("image_source must be 'official' or 'stock'");
    }

    if (online && urls.length && !p.some((x) => x.startsWith('verification_json'))) {
      const results = await Promise.all(urls.map(async (u) => ({ u, ...(await fetchText(u)) })));
      const reachable = results.filter((x) => x.ok);
      for (const x of results.filter((y) => !y.ok)) console.log(`   note: could not read ${x.u} (${x.status})`);
      if (new Set(reachable.map((x) => host(x.u))).size < 2) p.push('fewer than 2 different sources could be fetched and read');
      const corpus = reachable.map((x) => x.text).join(' \n ');
      const corpusWords = words(corpus);
      const corpusJoined = ` ${corpusWords.join(' ')} `;
      const bodyWords = words(r.body);
      for (let i = 0; i + 8 <= bodyWords.length; i++) {
        if (corpusJoined.includes(` ${bodyWords.slice(i, i + 8).join(' ')} `)) {
          p.push(`copied text: 8+ words taken verbatim from a source ("${bodyWords.slice(i, i + 8).join(' ')}…") — rewrite in your own words`);
          break;
        }
      }
      if (reachable.length) {
        const corpusNums = corpus.replace(/(\d)[,\s](?=\d{3})/g, '$1');
        const nums = [...new Set((r.title + ' ' + r.summary + ' ' + r.body).replace(/(\d)[,\s](?=\d{3})/g, '$1').match(/\d+(?:[.:]\d+)?/g) ?? [])].filter((n) => n.length >= 2);
        const missing = nums.filter((n) => !corpusNums.includes(n));
        if (missing.length) p.push(`numbers not found in any source: ${missing.join(', ')} — remove or fix them`);
      }
    }

    if (p.length) {
      failed++;
      console.log(`FAIL ${label}`);
      for (const x of p) console.log(`   - ${x}`);
    } else {
      console.log(`ok   ${label}${online ? ' (online checks passed)' : ''}`);
      exported.push({ id: exported.length + 1, ...r });
    }
  }

  if (problems.length) {
    failed++;
    console.log(`FAIL ${file}`);
    for (const x of problems) console.log(`   - ${x}`);
  }
  db.close();
}

if (exportPath && exported.length) {
  const cols = ['id', 'slug', 'title', 'category', 'published_date', 'source_name', 'source_url', 'summary', 'body', 'image_url', 'image_credit', 'verification_json'];
  writeFileSync(exportPath, JSON.stringify(exported.map((r) => Object.fromEntries(cols.map((c) => [c, r[c] ?? null]))), null, 2));
  console.log(`Exported ${exported.length} passing article(s) to ${exportPath}`);
}

console.log(`\n${checked} article(s) checked, ${failed} failed.`);
process.exit(failed ? 1 : 0);
