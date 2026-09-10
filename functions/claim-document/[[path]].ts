import type { PagesFunction, D1Database, R2Bucket } from '@cloudflare/workers-types';

interface Env {
  DB: D1Database;
  MEDIA: R2Bucket;
}

// Serves claim-support documents only to whoever holds the matching claim's
// review_token (emailed to the admin) — never publicly listable/guessable
// like the ordinary business-photo media path.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const key = (context.params.path as string[] | undefined)?.join('/');
  const token = new URL(context.request.url).searchParams.get('token');
  if (!key || !token) return new Response('Not found', { status: 404 });

  const claim = await context.env.DB
    .prepare('SELECT document_keys FROM business_claims WHERE review_token = ?')
    .bind(token)
    .first<{ document_keys: string }>();
  if (!claim) return new Response('Not found', { status: 404 });

  const keys: string[] = JSON.parse(claim.document_keys);
  if (!keys.includes(key)) return new Response('Not found', { status: 404 });

  const object = await context.env.MEDIA.get(key);
  if (!object) return new Response('Not found', { status: 404 });

  const headers = new Headers();
  object.writeHttpMetadata(headers as unknown as Headers);
  headers.set('etag', object.httpEtag);
  headers.set('Cache-Control', 'private, no-store');

  return new Response(object.body as unknown as BodyInit, { headers });
};
