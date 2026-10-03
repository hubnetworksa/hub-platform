import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../_lib/sites';
import { cityPublicKey } from '../_lib/city-api';

// The public half of the key Hub Admin signs city-site admin requests with
// (see _lib/city-api.ts). Public on purpose: it's what goes into the city
// sites' code, and it can only check signatures, never make them.
export const onRequestGet: PagesFunction<Env> = async (context) => json({ ok: true, key: await cityPublicKey(context.env.ADMIN_DB) });
