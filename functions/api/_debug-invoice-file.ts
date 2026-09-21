import type { PagesFunction, R2Bucket } from '@cloudflare/workers-types';
interface Env { MEDIA: R2Bucket }
// TEMPORARY — for manual local testing only, deleted before commit.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const key = new URL(context.request.url).searchParams.get('key') ?? '';
  const obj = await context.env.MEDIA.get(key);
  if (!obj) return new Response('not found', { status: 404 });
  return new Response(obj.body as unknown as BodyInit, { headers: { 'Content-Type': 'application/pdf' } });
};
