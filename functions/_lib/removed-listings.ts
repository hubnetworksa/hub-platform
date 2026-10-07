import pretoria from './removed-listings/pretoria.json';

// Business pages that were removed from a site, mapped to the closest live
// page: the same listing under its new address when it was renamed, else its
// category in its suburb, else its category. The middleware 301-redirects to
// these only when the old address now 404s, so a listing that comes back
// under the same address is served as normal.
//
// pretoria.json: the 3,874 listings removed in the September 2026 thin-listing
// clean-up, built from status/pretoria/db-snapshot.json before (28 Sep) and
// after the clean-up, with targets limited to pages in the live sitemap.
const MAPS: Record<string, Record<string, string>> = { pretoria };

export function removedListingTarget(site: string, pathname: string): string | null {
  const slug = /^\/business\/([^/]+)\/?$/.exec(pathname)?.[1];
  if (!slug) return null;
  return MAPS[site]?.[slug] ?? null;
}
