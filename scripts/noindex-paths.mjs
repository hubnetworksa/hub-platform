// Path prefixes with no public search value (account/admin/utility/form
// pages). Every one of these pages carries <meta name="robots"
// content="noindex"> (BaseLayout's `noindex` prop) and is left out of the
// sitemap. Shared by astro.config.mjs (sitemap filter) so the list can't drift.
//
// These are deliberately NOT disallowed in robots.txt: Google never fetches a
// disallowed URL, so it never sees the noindex tag and can still index the
// bare URL from links pointing at it (which is how /login/, /report-listing/
// etc. ended up in search results). Crawlable + noindex is what removes them.
export const NOINDEX_PATH_PREFIXES = [
  '/admin/',
  '/my-businesses/',
  '/my-events/',
  '/login/',
  '/register/',
  '/forgot-password/',
  '/reset-password/',
  '/search/',
  '/report-listing/',
  '/request-removal/',
  // The whole list-your-business flow, step 1 included (contact, review,
  // checkout are its later steps).
  '/list-your-business/',
  '/events/add/',
];

// The only paths robots.txt disallows: the admin area and the
// non-HTML/private endpoints (JSON APIs, uploaded claim documents), none of
// which a crawler has any reason to fetch. Pages in NOINDEX_PATH_PREFIXES
// must not be added here (see above).
export const ROBOTS_DISALLOW_PREFIXES = ['/admin/', '/api/', '/claim-document/'];
