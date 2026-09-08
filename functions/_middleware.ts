import type { PagesFunction } from '@cloudflare/workers-types';

interface Env {
  SITE: string;
}

// Runs on every request. Cloudflare Pages keeps the .pages.dev URL live
// alongside a connected custom domain — normally this 301-redirects that
// bare .pages.dev host to the real domain (both serving identical content
// is bad for SEO, and defeats the point of moving to a real domain).
//
// TEMPORARILY DISABLED (2026-09-08, owner request): none of the three real
// domains have actually been cut over to this account yet, so this redirect
// was only getting in the way of checking the new deployments directly at
// their .pages.dev URLs. Re-enable by restoring the block below once a
// site's domain is live here — see git history for the exact code.
//
// Login gate lives only on dev-landing/functions/_middleware.ts, not here —
// per-site dev previews (dev.<project>.pages.dev) are intentionally left
// open so there's exactly one login for the whole hosted dev environment,
// not one per site.
export const onRequest: PagesFunction<Env> = async (context) => {
  return context.next();
};
