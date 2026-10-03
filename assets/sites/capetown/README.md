`hero-banner.webp` is the real Cape Town photo (V&A Waterfront / Table
Mountain at sunset, provided 2026-09-08), and `section-banner.webp` the
inner-page banner. Both were converted from ~2MB PNGs to 1920px WebP on
2026-09-25; the PNG originals are in git history. The logo mark (a pin with Devil's Peak, Table Mountain and Lion's Head over
the city and harbour, added 2026-10-03) is drawn as a vector in
`assets/logo-src/capetown.svg`. `logo-icon.png`, `favicon-*.png`,
`apple-touch-icon.png`, `icon-512*.png` and `badge.svg` are all rendered from
it: edit the SVG, then run `node scripts/render-logo.mjs capetown`,
`node scripts/generate-pwa-icons.mjs capetown` and
`node scripts/generate-badges.mjs`. `hero-skyline.jpg` (unused, see below) is
still a placeholder borrowed from Pretoria.

`hero-skyline.jpg` isn't referenced anywhere in `src/` on any site (dead
asset, only reachable via `functions/hero-skyline.jpg.ts`'s hotlink-guard
route) — safe to ignore or delete once confirmed unused elsewhere.
