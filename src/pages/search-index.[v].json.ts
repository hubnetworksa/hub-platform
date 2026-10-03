import type { APIRoute, GetStaticPaths } from 'astro';
import { searchPack } from '../lib/search-pack';

// The business search payload (see src/lib/search-pack.ts): lean rows plus
// pre-normalised, pre-built Fuse indexes. The content hash in the URL makes
// it immutable-cacheable and always fresh after a rebuild.
export const getStaticPaths: GetStaticPaths = () => [{ params: { v: searchPack().hash } }];

export const GET: APIRoute = () =>
  new Response(searchPack().json, { headers: { 'Content-Type': 'application/json' } });
