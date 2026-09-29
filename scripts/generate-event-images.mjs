#!/usr/bin/env node
// Gives every event that has no image a free, non-copyrighted, AI-generated
// one — a flat-illustration scene matching its type (Market, Music, Sport...),
// via Cloudflare Workers AI (FLUX.1 [schnell]). No stock-photo licensing risk,
// no external API key: Workers AI bills against this Cloudflare account's own
// free daily neuron allowance (10,000/day free, ~230 images/day worth — see
// https://developers.cloudflare.com/workers-ai/platform/pricing/), well above
// what the events routine needs (a handful of events a week per city).
//
//   node scripts/generate-event-images.mjs --site capetown [--limit 20] [--dry-run]
//
// Only ever touches events where image_url IS NULL — never overwrites a real
// photo the events routine (or an organiser) already found. Idempotent: the
// D1 UPDATE re-checks image_url IS NULL, so a re-run can't double-charge or
// clobber a race with another writer.
import { execFileSync } from 'node:child_process';
import { readFileSync, writeFileSync, mkdtempSync, rmSync } from 'node:fs';
import path from 'node:path';
import os from 'node:os';

const REPO = process.cwd();
const WRANGLER = path.join(REPO, 'node_modules/wrangler/bin/wrangler.js');
const SITES = {
  capetown: { db: 'thecapetownhub-db', bucket: 'thecapetownhub-media' },
  pretoria: { db: 'pretoriahub-db', bucket: 'pretoriahub-media' },
  polokwane: { db: 'polokwanehub-db', bucket: 'polokwanehub-media' },
};

function arg(name, fallback) {
  const i = process.argv.indexOf(`--${name}`);
  return i >= 0 ? process.argv[i + 1] : fallback;
}
const site = arg('site');
const limit = Number(arg('limit', '20'));
const dryRun = process.argv.includes('--dry-run');
const cfg = SITES[site];
if (!cfg) {
  console.error('Usage: node scripts/generate-event-images.mjs --site <capetown|pretoria|polokwane> [--limit N] [--dry-run]');
  process.exit(2);
}

// CI (deploy workflows) already has CLOUDFLARE_API_TOKEN + CLOUDFLARE_ACCOUNT_ID
// as env vars for wrangler itself — reuse those when present. Locally, fall
// back to the token wrangler's own OAuth login already stored, so this also
// just works for a developer running it by hand (as confirmed working).
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

function d1(sql) {
  const out = execFileSync(process.execPath, [WRANGLER, 'd1', 'execute', cfg.db, '--config', `wrangler.${site}.jsonc`, '--remote', '--json', '--command', sql], { encoding: 'utf8', maxBuffer: 16 * 1024 * 1024 });
  return JSON.parse(out.slice(out.indexOf('['), out.lastIndexOf(']') + 1))[0].results;
}

// One themed prompt per event type — a scene, never the specific real venue,
// brand or a named person (all generic, so nothing depicts a real place
// incorrectly and nothing that could be mistaken for an existing photo).
// Flat-illustration style throughout: fast to generate, reads well as a card
// thumbnail, and avoids the uncanny/likeness issues photorealistic people can
// have in a generated image.
const PROMPTS = {
  Music: 'A lively outdoor live music concert at dusk, colourful stage lights, a crowd silhouette, flat illustration style, vibrant colours, no readable text, no logos',
  Market: 'A colourful outdoor food and craft market with striped awnings and stalls of fresh produce, sunny day, flat illustration style, no readable text, no logos',
  Sport: 'An energetic outdoor sports match in a stadium, colourful team silhouettes in motion, bright floodlights, flat illustration style, no readable text, no logos',
  Theatre: 'A theatre stage with red velvet curtains and dramatic spotlight, empty auditorium seats in the foreground, flat illustration style, no readable text, no logos',
  'Food & Drink': 'A warm restaurant table set with colourful dishes and drinks, string lights overhead, flat illustration style, no readable text, no logos',
  Family: 'A cheerful outdoor family fun day with balloons, a picnic blanket and a bouncy castle in a park, flat illustration style, no readable text, no logos',
  Other: 'A cheerful community event outdoors with bunting flags and a small crowd gathering, flat illustration style, no readable text, no logos',
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

const events = d1(`SELECT id, slug, title, type FROM events WHERE image_url IS NULL ORDER BY id LIMIT ${limit}`);
console.log(`${site}: ${events.length} event(s) with no image`);

if (dryRun) {
  for (const e of events) console.log(`  would generate: ${e.slug} (${e.type})`);
  process.exit(0);
}

const tmp = mkdtempSync(path.join(os.tmpdir(), 'event-img-'));
let done = 0;
for (const e of events) {
  const prompt = PROMPTS[e.type] ?? PROMPTS.Other;
  try {
    const bytes = await generateImage(prompt);
    const file = path.join(tmp, `${e.slug}.jpg`);
    writeFileSync(file, bytes);

    const key = `events/${e.slug}.jpg`;
    execFileSync(process.execPath, [WRANGLER, 'r2', 'object', 'put', `${cfg.bucket}/${key}`, '--file', file, '--remote', '--content-type', 'image/jpeg'], { stdio: 'pipe' });

    const url = `/media/${key}`;
    const credit = 'AI-generated image';
    d1(`UPDATE events SET image_url = '${url}', image_credit = '${credit}', image_source = 'ai' WHERE id = ${e.id} AND image_url IS NULL`);

    console.log(`  ok: ${e.slug} (${e.type}) -> ${url} (${bytes.length} bytes)`);
    done++;
  } catch (err) {
    console.log(`  FAILED: ${e.slug} — ${err.message}`);
  }
}
rmSync(tmp, { recursive: true, force: true });
console.log(`${site}: generated ${done}/${events.length} image(s)`);
