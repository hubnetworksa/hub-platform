# Ethan branch: production-readiness todo list

Scope: only the `Ethan` dev branch (TheCapeTownHub, PretoriaHub, PolokwaneHub). Nothing here is about what has changed on `main`.
Status as of 20 September 2026. **[Me]** = I can do it. **[You]** = needs your accounts, a decision, or a real-world action.

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
- [x] `/tourism/` now redirects home (and stays out of the sitemap) on Cape Town and Pretoria, which have no tourism section; Polokwane keeps it.
- [x] The backend type-check now runs in the preview build and stops a broken change from deploying.
- [x] `npm run check:links` (crawls a build for broken links) and `npm run check:smoke` (opens 40 pages at desktop and phone width) are saved in the repo; both pass.
- [x] The four Cape Town businesses that had no category are categorised (four missing categories were added to Cape Town to fit them).
- [x] **Suburb map coordinates:** Cape Town went from 0 to 162 of 168 suburbs, Pretoria from 178 to 180 of 218, Polokwane from 30 to 31 of 38. The map page now draws them.
- [x] First news stories published for all three cities (Cape Town 4, Pretoria 2, Polokwane 2), each checked against two sources.

## 2. Code work still to do on the branch

| # | Task | Owner | Why it matters |
|---|---|---|---|
| 2.1 | Run the payment flow end to end on the PayFast sandbox: subscribe, payment notification, cancel, expiry, sponsorship purchase, rejected-listing refund note | Me + You | The biggest untested area. Needs PayFast values in the Preview environment (see section 5) |
| 2.2 | Exercise the last endpoints against the real database: claim and guide-sponsorship checkout. (Verified live on 20 Sept: contact, enquiry, add-business with approval, submit-event with approve and delete, and all nine admin endpoints answering with real data.) | Me | Claim needs a signed-in owner with a document upload; guide sponsorship needs PayFast values in Preview (item 2.1) |
| 2.3 | Remove the temporary "[monitor copy]" emails that send a copy of every owner-confirmation email to a personal Gmail address (in `confirm-listing.ts` and `owner-confirm-listing.ts`, marked TEMP) | Me, once you say so | Owners' details should not be copied to a personal inbox once the site is live |
| 2.4 | Add real content where the mockup is empty and you decide to keep it: reviews, views/clicks data, an owner's own enquiries, invoice PDFs | Me (after your decision) | Otherwise these stay honest "No data yet" tiles |

## 3. Database work (the branch's own migrations)

- [x] Backups of all three databases taken on 20 September 2026 (`Hub/db-backups/2026-09-20/`, private; they contain user emails). Take a fresh set again on launch day.
- [x] Every migration is applied to all three production databases: event submissions, news and fuel, messages, submission hours and centre, and rate limits.
- [x] News is loaded for all three cities (Cape Town 4 stories, Pretoria 2, Polokwane 2) and fuel prices for all three.
- [ ] **[You]** Delete the demo user row (`admin@admin.com`) from all three databases before launch.

## 4. Data quality

- [x] The four dead business websites (`amarecapetown.com` and `leeschinesekitchen.co.za` do not exist; `arcww.co.za` serves a 404 and `apnisleep.co.za` a 500) were cleared from the Cape Town database on 20 September, so those listings no longer show a broken Website button.
- [ ] **[Me]** Proper map (Property24 style): business pins, suburb boundaries, a production-grade map provider. Plan sent 20 September; needs your go-ahead and a provider choice.
- [ ] **[You/Me]** Suburbs still without map coordinates: 6 in Cape Town, 38 in Pretoria, 7 in Polokwane, mostly small industrial and farm areas the public map service does not know. They simply are not plotted. Add them by hand or with a paid geocoder if you want them on the map.

## 5. Payments, secrets and accounts

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

## 7. Scheduled routines

- [ ] **[You]** Create the scheduled cloud agents for each city: hourly business, weekly events, daily news (the runbooks are in the repo).
- [ ] **[Me]** Raise the news check's 20-second fetch timeout, which is flaky on the City of Cape Town's own site.

## 8. Launch-day checklist (run in this order)

1. Back up all three databases.
2. Run `npm run check:links` on a build of each city and `npm run check:smoke` against the final preview build.
3. Apply pending migrations city by city, then load the fuel prices and news.
4. Delete the demo user rows.
5. Confirm the live PayFast secrets and that `domainLive` and DNS are correct for each domain.
6. Release, then test one real signup, one real payment and one event submission on each site.
7. Submit the sitemaps to Search Console and Bing.
