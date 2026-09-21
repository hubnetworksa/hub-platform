# Routines plan: rewrite the existing routines, add the missing ones

Status as of 21 September 2026 (routines below are planned or written but none are scheduled yet). Scope: TheCapeTownHub, PretoriaHub and PolokwaneHub. **[Me]** = I build it. **[You]** = needs your accounts or a decision.

The aim: every routine does only the work that is needed, uses as little of the AI agent (and as few database reads) as possible, and tells you when it fails.

## 1. What exists today

| Routine | Runs | Does what | Where |
|---|---|---|---|
| **Business routine** (one per city) | Hourly cloud agent | Five jobs: (1) discover new businesses, 3 suburbs per run; (2) discover shopping centres and their tenants; (3) sweep one shopping centre's own website; (4) enrich descriptions and hours of existing businesses; (5) check for permanently closed businesses. Writes a SQL file to `db/routine-updates/<city>/`. | `ROUTINE.capetown.md` (903 lines), `ROUTINE.pretoria.md` (720), `ROUTINE.polokwane.md` (922) |
| **Events routine** (one per city) | Weekly cloud agent | Finds upcoming public events and proposes them for the Events page. | `ROUTINE.events.<city>.md` (144 lines each) |
| **News routine** (one per city) | Daily cloud agent | Writes the day's local news articles. Checked by `npm run check:news` before pushing. | `ROUTINE.news.<city>.md` (about 145 lines each) |
| **Fuel prices routine** (one for all three cities) | Monthly: first Wednesday, with two catch-up days | Loads the month's pump prices for all three sites in one run. Prices are split by region: Cape Town uses the **coastal** price, Pretoria and Polokwane use the **inland** price (Gauteng and Limpopo), so it reads both columns of the announcement once and writes eight rows (four grades x two regions) across the three cities. Split out of the news routine on 21 September because prices only change on the first Wednesday. Guarded by `scripts/fuel-due.mjs` so it does nothing on any other day. | `ROUTINE.fuel.md` |
| **Owner reminders** | Daily 07:00 UTC, GitHub Actions | Emails owners whose listing confirmation is outstanding. | `.github/workflows/owner-reminders.yml` |
| **Subscription expiry** | Daily 07:15 UTC, GitHub Actions | Expires paid plans and sponsorships that have lapsed. | `.github/workflows/subscription-expiry.yml` |

How agent output reaches the site: the agent commits a SQL file, and the deploy workflow (runs on every push to `main`) applies it to the live database, rebuilds the snapshot in `status/<city>/db-snapshot.json` and redeploys all three sites.

## 2. What is inefficient today

1. **Three near-identical business runbooks** (about 2,500 lines in total). An agent with no memory reads its whole runbook on every run, then works out which of the five jobs is due.
2. **Every run reads the full snapshot.** Pretoria's is 3.9 MB, Polokwane's 0.46 MB and Cape Town's 0.09 MB, read on every hourly run to check what already exists.
3. **The agent does mechanical work**: duplicate checks by phone and address, slug and category validation, SQL formatting, link checks. Scripts do these faster, more reliably and for free.
4. **Jobs run whether or not they are due.** Jobs 3, 4 and 5 often find nothing to do but still cost a read of the runbook.
5. **Every routine commit triggers a full production deploy** (three builds, each reading all three databases). With hourly routines across three cities that is many deploys a day. This very likely contributed to the Cloudflare D1 free read limit being hit on 20 September (to be confirmed from the deploy history).
6. **Failures are silent.** Nothing tells you when a routine has stopped or keeps failing.
7. **Gaps:** no scheduled database backup, no data-quality report, no refresh of the tourism page, no routine to collect business emails (needed for claim verification), no clean-up of passed events or stale news.

## 3. Principles for the rewrite

1. **Scripts first, agent for judgement only.** Anything a script can decide runs in GitHub Actions. The agent only finds and verifies new information.
2. **One shared runbook per routine type**, plus a small per-city config file (suburbs, sources, city name, tone). No more three copies.
3. **Run only what is due.** A cheap script decides which job needs to run, and the run ends early when nothing is due.
4. **Small inputs.** The agent reads a small slice (its suburbs, its batch), never the whole snapshot.
5. **Cadence follows value.** Fast-changing data (news) daily, slow-changing data (attractions, boundaries) monthly or yearly. Once a city's backlog is done, hourly runs slow down automatically.
6. **Batch the deploys.** Routine SQL is applied and the sites rebuilt once a day (plus on demand), not on every commit.
7. **Hard budget per run** (steps and time), one clear success line in the log, and a failure that you can see.
8. **Every write is idempotent and guarded** (already the rule today: one-time flags such as `description_enriched_at IS NULL`). Keep that.
9. **No agent ever touches the database directly**, exactly as today.

## 4. Target set of routines

### 4.1 Rewrite what exists

| Routine | New shape |
|---|---|
| **1. Business discovery** (job 1) | Own routine. A script picks the next suburbs and pre-computes the known businesses for just those suburbs (phone and address dedupe done by script, including neighbouring suburbs). Agent searches and verifies only. Runs hourly while a city has unfinished suburbs, then weekly. |
| **2. Shopping centres** (jobs 2 and 3 plus new-mall discovery) | Own routine, one centre per run: read that centre's own website, link or unlink tenants, and add tenants that are new businesses. Daily until every centre has been swept once, then weekly. New-mall discovery monthly. Jobs 2 and 3 share the same centre list and state, so they belong together. |
| **3. Description, hours and email enrichment** (job 4) | Own routine, daily batch. A script hands the agent the next batch of businesses that still lack enrichment (guarded by `description_enriched_at IS NULL`). For each one the agent rewrites the description, captures the trading hours **and finds the company's contact email**. Runs after discovery, never at the same time. Details of the email rule are below. |
| **4. Closed-business check** (job 5) | Own routine, weekly. Script-first: check the business's website and phone status; the agent only decides the unclear cases. Never deletes, only hides (as today). |
| **Events** | One shared runbook, weekly. Script drops events already past and skips sources unchanged since last run. |
| **News** | One shared runbook, daily, news only (fuel is now its own routine, done). Each source fetched once; `npm run check:news` must pass before push. Raise the 20-second fetch timeout that is flaky on the City of Cape Town site. |
| **Fuel prices** | Done: one runbook for all three cities (Cape Town coastal, Pretoria and Polokwane inland, researched once), monthly, and `scripts/fuel-due.mjs` stops the run on every day except the first Wednesday and the two catch-up days after it. Still to do: a small GitHub Action that runs the guard first and only starts the agent when it is due. |
| **Owner reminders, subscription expiry** | Keep as GitHub Actions. Review the schedule and add failure alerts. |

**Company emails in the enrichment routine (new rule)**

- Job 4 gains one more allowed write: setting `email` on an existing business, **only when `email` is empty** (`UPDATE ... SET email = ? WHERE id = ? AND (email IS NULL OR email = '')`). It never overwrites an email that is already there.
- **Only a company contact address that is published by the business itself:** its own website (contact page, footer, or schema markup) or its official listing. Generic role addresses such as info@, hello@, sales@ or accounts@ are fine. Personal addresses of named individuals, addresses found on third-party data-broker sites, and guessed addresses are never used.
- **Verification:** the address must appear on a page that also carries the business's name or phone number, and its domain should match the business's website when it has one. The agent records the page it came from in `source_urls`.
- **Purpose and privacy:** the email is used to send the ownership-verification link when someone claims the business (already built). It is not shown on the public pages today and should stay that way. Handle it under the POPIA wording in the Privacy page.
- Existing businesses that already have a description but no email are queued by the script for an email-only pass, so the whole directory gets covered, not just newly discovered businesses.
- The data health report tracks the share of businesses with an email per city (today 2 to 7%).

**Why splitting works, and how the pieces stay out of each other's way**

- Each routine has its own schedule, its own small runbook and its own state file (for example `discovery-state.json`, `centres-state.json`), instead of one shared `routine-state.json` that every job edits. That avoids merge conflicts when two routines commit close together.
- Writes stay narrow and guarded, exactly as the current runbook already requires: discovery only inserts new businesses; the centre routine only changes `shopping_center_id`; enrichment only changes `description`, `hours`, `description_enriched_at` and an empty `email`; the closed check only sets `closed_at` once.
- Ordering rule: enrichment and the closed check work on businesses that already exist, so they are scheduled to start after the discovery run for that city, not at the same minute.
- Each routine still uses one shared runbook for all three cities plus a city config, so this is four runbooks in total, not twelve.
- Jobs 2 and 3 are merged into one routine on purpose (same centre list and state). If you would rather have five, they can be split further, at the cost of loading the centre list twice.

### 4.2 New routines

| Routine | Purpose | Runs | Executed by |
|---|---|---|---|
| **Business emails and websites** | Keep website links honest (dead ones cleared, like the four cleared on 20 Sept) and collect a public contact email from each business's own site. Only 2 to 7% of listings have an email today, so most claims still need manual review instead of verification at the business inbox. | Weekly | Script; agent only for unclear cases |
| **Tourism refresh** | Re-check attraction prices, opening hours and closures on the Things to do page (the mockup's prices and times are placeholders to confirm) and propose new attractions. | Monthly, per city | Agent, with a script that diffs against the current content |
| **Database backup** | Export all three databases to storage, keep a set number of weeks. Replaces the manual launch-day backup. | Weekly | GitHub Action (`wrangler d1 export`) |
| **Data health report** | Counts of businesses with no category, hours, email or website, suburbs without an outline, and stale content. Shown on the admin overview. | Weekly | Script |
| **Tidy expired content** | Remove events that have passed and news older than the cut-off so pages never show old content. | Daily | Script |
| **Suburb boundaries** | Refresh the outlines used by the interactive map from the municipal open data. | Yearly | `scripts/fetch-official-boundaries.mjs` |
| **Guides** | Draft and refresh the five missing buyer's guides for your review. | Quarterly | Agent, human review before publish |
| **Link and smoke check on production** | Run `npm run check:links` and `npm run check:smoke` against the live sites and alert on any failure. | Weekly | GitHub Action |

## 5. Shared infrastructure to build [Me]

1. `routines/` folder: one runbook per routine type, `cities/<city>.json` per city, and `scripts/routines/*.mjs` for the mechanical steps.
2. `status/<city>/routine-state.json`: one schema for "what was last done and what is due" across all routines (today's file only tracks the suburb rotation).
3. **Per-suburb snapshot slices** so the agent reads kilobytes, not the 3.9 MB Pretoria file.
4. **Scheduled apply-and-deploy:** routine SQL is applied and the sites rebuilt once a day, with a manual "apply now" trigger. Builds reuse the saved snapshot and read only the tables they need.
5. **Routine health:** every run writes one summary line; a script reads the last runs and shows a green/amber/red tile per routine on the admin overview. Failures and "no run in N days" emailed to you through the website's own email.
6. **Run budgets:** each runbook states its maximum steps and time, and ends early when nothing is due.

## 6. Rollout order

| Phase | What | Result | Owner |
|---|---|---|---|
| **0. Stop the read waste** | Batched daily deploy, builds reuse the snapshot. Weekly database backup. | No more D1 read-limit surprises; automatic backups. | Me |
| **1. Visibility** | Routine health tile, failure emails, data health report. | You can see what each routine is doing. | Me |
| **2. Consolidate** | One shared runbook per type + city config; shared state schema; snapshot slices. | About 2,500 lines of near-copies become one runbook; smaller reads per run. | Me |
| **3. Move mechanical work to scripts** | Dedupe, validation, link and website checks, SQL checks, tidy-up. | Agent work shrinks to judgement only. | Me |
| **4. Add the new routines** | Business emails and websites, tourism refresh, expired content, boundaries, production checks, guides. | The gaps in section 2 are closed. | Me |
| **5. Turn on schedules** | Create the scheduled cloud agents for each city from the new runbooks; switch off the old ones only after two clean runs each. | Rewritten routines are live. | You (accounts), Me (runbooks) |

Acceptance for each phase: the routine runs cleanly twice in a row on the dev branch, its output passes the existing checks (`check:news`, link check, typecheck), and its health tile is green.

## 7. Decisions needed from you

1. **Business routine cadence:** keep hourly while a city has unfinished suburbs (recommended), or move to a fixed schedule?
2. **Cloudflare plan:** the $5 Workers Paid plan removes the D1 read limit; Phase 0 keeps you inside the free limit without it, but with little headroom on a busy day.
3. **Who reviews guides and tourism changes** before they publish (recommended: you approve, agents only draft).
4. **Alert address:** where should failure emails go?

## 8. Risks

- **Rewriting the business routine is the biggest change.** Mitigation: keep the old routines running until the new ones have two clean runs, and keep every write guarded and idempotent.
- **Free-tier limits** (D1 reads, GitHub Actions minutes, Resend email volume) tighten as more routines are added; Phase 0 and the health tile are there to watch them.
- **Source websites change or block automated access.** The health report flags a source that starts failing so it can be replaced.
