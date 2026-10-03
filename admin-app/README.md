# Hub Admin

One dashboard for every city site, at **https://hub-admin-b4x.pages.dev** (`hub-admin.pages.dev` was already taken on Cloudflare, so it got a suffix). It installs as an app (PWA) on phones and desktops.

| Screen | What it shows |
|---|---|
| **Overview** | Each site's status (online/down), listings, paid plans, revenue this month and users, plus one combined **Needs attention** list (new listings, claims, reports, messages, reviews, events, event claims) from every site. Each item opens in that site's own admin. |
| **Stats** | Listing views, contact taps (phone/WhatsApp/website), enquiries, search appearances, new users and app installs, each against the previous period; daily charts per site; how people make contact; most-viewed categories; what people search for; top listings; revenue by month; Google Search figures from the weekly Search Console report. Filter by last 7/30/90 days and by site. Every chart has a table view. |
| **Upgrades** | The list of improvements to build on the sites: type one in, choose which sites it's for, set a priority, and move it from Idea → Planned → In progress → Done. Search and filter by site. |
| **Manage** | Shortcuts to every admin screen of every site. |
| **Settings** | Fingerprint/face sign-in (passkeys), password, sign out. Push notifications: turn them on per device, choose which kinds of item to be alerted about, send a test, see every device with alerts on, and the last 40 alerts. |

## How it's built

- `public/`: the app (plain HTML, CSS and JavaScript modules, no build step), its manifest, service worker and icons.
- `functions/`: the API (Cloudflare Pages Functions). `api/overview.ts` and `api/stats.ts` read each city's D1 database directly through the bindings in `wrangler.jsonc`.
- `functions/_middleware.ts`: the lock. The app's files load for anyone (they hold no data and include the sign-in screen); every `/api/` request needs a signed-in session, apart from the sign-in endpoints and the notifier trigger (which checks its own key). Anything that changes data must also carry the app's own `X-Hub-Admin` header, so another website can't use a signed-in browser to make changes.
- `migrations/`: Hub Admin's own D1 database (`hub-admin-db`): accounts, sessions, passkeys, upgrades, push subscriptions, notifications and the push key pair (generated on first use, never committed). The deploy workflow creates the database on its first run and fills its id into `wrangler.jsonc` (`__HUB_ADMIN_DB_ID__`).
- Notifications: `.github/workflows/admin-notify.yml` runs `scripts/admin-notify.mjs` every 5 minutes, which calls `/api/notify/run` with a random key kept only in the admin database (read through the Cloudflare API, never printed). The check finds new items in every city's queues and pushes an alert to subscribed devices. Pushes carry no content: the device fetches what each one is about from the app, behind the login. The first check only records a starting point, so nothing old is announced. GitHub can start scheduled runs a few minutes late.
- Deployed by `.github/workflows/deploy-admin.yml` on every push to `main` that touches `admin-app/` (or by running it by hand).
- Icon: `assets/logo-src/hub-admin.svg`, rendered by `node scripts/render-admin-icons.mjs`.

Chart colours per city are the reference data-viz palette's first three slots (blue, orange, teal), checked for colour-blind separation in light and dark mode. The teal sits just under 3:1 contrast on white, which is why every chart has direct labels and a table view.

## Signing in

Username and password, or a passkey (fingerprint, face or device PIN) on each phone or computer you set one up on.

- Passwords: at least 10 characters, stored salted and hashed (PBKDF2-SHA256, 100,000 rounds).
- Sessions: 30 days per device, in a secure cookie the page's scripts can't read. Settings → **Sign out everywhere** ends them all.
- Limits: 10 failed sign-ins per 15 minutes from one connection, and 20 per hour against one username from anywhere.
- Passkeys: Settings → **Fingerprint & face sign-in** → **Set up on this device** (the Overview also offers it after a password sign-in on a phone that supports it). Remove a lost device's passkey there too.

### First-time setup (once)

1. In GitHub: the hub-platform repository → **Settings → Secrets and variables → Actions → New repository secret**. Name: `HUB_ADMIN_SETUP_CODE`. Value: a long phrase only you know (at least 12 characters). Keep a copy somewhere safe: it's also how you reset a forgotten password.
2. Run the **Deploy Hub Admin** workflow (Actions tab → Deploy Hub Admin → Run workflow). It stores the code as an encrypted Cloudflare secret.
3. Open the app, enter the setup code, and choose your username and password. Setup then closes for good: it only works while no account exists.

### Forgot your password

On the sign-in screen, **Forgot your password?** → the setup code, your username and a new password. That also signs the account out everywhere.

## Adding a city

1. Add its D1 binding as `DB_<SLUG>` to `wrangler.jsonc` (name and id from that city's `wrangler.<slug>.jsonc`).
2. Import its `sites/<slug>.json` in `functions/_lib/sites.ts` and add it to `REGISTRY`.

## Notifications on iPhone and iPad

Apple only delivers web notifications to apps added to the Home Screen: open the app in Safari, tap Share → **Add to Home Screen**, open it from there, then go to **Settings** → **Turn on notifications**. Android, Windows and Mac work straight from the browser or the installed app.
