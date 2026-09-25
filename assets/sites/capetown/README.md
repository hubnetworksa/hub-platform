`hero-banner.webp` is the real Cape Town photo (V&A Waterfront / Table
Mountain at sunset, provided 2026-09-08), and `section-banner.webp` the
inner-page banner. Both were converted from ~2MB PNGs to 1920px WebP on
2026-09-25; the PNG originals are in git history. `logo-icon.png`, `favicon-*.png`,
`apple-touch-icon.png`, and `hero-skyline.jpg` (unused, see below) are
still placeholders borrowed from Pretoria — replace them with a real Cape
Town logo mark before this site goes live. See SETUP.md "Content / assets
still to do".

`hero-skyline.jpg` isn't referenced anywhere in `src/` on any site (dead
asset, only reachable via `functions/hero-skyline.jpg.ts`'s hotlink-guard
route) — safe to ignore or delete once confirmed unused elsewhere.
