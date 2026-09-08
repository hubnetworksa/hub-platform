# Hub Platform — infrastructure setup

This repo builds three sites from one codebase — PolokwaneHub, PretoriaHub,
and TheCapeTownHub — each its own Cloudflare Pages project, D1 database, and
R2 bucket, selected at build/dev/request time by the `SITE` env var (see
`README.md` for how that wiring works). Polokwane and Pretoria already have
live infrastructure (migrated from their old standalone repos); Cape Town's
still needs to be created from scratch. Steps below apply per-site — repeat
for each one you're setting up.

## 1. GitHub

1. Create the `hubnetwork-sa` GitHub organization (or whatever name you've
   settled on), then this repo inside it, as **private**.
2. Push this codebase's `main` branch to it.
3. Repo → Settings → Secrets and variables → Actions, add:
   - `CLOUDFLARE_API_TOKEN` — one token with D1 edit, R2 edit, and Pages
     edit permission, covering all three sites (or scope separate tokens
     per site if you'd rather not share one credential across them).
   - `CLOUDFLARE_ACCOUNT_ID`
4. Pushing to `main` runs `.github/workflows/deploy.yml` — a matrix job,
   one leg per site, each applying that site's own D1 migrations, applying
   any pending `db/routine-updates/<site>/*.sql`, building with
   `SITE=<site>`, deploying to that site's own Cloudflare Pages project,
   then regenerating `status/<site>/db-snapshot.json`.

## 2. Cloudflare — per site

Repeat for `polokwane` (done already if migrating from the old repo),
`pretoria` (same), and `capetown` (new):

1. `npx wrangler login` if you haven't already.
2. Create the D1 database: `npx wrangler d1 create <site>-db` (e.g.
   `thecapetownhub-db` for Cape Town). Copy the returned `database_id` into
   `wrangler.<slug>.jsonc`.
3. Create the R2 bucket (the API token needs R2 write permission):
   `npx wrangler r2 bucket create <site>-media`.
4. Create the Pages project with the exact name in that site's
   `wrangler.<slug>.jsonc` (`pages_build_output_dir` config there) — either
   via the dashboard (Workers & Pages → Create → Pages) or by letting the
   first `npx wrangler pages deploy dist --project-name=<name> --config
   wrangler.<slug>.jsonc` create it.
5. In that Pages project's settings, set the **environment variable**
   `SITE=<slug>` for both Production and Preview — this is what
   `functions/_lib/site.ts` reads at request time (the `vars.SITE` in
   `wrangler.<slug>.jsonc` covers `wrangler` CLI/local runs; the dashboard
   value is authoritative for the actual deployed Functions).
6. Add the custom domain (`polokwanehub.com`, `pretoriahub.com`,
   `thecapetownhub.com` — confirm this last one) to the Pages project and
   point DNS at Cloudflare.
7. Enable **Email Routing** (dashboard → the zone → Email → Email Routing)
   and add that site's `contactEmail` (from `sites/<slug>.json`) as a
   destination, forwarding to a real inbox you own.
8. (Optional, recommended) In the Pages project's **Preview** environment,
   point the D1/R2 bindings at a staging copy of the database/bucket
   instead of production — this is what makes a `dev` branch push a safe
   place to try schema or data changes before they can touch production.

## 3. The research routine (Claude account) — per site

Each site has its own runbook (`ROUTINE.polokwane.md`, `ROUTINE.pretoria.md`
— `ROUTINE.capetown.md` is a placeholder until Cape Town has real suburb
data) and needs its own scheduled cloud agent pointed at this repo. Each
only needs repo read/write access — no Cloudflare credentials (it proposes
SQL under `db/routine-updates/<site>/`, the GitHub Action applies it). It
reads that site's `ROUTINE.<slug>.md`, `status/<slug>/db-snapshot.json`,
and `status/<slug>/routine-state.json` each run — make sure whichever agent
you configure is told which site it owns and only touches that site's
paths.

## 4. Email

No SMTP, no Pages secret, no credentials at all — every site uses the same
client-side `mailto:` approach (see each `wrangler.<slug>.jsonc`'s
comment). Pretoria's old Gmail SMTP setup (`worker-mailer` +
`GMAIL_APP_PASSWORD`) has been retired as part of this consolidation; once
this deploys, delete the `GMAIL_APP_PASSWORD` secret from the old
`pretoriahub` Pages project if it's still there.

- **Receiving:** Cloudflare Email Routing (step 2.7 above) forwards each
  site's contact address to a real inbox.
- **Sending:** `report-listing.astro` and `request-removal.astro` build a
  `mailto:<contactEmail>` link client-side and open it — the visitor's own
  mail app sends it. `list-your-business.astro` does the same after
  `functions/api/submit-business.ts` saves the submission and returns a
  `reviewUrl`, so the admin still gets a link straight to
  `functions/verify-listing.ts`'s approve/reject page.

## 5. Google / AdSense — per site

Each site's `sites/<slug>.json` carries its own `googleSiteVerification`
and `adsensePublisherId` (`null` renders neither tag/script — that's
Cape Town's state until it has its own). To onboard a site:

- Get its AdSense publisher ID and set `adsensePublisherId` in
  `sites/<slug>.json` — `scripts/select-site-assets.mjs` generates that
  site's `public/ads.txt` from it automatically.
- Get a Search Console verification token (or use the DNS TXT method
  instead, like Polokwane does, and leave this `null`) and set
  `googleSiteVerification`.

## 6. Cape Town — content still to do

Cape Town's `features.tourism` is `false` and its
`src/site-content/capetown/areaGroups.ts` is empty — the site builds fine
like this (empty states everywhere) but isn't really usable until:

- `db/migrations/capetown/0002_seed_suburbs.sql` (and a coordinates
  migration like Polokwane's `0004`) — a real Cape Town suburb list.
- `src/site-content/capetown/areaGroups.ts` — group those suburbs for the
  `/suburb/` index, same pattern as `site-content/polokwane/areaGroups.ts`.
- `assets/sites/capetown/*` — replace every placeholder image (currently
  borrowed from Pretoria, see that folder's `README.md`) with real Cape
  Town branding.
- Business data itself comes from the same hourly-research-routine
  mechanism as the other two sites, once step 3 above is set up for it.

## 7. Local dev

```
npm install
SITE=polokwane npm run db:migrate:local   # fresh local D1 with that site's schema/seed
npm run dev:polokwane                     # http://localhost:4321 (fetch-data + asset-select run first)
```

Swap `polokwane` for `pretoria` or `capetown` throughout. `npm run
dev:<site>` and `build:<site>` are shortcuts for `SITE=<site> npm run
dev`/`build`; use the `SITE=<site> npm run <script>` form directly for
anything else (`db:migrate:local`, `db:migrate:remote`, etc.).
