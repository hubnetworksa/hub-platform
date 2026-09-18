# Outstanding work

Last updated: 2026-09-18

## Domain cutover checklist (per site)

**Pretoria: cut over 2026-09-10.** `pretoriahub.com` moved from the
personal Cloudflare account to `hubnetworksa` (Registrar account move,
accepted same day), the zone is Active there, and the domain now resolves
straight to hub-platform (`/api/me` and `/register/` both confirmed live
at `pretoriahub.com` — those routes never existed on the old repo).

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
- [x] Cape Town domain cutover — done 2026-09-18, see its own section below.

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
- [x] **Google OAuth Client for `polokwanehub.com`** — created in Google
      Cloud Console (redirect URI `https://polokwanehub.com/api/auth/google/callback`),
      `GOOGLE_OAUTH_CLIENT_ID`/`GOOGLE_OAUTH_CLIENT_SECRET` set on the
      `polokwanehub` Pages project via `wrangler pages secret put`, done
      2026-09-15. `/api/auth/google/start` confirmed redirecting to Google
      with the correct client_id/redirect_uri.
- [x] **Verify Google sign-in works end-to-end on `polokwanehub.com`** —
      confirmed working, 2026-09-15.
- [x] **Email Routing** on the new `polokwanehub.com` zone (`hubnetworksa`
      account) — destination address + routing rule (`hello@polokwanehub.com`
      → `hubnetworksa@gmail.com`) and the `_dmarc.polokwanehub.com` TXT
      record added, done 2026-09-15.
- [x] **Resend** — domain verified in Resend (including a manually-merged
      SPF record and a `resend._domainkey` DKIM TXT record), `RESEND_API_KEY`
      set on the `polokwanehub` Pages project, done 2026-09-15.
- [x] **Outbound + inbound email pipeline confirmed end-to-end** — a
      throwaway account was registered via `/api/register` on the live
      site (triggers a real "New account created" email through Resend to
      `hello@polokwanehub.com`), confirmed arriving at `hubnetworksa@gmail.com`,
      then the test user/session rows were deleted from `polokwanehub-db`.
- [x] **Search Console** — `polokwanehub.com` added as a property under
      the `hubnetworksa` Google account and **auto-verified** via the
      pre-existing `google-site-verification` TXT record that carried over
      in the domain move — no separate HTML-tag verification needed after
      all (`sites/polokwane.json`'s `googleSiteVerification` stays `null`,
      unused, since DNS-TXT verification doesn't go through that field).
      Sitemap submission (`sitemap-index.xml`) still to be done.
- [x] **Old Polokwane site/database merged** (2026-09-15) — confirmed: a
      separate legacy repo (`GuyWheel/Polokwanehub`, checked out locally at
      `c:\Users\EthanLindeque\Documents\Hub\Polokwanehub`) had its own D1
      (`polokwanehub-db`, id `d85f741d-...`, a different database than
      hub-platform's despite the same name). Backed up to
      `db/backups/old-polokwanehub-2026-09-15.sql` (720 businesses, 86
      categories, 31 suburbs, 29 shopping centres — no accounts/claims
      tables, that system was never built there). Merged into the live
      `polokwanehub-db` by exact slug diff (not name-fuzzy-matching):
      505 businesses already matched by slug, 214 were genuinely new, 1
      was excluded (marked `closed_at` by the old site's own
      closed-business routine, a column hub-platform's schema doesn't
      have), and 18 businesses currently live don't exist in the old DB at
      all (added independently after the cutover point, left untouched).
      Also seeded 1 missing suburb (`futura`), 18 missing categories (from
      the old repo's "Add 18 new business categories" commit that never
      made it to hub-platform), and 1 missing shopping centre
      (`city-centre-polokwane-central`) that the new businesses referenced.
      Final count 737 businesses; integrity-checked post-merge (0 orphaned
      `business_categories` rows, 0 bad `suburb_id` foreign keys). Verified
      live on `polokwanehub.com` after a redeploy. **Follow-up done**
      2026-09-15: all 18 newly-seeded categories wired into
      `categoryGroups.ts` (verified against all 86 live categories, no
      gaps/duplicates). Only `panel-beaters-spray-painters` has real
      listings so far (5) and now correctly shows under Automotive; the
      other 17 stay noindexed/hidden until they have listings.
- [x] **Full flow smoke test on `polokwanehub.com`** — confirmed 2026-09-15
      end-to-end against production, same pass as Pretoria's 2026-09-10
      test: register → submit (logged in, with owner email) → admin
      approve → owner confirm → published, with correct auto-link to the
      submitter's account. Second business submitted anonymously with no
      email → published immediately (no owner-confirm needed) with
      `owner_user_id` correctly null. Claimed by a second test user via
      the new simplified contact-info claim form → admin-approved the
      claim via `/api/review-claim` → ownership correctly transferred
      (`owner_user_id` set to the claimant's account). All test
      businesses/users/sessions/claims rows deleted afterward.
- [x] AdSense — Polokwane already has its own publisher ID
      (`ca-pub-7239595592067933` in `sites/polokwane.json`, distinct from
      Pretoria's), unlike Pretoria's shared-ID transition —
      `https://polokwanehub.com/ads.txt` confirmed serving
      `pub-7239595592067933` correctly post-cutover, 2026-09-15.

**Cape Town: cut over 2026-09-18.** `thecapetownhub.com`'s zone was already
on the `hubnetworksa` account when this cutover began; the domain now
resolves straight to hub-platform.

- [x] Attach `thecapetownhub.com` (and `www.thecapetownhub.com`) as a
      custom domain on the `thecapetownhub` Pages project — done
      2026-09-18. Cloudflare didn't auto-write the DNS record even though
      the zone and the Pages project share an account (same as Polokwane's
      experience) — CNAME `@`/`www` → `thecapetownhub.pages.dev` added
      manually.
- [x] Re-enable the `.pages.dev` → custom-domain redirect in
      `functions/_middleware.ts` — `domainLive: true` and `cloudflareZoneId`
      set in `sites/capetown.json`, 2026-09-18.
- [x] **Found and fixed a real bug during cutover**: `src/site-content/
      capetown/areaGroups.ts` was still an empty stub even though 168
      suburbs were already seeded (`db/migrations/capetown/0030_seed_suburbs.sql`)
      — the `/suburb/` page showed the correct "168 areas" count in its
      description but rendered zero tiles. Filled in, grouped into the same
      8 regions the migration already tags each suburb with; verified 1:1
      against the migration (168/168, no typos, no duplicates).
- [x] **Email Routing**: `hello@thecapetownhub.com` → `hubnetworksa@gmail.com`,
      Active.
- [x] **Resend** — domain verified (DKIM record present), `RESEND_API_KEY`
      set on the `thecapetownhub` Pages project, then a direct
      `wrangler pages deploy` forced so the secret took effect immediately
      rather than waiting for the next `main` push.
- [x] **DMARC** (`_dmarc.thecapetownhub.com` = `v=DMARC1; p=none;
      rua=mailto:hubnetworksa@gmail.com`) and **SPF** (merged to
      `v=spf1 include:_spf.mx.cloudflare.net include:amazonses.com ~all`,
      covering both Cloudflare's forwarding and Resend's sending) added.
- [x] **Outbound + inbound email pipeline confirmed end-to-end** — a
      throwaway account registered via `/api/register` on the live site,
      confirmed arriving at `hubnetworksa@gmail.com`, test user/session rows
      deleted from `thecapetownhub-db` afterward.
- [x] **Google OAuth Client for `thecapetownhub.com`** — created (redirect
      URI `https://thecapetownhub.com/api/auth/google/callback`),
      `GOOGLE_OAUTH_CLIENT_ID`/`GOOGLE_OAUTH_CLIENT_SECRET` set on the
      `thecapetownhub` Pages project, forced a fresh deploy, done
      2026-09-18.
- [x] Verify Google sign-in works end-to-end on `thecapetownhub.com` —
      confirmed 2026-09-18 (`/api/auth/google/start` redirects with the
      correct client_id/redirect_uri, and a real sign-in completed to
      `/my-businesses/`).
- [x] **Search Console** — added as a **Domain property** (`thecapetownhub.com`,
      covers all subdomains/protocols), verified via a DNS TXT record at the
      apex (`google-site-verification=azvy1BJdL6Yon3lgMOsjs4XzlNxCBwsvhyPx_kG1mho`),
      `sitemap-index.xml` submitted 2026-09-18. First fetch attempt showed
      "Couldn't fetch" (site/sitemap both verified fine directly — almost
      certainly caught mid-DNS-propagation), resubmitted after DNS settled.
      (`sites/capetown.json`'s `googleSiteVerification` field stays `null` and
      unused — same as Polokwane — since domain-property verification goes
      through DNS, not the meta-tag method that field feeds.)
- [ ] **AdSense ID needs fixing** — `sites/capetown.json`'s
      `adsensePublisherId` (`ca-pub-7239595592067933`) is currently a
      straight copy of Polokwane's, which conflicts with the "each site
      gets its own ID" decision below. Needs Cape Town's own approved
      publisher ID once it exists, not a shared one.
- [x] **Full flow smoke test on `thecapetownhub.com`** — confirmed
      2026-09-18, same pass as Pretoria/Polokwane's: register → submit
      (logged in, with owner email) → admin approve → owner confirm →
      published, with correct auto-link to the submitter's account
      (`owner_user_id` matched the registering user). Second business
      submitted anonymously with no email → published immediately with
      `owner_user_id` correctly `null`. Claimed by a second test user via
      the contact-info claim form → admin-approved via `/api/review-claim`
      → ownership correctly transferred. All test businesses/categories-
      links/users/sessions/claims/activity-log rows deleted afterward
      (verified 0 remaining).
- Old-site merge: N/A — unlike Pretoria/Polokwane, Cape Town has no prior
  standalone site/database; it was built fresh directly in hub-platform.

## hub-platform (Polokwane / Pretoria / Cape Town)

- [x] Set `GITHUB_DISPATCH_TOKEN` secret on all 3 Cloudflare Pages projects
      (polokwanehub, pretoriahub, thecapetownhub) — done and verified via a
      real workflow_dispatch test run on 2026-09-09.
- [x] Resend setup for Cape Town — done 2026-09-18 (see its cutover section
      above). All 3 sites now have `RESEND_API_KEY` set.
- [x] Custom 404 page — `src/pages/404.astro`, added 2026-09-15 (ported
      from the old Polokwane repo, site-aware, applies to all 3 sites).
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
- [ ] Search Console verification for Cape Town — domain is live now
      (2026-09-18 cutover), not yet done (Pretoria has its meta-tag code
      wired; Polokwane auto-verified via a carried-over DNS TXT record —
      see the per-site sections above).
- [x] GA4 for Polokwane (`G-QQL9HCKZNR`) and Cape Town (`G-JWEXFEXXW4`) —
      done 2026-09-09, each under its own separate Analytics account
      (fine for GA4, unlike AdSense).
- [x] Cape Town domain cutover — done 2026-09-18. All 3 sites now on their
      real domains.
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

**Done for Pretoria and Polokwane.** This whole system (accounts, claims,
My Businesses, Admin Dashboard, reports/activity log) is built into
hub-platform's shared codebase (`getSite(context.env.SITE)` / per-site
`sites/<slug>.json`, not hardcoded strings) and confirmed working end-to-end
on both live domains this session — register/login, Google OAuth, the
simplified claim flow (`functions/api/claim-business.ts`, contact-info based
rather than the old repo's document-upload version — see the 2026-09-15
commit simplifying this), `/admin/claims/`, My Businesses + edit page, the
"Claim it" button, and rebuild-trigger wiring
(`GITHUB_DISPATCH_TOKEN`, done 2026-09-09). Only remaining piece:

- [ ] Same setup for Cape Town — domain is live now (2026-09-18 cutover),
      so this can proceed: its own Google OAuth Client (redirect URI
      `https://thecapetownhub.com/api/auth/google/callback`), and the
      full submit/claim/admin-approve flow smoke test on that domain, same
      as the other two.
