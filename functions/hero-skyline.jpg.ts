import type { PagesFunction, Fetcher } from '@cloudflare/workers-types';
import { getSite, isAllowedMediaHost } from './_lib/site';

interface Env {
  ASSETS: Fetcher;
  SITE: string;
}

// Hotlink protection: only serve this image to requests referred by our own
// pages (or with no referer at all — a direct visit/new tab), blocking other
// sites from embedding it directly on their own pages. Doesn't stop someone
// from downloading and re-hosting their own copy — nothing server-side can —
// but it does stop the common case of another site linking straight to ours.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const referer = context.request.headers.get('Referer');
  if (referer) {
    try {
      if (!isAllowedMediaHost(site, new URL(referer).hostname)) {
        return new Response('Forbidden', { status: 403 });
      }
    } catch {
      // malformed referer header — fall through and serve normally
    }
  }
  return context.env.ASSETS.fetch(context.request);
};
