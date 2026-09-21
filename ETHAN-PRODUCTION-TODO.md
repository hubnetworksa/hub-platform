# Ethan branch: production-readiness todo list

Scope: only the `Ethan` dev branch (TheCapeTownHub, PretoriaHub, PolokwaneHub). Nothing here is about what has changed on `main`.
Status as of 21 September 2026. **[Me]** = I can do it. **[You]** = needs your accounts, a decision, or a real-world action.

## 1. Done (already on the branch)

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

- [ ] **[Me] Push the interactive map and the routine documents.** They are committed on the `Ethan` branch but not pushed. Build all three cities first (the Cloudflare D1 read limit that blocked builds resets at 02:00 South African time), then run the link check and the map test on Pretoria and Polokwane, which have not been tested with their real data yet.

## 2. Code work still to do on the branch

| # | Task | Owner | Why it matters |
|---|---|---|---|
| 2.1 | Run the payment flow end to end on the PayFast sandbox: subscribe, payment notification, cancel, expiry, sponsorship purchase, rejected-listing refund note | Me + You | The biggest untested area. Needs PayFast values in the Preview environment (see section 5) |
| 2.2 | Exercise the last endpoints against the real database: claim (including the new business-email verification, which needs Resend on Preview and a business that has an email) and guide-sponsorship checkout. (Verified live on 20 Sept: contact, enquiry, add-business with approval, submit-event with approve and delete, and all nine admin endpoints answering with real data.) | Me | Claim needs a signed-in owner with a document upload; guide sponsorship needs PayFast values in Preview (item 2.1) |
| 2.3 | Remove the temporary "[monitor copy]" emails that send a copy of every owner-confirmation email to a personal Gmail address (in `confirm-listing.ts` and `owner-confirm-listing.ts`, marked TEMP) | Me, once you say so | Owners' details should not be copied to a personal inbox once the site is live |
| 2.4 | Add real content where the mockup is empty and you decide to keep it: reviews, views/clicks data, an owner's own enquiries, invoice PDFs | Me (after your decision) | Otherwise these stay honest "No data yet" tiles |

## 3. Database work (the branch's own migrations)

- [x] Backups of all three databases taken on 20 September 2026 (`Hub/db-backups/2026-09-20/`, private; they contain user emails). Take a fresh set again on launch day.
- [x] Every migration is applied to all three production databases: event submissions, news and fuel, messages, submission hours and centre, and rate limits.
- [x] News is loaded for all three cities (Cape Town 4 stories, Pretoria 2, Polokwane 2) and fuel prices for all three.
- [ ] **[You]** Delete the demo user row (`admin@admin.com`) from all three databases before launch.

## 4. Data quality

- [x] The four dead business websites (`amarecapetown.com` and `leeschinesekitchen.co.za` do not exist; `arcww.co.za` serves a 404 and `apnisleep.co.za` a 500) were cleared from the Cape Town database on 20 September, so those listings no longer show a broken Website button.
- [x] **Interactive suburb map, completely free to run** (`/suburb/map/`): real suburb outlines you can hover and click, a suburb search box, "Near me", shading by region, by number of businesses or by any single category (with a legend), a side card for the selected suburb with its top categories linking to the category pages, region filters, a Detailed map style and a Tilt (3D) view, fullscreen, shareable links to a suburb, and a phone layout. It uses MapLibre and the OpenFreeMap basemap (no key, no usage limits, no cost) with outlines from the City of Cape Town and City of Tshwane open map services and OpenStreetMap. Official outlines: Cape Town 147 of 168 suburbs, Pretoria 164 of 218, Polokwane 4 of 38; the rest are drawn as clearly marked approximate areas. No per-business pins by design.
- [ ] **[Me]** Find official outlines for Polokwane (34 suburbs are approximate areas today) and the remaining Cape Town (21) and Pretoria (54) suburbs, mostly gated estates and small areas. Re-run `node scripts/fetch-official-boundaries.mjs <city>` when the municipalities update their data (the yearly boundary refresh routine in section 7).

- [ ] **[Me]** Add business email addresses at scale (only 2 to 7% of listings have one), so claim verification can go to the business inbox instead of a manual review. Best source: the routine that visits each business's own website (see section 7).

## 5. Payments, secrets and accounts

- [ ] **[You]** Cloudflare D1 **free plan daily read limit** was reached on 20 September (Cloudflare error 7500) after many test builds: every build reads all three databases (Pretoria alone has about 9,660 businesses). The limit resets at midnight UTC (02:00 South African time). Live sites kept working, but builds and deploys that read the databases fail until the reset. Before launch, decide whether to move the Cloudflare account to the Workers Paid plan (about $5 a month, far higher limits) so a busy day of deploys can never block a release.
- [ ] **[Me]** Cut the reads a build needs: reuse the saved database snapshot when nothing changed, and only pull the tables a build uses, so routine and preview deploys stay well inside the free limit.
- [x] Checked on 20 September 2026: the **Production** environment of all three Pages projects already has `RESEND_API_KEY`, `CRON_SECRET`, `GITHUB_DISPATCH_TOKEN` (the rebuild hook), Google sign-in keys and the four PayFast values. Only their names can be seen, not the values.
- [ ] **[You]** Switch PayFast to **live** credentials: check that the merchant ID, key, passphrase and host stored in Production on all three projects are the live ones, not the sandbox ones.
- [ ] **[You]** The **Preview** environment has no secrets at all, so the dev preview cannot send email, take payments or use Google sign-in (a test message on the Cape Town preview was saved but not emailed). To test those on the preview, add `RESEND_API_KEY` (and the PayFast values) to the Preview environment of each project. Production is unaffected.
- [ ] **[You]** Confirm each site's domain is verified in Resend (the key exists in Production; the sender is `hello@<domain>`). All email now goes through the website, so if a domain is not verified messages are still saved and visible in the admin Enquiries tab, but not emailed.
- [ ] **[You]** Turn on Cloudflare Turnstile or a rate-limit rule as a second layer in front of the public forms.
- [ ] **[You]** Real AdSense units in place of the "Advertisement" placeholder boxes; Google Analytics IDs confirmed.

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
- [ ] **Business routine (Cape Town, Pretoria, Polokwane):** replace the three near-identical runbooks with one shared runbook plus a small per-city config file. Put the five jobs on their own schedules instead of every run (suburb research often; shopping-centre sweep, description enrichment and closed-business check less often; new-mall discovery monthly).
- [ ] **Stop repeating work:** skip anything already verified recently, track what each run touched in `routine-state.json`, read only the slice of the database snapshot the run needs, and end the run early when nothing is due.
- [ ] **Move mechanical work out of the AI agent into scripts** that run in GitHub Actions: link and website checks, slug and category validation, SQL syntax check, duplicate detection. The agent then only does the parts that need judgement (finding and verifying new information).
- [x] **Fuel prices split from news:** one monthly routine for all three cities (`ROUTINE.fuel.md`), guarded by `scripts/fuel-due.mjs` so it only runs on the first Wednesday of the month and the two days after. Prices are split by region (Cape Town coastal; Pretoria and Polokwane inland), researched once for both. The news runbooks no longer touch fuel.
- [ ] **News routine (daily, three cities):** one shared runbook (news only); fetch each source once; publish only stories that pass `npm run check:news`.
- [ ] **Events routine (weekly, three cities):** one shared runbook; only look at sources that changed; drop events that have passed instead of re-checking them.
- [ ] Give every routine a hard time/step budget, one clear success log line, and a failure that is visible (admin overview health tile).

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
