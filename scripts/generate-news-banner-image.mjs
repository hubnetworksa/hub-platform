#!/usr/bin/env node
// Gives the News section a dedicated hero banner instead of falling back to
// the generic site.sectionBannerImage — a free, non-copyrighted, AI-generated
// image via Cloudflare Workers AI (FLUX.1 [schnell]). Same mechanism and cost
// profile as scripts/generate-guide-images.mjs: no external API key, billed
// against this Cloudflare account's own free daily neuron allowance.
//
//   node scripts/generate-news-banner-image.mjs [--dry-run]
//
// A "local news" scene isn't city-specific the way a suburb photo would be,
// so — same reasoning as the guide images — this generates ONE image and
// uploads the identical bytes to all three cities' own R2 buckets under the
// same key (banners/news.jpg), then patches sites/<city>.json's new
// newsBannerImage field. Idempotent: skips generation entirely if every
// site's JSON already has newsBannerImage set.
import { execFileSync } from 'node:child_process';
import { readFileSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import os from 'node:os';

const REPO = process.cwd();
const WRANGLER = path.join(REPO, 'node_modules/wrangler/bin/wrangler.js');
const SITES = {
  capetown: { bucket: 'thecapetownhub-media', config: 'wrangler.capetown.jsonc', jsonFile: 'sites/capetown.json' },
  pretoria: { bucket: 'pretoriahub-media', config: 'wrangler.pretoria.jsonc', jsonFile: 'sites/pretoria.json' },
  polokwane: { bucket: 'polokwanehub-media', config: 'wrangler.polokwane.jsonc', jsonFile: 'sites/polokwane.json' },
};

const dryRun = process.argv.includes('--dry-run');

function accountId() {
  if (process.env.CLOUDFLARE_ACCOUNT_ID) return process.env.CLOUDFLARE_ACCOUNT_ID;
  return '25e335c79ed876d3a1fa9e95a8c17dce'; // this account — not a secret, same id visible in every wrangler error message
}
function apiToken() {
  if (process.env.CLOUDFLARE_API_TOKEN) return process.env.CLOUDFLARE_API_TOKEN;
  const cfgPath = path.join(os.homedir(), 'AppData/Roaming/xdg.config/.wrangler/config/default.toml');
  const raw = readFileSync(cfgPath, 'utf8');
  const m = raw.match(/oauth_token\s*=\s*"([^"]+)"/);
  if (!m) throw new Error('No CLOUDFLARE_API_TOKEN and no local wrangler OAuth token found — run `wrangler login` or set CLOUDFLARE_API_TOKEN.');
  return m[1];
}

const PROMPT =
  'A neat stack of folded newspapers and a cup of coffee on a table at sunrise, a city skyline silhouette softly blurred in the background, flat illustration style, vibrant colours, no readable text, no logos';

async function generateImage(prompt) {
  const res = await fetch(`https://api.cloudflare.com/client/v4/accounts/${accountId()}/ai/run/@cf/black-forest-labs/flux-1-schnell`, {
    method: 'POST',
    headers: { Authorization: `Bearer ${apiToken()}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({ prompt, steps: 4 }),
  });
  const data = await res.json();
  if (!res.ok || !data.success || !data.result?.image) {
    throw new Error(`Workers AI request failed (${res.status}): ${JSON.stringify(data.errors ?? data).slice(0, 300)}`);
  }
  return Buffer.from(data.result.image, 'base64');
}

const alreadyDone = Object.values(SITES).every((cfg) => readFileSync(path.join(REPO, cfg.jsonFile), 'utf8').includes('"newsBannerImage"'));
if (alreadyDone) {
  console.log('Every site already has newsBannerImage set — nothing to do.');
  process.exit(0);
}
if (dryRun) {
  console.log(`Would generate 1 image and upload to ${Object.keys(SITES).length} sites' R2 buckets.`);
  process.exit(0);
}

const key = 'banners/news.jpg';
const bytes = await generateImage(PROMPT);
const tmpFile = path.join(os.tmpdir(), 'news-banner.jpg');
writeFileSync(tmpFile, bytes);
console.log(`generated ${bytes.length} bytes`);

for (const [city, cfg] of Object.entries(SITES)) {
  execFileSync(process.execPath, [WRANGLER, 'r2', 'object', 'put', `${cfg.bucket}/${key}`, '--file', tmpFile, '--config', cfg.config, '--remote', '--content-type', 'image/jpeg'], { stdio: 'pipe' });
  const jsonPath = path.join(REPO, cfg.jsonFile);
  const raw = readFileSync(jsonPath, 'utf8');
  const marker = raw.match(/^([ \t]*)"sectionBannerImage":\s*"[^"]*",\r?\n/m);
  if (!marker) throw new Error(`${cfg.jsonFile}: couldn't find sectionBannerImage to insert after`);
  const indent = marker[1];
  const eol = marker[0].endsWith('\r\n') ? '\r\n' : '\n';
  const patched = raw.replace(marker[0], `${marker[0]}${indent}"newsBannerImage": "/media/${key}",${eol}`);
  writeFileSync(jsonPath, patched);
  console.log(`  ${city}: uploaded to ${cfg.bucket}, patched ${cfg.jsonFile}`);
}
console.log('Done — review the sites/*.json diff, then commit and push to Ethan as usual.');
