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

## 2. Code work still to do on the branch

| # | Task | Owner | Why it matters |
|---|---|---|---|
| 2.1 | Save trading hours and shopping centre from the "Add your business" form (needs a small database migration and a change to how approved listings are created) | Me | Today these two fields are collected but only emailed to admin, so the step-3 preview promises something we don't store |
| 2.2 | Make "Report this listing" and "Request data removal" use the site's own endpoints (email stays as a fallback) | Me | Today they only open the visitor's mail app, so the admin Reports tab never receives anything |
| 2.3 | Hide `/tourism/` on Cape Town and Pretoria | Me | The page exists there but nothing links to it |
| 2.4 | Rate limiting on the public forms: add listing, add event, claim, report, removal (per-IP, server side) | Me | Right now they have only a hidden honeypot field and a minimum time on form |
| 2.5 | Add the backend type-check and the news check to the preview build workflow | Me | So a broken change can't be deployed unnoticed |
| 2.6 | Save the link checker and the browser smoke test as repo scripts (`npm run check:links`, `npm run check:smoke`) | Me | So every release can be verified the same way |
| 2.7 | Run the payment flow end to end on the PayFast sandbox: subscribe, payment notification, cancel, expiry, sponsorship purchase, rejected-listing refund note | Me + You | This is the biggest untested area |
| 2.8 | Exercise every new endpoint against a real database (submit-event and approve, claim, listing flow, admin listings, guide sponsorship) | Me | They were only tested with mocked responses |
| 2.9 | Add real content where the mockup is empty and you decide to keep it: reviews, views/clicks/enquiries data, invoice PDFs | Me (after your decision) | Otherwise these stay honest "No data yet" tiles |

## 3. Database work (the branch's own migrations)

- [ ] **[You]** Back up all three databases before touching anything (`wrangler d1 export`, keep the files private; they contain user emails).
- [ ] **[You/Me]** Apply the pending migrations to **Pretoria** (event submissions `0035`, news and fuel `0036`) and **Polokwane** (`0038`, `0039`). Cape Town already has everything. The classifier requires your explicit go-ahead for each city.
- [ ] **[You/Me]** After 2.1, apply its migration to all three.
- [ ] **[Me]** Load the September fuel prices and first news for Pretoria and Polokwane (files are ready in `db/routine-updates/`).
- [ ] **[You]** Create a **staging** database per city so the dev preview stops sharing the live database (today the preview reads and writes production data).
- [ ] **[You]** Delete the demo user row (`admin@admin.com`) from all three databases before launch.

## 4. Data quality

- [ ] **[You/Me]** Give the four Cape Town businesses with no category one (they are hidden from browsing): Advanced Electric Fencing, Craigmore Poultry Farm, Nicol Coachworks, Photo Booth World. Needs a database write.
- [ ] **[You/Me]** Remove or fix the dead business websites (`amarecapetown.com`, `leeschinesekitchen.co.za`, `arcww.co.za`, `apnisleep.co.za`).
- [ ] **[You/Me]** Add coordinates to the 168 Cape Town suburbs so the suburb map shows something (Pretoria and Polokwane already have data or need checking).

## 5. Payments, secrets and accounts

- [ ] **[You]** Live PayFast merchant ID, key, passphrase and host as secrets on all three Pages projects (currently sandbox).
- [ ] **[You]** Confirm the other secrets exist on all three Pages projects: `RESEND_API_KEY`, `CRON_SECRET`, the deploy hook for the admin "Rebuild & deploy" button, and Google sign-in keys for Polokwane and Cape Town.
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
