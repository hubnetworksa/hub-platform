#!/usr/bin/env node
// Generates the two 512x512 install icons Android needs from each site's
// logo mark (assets/sites/<slug>/logo-icon.png) — no image dependency, just a
// tiny PNG reader/writer on top of node:zlib. Run it again whenever a site's
// logo-icon.png changes:
//
//   node scripts/generate-pwa-icons.mjs            (every site)
//   node scripts/generate-pwa-icons.mjs capetown   (one site)
//
// Writes, next to logo-icon.png:
//   icon-512.png           the mark on a transparent square ("any" purpose)
//   icon-512-maskable.png  the mark shrunk into Android's adaptive-icon safe
//                          zone on the site's background colour, so a circular
//                          or squircle mask never crops the pin
// select-site-assets.mjs copies them into public/ with the other assets, and
// src/pages/manifest.webmanifest.ts points the web app manifest at them.

import { readFileSync, writeFileSync, readdirSync, existsSync } from 'node:fs';
import { inflateSync, deflateSync } from 'node:zlib';
import { fileURLToPath } from 'node:url';
import path from 'node:path';

const ROOT = path.join(path.dirname(fileURLToPath(import.meta.url)), '..');
const SIZE = 512;

const CRC_TABLE = (() => {
  const t = new Uint32Array(256);
  for (let n = 0; n < 256; n++) {
    let c = n;
    for (let k = 0; k < 8; k++) c = c & 1 ? 0xedb88320 ^ (c >>> 1) : c >>> 1;
    t[n] = c >>> 0;
  }
  return t;
})();

function crc32(buf) {
  let c = 0xffffffff;
  for (let i = 0; i < buf.length; i++) c = CRC_TABLE[(c ^ buf[i]) & 0xff] ^ (c >>> 8);
  return (c ^ 0xffffffff) >>> 0;
}

function chunk(type, data) {
  const len = Buffer.alloc(4);
  len.writeUInt32BE(data.length);
  const typeAndData = Buffer.concat([Buffer.from(type, 'ascii'), data]);
  const crc = Buffer.alloc(4);
  crc.writeUInt32BE(crc32(typeAndData));
  return Buffer.concat([len, typeAndData, crc]);
}

/** Decode an 8-bit, non-interlaced RGBA (colour type 6) PNG into { width, height, data }. */
function decodePng(buf) {
  if (buf.readUInt32BE(0) !== 0x89504e47) throw new Error('Not a PNG');
  let pos = 8;
  let width = 0;
  let height = 0;
  const idat = [];
  while (pos < buf.length) {
    const len = buf.readUInt32BE(pos);
    const type = buf.toString('ascii', pos + 4, pos + 8);
    const data = buf.subarray(pos + 8, pos + 8 + len);
    if (type === 'IHDR') {
      width = data.readUInt32BE(0);
      height = data.readUInt32BE(4);
      if (data[8] !== 8 || data[9] !== 6 || data[12] !== 0) throw new Error('Only 8-bit non-interlaced RGBA PNGs are supported');
    } else if (type === 'IDAT') idat.push(data);
    else if (type === 'IEND') break;
    pos += 12 + len;
  }
  const raw = inflateSync(Buffer.concat(idat));
  const bpp = 4;
  const stride = width * bpp;
  const out = Buffer.alloc(height * stride);
  for (let y = 0; y < height; y++) {
    const filter = raw[y * (stride + 1)];
    const line = raw.subarray(y * (stride + 1) + 1, (y + 1) * (stride + 1));
    for (let x = 0; x < stride; x++) {
      const a = x >= bpp ? out[y * stride + x - bpp] : 0;
      const b = y > 0 ? out[(y - 1) * stride + x] : 0;
      const c = x >= bpp && y > 0 ? out[(y - 1) * stride + x - bpp] : 0;
      let v = line[x];
      if (filter === 1) v += a;
      else if (filter === 2) v += b;
      else if (filter === 3) v += (a + b) >> 1;
      else if (filter === 4) {
        const p = a + b - c;
        const pa = Math.abs(p - a);
        const pb = Math.abs(p - b);
        const pc = Math.abs(p - c);
        v += pa <= pb && pa <= pc ? a : pb <= pc ? b : c;
      }
      out[y * stride + x] = v & 0xff;
    }
  }
  return { width, height, data: out };
}

function encodePng(width, height, rgba) {
  const stride = width * 4;
  const raw = Buffer.alloc(height * (stride + 1));
  for (let y = 0; y < height; y++) {
    raw[y * (stride + 1)] = 0;
    rgba.copy(raw, y * (stride + 1) + 1, y * stride, (y + 1) * stride);
  }
  const ihdr = Buffer.alloc(13);
  ihdr.writeUInt32BE(width, 0);
  ihdr.writeUInt32BE(height, 4);
  ihdr[8] = 8;
  ihdr[9] = 6;
  return Buffer.concat([
    Buffer.from([0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a]),
    chunk('IHDR', ihdr),
    chunk('IDAT', deflateSync(raw, { level: 9 })),
    chunk('IEND', Buffer.alloc(0)),
  ]);
}

/** Draw `img` scaled to dw x dh (bilinear) with its top-left at (dx, dy), alpha-blended over `canvas`. */
function drawScaled(canvas, cw, img, dx, dy, dw, dh) {
  const sx = img.width / dw;
  const sy = img.height / dh;
  const px = (x, y, c) => img.data[(Math.min(img.height - 1, Math.max(0, y)) * img.width + Math.min(img.width - 1, Math.max(0, x))) * 4 + c];
  for (let y = 0; y < dh; y++) {
    for (let x = 0; x < dw; x++) {
      const fx = (x + 0.5) * sx - 0.5;
      const fy = (y + 0.5) * sy - 0.5;
      const x0 = Math.floor(fx);
      const y0 = Math.floor(fy);
      const tx = fx - x0;
      const ty = fy - y0;
      // Interpolate premultiplied so transparent edge pixels don't bleed dark fringes.
      let r = 0, g = 0, b = 0, a = 0;
      for (const [ox, oy, w] of [[0, 0, (1 - tx) * (1 - ty)], [1, 0, tx * (1 - ty)], [0, 1, (1 - tx) * ty], [1, 1, tx * ty]]) {
        const al = px(x0 + ox, y0 + oy, 3) / 255;
        r += px(x0 + ox, y0 + oy, 0) * al * w;
        g += px(x0 + ox, y0 + oy, 1) * al * w;
        b += px(x0 + ox, y0 + oy, 2) * al * w;
        a += al * w;
      }
      if (a <= 0) continue;
      const i = ((dy + y) * cw + (dx + x)) * 4;
      const da = canvas[i + 3] / 255;
      const outA = a + da * (1 - a);
      for (const [c, v] of [[0, r], [1, g], [2, b]]) {
        canvas[i + c] = Math.round((v + canvas[i + c] * da * (1 - a)) / outA);
      }
      canvas[i + 3] = Math.round(outA * 255);
    }
  }
}

function hexToRgb(hex) {
  const m = /^#?([0-9a-f]{6})$/i.exec(hex);
  if (!m) return [255, 255, 255];
  const n = parseInt(m[1], 16);
  return [(n >> 16) & 255, (n >> 8) & 255, n & 255];
}

function makeIcon(logo, markHeight, background) {
  const canvas = Buffer.alloc(SIZE * SIZE * 4);
  if (background) {
    for (let i = 0; i < canvas.length; i += 4) {
      canvas[i] = background[0];
      canvas[i + 1] = background[1];
      canvas[i + 2] = background[2];
      canvas[i + 3] = 255;
    }
  }
  const markWidth = Math.round((markHeight * logo.width) / logo.height);
  drawScaled(canvas, SIZE, logo, Math.round((SIZE - markWidth) / 2), Math.round((SIZE - markHeight) / 2), markWidth, markHeight);
  return encodePng(SIZE, SIZE, canvas);
}

const only = process.argv[2];
const slugs = readdirSync(path.join(ROOT, 'assets', 'sites')).filter((d) => !only || d === only);
for (const slug of slugs) {
  const dir = path.join(ROOT, 'assets', 'sites', slug);
  const src = path.join(dir, 'logo-icon.png');
  if (!existsSync(src)) continue;
  const logo = decodePng(readFileSync(src));
  const siteJson = JSON.parse(readFileSync(path.join(ROOT, 'sites', `${slug}.json`), 'utf8'));
  // Some logo files carry their own opaque off-white backdrop (e.g. 253,253,253)
  // rather than transparency — fill the square with exactly that colour so no
  // faint box shows around the mark. Fully transparent logos fall back to the
  // theme background for the maskable icon and stay transparent for "any".
  const corner = logo.data.subarray(0, 4);
  const opaqueCorner = corner[3] === 255 ? [corner[0], corner[1], corner[2]] : null;
  const bg = opaqueCorner ?? hexToRgb(siteJson.theme?.bg ?? '#ffffff');
  // "any": the pin fills ~88% of the square. "maskable": the pin's bounding
  // box must sit inside the central 80%-diameter circle (Android's safe zone),
  // which for this tall mark means roughly 60% of the canvas height.
  writeFileSync(path.join(dir, 'icon-512.png'), makeIcon(logo, Math.round(SIZE * 0.88), opaqueCorner));
  writeFileSync(path.join(dir, 'icon-512-maskable.png'), makeIcon(logo, Math.round(SIZE * 0.6), bg));
  process.stderr.write(`[${slug}] wrote icon-512.png and icon-512-maskable.png from logo-icon.png (${logo.width}x${logo.height}).\n`);
}
