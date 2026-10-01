import type { APIRoute } from 'astro';
import { suburbBoundaries } from '../lib/suburbBoundaries';

export const GET: APIRoute = () =>
  new Response(JSON.stringify(suburbBoundaries), { headers: { 'Content-Type': 'application/json' } });
