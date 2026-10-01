#!/usr/bin/env node
// Renders the relaunch announcement email (functions/_lib/email-template.ts →
// relaunchEmailHtml / relaunchEmailText) for one site so it can be opened in
// a browser and proof-read before anything is sent.
//
//   node scripts/render-relaunch-email.mjs --site polokwane --out /tmp/relaunch-polokwane.html
//
// Writes the HTML to --out and the plain-text twin next to it (same name,
// .txt). The theme, domain, banner and contact address come from
// sites/<site>.json, exactly as the real send would use them; the three
// links are placeholders (the unsubscribe token in particular is fake).
//
// No build step: Node 22.6+ strips TypeScript types on import, and
// email-template.ts has only `import type` dependencies, so it loads as-is.

import { readFile, writeFile, mkdir } from 'node:fs/promises';
import { dirname, resolve, extname } from 'node:path';
import { fileURLToPath, pathToFileURL } from 'node:url';

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..');

function arg(name) {
  const i = process.argv.indexOf(`--${name}`);
  return i !== -1 && process.argv[i + 1] && !process.argv[i + 1].startsWith('--') ? process.argv[i + 1] : null;
}

const slug = arg('site');
const out = arg('out');
if (!slug || !out) {
  console.error('Usage: node scripts/render-relaunch-email.mjs --site <capetown|pretoria|polokwane> --out <file.html>');
  process.exit(2);
}

const site = JSON.parse(await readFile(resolve(root, 'sites', `${slug}.json`), 'utf8'));
const { relaunchEmailHtml, relaunchEmailText } = await import(pathToFileURL(resolve(root, 'functions/_lib/email-template.ts')).href);

const base = `https://${site.domain}`;
const urls = {
  unsubscribeUrl: `${base}/api/unsubscribe?t=PREVIEW-TOKEN-NOT-REAL`,
  dashboardUrl: `${base}/my-businesses/`,
  siteUrl: `${base}/`,
};

const htmlPath = resolve(out);
const textPath = htmlPath.slice(0, htmlPath.length - extname(htmlPath).length) + '.txt';
await mkdir(dirname(htmlPath), { recursive: true });
await writeFile(htmlPath, relaunchEmailHtml(site, urls), 'utf8');
await writeFile(textPath, relaunchEmailText(site, urls), 'utf8');
console.log(`${site.siteName}: wrote ${htmlPath} and ${textPath}`);
