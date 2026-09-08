# Hub Platform — infrastructure setup

This repo builds three sites from one codebase — PolokwaneHub, PretoriaHub,
and TheCapeTownHub — each its own Cloudflare Pages project, D1 database, and
R2 bucket, selected at build/dev/request time by the `SITE` env var (see
`README.md` for how that wiring works). Polokwane and Pretoria already have
live infrastructure (migrated from their old standalone repos, which may
have been on two different personal Cloudflare accounts); Cape Town's still
needs to be created from scratch. Steps below apply per-site — repeat for
each one you're setting up.

**One Cloudflare account for the whole network** (decided 2026-09-08): all
three sites' D1/R2/Pages live under a single Cloudflare account going
forward — simpler to manage (one dashboard, one bill, one Zero Trust team
for the hosted dev login) and it's what `.github/workflows/deploy.yml` /
`deploy-dev.yml` assume: **one** shared `CLOUDFLARE_API_TOKEN` +
`CLOUDFLARE_ACCOUNT_ID` secret pair authenticates every matrix leg. If
Polokwane and/or Pretoria are currently sitting on a *different* Cloudflare
account than the one you're standardizing on, see the **"Migrating a site
to the shared Cloudflare account"** section at the end of this file before
continuing. If everything's already on one account, skip straight to step 1.

## 1. GitHub

1. Create the `hubnetwork-sa` GitHub organization (or whatever name you've
   settled on), then this repo inside it, as **private**.
2. Push this codebase's `main` branch to it.
3. Repo → Settings → Secrets and variables → Actions, add:
   - `CLOUDFLARE_API_TOKEN` — one token, scoped to the single Cloudflare
     account above, with D1 edit, R2 edit, and Pages edit permission.
   - `CLOUDFLARE_ACCOUNT_ID`
4. Pushing to `main` runs `.github/workflows/deploy.yml` — a matrix job,
   one leg per site, each applying that site's own D1 migrations, applying
   any pending `db/routine-updates/<site>/*.sql`, building with
   `SITE=<site>`, deploying to that site's own Cloudflare Pages project,
   then regenerating `status/<site>/db-snapshot.json`.

## 2. Cloudflare — per site

All on the one account from above. Repeat for `polokwane` (done already if
migrating from the old repo), `pretoria` (same), and `capetown` (new):

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

## 3. Hosted dev environment (login-gated)

Pushing to the `dev` branch (`.github/workflows/deploy-dev.yml`) rebuilds
all three sites read-only from their live data and deploys each as a
Cloudflare Pages **preview** (via `wrangler pages deploy --branch=dev`),
plus a tiny static landing page (`dev-landing/`) that links them together —
this is the "one shared hosted dev environment" the whole team browses
instead of running things locally. No migrations, no routine-SQL apply, no
D1 writes happen on this branch — it's a safe read-only mirror of
whatever's on the `dev` branch's code.

1. Create a fourth Cloudflare Pages project named **`hub-platform-dev`**
   (dashboard, or let the first `npx wrangler pages deploy dev-landing
   --project-name=hub-platform-dev` create it) — this one has no D1/R2
   bindings and no build step; it just serves the static `dev-landing/index.html`.
2. Push a `dev` branch once to trigger `deploy-dev.yml` and get real URLs
   for all four: `dev.polokwanehub.pages.dev`, `dev.pretoriahub.pages.dev`,
   `dev.thecapetownhub.pages.dev`, and `hub-platform-dev.pages.dev`.
3. In the Cloudflare **Zero Trust** dashboard (Access → Applications), add
   a **Self-hosted** application covering all four of those hostnames
   (Access supports multiple hostnames per application) with whatever
   login method you want people to use — a one-time PIN emailed to an
   allow-list of addresses is the simplest to set up, Google/GitHub SSO if
   you'd rather not manage an allow-list by hand. This is what actually
   shows the login page — nothing in this repo implements auth itself.
   Logging in once covers all four hostnames (same Zero Trust team), so it
   reads as one environment even though it's four small deployments under
   the hood.
4. Day to day: push your branch to `dev` (or merge a feature branch into
   it), open `hub-platform-dev.pages.dev`, log in once, click through to
   whichever city you want to check, and once you're happy merge `dev` →
   `main` to run the real `deploy.yml` against production.

## 4. The research routine (Claude account) — per site

Each site has its own runbook (`ROUTINE.polokwane.md`, `ROUTINE.pretoria.md`
— `ROUTINE.capetown.md` is a placeholder until Cape Town has real suburb
data) and needs its own scheduled cloud agent pointed at this repo. Each
only needs repo read/write access — no Cloudflare credentials (it proposes
SQL under `db/routine-updates/<site>/`, the GitHub Action applies it). It
reads that site's `ROUTINE.<slug>.md`, `status/<slug>/db-snapshot.json`,
and `status/<slug>/routine-state.json` each run — make sure whichever agent
you configure is told which site it owns and only touches that site's
paths.

## 5. Email

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

## 6. Google / AdSense — per site

Each site's `sites/<slug>.json` carries its own `googleSiteVerification`
and `adsensePublisherId` (`null` renders neither tag/script — that's
Cape Town's state until it has its own). To onboard a site:

- Get its AdSense publisher ID and set `adsensePublisherId` in
  `sites/<slug>.json` — `scripts/select-site-assets.mjs` generates that
  site's `public/ads.txt` from it automatically.
- Get a Search Console verification token (or use the DNS TXT method
  instead, like Polokwane does, and leave this `null`) and set
  `googleSiteVerification`.

## 7. Cape Town — content still to do

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
  mechanism as the other two sites, once step 4 above is set up for it.

## 8. Local dev

```
npm install
SITE=polokwane npm run db:migrate:local   # fresh local D1 with that site's schema/seed
npm run dev:polokwane                     # http://localhost:4321 (fetch-data + asset-select run first)
```

Swap `polokwane` for `pretoria` or `capetown` throughout. `npm run
dev:<site>` and `build:<site>` are shortcuts for `SITE=<site> npm run
dev`/`build`; use the `SITE=<site> npm run <script>` form directly for
anything else (`db:migrate:local`, `db:migrate:remote`, etc.).

## Migrating a site to the shared Cloudflare account

Only needed if a site's D1/R2/domain currently live under a *different*
Cloudflare account than the one you're standardizing all three sites on
(see the note at the top of this file). Do this once per site that needs
to move, before pointing that site's Pages project at this repo.

**You'll need:** owner/admin access to both the old and new Cloudflare
accounts, and an API token for each (Dashboard → My Profile → API Tokens →
Create Token — "Edit Cloudflare Workers"/D1/R2/Pages permissions). Keep
them in two separate shell variables so you don't mix them up:

```
OLD_TOKEN=...   # old account
NEW_TOKEN=...   # new (target) account, same as CLOUDFLARE_API_TOKEN in GitHub secrets
```

### 1. D1 data

Don't just dump-and-restore the whole database wholesale — create the new
database from this repo's own migrations first, so its schema (and
wrangler's migration-tracking table) matches what the code expects, then
copy over *only the data*:

```bash
# On the NEW account: create the database and apply this repo's schema migrations
CLOUDFLARE_API_TOKEN=$NEW_TOKEN CLOUDFLARE_ACCOUNT_ID=<new-account-id> \
  npx wrangler d1 create <site>-db --config wrangler.<slug>.jsonc
# → copy the returned database_id into wrangler.<slug>.jsonc, then:
SITE=<slug> npm run db:migrate:remote   # (uses CLOUDFLARE_API_TOKEN/ACCOUNT_ID from your shell env)

# On the OLD account: export data only (no CREATE TABLE statements, which
# would collide with the schema you just applied above)
CLOUDFLARE_API_TOKEN=$OLD_TOKEN CLOUDFLARE_ACCOUNT_ID=<old-account-id> \
  npx wrangler d1 export <old-db-name> --remote --no-schema --output=data.sql

# Back on the NEW account: load that data into the freshly-schema'd database
CLOUDFLARE_API_TOKEN=$NEW_TOKEN CLOUDFLARE_ACCOUNT_ID=<new-account-id> \
  npx wrangler d1 execute <site>-db --config wrangler.<slug>.jsonc --remote --file=data.sql
```

If `data.sql` is large enough that `d1 execute --file` complains or times
out, split it into a few files by table (`--table=<name>` on the export
command) and execute them one at a time.

### 2. R2 media

There's no single "copy bucket to another account" command. For a
directory-photos-sized bucket (tens of images, not millions), the
practical option is [`rclone`](https://rclone.org/) configured with both
accounts' R2 S3-compatible credentials (Dashboard → R2 → "Manage R2 API
Tokens", **not** the general Cloudflare API token above — R2 uses its own
Access Key ID/Secret pair):

```bash
rclone config   # add two remotes, e.g. "cf-old" and "cf-new", type "Cloudflare R2",
                 # each with its own Access Key ID/Secret and account-specific endpoint
                 # (https://<account-id>.r2.cloudflarestorage.com)

npx wrangler r2 bucket create <site>-media --config wrangler.<slug>.jsonc   # on the new account
rclone sync cf-old:<old-bucket-name> cf-new:<site>-media --progress
```

For just a handful of files, `npx wrangler r2 object get <old-bucket>/<key>
--file=tmp` then `npx wrangler r2 object put <new-bucket>/<key>
--file=tmp` per object works fine without installing anything extra.

### 3. Domain / DNS

You do **not** need to transfer the Cloudflare zone itself to make this
work — a zone in one account can point at a Pages project in a different
account via a plain CNAME, and Cloudflare's automatic CNAME flattening
makes this work even at the bare apex (`polokwanehub.com`, not just
`www`):

1. In the **new** account's Pages project (Custom domains → Add), enter
   the real domain. Cloudflare will show you the exact target hostname to
   point at (`<project>.pages.dev`) and mark the domain "pending" until it
   sees a matching DNS record.
2. Wherever the domain's DNS is actually managed today (the old Cloudflare
   account's zone, or elsewhere), add/update the record: CNAME `@` (or
   `www`) → `<project>.pages.dev`. If that zone is on the old Cloudflare
   account, add it there directly; Cloudflare's UI will flatten the apex
   record automatically.
3. Wait for DNS to propagate (usually fast on Cloudflare, occasionally up
   to a few hours elsewhere) — the new Pages project's custom domain
   should flip from "pending" to "active" once it sees the record.
4. Only once step 3 shows active and you've spot-checked the live site:
   remove the domain from the *old* Pages project (if it's a Cloudflare
   Pages project too) so the two don't both claim it.

Moving the DNS *zone itself* between accounts (so it's not just pointing
cross-account, but actually managed under the new one) is a separate,
purely organizational step you can do later if you want everything under
one account for tidiness — dashboard → the zone → look for an account
transfer/move option (exact wording varies by Cloudflare dashboard
version). It's not required for the site to work.
