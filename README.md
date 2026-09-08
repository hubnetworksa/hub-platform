# Hub Platform

One Astro codebase that builds and deploys three (and counting) local
business directory sites — **PolokwaneHub**, **PretoriaHub**, and
**TheCapeTownHub** — each its own Cloudflare Pages project, D1 database, and
R2 bucket, all from this one repo. A single code change, pushed once to
`main`, redeploys every site.

New-infrastructure setup steps (Cloudflare, GitHub, DNS) live in `SETUP.md`.

## How the multi-site part works

- `sites/<slug>.json` holds each site's branding, domain, D1/R2 names,
  AdSense ID, feature flags, and color theme.
- `src/site.ts` loads the right one at build/dev time based on the `SITE`
  env var (`polokwane` / `pretoria` / `capetown`). Cloudflare Pages
  Functions (`functions/`) read the same thing from `context.env.SITE`
  (a Pages environment variable) at request time.
- `src/site-content/<slug>/` holds the handful of things that are
  genuinely per-site *code*, not just branding — how suburbs group into
  browsable areas (`areaGroups.ts`) and (for Polokwane so far)
  hand-authored tourism content (`tourism.ts`).
- `assets/sites/<slug>/` holds each site's actual logo/favicon/banner
  images; `scripts/select-site-assets.mjs` copies the current `SITE`'s
  into `public/` before each build/dev, the same way
  `scripts/fetch-d1-data.mjs` pulls that site's own D1 data into
  `src/data/`.
- `db/migrations/<slug>/`, `db/routine-updates/<slug>/`, and
  `status/<slug>/` keep each site's own D1 migration history and hourly
  research-routine state separate — see `ROUTINE.<slug>.md` for that
  routine's rules per site.
- `wrangler.<slug>.jsonc` has each site's own D1/R2 binding IDs.

Adding a fourth city later: one `sites/<slug>.json`, one
`db/migrations/<slug>/` (schema only, copy an existing site's structural
migrations), one Cloudflare Pages project + D1 + R2, one line in the
deploy workflow's matrix. No forking the codebase.

## Stack

- [Astro](https://astro.build) — static site, deployed to Cloudflare Pages
- **Cloudflare D1** — businesses/suburbs/categories (structured data, not files-in-git), one database per site
- **Cloudflare R2** — business photos/logos, one bucket per site
- Deployed via GitHub Actions (a matrix job, one leg per site) on every push to `main`

## Commands

| Command                        | Action                                                    |
| :------------------------------ | :--------------------------------------------------------- |
| `npm install`                    | Install dependencies                                        |
| `SITE=polokwane npm run dev`      | Local dev server at `localhost:4321`, against Polokwane's data |
| `npm run dev:polokwane` (or `:pretoria`, `:capetown`) | Same, as a shortcut                    |
| `SITE=polokwane npm run build`    | Build that site to `./dist/`                                 |
| `npm run build:polokwane` (etc.)  | Same, as a shortcut                                          |
| `SITE=polokwane npm run db:migrate:local`  | Apply that site's D1 migrations to its local dev database |
| `SITE=polokwane npm run db:migrate:remote` | Apply that site's D1 migrations to its real D1 database  |

`SITE` must be set for every command that touches `src/data/`, `public/`,
or a D1/wrangler command — the bare `dev`/`build`/`db:migrate:*` scripts
error out immediately with a clear message if it isn't.

## Dev → all-three-production pipeline

1. Develop locally with `SITE=<slug> npm run dev`.
2. Push to `dev` — `.github/workflows/deploy-dev.yml` rebuilds all three
   sites read-only and deploys each as a Cloudflare Pages preview, plus a
   small landing page (`dev-landing/`) linking them together as one hosted
   dev environment. Cloudflare Access sits in front of all of it (one
   login, configured once in the Cloudflare dashboard — see `SETUP.md`
   "Hosted dev environment"), so this is a real hosted URL you (or anyone
   you grant access to) can check a build on, not something running only
   on your own machine.
3. Merge `dev` → `main` — the GitHub Actions matrix workflow
   (`deploy.yml`) builds and deploys all three sites to their production
   domains in one push.
