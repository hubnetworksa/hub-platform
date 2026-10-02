#!/usr/bin/env node
// Prebuild step: copies this site's branded images (assets/sites/<SITE>/) into
// public/, and generates its ads.txt/robots.txt from sites/<SITE>.json — so
// public/ always reflects whichever SITE is currently being built, the same
// way src/data/*.json does for D1 content. public/ itself is gitignored for
// these generated files; assets/sites/<SITE>/ is the real, committed source.

import { readFile, writeFile, copyFile, readdir, mkdir, rm } from 'node:fs/promises';
import { fileURLToPath } from 'node:url';
import path from 'node:path';
import { ROBOTS_DISALLOW_PREFIXES } from './noindex-paths.mjs';
import { INDEXNOW_KEY } from './indexnow-key.mjs';

const SITE = process.env.SITE;
if (!SITE) {
  throw new Error('SITE env var is not set. Run with e.g. `SITE=polokwane npm run select-assets`.');
}
const ROOT = path.join(path.dirname(fileURLToPath(import.meta.url)), '..');
const site = JSON.parse(await readFile(path.join(ROOT, 'sites', `${SITE}.json`), 'utf8'));

const assetsDir = path.join(ROOT, 'assets', 'sites', SITE);
const publicDir = path.join(ROOT, 'public');

// Wipe first, not just copy-over — CI always starts from a clean checkout so
// this never matters there, but a local working directory that's built more
// than one SITE in a row (e.g. testing all three back to back) would
// otherwise carry a previous site's leftover files (a stale hero-banner.jpg
// sitting alongside the current site's own hero-banner.png, etc.) straight
// into the deployed dist.
await rm(publicDir, { recursive: true, force: true });
await mkdir(publicDir, { recursive: true });
await writeFile(path.join(publicDir, '.gitkeep'), '');

const files = (await readdir(assetsDir)).filter((f) => f !== 'README.md');
for (const file of files) {
  await copyFile(path.join(assetsDir, file), path.join(publicDir, file));
}

// PREVIEW ONLY: the sample logos scripts/apply-demo-premium.mjs points its
// fake paid businesses at. Production never sets DEMO_PREMIUM, so these
// never reach a production build.
if (process.env.DEMO_PREMIUM === 'true') {
  const demoDir = path.join(ROOT, 'assets', 'demo');
  for (const file of await readdir(demoDir)) {
    await copyFile(path.join(demoDir, file), path.join(publicDir, file));
  }
}

await writeFile(
  path.join(publicDir, 'ads.txt'),
  site.adsensePublisherId
    ? `google.com, pub-${site.adsensePublisherId.replace(/^ca-pub-/, '')}, DIRECT, f08c47fec0942fa0\n`
    : ''
);

const disallowLines = ROBOTS_DISALLOW_PREFIXES.map((p) => `Disallow: ${p}\n`).join('');
await writeFile(
  path.join(publicDir, 'robots.txt'),
  `User-agent: *\nAllow: /\n${disallowLines}\nSitemap: https://${site.domain}/sitemap-index.xml\n`
);

// IndexNow key-verification file: scripts/indexnow-submit.mjs submits with
// keyLocation https://<domain>/<key>.txt, and the body must be the key.
await writeFile(path.join(publicDir, `${INDEXNOW_KEY}.txt`), INDEXNOW_KEY);

process.stderr.write(`[${SITE}] Copied ${files.length} asset(s) into public/, generated ads.txt + robots.txt + IndexNow key file.\n`);
