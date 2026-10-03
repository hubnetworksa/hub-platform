#!/usr/bin/env node
// Hub Admin's banner: the three cities' own hero photos (Pretoria, Polokwane,
// Cape Town) side by side, joined by slanted edges, under a navy wash that
// darkens to the left where the heading sits (the same treatment as the
// city sites' banners). Two crops: wide for desktop, taller for phones.
// Writes admin-app/public/banner-wide.jpg and banner-mobile.jpg.
// Usage: node scripts/render-admin-banner.mjs

import sharp from 'sharp';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = path.join(path.dirname(fileURLToPath(import.meta.url)), '..');
const OUT = path.join(ROOT, 'admin-app', 'public');
const PHOTOS = [
  // [file, focus (sharp position) — keeps each city's landmark in frame]
  ['assets/sites/pretoria/hero-banner.jpg', 'right'], // Union Buildings
  ['assets/sites/polokwane/hero-banner.webp', 'right'], // clock tower
  ['assets/sites/capetown/hero-banner.webp', 'right'], // Table Mountain
];
const NAVY = '#0f1b3d';

async function render(W, H, slant, file) {
  // Panel edges: three equal bands with slanted borders.
  const third = W / 3;
  const polys = [
    [[0, 0], [third + slant / 2, 0], [third - slant / 2, H], [0, H]],
    [[third + slant / 2, 0], [2 * third + slant / 2, 0], [2 * third - slant / 2, H], [third - slant / 2, H]],
    [[2 * third + slant / 2, 0], [W, 0], [W, H], [2 * third - slant / 2, H]],
  ];
  const layers = [];
  for (let i = 0; i < 3; i++) {
    const [src, position] = PHOTOS[i];
    // Each photo covers a band a little wider than its panel, then is cut to the panel shape.
    const xs = polys[i].map(([x]) => x);
    const left = Math.max(0, Math.floor(Math.min(...xs)));
    const width = Math.ceil(Math.max(...xs)) - left;
    const photo = await sharp(path.join(ROOT, src)).resize(width, H, { fit: 'cover', position }).modulate({ saturation: 1.05 }).toBuffer();
    const pts = polys[i].map(([x, y]) => `${(x - left).toFixed(1)},${y}`).join(' ');
    const mask = Buffer.from(`<svg width="${width}" height="${H}"><polygon points="${pts}" fill="#fff"/></svg>`);
    layers.push({ input: await sharp(photo).composite([{ input: mask, blend: 'dest-in' }]).png().toBuffer(), left, top: 0 });
  }
  // Thin light seams on the slants, then the navy wash (strong left, light right) and a soft bottom fade.
  const seams = polys.slice(1).map((p) => `<line x1="${p[0][0]}" y1="0" x2="${p[3][0]}" y2="${H}" stroke="#ffffff" stroke-opacity="0.55" stroke-width="${Math.max(2, W / 640)}"/>`).join('');
  const overlay = Buffer.from(`<svg width="${W}" height="${H}" xmlns="http://www.w3.org/2000/svg">
    <defs>
      <linearGradient id="h" x1="0" y1="0" x2="1" y2="0">
        <stop offset="0" stop-color="${NAVY}" stop-opacity="0.88"/>
        <stop offset="0.45" stop-color="${NAVY}" stop-opacity="0.55"/>
        <stop offset="1" stop-color="${NAVY}" stop-opacity="0.12"/>
      </linearGradient>
      <linearGradient id="v" x1="0" y1="0" x2="0" y2="1">
        <stop offset="0.55" stop-color="${NAVY}" stop-opacity="0"/>
        <stop offset="1" stop-color="${NAVY}" stop-opacity="0.45"/>
      </linearGradient>
    </defs>
    ${seams}
    <rect width="${W}" height="${H}" fill="url(#h)"/>
    <rect width="${W}" height="${H}" fill="url(#v)"/>
  </svg>`);
  await sharp({ create: { width: W, height: H, channels: 3, background: NAVY } })
    .composite([...layers, { input: overlay }])
    .jpeg({ quality: 84, mozjpeg: true, progressive: true })
    .toFile(path.join(OUT, file));
  const { size } = await sharp(path.join(OUT, file)).metadata().then(async () => ({ size: (await import('node:fs')).statSync(path.join(OUT, file)).size }));
  console.log(`admin-app/public/${file}: ${W}x${H}, ${Math.round(size / 1024)} KB`);
}

await render(1920, 520, 110, 'banner-wide.jpg');
await render(1080, 640, 90, 'banner-mobile.jpg');
