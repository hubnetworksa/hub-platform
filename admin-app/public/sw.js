// Hub Admin service worker. The app shell (HTML, CSS, JS, icons) is served
// from cache and refreshed in the background; API data always comes from the
// network, falling back to the last copy only when offline, so numbers are
// never silently stale while online. Bump VERSION to force a fresh shell.
const VERSION = 'hub-admin-v1';
const SHELL = ['/', '/styles.css', '/app.js', '/charts.js', '/manifest.webmanifest', '/icons/logo-rounded.png', '/icons/icon-192.png'];

self.addEventListener('install', (event) => {
  event.waitUntil(caches.open(VERSION).then((c) => c.addAll(SHELL)).then(() => self.skipWaiting()));
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((keys) => Promise.all(keys.filter((k) => k !== VERSION).map((k) => caches.delete(k)))).then(() => self.clients.claim())
  );
});

async function networkFirst(request) {
  const cache = await caches.open(VERSION);
  try {
    const res = await fetch(request);
    if (res.ok) cache.put(request, res.clone());
    return res;
  } catch (err) {
    const hit = await cache.match(request);
    if (hit) return hit;
    throw err;
  }
}

async function staleWhileRevalidate(request) {
  const cache = await caches.open(VERSION);
  const hit = await cache.match(request, { ignoreSearch: true });
  const fresh = fetch(request)
    .then((res) => {
      // Only cache real app files; a redirect to the Cloudflare sign-in page
      // (expired session) must never replace the cached shell.
      if (res.ok && res.type === 'basic' && !res.redirected) cache.put(request, res.clone());
      return res;
    })
    .catch(() => hit);
  return hit || fresh;
}

self.addEventListener('fetch', (event) => {
  const req = event.request;
  if (req.method !== 'GET') return;
  const url = new URL(req.url);
  if (url.origin !== location.origin) return;
  if (url.pathname.startsWith('/cdn-cgi/')) return; // Cloudflare Access sign-in
  if (url.pathname.startsWith('/api/')) {
    event.respondWith(networkFirst(req));
    return;
  }
  if (req.mode === 'navigate') {
    // Navigations go to the network first so an expired Access session can
    // redirect to sign-in; offline, the cached shell still opens.
    event.respondWith(fetch(req).catch(() => caches.match('/')));
    return;
  }
  event.respondWith(staleWhileRevalidate(req));
});
