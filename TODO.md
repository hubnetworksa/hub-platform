# Outstanding work

Last updated: 2026-09-10

## hub-platform (Polokwane / Pretoria / Cape Town)

- [x] Set `GITHUB_DISPATCH_TOKEN` secret on all 3 Cloudflare Pages projects
      (polokwanehub, pretoriahub, thecapetownhub) — done and verified via a
      real workflow_dispatch test run on 2026-09-09.
- [ ] Verify Polokwane's domain in Resend + set `RESEND_API_KEY` on its
      Pages project (only Pretoria's hub-platform project has this so far;
      Polokwane/Cape Town fall back to the mailto: draft instead of a real
      email).
- [ ] Same Resend setup for Cape Town, once it has a registered domain.
- [ ] Add a custom 404 page (currently missing — unmatched URLs return 200
      with homepage content instead of a real 404).
- [x] AdSense: all 3 sites now share the new consolidated publisher ID
      `ca-pub-7060187043058790` (2026-09-09). Still pending on the Google
      side: old Polokwane/Pretoria AdSense accounts need to be closed and
      the new hubnetworksa account resubmitted/approved (blocked on a
      Google duplicate-account flag as of 2026-09-09); once approved, add
      each live domain as a Site under that one account.
- [ ] Search Console verification for Polokwane and Cape Town (each needs
      its own unique HTML-tag code from Search Console, under the
      hubnetworksa Google account — only Pretoria has one so far).
- [x] GA4 for Polokwane (`G-QQL9HCKZNR`) and Cape Town (`G-JWEXFEXXW4`) —
      done 2026-09-09, each under its own separate Analytics account
      (fine for GA4, unlike AdSense).
- [ ] Re-enable the `.pages.dev → custom domain` redirect in
      `functions/_middleware.ts` per site once each domain is actually cut
      over (currently disabled).
- [ ] Polokwane and Cape Town domain cutovers (deferred).
- [ ] Remove the TEMP separate monitor-copy email (to
      ethanmglindeque@gmail.com, sent alongside the real owner/admin
      emails) once the owner-confirmation flow is fully trusted — marked
      `TEMP` in code comments in `functions/api/confirm-listing.ts` and
      `functions/api/owner-confirm-listing.ts` on both hub-platform and
      the old Pretoria repo.

## Old Pretoria site (pretoriahub, GRimkiller360 repo)

### Built 2026-09-09/10 — done, live on pretoriahub.com

- [x] Business owner accounts: register/login (email+password), Google
      sign-in, sessions stored in D1 (`users`/`sessions` tables,
      `functions/_lib/auth.ts`).
- [x] Claim-by-document-review flow: search a business, upload proof of
      ownership, admin reviews the document(s) and approves/rejects
      (`business_claims` table, `functions/api/claim-business.ts`,
      `functions/review-claim.ts` + `functions/api/review-claim.ts`,
      `functions/claim-document/[[path]].ts`).
- [x] "Is this your business? Claim it" button on every unclaimed
      business's public page, linking straight into the claim flow.
- [x] Owner "My Businesses" dashboard (`/my-businesses/`) — businesses
      owned, pending-submission status, claim status — plus an edit page
      (`/my-businesses/edit/`) for owned businesses.
- [x] New submissions now auto-link to the submitter's account once
      confirmed/published (`pending_submissions.submitted_by_user_id` →
      `businesses.owner_user_id`), so they show up under My Businesses
      instead of vanishing on publish.
- [x] Admin Dashboard, split into a hub page (`/admin/`, stats strip +
      health check + manual rebuild button) plus dedicated pages:
      `/admin/submissions/` (with bulk approve/reject), `/admin/claims/`,
      `/admin/reports/`, `/admin/businesses/` (publish/hide/edit/delete/
      reassign-owner any business), `/admin/users/`, `/admin/activity/`
      (audit log of every decision — a new `activity_log` table, since
      the working-state rows get deleted on action).
- [x] "Report this listing" and "Request removal" now also write to a
      `reports` table (not just a fire-and-forget email), visible/
      resolvable from `/admin/reports/`.
- [x] `ads.txt` updated with the new consolidated AdSense publisher ID
      (`ca-pub-7060187043058790`) alongside the old one — was only listing
      the old id, which is why AdSense showed pretoriahub.com as
      Unauthorized for the new account.
- [x] Fixed a real Astro bug hit while building this: `:global()` needed
      around any CSS selector targeting content rendered via client-side
      `innerHTML` (Astro's scoping attribute never reaches JS-injected
      elements) — affected every dashboard page until fixed.

### Still open

- [ ] Clean up the still-sitting "Test Real Company Listing" test entry in
      `pending_submissions` (id 5, token `bdce7fb7-3214-4cc7-ac60-6fc288794786`).
- [ ] Finish the `pretoriahub.com` registrar transfer once the ICANN lock
      clears.
- [ ] Going forward, push any further changes to this repo through git
      (not direct `wrangler pages deploy`) — a direct-deploy/git mismatch
      is exactly what caused a production regression on 2026-09-09 (a
      GitHub Actions dispatch rebuilt from git and silently reverted the
      live site to pre-owner-confirmation code). Keep git and production
      in sync from now on.

## Port accounts/claims/admin-dashboard to hub-platform (Polokwane / Pretoria / Cape Town)

None of the above (accounts, claims, My Businesses, Admin Dashboard,
reports/activity log) exists yet in hub-platform — it was all built
directly on the old Pretoria site. Porting it over means re-doing the same
work adapted to hub-platform's per-site config pattern (`getSite(context.env.SITE)`
/ `sites/<slug>.json`) instead of the old repo's hardcoded `'PretoriaHub'`/
`'pretoriahub.com'` strings — same adaptation pattern already used when the
owner-confirmation feature was ported earlier.

- [ ] `users`/`sessions`/`business_claims`/`reports`/`activity_log` tables —
      one migration per site (`db/migrations/<site>/00XX_accounts.sql` etc.),
      same schema as the old repo's `0020`–`0022` migrations.
- [ ] `functions/_lib/auth.ts` port (site-agnostic as-is, no changes needed).
- [ ] Register/login pages + Google OAuth start/callback — **decided:
      a separate Google OAuth Client per domain** (not one Client with
      multiple redirect URIs), so each site needs its own Client created
      in Google Cloud Console (same steps used for the old Pretoria site)
      with that site's own `GOOGLE_OAUTH_CLIENT_ID`/`_SECRET` Pages
      secrets — do this per site once each real domain is live, since the
      callback redirect URI has to match the live domain.
- [ ] Claim flow (search/upload/review/document-download) — adapt emails to
      use `site.contactEmail`/`sendEmail` per site instead of hardcoded
      `hello@pretoriahub.com`.
- [ ] My Businesses + edit page.
- [ ] Admin Dashboard (hub + 6 sub-pages) — the "admin" gate
      (`isAdminEmail`) needs a decision: one shared admin across all 3
      sites, or per-site.
- [ ] "Claim it" button on business pages.
- [ ] Rebuild-trigger wiring already exists per-site in hub-platform
      (`GITHUB_DISPATCH_TOKEN`, done 2026-09-09) — the admin dashboard's
      manual "Rebuild now" button just needs the same endpoint ported.
