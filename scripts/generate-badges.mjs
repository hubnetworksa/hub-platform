#!/usr/bin/env node
// Generates the "Find us on <SiteName>" backlink badge for every site into
// assets/sites/<site>/badge.svg (copied to public/badge.svg by
// select-site-assets.mjs, so each site serves its own at https://<domain>/badge.svg).
// Business owners embed it from the owner dashboard (my-businesses/edit).
//
// The output is committed, so this only needs re-running when a site's name,
// theme colours or logo-icon.png change:   node scripts/generate-badges.mjs
// It uses sharp (installed with Astro) to shrink the logo mark to a small
// embedded PNG; an <img>-loaded SVG can't fetch external files, so the mark
// has to be inline.

import { readFile, writeFile, readdir } from 'node:fs/promises';
import { fileURLToPath } from 'node:url';
import path from 'node:path';
import sharp from 'sharp';

const ROOT = path.join(path.dirname(fileURLToPath(import.meta.url)), '..');
const W = 180;
const H = 56;

const isHex = (c) => typeof c === 'string' && /^#[0-9a-f]{6}$/i.test(c);
const mix = (hex, other, t) => {
  const a = hex.match(/\w\w/g).map((h) => parseInt(h, 16));
  const b = other.match(/\w\w/g).map((h) => parseInt(h, 16));
  return '#' + a.map((v, i) => Math.round(v + (b[i] - v) * t).toString(16).padStart(2, '0')).join('');
};
const esc = (s) => s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');

/** Split "PolokwaneHub" into ["Polokwane", "Hub"] so the Hub part takes the brand colour. */
function splitName(name) {
  const m = name.match(/^(.*?)(Hub)$/);
  return m ? [m[1], m[2]] : [name, ''];
}

for (const file of (await readdir(path.join(ROOT, 'sites'))).filter((f) => f.endsWith('.json'))) {
  const slug = file.replace(/\.json$/, '');
  const site = JSON.parse(await readFile(path.join(ROOT, 'sites', file), 'utf8'));
  const t = site.theme;
  const bg = t.navy;
  // Brand highlight for "Hub": the site's light header accent when it's a real
  // colour, else its accent lightened enough to read on the navy background.
  const highlight = isHex(t.brandRowAccent) ? t.brandRowAccent : mix(t.accent, '#ffffff', 0.38);

  const logo = await sharp(path.join(ROOT, 'assets', 'sites', slug, 'logo-icon.png'))
    .resize({ height: 72, withoutEnlargement: true })
    .png({ compressionLevel: 9, palette: true, quality: 90 })
    .toBuffer();
  const meta = await sharp(logo).metadata();
  const markH = 34;
  const markW = Math.round((meta.width / meta.height) * markH);
  const tile = 42;
  const tileX = 7;
  const tileY = (H - tile) / 2;

  const textX = tileX + tile + 10;
  const avail = W - textX - 10;
  const [lead, hub] = splitName(site.siteName);
  // Rough bold-sans width (0.6em per glyph); squeeze long names to fit.
  const nameSize = 17;
  const est = site.siteName.length * nameSize * 0.6;
  const fit = est > avail ? ` textLength="${avail}" lengthAdjust="spacingAndGlyphs"` : '';
  const font = `'Segoe UI', system-ui, -apple-system, Roboto, 'Helvetica Neue', Arial, sans-serif`;

  const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="${W}" height="${H}" viewBox="0 0 ${W} ${H}" role="img" aria-label="Find us on ${esc(site.siteName)}">
  <title>Find us on ${esc(site.siteName)}</title>
  <defs>
    <linearGradient id="g" x1="0" y1="0" x2="1" y2="1">
      <stop offset="0" stop-color="${mix(bg, '#ffffff', 0.1)}"/>
      <stop offset="1" stop-color="${bg}"/>
    </linearGradient>
  </defs>
  <rect x="0.5" y="0.5" width="${W - 1}" height="${H - 1}" rx="11" fill="url(#g)" stroke="#ffffff" stroke-opacity="0.22"/>
  <rect x="${tileX}" y="${tileY}" width="${tile}" height="${tile}" rx="9" fill="#ffffff"/>
  <image x="${tileX + (tile - markW) / 2}" y="${tileY + (tile - markH) / 2}" width="${markW}" height="${markH}" href="data:image/png;base64,${logo.toString('base64')}"/>
  <text x="${textX}" y="23" font-family="${font}" font-size="10" font-weight="600" letter-spacing="1.1" fill="#ffffff" fill-opacity="0.72">FIND US ON</text>
  <text x="${textX}" y="42" font-family="${font}" font-size="${nameSize}" font-weight="800" fill="#ffffff"${fit}>${esc(lead)}<tspan fill="${highlight}">${esc(hub)}</tspan></text>
</svg>
`;
  const out = path.join(ROOT, 'assets', 'sites', slug, 'badge.svg');
  await writeFile(out, svg);
  console.log(`${slug}: ${path.relative(ROOT, out)} (${(svg.length / 1024).toFixed(1)} KB)`);
}
