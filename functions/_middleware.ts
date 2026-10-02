import type { PagesFunction } from '@cloudflare/workers-types';
import { getSite } from './_lib/site';

interface Env {
  SITE: string;
}

// Runs on every request. Cloudflare Pages keeps the .pages.dev URL live
// alongside a connected custom domain — this 301-redirects that bare
// .pages.dev host to the real domain (both serving identical content is
// bad for SEO, and defeats the point of moving to a real domain).
//
// Gated on `domainLive` (sites/<slug>.json) rather than unconditional,
// since sites cut over to their real domain one at a time — redirecting a
// site whose domain isn't actually live here yet would send visitors to a
// domain that doesn't point at this project (re-disabled for Polokwane and
// Cape Town 2026-09-10; set domainLive: true once each one's cut over).
//
// Login gate lives only on dev-landing/functions/_middleware.ts, not here —
// per-site dev previews (dev.<project>.pages.dev) are intentionally left
// open so there's exactly one login for the whole hosted dev environment,
// not one per site.
export const onRequest: PagesFunction<Env> = async (context) => {
  const site = getSite(context.env.SITE);
  const url = new URL(context.request.url);
  // Same for www.<domain>: once www is attached to the Pages project it would
  // otherwise serve a full duplicate copy of the site.
  if (site.domainLive && (url.hostname === site.pagesDevHost || url.hostname === `www.${site.domain}`)) {
    url.hostname = site.domain;
    return Response.redirect(url.toString(), 301);
  }
  const res = await context.next();
  // public/_headers only covers static assets; Function responses (the
  // emailed confirm/review pages, APIs, /media/) get the same baseline here.
  const out = new Response(res.body, res);
  for (const [k, v] of Object.entries(SECURITY_HEADERS)) {
    if (!out.headers.has(k)) out.headers.set(k, v);
  }
  // The emailed one-off pages (claim/listing confirmations and reviews) and
  // the APIs must never be indexed. robots.txt only disallows /api/, so the
  // confirm pages stay crawlable and Google can see this header.
  if (NOINDEX_FUNCTION_PATHS.some((p) => url.pathname.startsWith(p)) && !out.headers.has('X-Robots-Tag')) {
    out.headers.set('X-Robots-Tag', 'noindex');
  }
  return out;
};

const NOINDEX_FUNCTION_PATHS = [
  '/api/',
  '/claim-document/',
  '/owner-confirm-listing',
  '/review-claim',
  '/review-event-claim',
  '/verify-claim',
  '/verify-listing',
];

const SECURITY_HEADERS: Record<string, string> = {
  'X-Frame-Options': 'SAMEORIGIN',
  'X-Content-Type-Options': 'nosniff',
  'Referrer-Policy': 'strict-origin-when-cross-origin',
  // Same values as public/_headers (assets/sites/<city>/_headers). No strict
  // Content-Security-Policy: AdSense, analytics, PayFast and Google sign-in
  // load from too many origins. COOP keeps sign-in/payment popups working.
  'Strict-Transport-Security': 'max-age=31536000; includeSubDomains',
  'Permissions-Policy': 'camera=(), microphone=(), payment=()',
  'Cross-Origin-Opener-Policy': 'same-origin-allow-popups',
};
