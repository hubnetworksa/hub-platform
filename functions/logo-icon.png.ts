import type { PagesFunction, Fetcher } from '@cloudflare/workers-types';
import { getSite, allowedHostsFor } from './_lib/site';

interface Env {
  ASSETS: Fetcher;
  SITE: string;
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const allowedHosts = allowedHostsFor(getSite(context.env.SITE));
  const referer = context.request.headers.get('Referer');
  if (referer) {
    try {
      if (!allowedHosts.includes(new URL(referer).hostname)) {
        return new Response('Forbidden', { status: 403 });
      }
    } catch {
      // malformed referer header — fall through and serve normally
    }
  }
  return context.env.ASSETS.fetch(context.request);
};
