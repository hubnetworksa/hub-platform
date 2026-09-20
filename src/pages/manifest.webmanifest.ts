import type { APIRoute } from 'astro';
import site from '../site';

// Web app manifest — with the service worker (service-worker.js.ts) this is
// what lets Chrome on Android offer "Install app" / "Add to Home screen".
// Built per site so the name, colours and icon match whichever hub this build is.
export const GET: APIRoute = () => {
  const manifest = {
    id: '/',
    name: site.siteName,
    short_name: `${site.cityLabel} Hub`,
    description: site.tagline,
    lang: 'en-ZA',
    start_url: '/?source=pwa',
    scope: '/',
    display: 'standalone',
    orientation: 'portrait-primary',
    background_color: site.theme.bg,
    theme_color: site.theme.navy,
    categories: ['business', 'shopping'],
    icons: [
      { src: '/favicon-192.png', sizes: '192x192', type: 'image/png', purpose: 'any' },
      { src: '/icon-512.png', sizes: '512x512', type: 'image/png', purpose: 'any' },
      { src: '/icon-512-maskable.png', sizes: '512x512', type: 'image/png', purpose: 'maskable' },
    ],
    shortcuts: [
      { name: 'Search businesses', short_name: 'Search', url: '/search/', icons: [{ src: '/favicon-192.png', sizes: '192x192', type: 'image/png' }] },
      { name: 'Events', short_name: 'Events', url: '/events/', icons: [{ src: '/favicon-192.png', sizes: '192x192', type: 'image/png' }] },
      { name: 'Add your business', short_name: 'Add business', url: '/list-your-business/', icons: [{ src: '/favicon-192.png', sizes: '192x192', type: 'image/png' }] },
    ],
  };
  return new Response(JSON.stringify(manifest, null, 2), {
    headers: { 'Content-Type': 'application/manifest+json' },
  });
};
