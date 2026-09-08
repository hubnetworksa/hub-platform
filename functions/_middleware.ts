import type { PagesFunction } from '@cloudflare/workers-types';
import { getSite } from './_lib/site';

interface Env {
  SITE: string;
}

// Runs on every request. Cloudflare Pages keeps the .pages.dev URL live
// alongside a connected custom domain — without this, both would serve
// identical content, which is bad for SEO (duplicate content) and defeats
// the point of moving to a real domain. 301s preserve path + query string.
export const onRequest: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const url = new URL(context.request.url);
  if (url.hostname === site.pagesDevHost) {
    url.hostname = site.domain;
    return Response.redirect(url.toString(), 301);
  }
  return context.next();
};
