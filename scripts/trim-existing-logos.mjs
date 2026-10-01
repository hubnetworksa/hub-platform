#!/usr/bin/env node
// One-off: trims the empty border off every business logo already in R2, so
// logos uploaded before the upload page started trimming (see prepareLogo in
// src/pages/my-businesses/edit.astro) fill their tile too. Same algorithm:
// crop away transparent (alpha < 16) and near-white (all channels > 245)
// rows/columns, keep a 4% margin, scale to fit 768x768 (never upscaled) and
// save as WebP (transparency kept). An effectively blank logo, or one where
// the trim would remove more than 98%, is left alone.
//
//   node scripts/trim-existing-logos.mjs --site polokwane --dry-run [--out <dir>]
//   node scripts/trim-existing-logos.mjs --site polokwane
//
// --dry-run is read-only: lists logos from D1, downloads each from R2 and
// writes the trimmed file to --out (default: a temp folder) — nothing in D1
// or R2 changes. Without it, each trimmed logo is uploaded under a NEW key
// business-logos/<id>/<uuid>.webp (/media/ is cached immutable, so a key is
// never reused), businesses.logo_key is switched to it (only if it still
// holds the old key), and the old object is deleted — so rebuild/deploy the
// site right after: until then built pages still point at the old key.

import { execFileSync } from 'node:child_process';
import { mkdir, readFile, writeFile } from 'node:fs/promises';
import { randomUUID } from 'node:crypto';
import { fileURLToPath } from 'node:url';
import os from 'node:os';
import path from 'node:path';
import sharp from 'sharp';

const args = process.argv.slice(2);
const argValue = (name) => {
  const i = args.indexOf(name);
  return i >= 0 ? args[i + 1] : undefined;
};
const SITE = argValue('--site');
const DRY_RUN = args.includes('--dry-run');
if (!SITE) {
  console.error('Usage: node scripts/trim-existing-logos.mjs --site <city> [--dry-run] [--out <dir>]');
  process.exit(1);
}

const ROOT = path.join(path.dirname(fileURLToPath(import.meta.url)), '..');
const site = JSON.parse(await readFile(path.join(ROOT, 'sites', `${SITE}.json`), 'utf8'));
const DB_NAME = site.dbName;
const WRANGLER_JS = path.join(ROOT, 'node_modules', 'wrangler', 'bin', 'wrangler.js');
const WRANGLER_CONFIG = path.join(ROOT, `wrangler.${SITE}.jsonc`);
const configText = await readFile(WRANGLER_CONFIG, 'utf8');
const BUCKET = configText.match(/"binding"\s*:\s*"MEDIA"\s*,\s*"bucket_name"\s*:\s*"([^"]+)"/)?.[1];
if (!BUCKET) throw new Error(`No MEDIA bucket found in ${WRANGLER_CONFIG}`);
const OUT_DIR = argValue('--out') ?? path.join(os.tmpdir(), `trim-logos-${SITE}`);

const LOGO_MAX_PX = 768;

function wrangler(cmdArgs) {
  return execFileSync(process.execPath, [WRANGLER_JS, ...cmdArgs, '--config', WRANGLER_CONFIG], {
    encoding: 'utf8',
    maxBuffer: 64 * 1024 * 1024,
  });
}

function query(sql) {
  const raw = wrangler(['d1', 'execute', DB_NAME, '--remote', '--json', '--command', sql]);
  return JSON.parse(raw.slice(raw.indexOf('[')))[0]?.results ?? [];
}

const sqlString = (s) => `'${String(s).replace(/'/g, "''")}'`;

/** Bounding box of the non-empty pixels plus a 4% margin, or null to keep the
 *  whole image. Mirrors logoTrimBox in src/pages/my-businesses/edit.astro. */
function logoTrimBox(px, w, h) {
  let x0 = w, y0 = h, x1 = -1, y1 = -1;
  for (let y = 0; y < h; y++) {
    for (let x = 0; x < w; x++) {
      const i = (y * w + x) * 4;
      if (px[i + 3] < 16 || (px[i] > 245 && px[i + 1] > 245 && px[i + 2] > 245)) continue;
      if (x < x0) x0 = x;
      if (x > x1) x1 = x;
      if (y < y0) y0 = y;
      if (y > y1) y1 = y;
    }
  }
  if (x1 < 0) return null;
  const bw = x1 - x0 + 1;
  const bh = y1 - y0 + 1;
  if (bw * bh < 0.02 * w * h) return null;
  const m = Math.round(0.04 * Math.max(bw, bh));
  const x = Math.max(0, x0 - m);
  const y = Math.max(0, y0 - m);
  const box = { x, y, w: Math.min(w, x1 + 1 + m) - x, h: Math.min(h, y1 + 1 + m) - y };
  return box.w === w && box.h === h ? null : box;
}

/** Returns { buffer, before, after } or null when there's nothing to trim. */
async function trimLogo(input) {
  const { data, info } = await sharp(input).rotate().ensureAlpha().raw().toBuffer({ resolveWithObject: true });
  const { width: w, height: h } = info;
  const box = logoTrimBox(data, w, h);
  if (!box) return null;
  const buffer = await sharp(data, { raw: { width: w, height: h, channels: 4 } })
    .extract({ left: box.x, top: box.y, width: box.w, height: box.h })
    .resize(LOGO_MAX_PX, LOGO_MAX_PX, { fit: 'inside', withoutEnlargement: true })
    .webp({ quality: 90, alphaQuality: 100 })
    .toBuffer();
  const meta = await sharp(buffer).metadata();
  return { buffer, before: `${w}x${h}`, after: `${meta.width}x${meta.height}` };
}

await mkdir(OUT_DIR, { recursive: true });
const rows = query("SELECT id, slug, logo_key FROM businesses WHERE logo_key IS NOT NULL AND logo_key != '' ORDER BY id;");
console.log(`${SITE}: ${rows.length} business(es) with a logo (bucket ${BUCKET})${DRY_RUN ? ' — DRY RUN, nothing is written to D1/R2' : ''}`);

let trimmed = 0, skipped = 0, failed = 0;
for (const row of rows) {
  const oldKey = row.logo_key;
  // Demo/preview logos are site paths, not R2 keys.
  if (oldKey.startsWith('/')) {
    skipped++;
    continue;
  }
  const label = `#${row.id} ${row.slug}`;
  try {
    const original = path.join(OUT_DIR, `${row.id}-original${path.extname(oldKey) || '.img'}`);
    wrangler(['r2', 'object', 'get', `${BUCKET}/${oldKey}`, '--remote', '--file', original]);
    const result = await trimLogo(await readFile(original));
    if (!result) {
      console.log(`  ${label}: nothing to trim, left as is`);
      skipped++;
      continue;
    }
    const out = path.join(OUT_DIR, `${row.id}-${row.slug}-trimmed.webp`);
    await writeFile(out, result.buffer);
    if (DRY_RUN) {
      console.log(`  ${label}: ${result.before} -> ${result.after} (${out})`);
      trimmed++;
      continue;
    }
    const newKey = `business-logos/${row.id}/${randomUUID()}.webp`;
    wrangler(['r2', 'object', 'put', `${BUCKET}/${newKey}`, '--remote', '--file', out, '--content-type', 'image/webp']);
    query(`UPDATE businesses SET logo_key = ${sqlString(newKey)} WHERE id = ${Number(row.id)} AND logo_key = ${sqlString(oldKey)};`);
    const [now] = query(`SELECT logo_key FROM businesses WHERE id = ${Number(row.id)};`);
    if (now?.logo_key !== newKey) {
      // The owner changed their logo meanwhile: drop our copy, keep theirs.
      wrangler(['r2', 'object', 'delete', `${BUCKET}/${newKey}`, '--remote']);
      console.log(`  ${label}: logo changed during the run, skipped`);
      skipped++;
      continue;
    }
    wrangler(['r2', 'object', 'delete', `${BUCKET}/${oldKey}`, '--remote']);
    console.log(`  ${label}: ${result.before} -> ${result.after}, ${oldKey} -> ${newKey}`);
    trimmed++;
  } catch (err) {
    console.error(`  ${label}: FAILED — ${err.message.split('\n')[0]}`);
    failed++;
  }
}
console.log(`Done: ${trimmed} trimmed${DRY_RUN ? ' (dry run)' : ''}, ${skipped} skipped, ${failed} failed. Files in ${OUT_DIR}`);
if (failed) process.exitCode = 1;
