// Hub Admin service worker. The app shell (HTML, CSS, JS, icons) is served
// from cache and refreshed in the background; API data always comes from the
// network, falling back to the last copy only when offline, so numbers are
// never silently stale while online. Bump VERSION to force a fresh shell.
const VERSION = 'hub-admin-v4';
const SHELL = ['/', '/styles.css', '/app.js', '/charts.js', '/motion.js', '/vendor/gsap.min.js', '/vendor/ScrollTrigger.min.js', '/manifest.webmanifest', '/icons/logo-rounded.png', '/icons/icon-192.png'];

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

// ── Push notifications ─────────────────────────────────────────────────────
// Pushes arrive empty (see functions/_lib/webpush.ts): ask the app what this
// one is about, then show it. If the sign-in has expired the fetch fails and
// a generic notification is shown instead, which opens the app to sign in.
self.addEventListener('push', (event) => {
  event.waitUntil(
    (async () => {
      let n = null;
      try {
        const sub = await self.registration.pushManager.getSubscription();
        const res = await fetch(`/api/notifications/latest?endpoint=${encodeURIComponent(sub ? sub.endpoint : '')}`, { credentials: 'same-origin', cache: 'no-store' });
        if (res.ok && !res.redirected) n = (await res.json()).notification;
      } catch {
        /* show the generic notification */
      }
      await self.registration.showNotification(n ? n.title : 'Hub Admin', {
        body: n ? n.body : 'Something new needs your attention.',
        icon: '/icons/icon-192.png',
        badge: '/icons/badge-96.png',
        tag: n ? `hub-${n.id}` : 'hub-generic',
        data: { url: n ? n.url : '/#/' },
      });
    })()
  );
});

self.addEventListener('notificationclick', (event) => {
  event.notification.close();
  const url = new URL((event.notification.data && event.notification.data.url) || '/#/', self.location.origin).href;
  event.waitUntil(
    self.clients.matchAll({ type: 'window', includeUncontrolled: true }).then((list) => {
      for (const c of list) {
        if (new URL(c.url).origin === self.location.origin && 'focus' in c) {
          c.navigate(url).catch(() => {});
          return c.focus();
        }
      }
      return self.clients.openWindow(url);
    })
  );
});
