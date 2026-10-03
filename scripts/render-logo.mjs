#!/usr/bin/env node
// Renders a site's vector logo (assets/logo-src/<slug>.svg) to the PNG
// logo files the site serves, next to it in assets/sites/<slug>/:
//   logo-icon.png          537x620 transparent (header, admin, share image, schema logo)
//   favicon-48.png         48x48 transparent
//   favicon-192.png        192x192 transparent
//   apple-touch-icon.png   180x180 on white (iOS shows transparency as black)
// Then run the generators that derive from logo-icon.png:
//   node scripts/generate-pwa-icons.mjs <slug>   (icon-512*.png)
//   node scripts/generate-badges.mjs             (badge.svg)
//
// Usage: node scripts/render-logo.mjs capetown

import sharp from 'sharp';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const slug = process.argv[2];
if (!slug) throw new Error('Usage: node scripts/render-logo.mjs <slug>');
const ROOT = path.join(path.dirname(fileURLToPath(import.meta.url)), '..');
const dir = path.join(ROOT, 'assets', 'sites', slug);
const svg = path.join(ROOT, 'assets', 'logo-src', `${slug}.svg`);
const clear = { r: 0, g: 0, b: 0, alpha: 0 };

// High-density render once, then downscale for crisp small sizes.
const master = await sharp(svg, { density: 300 }).png().toBuffer();
const fit = (w, h, background = clear) => sharp(master).resize(w, h, { fit: 'contain', background });

await fit(537, 620).png().toFile(path.join(dir, 'logo-icon.png'));
await fit(48, 48).png().toFile(path.join(dir, 'favicon-48.png'));
await fit(192, 192).png().toFile(path.join(dir, 'favicon-192.png'));
const touch = await fit(150, 150, '#ffffff').flatten({ background: '#ffffff' }).toBuffer();
await sharp({ create: { width: 180, height: 180, channels: 3, background: '#ffffff' } })
  .composite([{ input: touch, left: 15, top: 15 }])
  .png()
  .toFile(path.join(dir, 'apple-touch-icon.png'));

console.log(`[${slug}] logo-icon.png, favicon-48.png, favicon-192.png, apple-touch-icon.png`);
