import type { PagesFunction } from '@cloudflare/workers-types';
import { requireBasicAuth } from './_lib/basic-auth';

interface Env {
  DEV_AUTH_USER?: string;
  DEV_AUTH_PASSWORD?: string;
}

// This whole project only ever exists as a dev-environment entry point —
// no production/preview distinction needed, always gated.
export const onRequest: PagesFunction<Env> = async (context) => {
  const unauthorized = requireBasicAuth(context.request, context.env);
  if (unauthorized) return unauthorized;
  return context.next();
};
