# Hub Admin

One dashboard for every city site, at **https://hub-admin.pages.dev**. It installs as an app (PWA) on phones and desktops.

| Screen | What it shows |
|---|---|
| **Overview** | Each site's status (online/down), listings, paid plans, revenue this month and users, plus one combined **Needs attention** list (new listings, claims, reports, messages, reviews, events, event claims) from every site. Each item opens in that site's own admin. |
| **Stats** | Listing views, contact taps (phone/WhatsApp/website), enquiries, search appearances, new users and app installs, each against the previous period; daily charts per site; how people make contact; most-viewed categories; what people search for; top listings; revenue by month; Google Search figures from the weekly Search Console report. Filter by last 7/30/90 days and by site. Every chart has a table view. |
| **Manage** | Shortcuts to every admin screen of every site. |

## How it's built

- `public/`: the app (plain HTML, CSS and JavaScript modules, no build step), its manifest, service worker and icons.
- `functions/`: the API (Cloudflare Pages Functions). `api/overview.ts` and `api/stats.ts` read each city's D1 database directly through the bindings in `wrangler.jsonc`.
- `functions/_middleware.ts`: the lock. Every request, including the page itself, is refused unless it carries a valid Cloudflare Access login for an email on `ADMIN_EMAILS`.
- Deployed by `.github/workflows/deploy-admin.yml` on every push to `main` that touches `admin-app/` (or by running it by hand).
- Icon: `assets/logo-src/hub-admin.svg`, rendered by `node scripts/render-admin-icons.mjs`.

Chart colours per city are the reference data-viz palette's first three slots (blue, orange, teal), checked for colour-blind separation in light and dark mode. The teal sits just under 3:1 contrast on white, which is why every chart has direct labels and a table view.

## Setting up the login (Cloudflare Access), once

Until these steps are done the app shows "Hub Admin is locked" and serves no data.

1. In the Cloudflare dashboard, open **Zero Trust**. The first time, pick a team name (for example `hubnetworksa`) and the **Free** plan (up to 50 people, no charge).
2. **Settings → Authentication → Login methods**: keep **One-time PIN** (a code is emailed to you). Google login can be added here later.
3. **Access → Applications → Add an application → Self-hosted**:
   - Application name: `Hub Admin`
   - Session duration: `24 hours` (or what you prefer)
   - Domains: add `hub-admin.pages.dev` **and** `*.hub-admin.pages.dev` (the second covers preview copies)
   - Policy: name `Admins`, action **Allow**, include **Emails** → `hubnetworksa@gmail.com`
4. Save, then open the application's **Overview** and copy its **Application Audience (AUD) Tag**.
5. Put the values in `admin-app/wrangler.jsonc` under `vars` (neither is a secret):
   - `ACCESS_TEAM_DOMAIN`: `<your-team-name>.cloudflareaccess.com`
   - `ACCESS_AUD`: the AUD tag from step 4
   and push to `main`, which redeploys the app.

## Adding a city

1. Add its D1 binding to `wrangler.jsonc` as `DB_<SLUG>` (name and id from that city's `wrangler.<slug>.jsonc`).
2. Import its `sites/<slug>.json` in `functions/_lib/sites.ts` and add it to `REGISTRY`.

## Adding a person

Add their email to the Access policy (step 3) **and** to `ADMIN_EMAILS` in `wrangler.jsonc`. Removing them from either locks them out.
