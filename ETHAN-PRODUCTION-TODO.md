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

## 2. Code work still to do on the branch

| # | Task | Owner | Why it matters |
|---|---|---|---|
| 2.1 | Save trading hours and shopping centre from the "Add your business" form (needs a small database migration and a change to how approved listings are created) | Me | Today these two fields are collected but only emailed to admin, so the step-3 preview promises something we don't store |
| 2.3 | Hide `/tourism/` on Cape Town and Pretoria | Me | The page exists there but nothing links to it |
| 2.4 | Extend the per-visitor rate limit (already on contact and enquiry) to add listing, add event, claim, report and removal | Me | Those forms still have only a hidden honeypot field and a minimum time on form |
| 2.5 | Add the backend type-check and the news check to the preview build workflow | Me | So a broken change can't be deployed unnoticed |
| 2.6 | Save the link checker and the browser smoke test as repo scripts (`npm run check:links`, `npm run check:smoke`) | Me | So every release can be verified the same way |
| 2.7 | Run the payment flow end to end on the PayFast sandbox: subscribe, payment notification, cancel, expiry, sponsorship purchase, rejected-listing refund note | Me + You | This is the biggest untested area |
| 2.8 | Exercise every new endpoint against a real database (submit-event and approve, claim, listing flow, admin listings, guide sponsorship) | Me | They were only tested with mocked responses |
| 2.10 | Remove the temporary "[monitor copy]" emails that send a copy of every owner-confirmation email to a personal Gmail address (in `confirm-listing.ts` and `owner-confirm-listing.ts`, marked TEMP) | Me, once you say so | Owners' details should not be copied to a personal inbox once the site is live |
| 2.9 | Add real content where the mockup is empty and you decide to keep it: reviews, views/clicks/enquiries data, invoice PDFs | Me (after your decision) | Otherwise these stay honest "No data yet" tiles |

## 3. Database work (the branch's own migrations)

- [x] Backups of all three databases taken on 20 September 2026 (`Hub/db-backups/2026-09-20/`, private; they contain user emails). Take a fresh set again on launch day.
- [x] Migrations applied to all three production databases (Pretoria `0035`/`0036`/`0037`, Polokwane `0038`/`0039`/`0040`, Cape Town `0038`). Cape Town news (4 stories) and all three cities' fuel prices are loaded.
- [ ] **[You/Me]** After 2.1, apply its migration to all three.
- [ ] **[Me]** Publish the first news stories for Pretoria and Polokwane (run their news routines).
- [ ] **[You]** Delete the demo user row (`admin@admin.com`) from all three databases before launch.

## 4. Data quality

- [ ] **[You/Me]** Give the four Cape Town businesses with no category one (they are hidden from browsing): Advanced Electric Fencing, Craigmore Poultry Farm, Nicol Coachworks, Photo Booth World. Needs a database write.
- [ ] **[You/Me]** Remove or fix the dead business websites (`amarecapetown.com`, `leeschinesekitchen.co.za`, `arcww.co.za`, `apnisleep.co.za`).
- [ ] **[You/Me]** Add coordinates to the 168 Cape Town suburbs so the suburb map shows something (Pretoria and Polokwane already have data or need checking).

## 5. Payments, secrets and accounts

- [ ] **[You]** Live PayFast merchant ID, key, passphrase and host as secrets on all three Pages projects (currently sandbox).
- [x] Checked on 20 September 2026: the **Production** environment of all three Pages projects already has `RESEND_API_KEY`, `CRON_SECRET`, `GITHUB_DISPATCH_TOKEN` (the rebuild hook), Google sign-in keys and the four PayFast values. Only their names can be seen, not the values.
- [ ] **[You]** Confirm the PayFast values in Production are the **live** credentials, not the sandbox ones.
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
2. Run the link checker and the smoke test on the final preview build.
3. Apply pending migrations city by city, then load the fuel prices and news.
4. Delete the demo user rows.
5. Confirm the live PayFast secrets and that `domainLive` and DNS are correct for each domain.
6. Release, then test one real signup, one real payment and one event submission on each site.
7. Submit the sitemaps to Search Console and Bing.
