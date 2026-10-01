// Service worker for the installable web app. Served as /service-worker.js by
// src/pages/service-worker.js.ts, which prepends `const HUB = {...}` (site name
// and colours) before this file's contents — so HUB is available below.
//
// What it does:
//  - Gives Chrome on Android the fetch handler it needs to offer "Install app".
//  - Network-first for pages, so visitors always get fresh content; a page
//    they've already opened is available offline as a fallback.
//  - Cache-first for the hashed /_astro/ build files (safe: a change always
//    means a new filename).
//  - Never touches the API, admin, sign-in, owner or payment/listing pages —
//    those must always be live and are never cached.
//  - Shows a small branded "You're offline" page when a page isn't cached.

const CACHE = 'hub-pages-v1';
const MAX_ENTRIES = 60;
const NEVER_CACHE = ['/api/', '/admin/', '/my-businesses/', '/login/', '/register/', '/list-your-business/', '/service-worker.js'];

self.addEventListener('install', (event) => {
  self.skipWaiting();
  event.waitUntil(
    caches
      .open(CACHE)
      .then((cache) => cache.addAll(['/favicon-192.png', '/icon-512.png']))
      .catch(() => {}),
  );
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    (async () => {
      const keys = await caches.keys();
      await Promise.all(keys.filter((k) => k.startsWith('hub-pages-') && k !== CACHE).map((k) => caches.delete(k)));
      await self.clients.claim();
    })(),
  );
});

// `copy` must already be a clone — cloning has to happen before the original
// response is handed to the page (a used body can't be cloned afterwards).
async function remember(request, copy) {
  const cacheControl = copy.headers.get('Cache-Control') || '';
  if (/no-store/i.test(cacheControl)) return;
  const cache = await caches.open(CACHE);
  await cache.put(request, copy);
  const keys = await cache.keys();
  for (let i = 0; i < keys.length - MAX_ENTRIES; i++) await cache.delete(keys[i]);
}

function cacheable(response) {
  return response && response.ok && response.type === 'basic';
}

async function networkFirst(request, isNavigation) {
  try {
    const response = await fetch(request);
    if (cacheable(response)) remember(request, response.clone()).catch(() => {});
    return response;
  } catch (err) {
    const cached = await caches.match(request);
    if (cached) return cached;
    if (isNavigation) return offlinePage();
    throw err;
  }
}

async function cacheFirst(request) {
  const cached = await caches.match(request);
  if (cached) return cached;
  const response = await fetch(request);
  if (cacheable(response)) remember(request, response.clone()).catch(() => {});
  return response;
}

function offlinePage() {
  const html =
    '<!doctype html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">' +
    '<title>Offline</title></head>' +
    '<body style="margin:0;font-family:system-ui,-apple-system,Segoe UI,Roboto,sans-serif;background:' + HUB.bg + ';color:' + HUB.navy + ';display:flex;min-height:100vh;align-items:center;justify-content:center;padding:24px;text-align:center">' +
    '<div style="max-width:360px"><img src="/favicon-192.png" alt="" width="84" height="84" style="border-radius:20px">' +
    '<h1 style="margin:18px 0 8px;font-size:24px;letter-spacing:-.02em">You are offline</h1>' +
    '<p style="margin:0 0 20px;font-size:15px;line-height:1.5;opacity:.75">' + HUB.siteName + ' needs a connection for this page. Pages you have already opened still work.</p>' +
    '<button onclick="location.reload()" style="padding:13px 22px;border:0;border-radius:11px;background:' + HUB.accent + ';color:' + HUB.accentContrast + ';font-size:15px;font-weight:800;cursor:pointer">Try again</button></div></body></html>';
  return new Response(html, { status: 503, headers: { 'Content-Type': 'text/html; charset=utf-8' } });
}

self.addEventListener('fetch', (event) => {
  const request = event.request;
  if (request.method !== 'GET' || request.headers.has('range')) return;
  const url = new URL(request.url);
  if (url.origin !== self.location.origin) return;
  if (NEVER_CACHE.some((p) => url.pathname.startsWith(p))) return;

  if (request.mode === 'navigate') {
    event.respondWith(networkFirst(request, true));
  } else if (url.pathname.startsWith('/_astro/')) {
    event.respondWith(cacheFirst(request));
  } else {
    event.respondWith(networkFirst(request, false));
  }
});
