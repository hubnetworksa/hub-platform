import type { PagesFunction, R2Bucket } from '@cloudflare/workers-types';
import { getSite, isAllowedMediaHost } from '../_lib/site';

interface Env {
  MEDIA: R2Bucket;
  SITE: string;
}

// Serves suburb photos (and any other owner-supplied media) out of this
// site's own R2 bucket (bound as MEDIA — a different bucket per Cloudflare
// Pages project) at /media/<key>, e.g. /media/suburbs/bendor.jpg — same
// hotlink-protection pattern as logo-icon.png.ts/hero-skyline.jpg.ts, since
// these are real photos, not build-time assets, so they aren't covered by
// that per-file approach.
const PRIVATE_PREFIXES = ['invoices/'];

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

  const key = (context.params.path as string[] | undefined)?.join('/');
  if (!key) return new Response('Not found', { status: 404 });
  // Invoices share this bucket but are private: they name the payer and are
  // numbered sequentially, so serving them here would let anyone walk every
  // invoice. They're only served by /api/invoice, which checks ownership.
  if (PRIVATE_PREFIXES.some((p) => key.startsWith(p))) return new Response('Not found', { status: 404 });

  const object = await context.env.MEDIA.get(key);
  if (!object) return new Response('Not found', { status: 404 });

  const headers = new Headers();
  object.writeHttpMetadata(headers as unknown as Headers);
  headers.set('etag', object.httpEtag);
  headers.set('Cache-Control', 'public, max-age=31536000, immutable');

  return new Response(object.body as unknown as BodyInit, { headers });
};
