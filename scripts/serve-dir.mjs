#!/usr/bin/env node
// Tiny static server for a built site folder, dependency-free, so the smoke
// test can run without `npx serve`. Mimics the bits of Cloudflare Pages that
// matter for a static Astro build: /foo → /foo/ redirect when foo/ is a
// directory, /foo/ → foo/index.html, /foo → foo.html, and a real 404 status
// with the site's own 404.html. Anything under /api/ answers 404 JSON (there
// are no Functions here), which the smoke test tolerates.
//
//   node scripts/serve-dir.mjs .build-capetown [--port 4321]

import { createServer } from 'node:http';
import { createReadStream, existsSync, statSync } from 'node:fs';
import path from 'node:path';

const positional = [];
let port = 4321;
for (let i = 2; i < process.argv.length; i++) {
  const a = process.argv[i];
  if (a === '--port') port = Number(process.argv[++i]);
  else if (a === '--help' || a === '-h') {
    console.error('Usage: node scripts/serve-dir.mjs <dir> [--port 4321]');
    process.exit(0);
  } else positional.push(a);
}
const dir = path.resolve(positional[0] ?? '');
if (!positional[0] || !existsSync(dir) || !statSync(dir).isDirectory()) {
  console.error('Usage: node scripts/serve-dir.mjs <dir> [--port 4321]');
  process.exit(2);
}

const TYPES = {
  '.html': 'text/html; charset=utf-8',
  '.css': 'text/css; charset=utf-8',
  '.js': 'text/javascript; charset=utf-8',
  '.mjs': 'text/javascript; charset=utf-8',
  '.json': 'application/json; charset=utf-8',
  '.webmanifest': 'application/manifest+json',
  '.xml': 'application/xml; charset=utf-8',
  '.txt': 'text/plain; charset=utf-8',
  '.svg': 'image/svg+xml',
  '.png': 'image/png',
  '.jpg': 'image/jpeg',
  '.jpeg': 'image/jpeg',
  '.webp': 'image/webp',
  '.gif': 'image/gif',
  '.ico': 'image/x-icon',
  '.avif': 'image/avif',
  '.woff': 'font/woff',
  '.woff2': 'font/woff2',
  '.ttf': 'font/ttf',
  '.pdf': 'application/pdf',
  '.map': 'application/json',
};

function isFile(p) {
  return existsSync(p) && statSync(p).isFile();
}

function send(res, status, file, extraHeaders = {}) {
  res.writeHead(status, { 'Content-Type': TYPES[path.extname(file).toLowerCase()] ?? 'application/octet-stream', 'Cache-Control': 'no-store', ...extraHeaders });
  createReadStream(file).pipe(res);
}

const server = createServer((req, res) => {
  const url = new URL(req.url ?? '/', 'http://localhost');
  let pathname;
  try {
    pathname = decodeURIComponent(url.pathname);
  } catch {
    res.writeHead(400).end('Bad request');
    return;
  }

  if (pathname.startsWith('/api/')) {
    res.writeHead(404, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ ok: false, error: 'static server: no API here' }));
    return;
  }

  // Never escape the served folder.
  const target = path.join(dir, pathname);
  if (!target.startsWith(dir)) {
    res.writeHead(403).end('Forbidden');
    return;
  }

  if (pathname.endsWith('/')) {
    const index = path.join(target, 'index.html');
    if (isFile(index)) return send(res, 200, index);
  } else {
    if (isFile(target)) return send(res, 200, target);
    if (isFile(`${target}.html`)) return send(res, 200, `${target}.html`);
    if (existsSync(target) && statSync(target).isDirectory() && isFile(path.join(target, 'index.html'))) {
      res.writeHead(301, { Location: `${pathname}/${url.search}` });
      res.end();
      return;
    }
  }

  const notFound = path.join(dir, '404.html');
  if (isFile(notFound)) return send(res, 404, notFound);
  res.writeHead(404, { 'Content-Type': 'text/plain' }).end('Not found');
});

server.listen(port, '127.0.0.1', () => {
  console.log(`Serving ${dir} at http://localhost:${port}/ (Ctrl+C to stop)`);
});
for (const sig of ['SIGINT', 'SIGTERM']) process.on(sig, () => server.close(() => process.exit(0)));
