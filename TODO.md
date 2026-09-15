# Outstanding work

Last updated: 2026-09-15

## Domain cutover checklist (per site)

**Pretoria: cut over 2026-09-10.** `pretoriahub.com` moved from the
personal Cloudflare account to `hubnetworksa` (Registrar account move,
accepted same day), the zone is Active there, and the domain now resolves
straight to hub-platform (`/api/me` and `/register/` both confirmed live
at `pretoriahub.com` — those routes never existed on the old repo).
Polokwane and Cape Town are still on `.pages.dev` only.

- [x] Cloudflare Registrar account move for `pretoriahub.com` (personal →
      `hubnetworksa`) — submitted and accepted 2026-09-10.
- [x] Attach `pretoriahub.com` as a custom domain on the `pretoriahub`
      Pages project (`hubnetworksa` account) — done 2026-09-10.
- [x] Re-enable the `.pages.dev` → custom-domain redirect in
      `functions/_middleware.ts` for Pretoria — done 2026-09-10, gated on
      a new `domainLive` field in `sites/<slug>.json` (`true` for Pretoria,
      `false` for Polokwane/Cape Town) so it only fires for a site whose
      domain is actually live — set `domainLive: true` for each site as
      its own cutover happens.
- [x] **Google OAuth Client for `pretoriahub.com`** — `GOOGLE_OAUTH_CLIENT_ID`
      and `GOOGLE_OAUTH_CLIENT_SECRET` are set on the `pretoriahub` Pages
      project (confirmed via `wrangler pages secret list`, 2026-09-10).
      Same still needed for Polokwane/Cape Town once their domains are live.
- [x] **Verify Google sign-in works end-to-end on `pretoriahub.com`** —
      confirmed working 2026-09-10, after rotating the Client ID/secret
      pair and forcing a fresh Pages deployment (Cloudflare Pages only
      applies new secrets to the *next* deployment, not the one already
      live — direct `wrangler pages deploy` was used once to force that,
      then the commit was pushed to `main` so the GitHub Actions pipeline
      stays the source of truth going forward).
- [ ] **Email Routing** on the new `pretoriahub.com` zone (`hubnetworksa`
      account) — forward `hello@pretoriahub.com` to a real inbox. Not
      confirmed set up yet on the new zone (the old zone under the
      personal account had it; that config did not carry over with the
      account move).
- [ ] **Search Console** — verify `pretoriahub.com` under `hubnetworksa`'s
      Search Console (meta-tag code already wired into
      `sites/pretoria.json`) and submit `/sitemap-index.xml`. The domain's
      old TXT-based verification records belonged to the old zone/account
      and don't need recreating.
- [x] **Old Pretoria repo (GRimkiller360 account) cleanup** — removed
      `pretoriahub.com` from that Pages project's custom domains,
      2026-09-10. Still undecided: archive the repo, or just leave it
      deployed-but-unreachable at its own `.pages.dev` URL.
- [ ] **One more D1 backup + merge pass** for Pretoria — same process as
      `db/backups/old-pretoriahub-2026-09-10.sql`, in case the old site
      collected anything between that backup and the actual cutover.
- [x] **Email pipeline confirmed end-to-end on `pretoriahub.com`**
      (2026-09-10): Resend → Cloudflare Email Routing → Gmail forwarding
      → delivered to `hubnetworksa@gmail.com`. Took two real fixes to get
      here, both consequences of the domain moving to a fresh Cloudflare
      zone: (1) `hello@pretoriahub.com` got auto-suppressed in Resend
      after early hard bounces during the transition window — had to be
      un-suppressed in Resend's dashboard; (2) Cloudflare Email Routing
      requires a DMARC record to exist for Gmail to accept forwarded mail
      (`developers.cloudflare.com/email-routing/postmaster/`) — added
      `_dmarc.pretoriahub.com` = `v=DMARC1; p=none; rua=mailto:hubnetworksa@gmail.com`.
      Also had to hit "Restart verification" in Resend's own domain page
      after their Cloudflare auto-configure, since it doesn't reliably
      re-check on its own after a domain move.
- [x] **Full flow smoke test on `pretoriahub.com`** — confirmed 2026-09-10
      end-to-end against production: register → submit (logged in, with
      owner email) → admin approve → owner confirm → published, with
      correct auto-link to the submitter's account (My Businesses showed
      it) and the new "you're live" email sent. Second business submitted
      anonymously with no email → published immediately (no owner-confirm
      needed), then claimed by a second test user → admin-approved the
      claim → ownership correctly transferred. Every emailed link
      (`/verify-listing`, `/owner-confirm-listing`, `/review-claim`,
      `/claim-document/...`) resolved with 200. All test businesses/
      users/sessions/claims/activity-log rows and the uploaded R2
      document were deleted afterward.
- [x] **Owner-confirmation reminder + expiry** — added 2026-09-10:
      `functions/api/admin/process-owner-reminders.ts` (one per site,
      gated on a `CRON_SECRET` shared secret, not a browser session) sends
      a reminder email 3 days after admin approval if the owner still
      hasn't confirmed, then deletes the pending submission (never
      published) if there's still no response 4 days after that reminder.
      Runs daily via `.github/workflows/owner-reminders.yml`. New
      `reminder_sent_at` column on `pending_submissions` (migration per
      site). `CRON_SECRET` set as both a GitHub Actions secret and a
      Cloudflare Pages secret on all 3 projects.
- [x] AdSense — `https://pretoriahub.com/ads.txt` confirmed serving the
      shared `pub-7060187043058790` line correctly post-cutover
      (2026-09-10) — though see below, this ID is being replaced with a
      Pretoria-specific one, not kept long-term.
- [ ] Cape Town domain cutover — repeat this whole checklist once its real
      domain is ready to move.

**Polokwane: cut over 2026-09-15.** `polokwanehub.com` moved from its
previous Cloudflare account to `hubnetworksa` (Registrar account move,
accepted same day), the zone is Active there, and the domain now resolves
straight to hub-platform (`/`, `/api/me`, and `/register/` all confirmed
live at `polokwanehub.com`). Cape Town is still on `.pages.dev` only.

- [x] Cloudflare Registrar account move for `polokwanehub.com` (previous
      account → `hubnetworksa`) — submitted and accepted 2026-09-15. The
      old zone's DNS records (A/AAAA, MX for Cloudflare Email Routing,
      SPF/DKIM TXT, `_acme-challenge` TXT, and an existing
      `google-site-verification` TXT) were auto-imported by Cloudflare's
      "Add a site" scan when the domain was added to `hubnetworksa`, and
      kept as Proxied (A/AAAA) or DNS only (MX/TXT, not proxyable).
- [x] Attach `polokwanehub.com` (and `www.polokwanehub.com`) as a custom
      domain on the `polokwanehub` Pages project (`hubnetworksa` account) —
      done 2026-09-15, via a manually-added CNAME (Cloudflare's
      auto-DNS-write didn't fire) rather than Pretoria's automatic path.
- [x] Re-enable the `.pages.dev` → custom-domain redirect in
      `functions/_middleware.ts` for Polokwane — done 2026-09-15,
      `domainLive: true` set in `sites/polokwane.json`.
- [ ] **Google OAuth Client for `polokwanehub.com`** — needs its own
      `GOOGLE_OAUTH_CLIENT_ID`/`GOOGLE_OAUTH_CLIENT_SECRET` set on the
      `polokwanehub` Pages project (same per-domain-Client decision as
      Pretoria — the callback redirect URI has to match the live domain).
- [ ] **Verify Google sign-in works end-to-end on `polokwanehub.com`**
      once the OAuth Client above is set up.
- [ ] **Email Routing** on the new `polokwanehub.com` zone (`hubnetworksa`
      account) — forward `hello@polokwanehub.com` to a real inbox. The
      imported MX records point at Cloudflare's routing servers, but that
      doesn't by itself mean a destination address is configured in this
      account — needs checking/(re)setting up, same DMARC-record caveat
      Pretoria hit (`developers.cloudflare.com/email-routing/postmaster/`).
- [ ] **Search Console** — the imported `google-site-verification` TXT
      record belongs to whoever verified it under the *old* account/Google
      login, not necessarily `hubnetworksa`'s own Search Console. Per the
      existing open item below, Polokwane still needs its own HTML-tag
      verification code under the `hubnetworksa` Google account
      (`sites/polokwane.json`'s `googleSiteVerification` is still `null`) —
      don't assume the old TXT record covers this.
- [ ] **Old Polokwane site/database, if any** — unconfirmed whether a
      separate legacy Polokwane site/D1 exists analogous to the old
      Pretoria repo (`GRimkiller360/pretoriahub`) that would need a
      data backup + merge pass like `db/backups/old-pretoriahub-2026-09-10.sql`
      before treating `polokwanehub-db` as the single source of truth. If
      Polokwane's data has always lived only in this repo's D1, this item
      is moot — needs confirming either way.
- [ ] **Full flow smoke test on `polokwanehub.com`** — same end-to-end
      pass as Pretoria's 2026-09-10 test (register → submit → admin
      approve → owner confirm → published; claim → admin-approve →
      ownership transfer; every emailed link resolves) — not yet run for
      Polokwane's real domain.
- [ ] AdSense — Polokwane already has its own publisher ID
      (`ca-pub-7239595592067933` in `sites/polokwane.json`, distinct from
      Pretoria's), unlike Pretoria's shared-ID transition — just needs
      confirming `https://polokwanehub.com/ads.txt` serves it correctly
      post-cutover.

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
- [ ] **AdSense decision reversed (2026-09-10): each site will use its
      own separate publisher ID/account, not the shared
      `ca-pub-7060187043058790` all 3 currently use.** The consolidated ID
      is a placeholder until each site's own ID exists — don't build
      anything new on the assumption it's shared. Per site, once its own
      ID is approved: update `adsensePublisherId` in `sites/<slug>.json`
      and that site's `ads.txt`/AdSense script tag (currently generated
      from the same field, so this should be a small, mechanical change
      once the actual IDs are in hand — not done yet, IDs not ready).
      The `hubnetworksa` account's duplicate-account flag did clear
      2026-09-10, which unblocks getting those per-site approvals moving.
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
