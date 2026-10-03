# Hub Admin

One dashboard for every city site, at **https://hub-admin-b4x.pages.dev** (`hub-admin.pages.dev` was already taken on Cloudflare, so it got a suffix). It installs as an app (PWA) on phones and desktops.

| Screen | What it shows |
|---|---|
| **Overview** | Today's briefing (written each morning by a Claude routine), each site's status, listings, paid plans, revenue this month and users, plus one combined **Needs attention** list. |
| **Inbox** | Every waiting item on every site (new listings, claims, reports, messages, reviews, events, event claims) with its full details: the submitted listing, the review text, the message, the reason for a report. Each opens the right screen in that site's admin to approve, reject or reply. |
| **Stats** | Listing views, contact taps, enquiries, searches, sign-ups and installs against the previous period; daily charts per site; top categories, searches and listings; revenue by month; weekly Search Console figures. |
| **Health** | Uptime per site (checked every 5 minutes, with outages), the latest run of every GitHub workflow (with the failing step and error), Cloudflare D1 usage against the free daily limit, routine health, security checks and the weekly broken-links report. |
| **Listings** | Data quality per city: a completeness score, what's missing (phone, hours, description, map location, address, category), likely duplicates, stale and unseen listings, enquiries that never reached the business, unclaimed businesses getting enquiries, owners who never confirmed, and thin category-in-suburb pages. |
| **Google** | Daily clicks and impressions, the indexing trend (pages seen in Google per day), Google's verdict for each page (the "not in Google" list), searches where the site is just off page one, and on-site searches with only one or two results. |
| **Money** | Income per month, monthly recurring income, paying customers, failed payments, overdue renewals, plans ending soon, new and cancelled plans, the free listings most worth offering a paid plan, and AdSense earnings. |
| **Activity log** | Every city's own log (approvals, claims, payments, renewals, settings) plus what admins did in Hub Admin, and the Monday weekly summary. |
| **Upgrades** | Improvements to build on the sites: Idea → Planned → In progress → Done, per site and priority. **Copy for Claude** copies a ready-to-paste task for a Claude Code session; **Link code** attaches the pull request or commit that built it. |
| **Social** | Facebook / Instagram setup checklist per city (shared by all admins), the page links, and ready-to-post captions from new listings, upcoming events and news. |
| **Manage** | Shortcuts to every admin screen of every site. |
| **Settings** | Fingerprint/face sign-in, password, weekly summary email, admins, and push notifications per device (choose which kinds: each queue, morning briefing, weekly summary, site down, failed deploy, database near its limit, late routine). |

On phones the tab bar shows Overview, Inbox, Stats and Health; everything else is under **More**.

## How it's built

- `public/`: the app (plain HTML, CSS and JavaScript modules, no build step), its manifest, service worker and icons.
- `functions/`: the API (Cloudflare Pages Functions). `api/overview.ts` and `api/stats.ts` read each city's D1 database directly through the bindings in `wrangler.jsonc`.
- `functions/_middleware.ts`: the lock. The app's files load for anyone (they hold no data and include the sign-in screen); every `/api/` request needs a signed-in session, apart from the sign-in endpoints and the notifier trigger (which checks its own key). Anything that changes data must also carry the app's own `X-Hub-Admin` header, so another website can't use a signed-in browser to make changes.
- `migrations/`: Hub Admin's own D1 database (`hub-admin-db`): accounts, sessions, passkeys, upgrades, push subscriptions, notifications and the push key pair (generated on first use, never committed). The deploy workflow creates the database on its first run and fills its id into `wrangler.jsonc` (`__HUB_ADMIN_DB_ID__`).
- The 5-minute run: `.github/workflows/admin-notify.yml` runs `scripts/admin-notify.mjs` every 5 minutes, which calls `/api/notify/run` with a random key kept only in the admin database (read through the Cloudflare API, never printed). It sends along the latest GitHub workflow runs and Cloudflare D1 usage (GraphQL analytics; the API token needs **Account Analytics: Read**, otherwise the Health screen says so). Hub Admin then finds new items in every city's queues, checks every site is up and its database answers, stores the runs and usage, checks routine health, and on Monday morning builds the weekly summary. Each problem alerts once when it starts and once when it clears.
- Weekly: `.github/workflows/admin-weekly.yml` (Sunday night) runs `scripts/admin-links.mjs`: every sitemap page and internal link on each site, and every business's own website, sent to `/api/notify/report?kind=links`.
- Daily: `.github/workflows/admin-google.yml` runs `scripts/search-console-daily.mjs`: Search Console per day, pages seen in Google, search gaps, URL Inspection for ~120 pages per site (rotating) and AdSense earnings, kept in the admin database (`/api/notify/report?kind=google`), nothing committed. Pushes carry no content: the device fetches what each one is about from the app, behind the login. The first check only records a starting point, so nothing old is announced. GitHub can start scheduled runs a few minutes late.
- Deployed by `.github/workflows/deploy-admin.yml` on every push to `main` that touches `admin-app/` (or by running it by hand).
- Icon: `assets/logo-src/hub-admin.svg`, rendered by `node scripts/render-admin-icons.mjs`. Banner (Overview header and sign-in background): the three cities' own hero photos, joined by `node scripts/render-admin-banner.mjs` into `public/banner-wide.jpg` and `public/banner-mobile.jpg`.

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

### Adding another admin (e.g. Guy)

Settings → **Admins** → type their username → **Create invite link**, then send them the link privately (WhatsApp, SMS, email). It works once and expires in 48 hours. They open it, choose their own password, and can then set up their own fingerprint. Every admin has full access. Remove an admin from the same list; that signs them out everywhere. You can't remove yourself or the last admin.

### Forgot your password

On the sign-in screen, **Forgot your password?** → the setup code, your username and a new password. That also signs the account out everywhere.

### Weekly summary email (optional)

The Monday summary always arrives as a notification and on the Activity log screen. To also email it: add a Resend API key (the same Resend account the sites use) as the GitHub secret **`HUB_ADMIN_RESEND_KEY`**, run Deploy Hub Admin, then in Settings → **Weekly summary email** enter your address and tick the box. It's sent from the first city's `hello@` address, which is already verified in Resend.

## Adding a city

1. Add its D1 binding as `DB_<SLUG>` to `wrangler.jsonc` (name and id from that city's `wrangler.<slug>.jsonc`).
2. Import its `sites/<slug>.json` in `functions/_lib/sites.ts` and add it to `REGISTRY`.

## Notifications on iPhone and iPad

Apple only delivers web notifications to apps added to the Home Screen: open the app in Safari, tap Share → **Add to Home Screen**, open it from there, then go to **Settings** → **Turn on notifications**. Android, Windows and Mac work straight from the browser or the installed app.

## Animations

`public/motion.js` (GSAP 3.15.0 and ScrollTrigger, in `public/vendor/`, copied from the `gsap` npm package: free for commercial use under GreenSock's Standard license, https://gsap.com/standard-license). They're served from the app itself because its Content-Security-Policy only allows its own scripts. Everything is skipped for people with "reduce motion" turned on.

## Morning briefing (Claude routine)

The Overview opens with **Today's briefing**: a headline, what needs you today, a line per site and anything worth knowing. It's written every morning by a **Claude routine** (a scheduled Claude session on the owner's account, like the research routines), so there's no API key and no per-request cost.

1. At about 05:52 South African time the routine fetches the morning's facts: `GET /api/briefing/facts`.
2. It writes the briefing as JSON and posts it: `POST /api/briefing/submit`. The app checks the shape (one line per site, in order; every "needs you" item names a site or `all`), stores it with the facts it was written from (`daily_briefings`), and on the first delivery of the day notifies devices with **Morning briefing** alerts on. A rejected briefing returns the reason, so the routine fixes it and sends it again.
3. Until the day's briefing arrives, the card shows a plain summary computed from the live numbers.

Both endpoints need the routine's key in an `X-Briefing-Key` header (10 attempts an hour per connection). Only its SHA-256 hash is in the repo (`BRIEFING_KEY_HASH` in `wrangler.jsonc`); the key itself is only in the routine's prompt. To change the key: generate a new one, put its hash in `wrangler.jsonc`, deploy, and update the routine's prompt.

Facts sent to the routine: per-site counts (views, contact taps, searches, enquiries, sign-ups, installs: last 24 hours vs the previous 24 and the 7-day average), items waiting and how long, business names that are new or most viewed, top searches, revenue, renewals, the weekly Search Console totals and open upgrades. No visitor names, emails, phone numbers or message text (`functions/_lib/briefing.ts`).
