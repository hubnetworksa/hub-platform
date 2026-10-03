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

// Monochrome notification badge (Android shows it in the status bar, white on
// transparent): just the pin with its three bars cut out.
const badge = Buffer.from(`<svg xmlns="http://www.w3.org/2000/svg" width="96" height="96" viewBox="0 0 512 512">
  <defs><mask id="m"><rect width="512" height="512" fill="#fff"/>
    <rect x="196" y="214" width="30" height="70" rx="6" fill="#000"/>
    <rect x="241" y="176" width="30" height="108" rx="6" fill="#000"/>
    <rect x="286" y="146" width="30" height="138" rx="6" fill="#000"/></mask></defs>
  <path d="M256,470 L132,300 A150,150 0 1 1 380,300 Z" fill="#fff" mask="url(#m)"/>
</svg>`);
await sharp(badge).resize(96, 96).png().toFile(path.join(out, 'badge-96.png'));
console.log('admin-app/public/icons: badge-96');
