#!/usr/bin/env node
// Builds each site's social profile kit into social/<slug>/ from its committed
// brand assets (assets/sites/<slug>/) and theme (sites/<slug>.json):
//   profile.png        1080x1080 profile picture (Facebook + Instagram crop it to a circle)
//   facebook-cover.jpg 1640x856 Facebook Page cover (safe area kept clear for the mobile crop)
//   launch-post.jpg    1080x1350 first post for both networks (4:5, Instagram's tallest feed size)
//
// Usage: node scripts/social/make-profile-kit.mjs [slug ...]   (default: all three)

import sharp from 'sharp';
import { readFile, mkdir, readdir } from 'node:fs/promises';
import path from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = path.join(path.dirname(fileURLToPath(import.meta.url)), '..', '..');
const slugs = process.argv.slice(2).length ? process.argv.slice(2) : ['pretoria', 'polokwane', 'capetown'];
const FONT = 'DejaVu Sans, Arial, Helvetica, sans-serif';

const esc = (s) => s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');

async function heroFor(slug) {
  const files = await readdir(path.join(ROOT, 'assets', 'sites', slug));
  const hero = files.find((f) => /^hero-banner\.(jpg|jpeg|png|webp)$/.test(f));
  return path.join(ROOT, 'assets', 'sites', slug, hero);
}

async function build(slug) {
  const site = JSON.parse(await readFile(path.join(ROOT, 'sites', `${slug}.json`), 'utf8'));
  const { navy, accent } = site.theme;
  const out = path.join(ROOT, 'social', slug);
  await mkdir(out, { recursive: true });
  // The transparent pin (icon-512.png has a white square behind it).
  // Polokwane's is cropped just below the pin's shadow: its source has a stray mark
  // in its bottom-left corner.
  const iconPath = path.join(ROOT, 'assets', 'sites', slug, 'logo-icon.png');
  const { width: iw, height: ih } = await sharp(iconPath).metadata();
  const icon = await sharp(iconPath).extract({ left: 0, top: 0, width: iw, height: slug === 'polokwane' ? Math.round(ih * 0.93) : ih }).png().toBuffer();
  const hero = await heroFor(slug);

  // Profile picture: the pin logo centred on white, sized to sit inside the circle crop.
  const logo = await sharp(icon).resize(820, 820, { fit: 'contain', background: { r: 0, g: 0, b: 0, alpha: 0 } }).toBuffer();
  await sharp({ create: { width: 1080, height: 1080, channels: 4, background: '#ffffff' } })
    .composite([{ input: logo, left: 130, top: 120 }])
    .png()
    .toFile(path.join(out, 'profile.png'));

  // Facebook cover: city photo under a navy fade, name and tagline in the centre
  // band (Facebook trims the sides on phones and the profile picture covers the
  // bottom left on desktop).
  const W = 1640, H = 856;
  const coverSvg = `<svg width="${W}" height="${H}" xmlns="http://www.w3.org/2000/svg">
    <defs><linearGradient id="g" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0" stop-color="${navy}" stop-opacity="0.25"/>
      <stop offset="1" stop-color="${navy}" stop-opacity="0.88"/></linearGradient></defs>
    <rect width="${W}" height="${H}" fill="url(#g)"/>
    <text x="${W / 2}" y="360" text-anchor="middle" font-family="${FONT}" font-weight="bold" font-size="104" fill="#ffffff">${esc(site.siteName)}</text>
    <text x="${W / 2}" y="440" text-anchor="middle" font-family="${FONT}" font-size="40" fill="#ffffff">${esc(site.footerTagline || site.tagline)}</text>
    <rect x="${W / 2 - 230}" y="490" width="460" height="74" rx="37" fill="${accent}"/>
    <text x="${W / 2}" y="540" text-anchor="middle" font-family="${FONT}" font-weight="bold" font-size="36" fill="#ffffff">${esc(site.domain)}</text>
  </svg>`;
  await sharp(hero)
    .resize(W, H, { fit: 'cover' })
    .composite([{ input: Buffer.from(coverSvg) }])
    .jpeg({ quality: 88 })
    .toFile(path.join(out, 'facebook-cover.jpg'));

  // Launch post (4:5): photo top, navy panel bottom with the pitch.
  const PW = 1080, PH = 1350, photoH = 620;
  const photo = await sharp(hero).resize(PW, photoH, { fit: 'cover' }).toBuffer();
  // Round white logo badge in the photo's top-right corner.
  const badge = await sharp({ create: { width: 210, height: 210, channels: 4, background: { r: 0, g: 0, b: 0, alpha: 0 } } })
    .composite([
      { input: Buffer.from('<svg width="210" height="210"><circle cx="105" cy="105" r="105" fill="#ffffff"/></svg>') },
      { input: await sharp(icon).resize(150, 150, { fit: 'contain', background: { r: 0, g: 0, b: 0, alpha: 0 } }).toBuffer(), left: 30, top: 32 },
    ])
    .png()
    .toBuffer();
  const postSvg = `<svg width="${PW}" height="${PH}" xmlns="http://www.w3.org/2000/svg">
    <rect y="${photoH}" width="${PW}" height="${PH - photoH}" fill="${navy}"/>
    <text x="80" y="${photoH + 110}" font-family="${FONT}" font-size="44" fill="#ffffff">Welcome to</text>
    <text x="80" y="${photoH + 195}" font-family="${FONT}" font-weight="bold" font-size="78" fill="#ffffff">${esc(site.siteName)}</text>
    <text x="80" y="${photoH + 285}" font-family="${FONT}" font-size="38" fill="#ffffff">${esc(site.cityLabel)}'s free local business directory.</text>
    <text x="80" y="${photoH + 345}" font-family="${FONT}" font-size="38" fill="#ffffff">Find shops, services, events and news</text>
    <text x="80" y="${photoH + 405}" font-family="${FONT}" font-size="38" fill="#ffffff">in your suburb.</text>
    <rect x="80" y="${photoH + 480}" width="560" height="96" rx="48" fill="${accent}"/>
    <text x="360" y="${photoH + 543}" text-anchor="middle" font-family="${FONT}" font-weight="bold" font-size="40" fill="#ffffff">${esc(site.domain)}</text>
  </svg>`;
  await sharp({ create: { width: PW, height: PH, channels: 4, background: navy } })
    .composite([
      { input: photo, left: 0, top: 0 },
      { input: Buffer.from(postSvg) },
      { input: badge, left: PW - 250, top: 40 },
    ])
    .jpeg({ quality: 88 })
    .toFile(path.join(out, 'launch-post.jpg'));

  console.log(`[${slug}] social/${slug}/: profile.png, facebook-cover.jpg, launch-post.jpg`);
}

for (const slug of slugs) await build(slug);
