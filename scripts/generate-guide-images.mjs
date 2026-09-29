#!/usr/bin/env node
// Gives every buyer's guide topic a free, non-copyrighted, AI-generated
// header image — a flat-illustration scene matching the trade (electrician,
// builder, mechanic, security, locksmith) — via Cloudflare Workers AI
// (FLUX.1 [schnell]). Same mechanism and cost profile as
// scripts/generate-event-images.mjs: no external API key, billed against
// this Cloudflare account's own free daily neuron allowance.
//
//   node scripts/generate-guide-images.mjs [--limit N] [--dry-run]
//
// Guides are content in src/lib/guides.ts, not a database row, and one
// topic's illustration is genuinely the same scene regardless of which
// city's text sits below it (a distribution board looks like a distribution
// board in every city) — so this generates ONE image per unique guide slug,
// not one per (city, slug) pair, and uploads the identical bytes to all
// three cities' own R2 buckets under the same key (guides/<slug>.jpg), so
// each site's /media/ route serves it from its own bucket — required by the
// hotlink guard in functions/media/[[path]].ts, which checks the Referer
// against that site's own allowed hosts (see isAllowedMediaHost).
//
// Only ever fills in a guide that has no imageUrl yet — never overwrites
// one that's already set (e.g. if someone replaces the AI image with a
// real photo by hand later, a re-run of this script leaves it alone).
// Idempotent: re-running after a partial failure only (re)generates and
// patches the slugs still missing an imageUrl.
import { execFileSync } from 'node:child_process';
import { readFileSync, writeFileSync, mkdtempSync, rmSync } from 'node:fs';
import path from 'node:path';
import os from 'node:os';

const REPO = process.cwd();
const WRANGLER = path.join(REPO, 'node_modules/wrangler/bin/wrangler.js');
const GUIDES_FILE = path.join(REPO, 'src/lib/guides.ts');
const SITES = {
  capetown: { bucket: 'thecapetownhub-media', config: 'wrangler.capetown.jsonc' },
  pretoria: { bucket: 'pretoriahub-media', config: 'wrangler.pretoria.jsonc' },
  polokwane: { bucket: 'polokwanehub-media', config: 'wrangler.polokwane.jsonc' },
};

function arg(name, fallback) {
  const i = process.argv.indexOf(`--${name}`);
  return i >= 0 ? process.argv[i + 1] : fallback;
}
const limit = Number(arg('limit', '20'));
const dryRun = process.argv.includes('--dry-run');

// Same credential resolution as generate-event-images.mjs: CI already has
// these as env vars; a local run falls back to wrangler's own stored login.
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

// One themed prompt per guide topic — a generic scene of the trade at work,
// never a real branded van, a named company or a recognisable person. Flat
// illustration throughout, matching the event-image style already live on
// the site, so the two AI-image sets look like one consistent system.
const PROMPTS = {
  'how-to-choose-an-electrician': 'An electrician in overalls carefully working on an open household distribution board with wires and switches, warm indoor lighting, flat illustration style, vibrant colours, no readable text, no logos',
  'how-to-choose-a-builder': 'A builder in a hard hat reviewing house renovation plans on a clipboard at a construction site with scaffolding, daytime, flat illustration style, no readable text, no logos',
  'how-to-choose-a-mechanic': 'A mechanic in overalls working under the raised bonnet of a car in a bright workshop with tools on a wall, flat illustration style, no readable text, no logos',
  'how-to-choose-a-security-company': 'A security guard uniform and a wall-mounted alarm control panel with a keypad, a house silhouette with a perimeter fence in the background, flat illustration style, no readable text, no logos',
  'how-to-choose-a-locksmith': 'A locksmith kneeling at a front door fitting a shiny new lock cylinder with a small tool kit open beside them, warm porch light, flat illustration style, no readable text, no logos',
};

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

// Which guide slugs are still missing an imageUrl, read straight out of the
// source file rather than importing it (this is a plain .mjs script, the
// source is .ts) — good enough for "does this slug's block already set
// imageUrl", since every entry for the same slug across all three city
// arrays gets the same image together, so checking the first occurrence is
// sufficient.
const source = readFileSync(GUIDES_FILE, 'utf8');
const missingSlugs = Object.keys(PROMPTS).filter((slug) => {
  const at = source.indexOf(`slug: '${slug}'`);
  if (at === -1) return false; // guide doesn't exist (shouldn't happen — PROMPTS is meant to track guides.ts)
  const nextSlugAt = source.indexOf(`\n  {`, at); // next guide object opens with "  {" — good enough boundary
  const block = nextSlugAt === -1 ? source.slice(at) : source.slice(at, nextSlugAt);
  return !block.includes('imageUrl:');
}).slice(0, limit);

console.log(`${missingSlugs.length} guide topic(s) with no image yet: ${missingSlugs.join(', ') || '(none)'}`);
if (dryRun || missingSlugs.length === 0) process.exit(0);

const tmp = mkdtempSync(path.join(os.tmpdir(), 'guide-img-'));
let updated = source;
let done = 0;
for (const slug of missingSlugs) {
  const prompt = PROMPTS[slug];
  try {
    const bytes = await generateImage(prompt);
    const file = path.join(tmp, `${slug}.jpg`);
    writeFileSync(file, bytes);

    const key = `guides/${slug}.jpg`;
    for (const [city, cfg] of Object.entries(SITES)) {
      execFileSync(process.execPath, [WRANGLER, 'r2', 'object', 'put', `${cfg.bucket}/${key}`, '--file', file, '--config', cfg.config, '--remote', '--content-type', 'image/jpeg'], { stdio: 'pipe' });
      console.log(`  uploaded to ${city} (${cfg.bucket})`);
    }

    const url = `/media/${key}`;
    // Insert imageUrl/imageCredit right after every "slug: '<slug>'" line
    // for this topic — one per city array, three total.
    const slugLine = `slug: '${slug}',`;
    const insertion = `slug: '${slug}',\n    imageUrl: '${url}',\n    imageCredit: 'AI-generated image',`;
    const before = updated.split(slugLine).length - 1;
    updated = updated.split(slugLine).join(insertion);
    console.log(`  ok: ${slug} -> ${url} (${bytes.length} bytes, patched ${before} occurrence(s) in guides.ts)`);
    done++;
  } catch (err) {
    console.log(`  FAILED: ${slug} — ${err.message}`);
  }
}
rmSync(tmp, { recursive: true, force: true });
if (updated !== source) writeFileSync(GUIDES_FILE, updated);
console.log(`generated ${done}/${missingSlugs.length} image(s), src/lib/guides.ts ${updated !== source ? 'updated' : 'unchanged'} — review the diff, then commit and push to Ethan as usual.`);
