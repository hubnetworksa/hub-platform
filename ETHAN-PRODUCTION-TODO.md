# Ethan branch: production-readiness todo list

Scope: only the `Ethan` dev branch (TheCapeTownHub, PretoriaHub, PolokwaneHub). Nothing here is about what has changed on `main`.
Status as of 25 September 2026. **[Me]** = I can do it. **[You]** = needs your accounts, a decision, or a real-world action.

## 1. Done (already on the branch)

### Production-readiness pass, 25 September 2026

- [x] **Monthly renewals now work.** PayFast's second and later monthly charges used to be ignored, so the expiry sweep would have downgraded every paying customer after their first month. Renewals now extend the paid period and are invoiced. A plan bought at signup renews correctly too.
- [x] **Upgrading stops the old plan's billing** once the new plan is paid. Before, PayFast kept charging for both.
- [x] **Rejected or disputed paid listings** cancel the PayFast billing automatically and email the site inbox a refund to-do. The reminder sweep no longer deletes paid listings.
- [x] **Late renewals get a 3-day grace period** before anything is downgraded, and a charge that lands after a lapse brings the plan back.
- [x] **Invoices are private.** They were downloadable by anyone who guessed an invoice number.
- [x] **Password reset** (`/forgot-password/`), linked from the log-in page. Links work once, for 60 minutes, and sign the account out everywhere else.
- [x] Security: open redirect after log-in closed, log-in and sign-up rate limited, sessions renewed at log-in, photo uploads checked by file content (no SVG), security headers on every page, owner text can no longer break out of structured data.
- [x] Events: homepage "Featured events" strip, past events drop off listings, Google event markup, admin sees which submissions were paid for, and un-featuring a paid event needs confirmation.
- [x] SEO: business page titles now read "Name – Category in Suburb", every page has share tags, and Cape Town's banners went from about 4MB to 280KB.
- [x] The deploy workflow type-checks before it touches the databases.
- [x] Item 2.3 is done: the "[monitor copy]" emails to a personal inbox are removed.
- [x] **Premium and sponsorships are self-serve and automatic.** Every sponsorship type can be bought at `/my-businesses/sponsor/` straight to PayFast (before, all but tourism needed an admin). Paid placements go live through `rebuild-flush.yml` within about 15 minutes, and the expiry sweep runs every 6 hours. Sponsors now show above the listings they sponsor, paid businesses list first, and photo limits match the pricing page.

- [x] All three cities build cleanly; about 935,000 links, images, scripts and anchors checked, no broken internal links.
- [x] Backend code type-checks with zero errors (`npm run typecheck:functions`).
- [x] Demo admin login (`admin@admin.com`) now only works on the dev preview; a production deploy ignores it.
- [x] Broken business website links fixed (websites saved without `https://`); 404 page canonical removed.
- [x] Demo premium data (fake Featured/Verified/sponsors) only exists in the preview workflow, never in a production build.
- [x] Installable Android app (manifest, service worker, icons), verified on all three preview URLs.
- [x] Full change list written (`CHANGES-ETHAN-BRANCH.md` and `.docx`).
- [x] **All email is sent by the website itself.** Contact, listing enquiries, report, data removal, add-event and add-business now post to the site's own endpoints, which save the message and email it from the server. No `mailto:` link exists anywhere on the sites, and the admin Enquiries tab shows the stored messages.
- [x] All three production databases backed up (saved outside the repo in `Hub/db-backups/2026-09-20/`) and fully migrated: event submissions, news and fuel prices, and messages. September fuel prices are loaded for all three cities.
- [x] **Trading hours and shopping centre are now saved.** The "Add your business" form stores them, and approving the listing copies them onto the published business (checked end to end on the live preview with a test listing, since deleted).
- [x] **Every public form is rate limited** per visitor per hour (add listing, add event, claim, report, removal, contact, enquiry), on top of the honeypot and minimum time on form.
- [x] A stray `/tourism/` page was hidden while those cities had no tourism content; the new Things to do page below replaces that.
- [x] The backend type-check now runs in the preview build and stops a broken change from deploying.
- [x] `npm run check:links` (crawls a build for broken links) and `npm run check:smoke` (opens 40 pages at desktop and phone width) are saved in the repo; both pass.
- [x] The four Cape Town businesses that had no category are categorised (four missing categories were added to Cape Town to fit them).
- [x] **Suburb map coordinates:** Cape Town went from 0 to 162 of 168 suburbs, Pretoria from 178 to 180 of 218, Polokwane from 30 to 31 of 38. The map page now draws them.
- [x] First news stories published for all three cities (Cape Town 4, Pretoria 2, Polokwane 2), each checked against two sources.

- [x] **"Things to do" (tourism) page now follows the mockup on all three cities:** header link, hero, category chips, attraction cards, itineraries, "When to come", operator sidebar. It was previously Polokwane-only in the old design. The mockup's own attraction prices and times are shown as written and must be confirmed with each operator before launch (see section 7). Polokwane keeps its seven full attraction pages, linked from the cards.
- [x] **Claim verification now goes to the business's own email.** When someone claims a business that has an email on file, the verification link is sent to that business address (never the claimant's), and the claimant gets an email saying the claim only completes once someone confirms it from that inbox. Confirming approves the claim automatically; "this isn't us" rejects it; links last 14 days. If the business has no email on file the claim falls back to manual review by an admin. Only 43 of 645 Cape Town, 172 of 9,660 Pretoria and 167 of 1,055 Polokwane businesses have an email on file, so most claims will still be manual until emails are added (see section 4).
- [x] **Featured plan: social page links.** Featured businesses can add Instagram, Facebook, LinkedIn and YouTube page links from My businesses > Edit listing (each checked to be a real link to that network, saved only while the plan is active). They show as buttons on the public business page while the business is Featured, and are kept but hidden if it downgrades. Listed in the Featured perks on the pricing page and plan picker. New columns on businesses (migration Cape Town 0042, Pretoria 0041, Polokwane 0044, applied to all three).

- [x] The interactive map, the rewritten routines and everything since are pushed to `Ethan` and live on the preview.
- [x] **Automatic invoicing.** Every completed payment (tier upgrade or sponsorship) generates a numbered, branded PDF invoice (site logo, letterhead, PAID stamp, total), stores it in R2, and emails it to the business owner with a copy to the site's own inbox. Owners can redownload it from My businesses > Billing; admins from the Invoices tab. Verified against real data: a test payment produced a correct PDF end to end (content, numbering, idempotent re-runs). New `invoice_number`/`invoice_pdf_key`/`invoiced_at` columns on `payments` (migration Cape Town 0043, Pretoria 0042, Polokwane 0045, applied to all three). Still open: a company registration number/VAT number/registered address (all optional, shown automatically once set) and an actual live-email test, both blocked on you (see section 5).

## 2. Code work still to do on the branch

| # | Task | Owner | Why it matters |
|---|---|---|---|
| 2.1 | **One piece left: completing a real payment on PayFast's sandbox checkout page**, which is the only way to trigger a genuine ITN callback — confirmed a synthetic one can't be faked (PayFast's own validate endpoint checks it against a real transaction, not just the signature). This is a 2-minute step on PayFast's own hosted checkout UI (login, then a test card) and needs a browser, which I don't have in this session. Everything else in this row is now verified live against the real sandbox and real data (see done list): checkout (tier + sponsorship), the exclusivity guard, expiry (downgrade + slot freed + re-purchasable), cancel (found and fixed two real signing bugs, verified the failure path end-to-end), and the rejected-paid-listing refund note. | You (the checkout step) + Me (everything else, done) | Walk me through it or I can talk you through it — 2 minutes on PayFast's sandbox page |
| 2.2 | Exercise the last endpoints against the real database: claim (needs Resend on Preview and a business that has an email) and guide-sponsorship checkout. (Verified live: contact, enquiry, add-business with approval, submit-event with approve and delete, all nine admin endpoints, and a tier-upgrade PayFast checkout accepted by the sandbox.) | Me | Claim needs a signed-in owner with a document upload |
| 2.3 | ~~Remove the temporary "[monitor copy]" emails~~ Done 25 September. | Me | |
| 2.4 | Add real content where the mockup is empty and you decide to keep it: reviews, views/clicks data, an owner's own enquiries | Me (after your decision) | Otherwise these stay honest "No data yet" tiles |

## 3. Database work (the branch's own migrations)

- [x] Backups of all three databases taken on 20 September 2026 (`Hub/db-backups/2026-09-20/`, private; they contain user emails). Take a fresh set again on launch day.
- [x] Every migration is applied to all three production databases: event submissions, news and fuel, messages, submission hours and centre, and rate limits.
- [x] News is loaded for all three cities (Cape Town 4 stories, Pretoria 2, Polokwane 2) and fuel prices for all three.
- [ ] **[You]** Delete the demo user row (`admin@admin.com`) from all three databases before launch.

## 4. Data quality

- [x] The four dead business websites (`amarecapetown.com` and `leeschinesekitchen.co.za` do not exist; `arcww.co.za` serves a 404 and `apnisleep.co.za` a 500) were cleared from the Cape Town database on 20 September, so those listings no longer show a broken Website button.
- [x] **Interactive suburb map, completely free to run** (`/suburb/map/`): real suburb outlines you can hover and click, a suburb search box, "Near me", shading by region, by number of businesses or by any single category (with a legend), a side card for the selected suburb with its top categories linking to the category pages, region filters, a Detailed map style and a Tilt (3D) view, fullscreen, shareable links to a suburb, and a phone layout. It uses MapLibre and the OpenFreeMap basemap (no key, no usage limits, no cost) with outlines from the City of Cape Town and City of Tshwane open map services and OpenStreetMap. Official outlines: Cape Town 147 of 168 suburbs, Pretoria 164 of 218, Polokwane 4 of 38; the rest are drawn as clearly marked approximate areas. No per-business pins by design.
- [ ] **[Me]** Find official outlines for Polokwane (34 suburbs are approximate areas today) and the remaining Cape Town (21) and Pretoria (54) suburbs, mostly gated estates and small areas. Re-run `node scripts/fetch-official-boundaries.mjs <city>` when the municipalities update their data (the yearly boundary refresh routine in section 7).

- [ ] **[Me]** Add business email addresses at scale (only 2 to 7% of listings have one), so claim verification can go to the business inbox instead of a manual review. Decided: the description, hours and email enrichment routine (job 4) also collects the company's published contact email, only when empty and only from the business's own site or official listing (see `ROUTINES-PLAN.md`).

## 5. Payments, secrets and accounts

- [ ] **[You] Urgent: rotate `CRON_SECRET` in Production on all three Pages projects**, and update the GitHub Actions secret of the same name. The old value was committed to this public repo in the preview config and must be treated as known to anyone. It was removed from the repo on 24 September.
- [ ] **[You]** The scheduled jobs (`rebuild-flush.yml`, `subscription-expiry.yml`, `owner-reminders.yml`) only run from `main`, so automatic go-live and expiry start when the branch is merged. They need the rotated `CRON_SECRET` in GitHub Actions secrets and in each Pages project's Production secrets.
- [ ] **[You]** To have preview purchases rebuild the preview automatically, add `GITHUB_DISPATCH_TOKEN` as a Preview-environment secret on all three Pages projects. Without it the preview only rebuilds on a push.
- [ ] **[You]** Decide whether a new listing that pays for a plan at signup should skip admin approval. Today it waits for approval and owner confirmation, like every new listing. Upgrades and sponsorships for existing listings need no admin at all.
- [ ] **[You]** The pricing page says Basic has no website link and no enquiry form, but every listing shows both today. Either gate them to paid plans or change the pricing copy.
- [ ] **[You]** Refunds stay manual: PayFast only allows them from the merchant dashboard. When a paid listing or event is rejected, the site inbox gets an email naming the exact payment to refund.

- [ ] **[You]** Cloudflare D1 **free plan daily read limit** was reached on 20 September (Cloudflare error 7500) after many test builds: every build reads all three databases (Pretoria alone has about 9,660 businesses). It resets at midnight UTC (02:00 South African time). Live sites kept working. **Decision (21 September): staying on the free plan for now**, so cutting build reads (next item) is a must-do, not optional.
- [ ] **[Me] Must do (staying on the free plan):** cut the reads a build needs: reuse the saved database snapshot when nothing changed, and only pull the tables a build uses, so routine and preview deploys stay well inside the free limit.
- [x] Checked on 20 September 2026: the **Production** environment of all three Pages projects already has `RESEND_API_KEY`, `CRON_SECRET`, `GITHUB_DISPATCH_TOKEN` (the rebuild hook), Google sign-in keys and the four PayFast values. Only their names can be seen, not the values.
- [ ] **[You]** Switch PayFast to **live** credentials: check that the merchant ID, key, passphrase and host stored in Production on all three projects are the live ones, not the sandbox ones.
- [ ] **[You]** The **Preview** environment still has no `RESEND_API_KEY`, so the dev preview cannot send email or Google sign-in (a test message on the Cape Town preview was saved but not emailed). PayFast is no longer part of this: Preview now has its own sandbox credentials (see below), separate from Production. To test email on preview, add `RESEND_API_KEY` to the Preview environment of each project. Production is unaffected.
- [ ] **[You]** Confirm each site's domain is verified in Resend (the key exists in Production; the sender is `hello@<domain>`). All email now goes through the website, so if a domain is not verified messages are still saved and visible in the admin Enquiries tab, but not emailed.
- [ ] **[You]** Turn on Cloudflare Turnstile or a rate-limit rule as a second layer in front of the public forms.
- [ ] **[You]** Real AdSense units in place of the "Advertisement" placeholder boxes; Google Analytics IDs confirmed.
- [x] **PayFast checkout works on the Ethan preview**, with no dashboard access needed: `wrangler.<city>.jsonc`'s `env.preview` block carries PayFast's own publicly documented sandbox test pair (merchant 10004002 — safe to commit, sandbox-only, no real money) for all three cities. Production is untouched: it keeps its own encrypted PayFast secrets, never read from this file.
- [x] **Found and fixed a real signing bug in `functions/_lib/payfast.ts`**, not just a config problem: a plain tier upgrade always sends `custom_str3: ''` (no sponsorship target); the signature calculation correctly skipped that empty field, but the actual request sent it anyway, so PayFast recomputed a different signature and rejected every tier-upgrade checkout with "Generated signature does not match submitted signature" — this would have hit production too, sandbox or live. New `buildCheckoutParams()` builds the outgoing request from the exact same rule the signature uses, so they can't drift apart again. Confirmed fixed directly against the PayFast sandbox (a real checkout now gets redirected to a real payment page).
- [x] **Found and fixed two more real bugs, this time in Cancel.** (1) The Subscriptions REST API (used only for Cancel) signs requests differently from checkout — the passphrase has to be sorted in alphabetically with the other fields, not appended last — getting this wrong doesn't error clearly, it just returns PayFast's generic "Merchant authorization failed", so it read like a credentials problem. (2) PayFast returns HTTP 200 with a body saying `"status":"failed"` for at least one real failure (an unrecognised token) — trusting the HTTP status alone would have told an owner "cancelled" while PayFast quietly did nothing and kept charging them, exactly the failure the function's own comment says it exists to prevent. Both fixed and confirmed directly against the sandbox and through our own live endpoint (the failure path correctly returns an error and leaves the database untouched).
- [x] **Expiry sweep verified live and end to end:** a tier past its paid period downgrades to Free, a sponsorship slot past its period frees up, and the freed slot is immediately re-purchasable — all confirmed against the real database and the real checkout endpoint.
- [x] **Sponsorship checkout and its exclusivity guard verified live:** a suburb-sponsor checkout is accepted by the PayFast sandbox the same as a tier upgrade, and a second attempt on an already-active slot is correctly refused (409) before it ever reaches PayFast.
- [x] **The rejected-paid-listing refund note verified live:** rejecting a submission that was already paid writes the exact admin activity-log line flagging it for a manual PayFast refund.

## 6. Content and business decisions

- [ ] **[You]** Set real prices in admin Plans & pricing: Verified, Featured, the four sponsor spots, guide sponsorship, Featured event. Then remove the "Prices shown are placeholders" line.
- [ ] **[You]** Have a lawyer review Privacy & POPIA and Terms (Information Officer wording, 30-day POPIA response, retention periods, liability clause, refund wording).
- [ ] **[You]** Decide the refund promise shown at checkout: "If we can't publish it, we refund your payment".
- [ ] **[You]** Provide real logos and favicons (Cape Town borrows Pretoria's); I then regenerate the app icons.
- [ ] **[You]** Set up real mailboxes (listings@, ads@, privacy@) or confirm the single contact address is fine.
- [ ] **[You]** Write the five missing buyer's guides, or agree to launch with one.

## 7. Scheduled routines: rewrite, then add the missing ones

The full plan is in `ROUTINES-PLAN.md` (inventory, what is inefficient, target set of routines, rollout order and decisions needed).

Today there are nine runbooks totalling about 3,800 lines. The three business runbooks (700 to 920 lines each) are near-copies with only the city changed, and every run re-reads a lot before it does anything. The aim is routines that do only the work that is needed and nothing else.

**Rewrite the existing routines (all [Me])**
- [x] **Business routine split and rewritten (dev branch, not scheduled):** the five jobs are now four routines (`routines/business-discovery.md`, `shopping-centres.md`, `enrichment.md`, `closed-check.md`) sharing `routines/_shared.md` and per-city settings in `routines/cities/<city>.json`, instead of three near-identical runbooks of about 2,500 lines. Enrichment also collects company emails.
- [x] **Stop repeating work:** each routine has its own small state file and a Step 0 script (`scripts/routines/next.mjs`) that says whether anything is due (the agent stops without searching when not) and hands over a small work packet instead of the whole snapshot.
- [x] **Mechanical work moved into scripts:** `scripts/routines/validate.mjs` checks every SQL file (allow-list of statements, slugs, mandatory phone and address, two independent sources, duplicate phone numbers across the whole city, one-time guards, append-only sources, record cap) and `done.mjs` records progress. Still to do: link and website checks, and an events validator.
- [x] **Fuel prices split from news:** one monthly routine for all three cities (`routines/fuel.md`), guarded by `scripts/fuel-due.mjs` so it only runs on the first Wednesday of the month and the two days after. Prices are split by region (Cape Town coastal; Pretoria and Polokwane inland), researched once for both. The news runbooks no longer touch fuel.
- [x] **News routine:** one shared runbook (`routines/news.md`), news only, with a work packet of recent articles and the city's sources.
- [x] **Events routine:** one shared runbook (`routines/events.md`) with a work packet of known events. Still to do: skip unchanged sources, and a validator.
- [x] **Every event now gets a real, non-copyrighted image.** New `scripts/generate-event-images.mjs`: for any event with no photo, generates a free, themed, flat-illustration image matching its type (Market, Music, Sport, Theatre, Food & Drink, Family) via Cloudflare Workers AI — no external API key, well inside the account's free daily allowance at this volume. Stores it in the site's own R2 bucket and links it on the event. Run live against PretoriaHub on 21 September: all 20 events that had no image got one, confirmed rendering correctly on the live preview. Never touches an event that already has a real photo. Still to do: a GitHub Action step so this runs automatically right after an events deploy, and the same run for Cape Town and Polokwane's events.
- [ ] Give every routine a hard time/step budget and a visible failure: `scripts/routines/health.mjs` reports the last run and lateness per routine (done); still to do: show it on the admin overview and alert by email.

**Routines to add (all [Me] to build, [You] to switch on)**
- [ ] **Business emails and websites:** visit each business's own site, keep the website status honest (dead links cleared), and pick up a public contact email for claim verification. Weekly, script first, agent only for the unclear ones.
- [ ] **Tourism refresh (monthly, three cities):** re-check attraction prices, opening hours and closures shown on the Things to do page, and add new attractions.
- [ ] **Database backup:** scheduled export of all three databases to storage (weekly, kept for a set number of weeks), so launch-day backups are not a manual job.
- [ ] **Data health report (weekly):** counts of businesses with no category, coordinates, email, hours or website; shown on the admin overview.
- [ ] **Suburb boundaries:** yearly refresh of the suburb outlines for the map (`scripts/fetch-official-boundaries.mjs`).
- [ ] **Guides:** a routine (or scheduled task) to draft and refresh the five missing buyer's guides for review.
- [ ] **Expired events and stale news:** tidy items that have passed so the pages never show old content.
- [ ] Already running (keep, review the schedule): owner reminders and subscription expiry (GitHub Actions).

**Set up and small fixes**
- [ ] **[You]** Create the scheduled cloud agents for each city once the rewritten runbooks are ready.
- [ ] **[Me]** Raise the news check's 20-second fetch timeout, which is flaky on the City of Cape Town's own site.
- [ ] **[You/Me]** Confirm the Things to do prices and times (taken from the mockup) with each attraction before launch; the tourism refresh routine keeps them current afterwards.

## 8. Launch-day checklist (run in this order)

1. Back up all three databases.
2. Run `npm run check:links` on a build of each city and `npm run check:smoke` against the final preview build.
3. Apply pending migrations city by city, then load the fuel prices and news.
4. Delete the demo user rows.
5. Confirm the live PayFast secrets and that `domainLive` and DNS are correct for each domain.
6. Release, then test one real signup, one real payment and one event submission on each site.
7. Submit the sitemaps to Search Console and Bing.
