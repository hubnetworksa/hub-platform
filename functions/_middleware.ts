import type { PagesFunction } from '@cloudflare/workers-types';
import { requireBasicAuth } from './_lib/basic-auth';

interface Env {
  SITE: string;
  // Set automatically by Cloudflare Pages on every deployment — the
  // --branch value passed to `wrangler pages deploy` ("main" for
  // production, "dev" for the hosted dev environment).
  CF_PAGES_BRANCH: string;
  DEV_AUTH_USER?: string;
  DEV_AUTH_PASSWORD?: string;
}

// Runs on every request.
//
// 1. Login gate — only on non-production (dev preview) deployments, a
//    stopgap until Cloudflare Access is set up for real (see SETUP.md
//    "Hosted dev environment"). Production is never gated.
//
// 2. Cloudflare Pages keeps the .pages.dev URL live alongside a connected
//    custom domain — normally this 301-redirects that bare .pages.dev host
//    to the real domain (both serving identical content is bad for SEO,
//    and defeats the point of moving to a real domain).
//    TEMPORARILY DISABLED (2026-09-08, owner request): none of the three
//    real domains have actually been cut over to this account yet, so this
//    redirect was only getting in the way of checking the new deployments
//    directly at their .pages.dev URLs. Re-enable by restoring that block
//    once a site's domain is live here — see git history for the exact code.
export const onRequest: PagesFunction<Env> = async (context) => {
  if (context.env.CF_PAGES_BRANCH !== 'main') {
    const unauthorized = requireBasicAuth(context.request, context.env);
    if (unauthorized) return unauthorized;
  }
  return context.next();
};
