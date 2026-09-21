# Ethan branch: complete list of changes

Status as of 20 September 2026. Covers everything built on the `Ethan` dev branch for TheCapeTownHub, PretoriaHub and PolokwaneHub since it diverged from `main`.

## 1. At a glance

| | |
|---|---|
| Branch | `Ethan` (preview only; production runs from `main`) |
| Commits on the branch | 34 (18 to 20 September 2026) |
| Files touched | 155 (99 new, 56 changed); about 14,400 lines added, 3,600 removed |
| Diverged from `main` at | commit `1c2d59b`. `main` has since gained 1,426 commits, almost all from the hourly research routine bot, so a merge is needed before release |
| Preview sites | Cape Town: `ethan-dzsb.thecapetownhub.pages.dev`; Pretoria: `ethan-orjd.pretoriahub-7sv.pages.dev`; Polokwane: `ethan-kp7p.polokwanehub-49u.pages.dev` |
| Payments | PayFast, still on sandbox (test) credentials |
| Not yet on the live domains | Nothing here is live until this branch is merged to `main` and deployed |

**What the branch delivers, in one paragraph.** A full redesign of all three sites to match the design mockup (public pages and the admin console), plus real working features behind the new screens: paid premium listings and sponsorship spots (PayFast), a multi-step "Add your business" flow, a claim flow, an owner dashboard, events with organiser submissions, buyer's guides, local news and fuel prices, a weather card, and installing the site as an Android app.

---

## 2. Site-wide look and feel (matches the mockup)

- **Shell:** new trust bar, white header with navy bottom border, navy footer, Archivo font (replaced Nunito), and layout breakpoints at 950px and 760px.
- **Header and nav:** Directory, Categories, Events, Shopping centres, Guides, About; Pricing button; "Add your business" button that collapses to a "+" icon on the narrowest phones; hamburger menu on mobile with Guides and "Business log in".
- **Header extras:** live weather chip in the trust bar (desktop widths); "Business log in" goes to the owner area.
- **Footer:** Browse (Suburbs, Categories, Events, Shopping centres, Guides), For owners (Add your business, Plans & pricing, My businesses), Company (About, Partners, Contact, Privacy & POPIA, Terms). An "Install the app" button appears when the browser offers installation.
- **Heroes:** every page except the homepage uses a wide panoramic banner (Cape Town got a new 2172x724 image) with a shorter, aggressively cropped height.
- **Shared building blocks:** plan badges, stat tiles, section headers, sponsorship slot boxes, business cards (with hover states), breadcrumbs with structured data.
- **Global rules:** links no longer underline by default; hidden elements stay hidden even when they have inline display styles.
- **Mobile fixes:** removed sideways scrolling on phones site-wide; the header row wraps instead of overflowing; the admin console became a slide-out menu on phones.

## 3. Homepage

- Hero with search and popular category chips; stat strip with real counts.
- "Featured this month" row (paid Featured listings), owner call-to-action, browse by section, browse by suburb.
- **"<City> today" section:** weather card and fuel price card on the left, local news panel on the right (lead story with headline, then three more), with an "All local news" link.
- **Homepage banner sponsor:** a full-width strip under the hero when that slot is sold.
- Advertisement placeholder box (can be switched off from admin).

## 4. Search

- Results page with filters, a pinned Featured result, and the mockup's copy and buttons.
- **Open now** toggle and Verified-only pill, with "Open now / Closed" badges on results (worked out from each business's trading hours; unclear hours show nothing rather than a guess).
- **No-results screen:** "Nothing matched...", with real "You might have meant" suggestions (typo tolerant), nearby suburbs, or popular categories.
- Search index now includes hours, phone, website and address for the pinned card.

## 5. Directory pages

- **Suburbs index (`/suburb/`):** hero, "Busiest suburbs", "Browse by region" accordion with live search, sponsor call-to-action.
- **Suburb map (`/suburb/map/`):** Leaflet map page with region buttons and a full suburb list. It shows "Map coming soon" for cities whose suburbs have no coordinates (currently all of Cape Town).
- **Suburb pages:** listings are now grouped by category in cards, in the same style as the Categories page, instead of an A to Z list. Also has Featured-in-this-suburb cards, an "Own {suburb}" sponsor box and nearby suburbs.
- **Categories (`/category/`):** section cards with counts, live category search, sponsored-section labels, call-to-action band. Each category page also has a category sponsor box.
- **Shopping centres:** card grid with sponsored badge and tenant names, centre management panel, centre detail page with stat tiles and sponsor panel.
- **Business profile:** Featured/Verified badges, Open-now line, "Owner verified", enquiry helper, photo gallery for Featured listings, claim button, directions, and website link.

## 6. Paid premium listings and sponsorship (real, working backend)

- **Plans:** Basic (free), Verified, Featured. Prices are stored in the database and editable in admin (the seeded prices are placeholders).
- **Restored and extended PayFast backend:** start checkout, payment notification (ITN), cancel, expiry sweep, admin subscription overrides, plus a daily expiry workflow (`subscription-expiry.yml`).
- **Sponsorship products (one advertiser per slot):** category, suburb, shopping centre, homepage banner, and **guide sponsorship** (added 19 September). All share one checkout and exclusivity check.
- **Featured photos:** upload and delete endpoint with plan gating, up to 12 photos.
- **Public pages:** Pricing (three plans plus the exclusive spots grid and Featured event fee) and Advertise (network pitch across the three hubs, trust points, contact).
- **Where paid spots show:** Featured row on home, pinned in search, top of suburb pages, plan badges on cards and profiles, sponsor boxes on category, suburb, centre, guide and homepage pages, star marks on sponsored suburbs, Featured event badges.

## 7. Owner area

- **My businesses (`/my-businesses/`):** business cards with plan chip and renewal date, add/claim buttons, pending submissions and claims lists.
- **Business dashboard (`/my-businesses/edit/`):** header with plan, five tabs (Overview, Edit listing, Enquiries, Reviews, Billing); edit form; photo manager; billing with upgrade/cancel and real payment history. Tiles without real data (views, clicks, enquiries, reviews) show "No data yet" instead of made-up numbers.
- **Claim flow (`/my-businesses/claim/`):** three steps (verify, contact details and hours, review and send), business search, honest verification wording (a person reviews every claim). The verification method and any details go into the claim record.

## 8. "Add your business" flow

- Four screens: Details (`/list-your-business/`), Where customers reach you (`.../contact/`), Check it and send (`.../review/`), and Checkout (`.../checkout/`), with progress bar and sidebars.
- Sign-in required; spam protection (honeypot and minimum time on form) kept.
- Paid plans go to PayFast through the server-provided link; the free path shows a "sent for review" state. Return and cancel links from PayFast handled.
- Our team is emailed by the server as soon as a listing is saved, with a review link. Nothing opens the visitor's email app.
- Trading hours and shopping centre are saved on the pending listing and copied onto the business when it is approved.

## 9. Events

- **Public:** events list (type filter, cards, Featured events, month counts, ads box, "selling tickets" band) and event detail pages.
- **Add an event (`/events/add/`):** organiser form with spam protection; submissions go to a review queue and are **not** published automatically.
- **Admin Events tab:** create, edit, feature and remove events; a "Waiting for review" list with Approve and Reject.
- **Weekly discovery routine:** a scheduled cloud agent (no API key) proposes events, each verified by at least three non-ticket-resale sources, as SQL files. First manual run for Cape Town added two events.

## 10. Buyer's guides

- Guides index and guide pages (`/guides/`), currently one full guide ("How to choose a plumber in {city}") with numbered sections, a table of contents, real plumbers listed for the city (or an honest empty state), and a guide sponsor box.
- Guides are only published where full text exists.

## 11. Local news and fuel prices

- **News (`/news/`, `/news/{slug}/`):** category filter, story pages with sources, "Tell us about a mistake" link, structured data, and the homepage panel.
- **Written in our own words:** every story must be checked against at least two independent sources and never copies source text.
- **Quality gate (`scripts/check-news.mjs`):** fails a file if it has anything other than news/fuel inserts, is older than 10 days, has fewer than two source sites, copies 8+ words from a source, or contains a number not found in a source.
- **Fuel prices:** monthly regulated pump prices (coastal for Cape Town, inland for Pretoria and Polokwane) shown on the homepage with the change per litre. September 2026 prices were loaded from BusinessTech and Time Out.
- **Daily routine runbooks** for each city (`ROUTINE.news.<city>.md`). First manual run for Cape Town published 4 stories and discarded 8 that could not be verified.
- **Admin News tab** to remove a story.

## 12. Weather

- `/api/weather` (cached, MET Norway data with attribution) powers the homepage card and the header chip.

## 13. Contact, legal and error pages

- **Contact:** the mockup layout; the form sends through the website (the message is saved and emailed to us by the server); the contact address is shown as text, not a mail link.
- **Email handling:** every form on the sites (contact, listing enquiry, report, data removal, add event, add business) posts to the website's own endpoints, which save the message and email it server-side. No `mailto:` links exist anywhere.
- **Privacy & POPIA and Terms:** one shared layout with four tabs (Privacy, Terms, Listing rules, Cookies). Existing real clauses (copyright, data removal, data sources, AdSense wording) were merged in so none were lost. The mockup's own placeholder wording needs a lawyer's review before launch.
- **404 page:** "That page has moved or never existed" with three buttons.

## 14. Admin console (rebuilt to the mockup)

- Navy sidebar (slide-out on phones), topbar with "+ New listing", notification badges on nav items.
- **Pages:** Dashboard (tiles, waiting list with Approve/Reject, revenue by product including guide sponsors), Listings (search, plan filters, create/edit modal, plan changes, remove, hide, reassign owner), Approvals, Claims, Reports, Events, News, Enquiries, Sponsored inventory (book/release every slot), Invoices (CSV export and printable receipt), Analytics, Users & roles, Activity, Plans & pricing (edit every price), Ads & sponsors (placements, comp a slot), Site settings (site name, city label, footer tagline overrides).
- The Enquiries tab lists the messages stored from the contact page and each listing's enquiry form (Close, Reopen, Delete). Analytics is still an honest empty state because nothing records views or clicks yet.
- **Site settings** take effect on the next rebuild through `src/lib/site-overrides.ts`; the global "ads on/off" switch hides all ad placeholders.
- A demo admin login (`admin@admin.com`) was added for testing. **It must be removed before launch.**
- Security: all user-supplied text in admin pages is now escaped.

## 15. Installable Android app (PWA)

- Web app manifest per site, named **TheCapeTownHub**, **PretoriaHub** and **PolokwaneHub**, opens full screen, navy status bar, shortcuts to Search, Events and Add your business.
- **Icons:** 512px and "maskable" icons generated from each site's logo (`scripts/generate-pwa-icons.mjs`); the logos themselves are still placeholders.
- **Service worker:** pages load fresh first, visited pages work offline, a branded "You are offline" page for the rest. The API, admin, sign-in, owner and payment/listing pages are never cached.
- Chrome's installability check reports no errors on all three preview URLs.

## 16. Dev preview and tooling

- **Standing preview deployment** (`deploy-ethan-preview.yml`) for all three sites on every push to `Ethan` (note: it uses the same production databases, so it previews the front end only).
- **Demo premium data (preview only):** `DEMO_PREMIUM` (set only in the preview workflow) overlays fake Featured/Verified listings, sponsors in every slot and Featured events at build time so every paid spot can be seen. It never touches the database.
- Scripts added: `check-news.mjs`, `generate-pwa-icons.mjs`, `apply-demo-premium.mjs`.
- `SETUP.md` documents the events and news routines.

## 17. Bug fixes and data-quality fixes

- Public forms are rate limited per visitor per hour; `/tourism/` redirects home on the sites without a tourism section; a backend type-check runs before each preview deploy; `npm run check:links` and `npm run check:smoke` verify a build.

- Business submission duplicate matching now requires the same suburb (also copied to `main` as a hotfix).
- Website links: values saved without `https://` (e.g. `www.builders.co.za`) rendered as broken relative links on some Pretoria pages; now fixed everywhere a website is shown.
- The 404 page no longer claims `/404/` as its canonical address.
- Admin layout collapsing to one column on desktop; page title dropping under the hamburger; hover and filter bugs on injected content; filters that were silently ignored because of inline styles.
- Sideways scroll on phones; overflowing header row.
- Site link check: all three builds crawled (about 935,000 references); no broken internal links remain.

## 18. Database changes

| Migration | Cape Town | Pretoria | Polokwane | What it adds | Status |
|---|---|---|---|---|---|
| Premium listings v2 | 0034 | 0033 | 0036 | site settings prices, sponsorship columns, submission payment columns | Applied on all three |
| Events (this branch's copy) | 0035 | 0034 | 0037 | events table, Featured event price | Applied on all three |
| Event submissions | 0036 | 0035 | 0038 | organiser submissions queue | Applied on all three |
| News and fuel prices | 0037 | 0036 | 0039 | news articles and monthly fuel prices | Applied on all three |
| Messages | 0038 | 0037 | 0040 | contact messages and listing enquiries | Applied on all three |
| Submission hours and centre | 0039 | 0038 | 0041 | trading hours and shopping centre kept on a pending listing | Applied on all three |
| Rate limits | 0040 | 0039 | 0042 | per-visitor request counts for the public forms | Applied on all three |

Checked against the live databases on 20 September 2026. Each database records both `main`'s events migration (Cape Town `0034_events`, Pretoria `0033_events`, Polokwane `0036_events`) and this branch's (`0035`, `0034`, `0037`), so the earlier numbering clash no longer blocks `main`'s deploys, which are succeeding again.

All of the above are applied on all three production databases (20 September 2026, after a backup). When merging, keep both sets of events migration files so the recorded names still match.

## 19. New and changed API endpoints

- **New:** `contact`, `enquiry`, `admin/messages`, `submit-event`, `weather`, `admin/listings`, `admin/payments`, `admin/news`, `admin/events`, `admin/sponsorships`, `admin/subscriptions`, `admin/process-expired-subscriptions`, `subscribe/start`, `subscribe/notify`, `subscribe/cancel`, `business-photos`.
- **Extended:** `submit-business`, `claim-business`, `update-business`, `admin/overview`, `admin/site-settings`, `admin/users`.
- Every `/api/...` call in the site code has a matching endpoint (checked).

## 20. Not built or not complete (be aware)

- No reviews or star ratings, and no page-view or click data (tiles show "No data yet"). A business owner's own dashboard does not yet list the enquiries sent to it.
- No invoice PDFs or "remind" action; no user invite or edit in admin.
- Only one full guide; the other five guides in the mockup have no text.
- Suburb map: 6 Cape Town, 38 Pretoria and 7 Polokwane suburbs still have no coordinates and are not plotted.
- Logos and favicons are placeholders (Cape Town borrows Pretoria's).
- Legal wording is the mockup's placeholder text, unreviewed by a lawyer.
- New backend endpoints have been tested with mocked responses, not against live services, and the `functions/` code has never been type-checked.
- Data issues found: a few business websites are dead (`amarecapetown.com`, `leeschinesekitchen.co.za`, `arcww.co.za`, `apnisleep.co.za`).

## 21. Changes made outside the code (live data and services)

- Live data added on 20 September: suburb map coordinates (Cape Town 162 of 168 suburbs, Pretoria +2, Polokwane +1, from OpenStreetMap), four missing categories added to Cape Town and four businesses categorised, news for Pretoria (2) and Polokwane (2), and every migration above applied to all three databases.
- Live databases: all three received the event submissions, news/fuel and messages migrations (after a backup); 2 real events (Oranjezicht City Farm Market, First Thursdays) added to Cape Town; 4 news stories added to Cape Town and September fuel prices to all three; a demo admin user row added to all three databases; test businesses created during testing were removed.
- `main`: the duplicate-matching fix was copied there as a hotfix. Nothing else from this branch is on `main`.
- Cloudflare Pages: three preview deployments (one per site) on the `ethan` branch alias.

## 22. Full commit list (oldest first)

| Commit | Date | Summary |
|---|---|---|
| 5ea5009 | 18 Sep | Restore Premium Listings backend (PayFast) and generalize for sponsorship slots |
| 1f7a42f | 18 Sep | Redesign site shell and homepage to match the new mockup |
| 8206db5 | 18 Sep | Add plan badges, featured sorting, and sponsorship slots to listing/detail pages |
| a0b0303 | 18 Sep | Add pricing/advertise pages, plan picker at signup, and shopping-centre sponsorship |
| 3dba584 | 18 Sep | Wire real plan management and Featured-tier photo uploads into my-businesses |
| 10056a7 | 18 Sep | Add admin Plans & pricing and Ads & sponsors console pages |
| 0061ce1 | 18 Sep | Add a standing preview deployment for the Ethan branch |
| 2d7c12b | 18 Sep | Rebuild site shell and homepage to literally match the mockup |
| 7f79b29 | 18 Sep | Rebuild suburb, business, centre, pricing, advertise, list-your-business to match mockup exactly |
| d6707ec | 18 Sep | Rebuild the admin console with the mockup's navy sidebar chrome |
| eee8df5 | 18 Sep | Extend the mockup visual language to category/suburb index pages and My Businesses |
| fb76f74 | 18 Sep | Add a demo admin account for testing the admin console |
| 916b2a7 | 18 Sep | Turn the admin sidebar into an off-canvas hamburger menu on mobile |
| 6e2ea6c | 18 Sep | Keep the admin page title next to the hamburger button, not under it |
| e189a09 | 18 Sep | Add Events, ported exactly from the mockup, plus a weekly discovery agent |
| 356fda7 | 18 Sep | Switch the weekly events discovery to a cloud research routine, not an API key |
| 8e714e9 | 18 Sep | Fix the events routine's log filename, run it once by hand for Cape Town |
| 7266a61 | 18 Sep | Cap event poster thumbnails to a fixed height on the listing page |
| 25f1689 | 18 Sep | Fix the admin console layout collapsing to a single column at desktop width |
| 39f620f | 18 Sep | Restore small details the mockup port missed: icons, copy, hover states |
| 1d6ac6b | 18 Sep | Admin console: nav badges, search icon, table headers, plan filter, hover states |
| cbd45ea | 18 Sep | Use a wider panoramic banner for every non-homepage hero |
| 7371590 | 18 Sep | Fix mobile horizontal scroll site-wide + aggressive hero crop on short pages |
| e4f8fef | 18 Sep | Fix business-submission duplicate matching to require the same suburb |
| 33e85d7 | 18 Sep | Let the header row wrap instead of overflowing on the narrowest phones |
| c8e3dcb | 19 Sep | Port the mockup's new Categories and Shopping-centres screens, plus fidelity fixes |
| a09ae6f | 19 Sep | Port the new mockup screens: guides, directory index and map, owner dashboard, claim, 3-step listing flow, add event, contact/legal/404, expanded admin console |
| 481f778 | 19 Sep | Add local news and monthly fuel prices: news pages, homepage today panel, daily news routine with a verification gate |
| bfb52e9 | 19 Sep | Show demo premium listings and sponsor spots in the dev preview only |
| 4f9efc9 | 19 Sep | Show the homepage banner sponsor and category sponsor boxes on the public pages |
| 86881e9 | 19 Sep | Group suburb-page listings by category, and add Guide sponsorship as a real product |
| abb7fb2 | 20 Sep | Make the site installable as an Android app: web manifest, service worker and 512px icons |
| 176a08a | 20 Sep | Use each site's real name as the installed app label |
| 616dc91 | 20 Sep | Fix broken business website links and drop the canonical on the 404 page |

## Added 20 September (later)

- **Things to do (tourism) page rebuilt from the mockup** for all three cities (`src/site-content/tourism.ts`, `src/pages/tourism/index.astro`). "Things to do" now appears in the header, mobile menu and footer. Attraction cards link to Polokwane's full attraction pages where they exist and to a map search otherwise; the Sponsored badge shows only in the dev preview.
- **Claims are verified at the business's own email address.** `functions/api/claim-business.ts` sends the link to the business email on file, tells the claimant to expect it there, and `functions/verify-claim.ts` plus `functions/api/verify-claim.ts` complete or decline the claim. New migration adds `verify_token`, `verify_sent_to` and `email_verified_at` to `business_claims` (Cape Town 0041, Pretoria 0040, Polokwane 0043; applied to all three production databases). Businesses with no email on file still go to manual review.
- **Four dead business websites cleared** in Cape Town.
- **Fuel prices split from the news routine:** new `routines/fuel.md` (one monthly routine for all three cities) and `scripts/fuel-due.mjs` (only due on the first Wednesday and the two days after). Fuel sections removed from the three `ROUTINE.news.<city>.md` runbooks. Prices stay split by region: Cape Town coastal, Pretoria and Polokwane inland.
- **Featured plan can add social page links** (Instagram, Facebook, LinkedIn, YouTube): `functions/_lib/social.ts` validates them, `update-business.ts` saves them only for an active Featured plan, the owner edit page has the fields, the business page shows the buttons. Migration adds four columns to `businesses` (Cape Town 0042, Pretoria 0041, Polokwane 0044).
- **Interactive suburb map rebuilt** (`src/pages/suburb/map.astro`, `src/lib/suburbBoundaries.ts`, `src/pages/suburb-boundaries.json.ts`). MapLibre GL with the free OpenFreeMap basemap; suburb outlines from municipal open data (`scripts/fetch-official-boundaries.mjs`) and OpenStreetMap (`scripts/fetch-suburb-boundaries.mjs`) saved in `src/site-content/<city>/suburb-boundaries.json`. Search, hover, click, near me, shade by region, count or category, detailed and tilted views, region filters and a suburb card.
- **Routines rewritten on the dev branch (not scheduled, not on `main`):** new `routines/` folder with a shared rules file, four split business routines, events, news, fuel and tourism runbooks, and per-city settings; new `scripts/routines/` (`next.mjs`, `validate.mjs`, `done.mjs`, `migrate-state.mjs`, `health.mjs`); per-routine state in `status/<city>/state/`; the snapshot writer also records each business's website and whether it has an email. The old `ROUTINE.<city>.md` runbooks are untouched and remain the live ones.
- **Automatic invoicing.** Every completed PayFast payment now generates a numbered, professionally branded PDF invoice (site logo, letterhead, PAID stamp, itemised total) via `functions/_lib/invoice-pdf.ts` and `functions/_lib/invoicing.ts`, stores it in R2, and emails it to the business owner with a copy to the site's own inbox (`functions/_lib/send-email.ts` now supports attachments). Owners can redownload it from My businesses > Billing (`functions/api/invoice.ts`); admins from the Invoices tab (`functions/api/admin/payments.ts`, `src/pages/admin/invoices.astro`). New `invoice_number`, `invoice_pdf_key` and `invoiced_at` columns on `payments` (migration Cape Town 0043, Pretoria 0042, Polokwane 0045).
- **Fixed a real PayFast signing bug.** A plain tier upgrade always sent `custom_str3: ''` (no sponsorship target); the signature was correctly computed without that empty field, but the actual outgoing request sent it anyway, so PayFast recomputed a different signature and rejected every tier-upgrade checkout — sandbox or live. `functions/_lib/payfast.ts`'s new `buildCheckoutParams()` builds the outgoing request from the exact same field rule the signature uses, so the two can never drift apart again. Confirmed fixed directly against the PayFast sandbox.
- **PayFast checkout now works on the Ethan preview with no dashboard access needed.** Each `wrangler.<city>.jsonc` carries an `env.preview` block with PayFast's own publicly documented sandbox test credentials (merchant 10004002 — safe to commit, sandbox-only, moves no real money). Production keeps its own separate, encrypted PayFast secrets, never read from this file.
