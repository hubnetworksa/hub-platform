import type { APIRoute } from 'astro';
import swSource from '../lib/service-worker.js?raw';
import site from '../site';

// Serves the service worker at /service-worker.js (root scope). The worker
// itself lives in src/lib/service-worker.js; this just prepends the per-site
// name/colours it uses for its offline page.
export const GET: APIRoute = () => {
  const hub = {
    siteName: site.siteName,
    bg: site.theme.bg,
    navy: site.theme.navy,
    accent: site.theme.accent,
    accentContrast: site.theme.accentContrast,
  };
  return new Response(`const HUB = ${JSON.stringify(hub)};\n${swSource}`, {
    headers: {
      'Content-Type': 'application/javascript; charset=utf-8',
      'Service-Worker-Allowed': '/',
    },
  });
};
