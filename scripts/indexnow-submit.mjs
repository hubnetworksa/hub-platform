#!/usr/bin/env node
// Tells IndexNow (Bing, Yandex, Seznam, Naver, ...; Google doesn't use it)
// which URLs changed in the deploy that just went out. Run by deploy.yml after
// a successful production deploy, as a non-fatal step.
//
//   node scripts/indexnow-submit.mjs --site polokwane [--dist dist] [--dry-run] [--all]
//
// What changed is worked out from the sitemap the build just wrote
// (<dist>/sitemap-index.xml and its children) against the URL -> lastmod map
// saved after the previous successful submission in
// status/<site>/indexnow-state.json (committed by deploy.yml's snapshot step,
// next to db-snapshot.json). Submitted: URLs that are new, whose lastmod
// changed, or that dropped out of the sitemap (so engines recheck them).
// No state file yet (first run), or --all: everything is submitted.
//
// Pages whose <lastmod> is just the build time (home, /about/, guides,
// upcoming events; see src/lib/sitemap.ts's BUILD_DATE) would otherwise look
// "changed" on every deploy, so those count only when they're new. They're
// recognised by having milliseconds: BUILD_DATE comes from new Date(), while
// every data-driven lastmod comes from a second-precision D1 timestamp or a
// plain date (always .000Z).
//
// --dry-run prints the payload(s) instead of POSTing and never writes state.
// The state file is only written after every batch was accepted, so a failed
// run is simply retried in full by the next deploy.

import { readFile, writeFile, mkdir } from 'node:fs/promises';
import { existsSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import path from 'node:path';
import { INDEXNOW_KEY } from './indexnow-key.mjs';

const ENDPOINT = 'https://api.indexnow.org/indexnow';
const MAX_URLS = 10_000;

const ROOT = path.join(path.dirname(fileURLToPath(import.meta.url)), '..');
const args = process.argv.slice(2);
const flag = (name) => args.includes(name);
const opt = (name, fallback) => {
  const i = args.indexOf(name);
  return i >= 0 && args[i + 1] ? args[i + 1] : fallback;
};

const SITE = opt('--site', process.env.SITE);
if (!SITE) {
  console.error('Usage: node scripts/indexnow-submit.mjs --site <polokwane|pretoria|capetown> [--dist dist] [--dry-run] [--all]');
  process.exit(2);
}
const DRY = flag('--dry-run');
const ALL = flag('--all');
const DIST = path.resolve(ROOT, opt('--dist', 'dist'));
const STATE_FILE = path.resolve(ROOT, opt('--state', path.join('status', SITE, 'indexnow-state.json')));

const site = JSON.parse(await readFile(path.join(ROOT, 'sites', `${SITE}.json`), 'utf8'));
const host = site.domain;
const keyLocation = `https://${host}/${INDEXNOW_KEY}.txt`;

function fail(msg) {
  // A GitHub Actions warning annotation: the deploy step is continue-on-error,
  // so this shows up on the run without failing it.
  console.log(`::warning title=IndexNow (${SITE})::${msg}`);
  process.exit(1);
}

if (!site.domainLive && !DRY) {
  console.log(`[${SITE}] domainLive is false; ${host} isn't serving this site yet, so nothing is submitted.`);
  process.exit(0);
}

// ---- Read the built sitemap ----
const tagValues = (xml, tag) => [...xml.matchAll(new RegExp(`<${tag}>([\\s\\S]*?)</${tag}>`, 'g'))].map((m) => m[1].trim());
const unescapeXml = (s) => s.replace(/&lt;/g, '<').replace(/&gt;/g, '>').replace(/&quot;/g, '"').replace(/&apos;/g, "'").replace(/&amp;/g, '&');

const indexPath = path.join(DIST, 'sitemap-index.xml');
if (!existsSync(indexPath)) fail(`No sitemap at ${indexPath}; build the site first.`);
const childUrls = tagValues(await readFile(indexPath, 'utf8'), 'loc').map(unescapeXml);

/** @type {Map<string, string>} url -> lastmod ('' when the sitemap gives none) */
const current = new Map();
for (const child of childUrls) {
  const file = path.join(DIST, new URL(child).pathname);
  const xml = await readFile(file, 'utf8');
  for (const block of tagValues(xml, 'url')) {
    const loc = tagValues(block, 'loc')[0];
    if (!loc) continue;
    current.set(unescapeXml(loc), tagValues(block, 'lastmod')[0] ?? '');
  }
}
if (current.size === 0) fail('The sitemap lists no URLs.');

const foreign = [...current.keys()].filter((u) => new URL(u).host !== host);
if (foreign.length) fail(`${foreign.length} sitemap URL(s) aren't on ${host}, e.g. ${foreign[0]}`);

const isBuildStamp = (lastmod) => /\.\d{3}Z$/.test(lastmod) && !/\.000Z$/.test(lastmod);
const BUILD = 'build';
const stateValue = (lastmod) => (isBuildStamp(lastmod) ? BUILD : lastmod);

// ---- Compare with the previous submission ----
let previous = null;
if (!ALL && existsSync(STATE_FILE)) {
  try {
    previous = JSON.parse(await readFile(STATE_FILE, 'utf8'));
    if (!previous || previous.host !== host || typeof previous.urls !== 'object') previous = null;
  } catch {
    previous = null;
  }
}

const reasons = { new: 0, changed: 0, removed: 0 };
const urlList = [];
for (const [url, lastmod] of current) {
  if (!previous) {
    urlList.push(url);
    continue;
  }
  const before = previous.urls[url];
  if (before === undefined) {
    urlList.push(url);
    reasons.new++;
  } else if (stateValue(lastmod) !== BUILD && before !== stateValue(lastmod)) {
    urlList.push(url);
    reasons.changed++;
  }
}
if (previous) {
  for (const url of Object.keys(previous.urls)) {
    if (!current.has(url)) {
      urlList.push(url);
      reasons.removed++;
    }
  }
}

const mode = previous ? `${reasons.new} new, ${reasons.changed} changed, ${reasons.removed} removed` : ALL ? 'forced full submission (--all)' : 'first run: full submission';
console.log(`[${SITE}] ${current.size} URLs in the sitemap; submitting ${urlList.length} (${mode}).`);

// ---- Submit ----
const batches = [];
for (let i = 0; i < urlList.length; i += MAX_URLS) batches.push(urlList.slice(i, i + MAX_URLS));

if (DRY) {
  for (const [n, batch] of batches.entries()) {
    const body = JSON.stringify({ host, key: INDEXNOW_KEY, keyLocation, urlList: batch });
    console.log(`\nBatch ${n + 1}/${batches.length}: POST ${ENDPOINT}`);
    console.log(`  ${batch.length} URLs, ${(Buffer.byteLength(body) / 1024).toFixed(1)} KB JSON`);
    const sample = { host, key: INDEXNOW_KEY, keyLocation, urlList: [...batch.slice(0, 5), ...(batch.length > 5 ? [`... ${batch.length - 5} more`] : [])] };
    console.log(JSON.stringify(sample, null, 2).replace(/^/gm, '  '));
  }
  if (!batches.length) console.log('Nothing to submit.');
  const keyFile = path.join(DIST, `${INDEXNOW_KEY}.txt`);
  const keyOk = existsSync(keyFile) && (await readFile(keyFile, 'utf8')).trim() === INDEXNOW_KEY;
  console.log(`\nKey file ${path.relative(ROOT, keyFile)}: ${keyOk ? 'present, body matches the key' : 'MISSING or wrong body'}`);
  console.log('Dry run: nothing was sent and the state file was not written.');
  process.exit(keyOk ? 0 : 1);
}

if (batches.length) {
  // Engines fetch keyLocation to verify ownership; if this deploy didn't
  // actually put it live, submitting would only earn a 403.
  try {
    const res = await fetch(keyLocation, { headers: { 'Cache-Control': 'no-cache' } });
    const body = (await res.text()).trim();
    if (!res.ok || body !== INDEXNOW_KEY) fail(`${keyLocation} returned HTTP ${res.status} without the key; not submitting.`);
  } catch (e) {
    fail(`Couldn't fetch ${keyLocation}: ${e.message}`);
  }
}

for (const [n, batch] of batches.entries()) {
  let res;
  try {
    res = await fetch(ENDPOINT, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json; charset=utf-8' },
      body: JSON.stringify({ host, key: INDEXNOW_KEY, keyLocation, urlList: batch }),
    });
  } catch (e) {
    fail(`Batch ${n + 1}/${batches.length} failed to send: ${e.message}`);
  }
  // 200 OK and 202 Accepted (key validation pending) are both success.
  if (res.status !== 200 && res.status !== 202) {
    const text = (await res.text().catch(() => '')).slice(0, 300);
    fail(`Batch ${n + 1}/${batches.length} rejected: HTTP ${res.status} ${text}`);
  }
  console.log(`[${SITE}] Batch ${n + 1}/${batches.length}: ${batch.length} URLs accepted (HTTP ${res.status}).`);
}

// ---- Save state (one URL per line so the committed diff stays readable) ----
const sorted = [...current.keys()].sort();
const lines = sorted.map((u) => `    ${JSON.stringify(u)}: ${JSON.stringify(stateValue(current.get(u)))}`);
const json = `{\n  "host": ${JSON.stringify(host)},\n  "submittedAt": ${JSON.stringify(new Date().toISOString())},\n  "urls": {\n${lines.join(',\n')}\n  }\n}\n`;
if (batches.length || !previous) {
  await mkdir(path.dirname(STATE_FILE), { recursive: true });
  await writeFile(STATE_FILE, json);
  console.log(`[${SITE}] Wrote ${path.relative(ROOT, STATE_FILE)}.`);
} else {
  console.log(`[${SITE}] Nothing changed since the last submission.`);
}
