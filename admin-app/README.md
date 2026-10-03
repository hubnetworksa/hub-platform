# Hub Admin

One dashboard for every city site, at **https://hub-admin-b4x.pages.dev** (`hub-admin.pages.dev` was already taken on Cloudflare, so it got a suffix). It installs as an app (PWA) on phones and desktops.

| Screen | What it shows |
|---|---|
| **Overview** | Each site's status (online/down), listings, paid plans, revenue this month and users, plus one combined **Needs attention** list (new listings, claims, reports, messages, reviews, events, event claims) from every site. Each item opens in that site's own admin. |
| **Stats** | Listing views, contact taps (phone/WhatsApp/website), enquiries, search appearances, new users and app installs, each against the previous period; daily charts per site; how people make contact; most-viewed categories; what people search for; top listings; revenue by month; Google Search figures from the weekly Search Console report. Filter by last 7/30/90 days and by site. Every chart has a table view. |
| **Upgrades** | The list of improvements to build on the sites: type one in, choose which sites it's for, set a priority, and move it from Idea → Planned → In progress → Done. Search and filter by site. |
| **Manage** | Shortcuts to every admin screen of every site. |
| **Alerts** | Push notifications: turn them on per device, choose which kinds of item to be alerted about, send a test, see every device with alerts on, and the last 40 alerts. |

## How it's built

- `public/`: the app (plain HTML, CSS and JavaScript modules, no build step), its manifest, service worker and icons.
- `functions/`: the API (Cloudflare Pages Functions). `api/overview.ts` and `api/stats.ts` read each city's D1 database directly through the bindings in `wrangler.jsonc`.
- `functions/_middleware.ts`: the lock. Every request, including the page itself, is refused unless it carries a valid Cloudflare Access login for an email on `ADMIN_EMAILS`.
- `migrations/`: Hub Admin's own D1 database (`hub-admin-db`): upgrades, push subscriptions, notifications, and the push key pair (generated on first use, never committed). The deploy workflow creates the database on its first run and fills its id into the configs (`__HUB_ADMIN_DB_ID__`).
- `notifier/`: a Worker with no public URL that runs every 5 minutes, finds new items in every city's queues, and sends push notifications. Pushes carry no content: the device fetches what each one is about from the app, behind the same login. The first run only records a starting point, so nothing old is announced.
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
   - Domains: add `hub-admin-b4x.pages.dev` **and** `*.hub-admin-b4x.pages.dev` (the second covers preview copies)
   - Policy: name `Admins`, action **Allow**, include **Emails** → `hubnetworksa@gmail.com`
4. Save, then open the application's **Overview** and copy its **Application Audience (AUD) Tag**.
5. Put the values in `admin-app/wrangler.jsonc` under `vars` (neither is a secret):
   - `ACCESS_TEAM_DOMAIN`: `<your-team-name>.cloudflareaccess.com`
   - `ACCESS_AUD`: the AUD tag from step 4
   and push to `main`, which redeploys the app.

## Adding a city

1. Add its D1 binding as `DB_<SLUG>` to both `wrangler.jsonc` and `notifier/wrangler.jsonc` (name and id from that city's `wrangler.<slug>.jsonc`).
2. Import its `sites/<slug>.json` in `functions/_lib/sites.ts` and add it to `REGISTRY`.

## Adding a person

Add their email to the Access policy (step 3) **and** to `ADMIN_EMAILS` in `wrangler.jsonc`. Removing them from either locks them out.

## Notifications on iPhone and iPad

Apple only delivers web notifications to apps added to the Home Screen: open the app in Safari, tap Share → **Add to Home Screen**, open it from there, then go to **Alerts** → **Turn on notifications**. Android, Windows and Mac work straight from the browser or the installed app.
