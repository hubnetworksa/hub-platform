#!/usr/bin/env node
// Crawls a built site and reports broken links. Usage:
//
//   SITE=capetown npx astro build --outDir .build-check
//   node scripts/check-links.mjs .build-check capetown [--external]
//
// Checks every internal href/src/action in every built page (routes served by
// Pages Functions count as valid), #anchors, that every search-index entry and
// sitemap URL has a built page, and (with --external) that outside links answer.
// Exits non-zero if anything internal is broken, so it can gate a release.
//
// Anchors count as fine if the target page has that id/name OR the fragment
// appears in the page's own script (tabs opened from the URL hash by JS).

import { readdirSync, readFileSync, existsSync, statSync } from 'node:fs';
import path from 'node:path';

const [dist, siteSlug, ...flags] = process.argv.slice(2);
if (!dist || !siteSlug) {
  console.error('Usage: node scripts/check-links.mjs <build-dir> <site-slug> [--external]');
  process.exit(2);
}
const checkExternal = flags.includes('--external');
const ROOT = process.cwd();
const site = JSON.parse(readFileSync(path.join(ROOT, 'sites', `${siteSlug}.json`), 'utf8'));

// Routes that exist as Cloudflare Pages Functions rather than files in the build.
const fnRoutes = new Set();
(function walk(dir, prefix) {
  for (const e of readdirSync(dir, { withFileTypes: true })) {
    if (e.name.startsWith('_')) continue;
    if (e.isDirectory()) walk(path.join(dir, e.name), `${prefix}/${e.name}`);
    else if (e.name.endsWith('.ts')) fnRoutes.add(`${prefix}/${e.name.replace(/\.ts$/, '')}`);
  }
})(path.join(ROOT, 'functions'), '');
const isFunctionRoute = (p) =>
  fnRoutes.has(p.replace(/\/$/, '')) || p.startsWith('/media/') || p.startsWith('/claim-document/') || p.startsWith('/api/');

const pages = [];
(function walk(d) {
  for (const e of readdirSync(d, { withFileTypes: true })) {
    const f = path.join(d, e.name);
    if (e.isDirectory()) walk(f);
    else if (e.name.endsWith('.html')) pages.push(f);
  }
})(dist);

const pageUrl = (file) => '/' + path.relative(dist, file).split(path.sep).join('/').replace(/index\.html$/, '');
const has = (p) => {
  const f = path.join(dist, decodeURIComponent(p));
  return (existsSync(f) && statSync(f).isFile()) || existsSync(path.join(f, 'index.html')) || existsSync(`${f}.html`);
};
const htmlCache = new Map();
const htmlFor = (p) => {
  let f = path.join(dist, decodeURIComponent(p));
  if (!(existsSync(f) && statSync(f).isFile())) {
    f = existsSync(path.join(f, 'index.html')) ? path.join(f, 'index.html') : `${f}.html`;
  }
  if (!htmlCache.has(f)) htmlCache.set(f, existsSync(f) ? readFileSync(f, 'utf8') : '');
  return htmlCache.get(f);
};

const broken = new Map();
const badAnchors = new Map();
const externals = new Map();
let checked = 0;

for (const file of pages) {
  const from = pageUrl(file);
  const body = readFileSync(file, 'utf8').replace(/<!--[\s\S]*?-->/g, '');
  const refs = [...body.matchAll(/\b(?:href|src|action|poster|data-href)="([^"]*)"/g)].map((m) => m[1]);
  for (const raw of refs) {
    let ref = raw.trim().replace(/&amp;/g, '&');
    if (!ref || ref === '#') continue;
    if (/^(mailto:|tel:|javascript:|data:|blob:|sms:)/i.test(ref)) continue;
    // Fragments of JS string building that end up inside inline scripts.
    if (/\$\{|\{\{|%7B|%60|`|encodeURIComponent/.test(ref)) continue;
    if (/^https?:\/\//i.test(ref) || ref.startsWith('//')) {
      const u = new URL(ref.startsWith('//') ? `https:${ref}` : ref);
      if (u.hostname === site.domain || u.hostname.endsWith(`.${site.domain}`)) {
        ref = u.pathname + u.hash;
      } else {
        const key = u.origin + u.pathname;
        if (!externals.has(key)) externals.set(key, from);
        continue;
      }
    }
    let target;
    try {
      target = new URL(ref, `http://x${from}`);
    } catch {
      continue;
    }
    const p = target.pathname;
    checked++;
    if (!isFunctionRoute(p) && !has(p)) {
      if (!broken.has(p)) broken.set(p, new Set());
      broken.get(p).add(from);
      continue;
    }
    if (target.hash.length > 1 && !isFunctionRoute(p)) {
      const frag = decodeURIComponent(target.hash.slice(1));
      const html = htmlFor(p);
      const inDom = new RegExp(`\\b(?:id|name)="${frag.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')}"`).test(html);
      if (!inDom && !html.includes(frag)) {
        const key = `${p}#${frag}`;
        if (!badAnchors.has(key)) badAnchors.set(key, new Set());
        badAnchors.get(key).add(from);
      }
    }
  }
}

let problems = 0;
console.log(`${site.slug}: ${pages.length} pages, ${checked} internal references checked`);
for (const [p, from] of broken) {
  problems++;
  console.log(`BROKEN  ${p}  (linked from ${[...from].slice(0, 3).join(', ')}${from.size > 3 ? ` +${from.size - 3} more` : ''})`);
}
for (const [p, from] of badAnchors) {
  problems++;
  console.log(`ANCHOR  ${p}  (on ${[...from].slice(0, 2).join(', ')})`);
}

// Search index and sitemap must only point at pages that exist.
const indexFile = path.join(dist, 'search-index.json');
if (existsSync(indexFile)) {
  const idx = JSON.parse(readFileSync(indexFile, 'utf8'));
  let missing = 0;
  for (const r of idx) {
    if (!has(`/business/${r.s}`) || (r.sbs && !has(`/suburb/${r.sbs}`))) {
      missing++;
      if (missing <= 5) console.log(`SEARCH-INDEX  no page for ${r.s} / ${r.sbs}`);
    }
  }
  problems += missing;
  console.log(`search index: ${idx.length} entries, ${missing} without a page`);
}
let sitemapUrls = 0;
let sitemapMissing = 0;
for (const f of readdirSync(dist).filter((n) => /^sitemap-\d+\.xml$/.test(n))) {
  for (const m of readFileSync(path.join(dist, f), 'utf8').matchAll(/<loc>([^<]+)<\/loc>/g)) {
    sitemapUrls++;
    const p = new URL(m[1]).pathname;
    if (p !== '/' && !has(p.replace(/\/$/, ''))) {
      sitemapMissing++;
      if (sitemapMissing <= 5) console.log(`SITEMAP  no page for ${m[1]}`);
    }
  }
}
problems += sitemapMissing;
console.log(`sitemap: ${sitemapUrls} URLs, ${sitemapMissing} without a page`);

if (checkExternal) {
  const list = [...externals.keys()].filter((u) => !/googleapis|gstatic|googletagmanager|google-analytics|googlesyndication|doubleclick|schema\.org|w3\.org/.test(u));
  console.log(`external: checking ${list.length} links (blocked-by-bots and timeouts are reported but do not fail the run)`);
  const probe = async (url) => {
    const ctl = new AbortController();
    const t = setTimeout(() => ctl.abort(), 20000);
    try {
      let r = await fetch(url, { method: 'HEAD', redirect: 'follow', signal: ctl.signal, headers: { 'User-Agent': 'Mozilla/5.0 (LinkCheck)' } });
      if ([400, 403, 404, 405].includes(r.status)) r = await fetch(url, { method: 'GET', redirect: 'follow', signal: ctl.signal, headers: { 'User-Agent': 'Mozilla/5.0 (LinkCheck)' } });
      return r.status;
    } catch (e) {
      return `ERR ${e.cause?.code || e.name}`;
    } finally {
      clearTimeout(t);
    }
  };
  const queue = [...list];
  await Promise.all(Array.from({ length: 12 }, async () => {
    while (queue.length) {
      const u = queue.shift();
      const s = await probe(u);
      if (!(typeof s === 'number' && s < 400)) console.log(`EXTERNAL  ${s}  ${u}  (on ${externals.get(u)})`);
    }
  }));
}

console.log(problems ? `\n${problems} problem(s) found.` : '\nNo broken internal links.');
process.exit(problems ? 1 : 0);
