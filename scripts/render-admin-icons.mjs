#!/usr/bin/env node
// Renders the Hub Admin app icon (assets/logo-src/hub-admin.svg) to the PNGs
// the admin app's manifest and pages use, in admin-app/public/icons/.
// Usage: node scripts/render-admin-icons.mjs

import sharp from 'sharp';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = path.join(path.dirname(fileURLToPath(import.meta.url)), '..');
const svg = path.join(ROOT, 'assets', 'logo-src', 'hub-admin.svg');
const out = path.join(ROOT, 'admin-app', 'public', 'icons');
const master = await sharp(svg, { density: 400 }).png().toBuffer();

// The artwork is full-bleed, so the same image serves as "any" and "maskable".
for (const [name, size] of [['icon-512.png', 512], ['icon-192.png', 192], ['apple-touch-icon.png', 180], ['favicon-48.png', 48], ['favicon-32.png', 32]]) {
  await sharp(master).resize(size, size).png().toFile(path.join(out, name));
}
// Rounded version for in-app use (header, login) on light or dark surfaces.
const r = 112;
const mask = Buffer.from(`<svg width="512" height="512"><rect width="512" height="512" rx="${r}" ry="${r}"/></svg>`);
await sharp(master).resize(512, 512).composite([{ input: mask, blend: 'dest-in' }]).png().toFile(path.join(out, 'logo-rounded.png'));
console.log('admin-app/public/icons: icon-512, icon-192, apple-touch-icon, favicon-48, favicon-32, logo-rounded');
