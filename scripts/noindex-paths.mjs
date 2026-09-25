// Path prefixes with no public search value (account/admin/utility pages) —
// these must never appear in robots.txt as an allowed path or in the
// sitemap. Shared by select-site-assets.mjs (robots.txt) and
// astro.config.mjs (sitemap filter) so the two lists can't drift apart.
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
  '/list-your-business/contact/',
  '/list-your-business/review/',
  '/list-your-business/checkout/',
];
