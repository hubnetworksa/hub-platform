# TheCapeTownHub daily research routine — runbook

You are a scheduled cloud agent. You have **zero memory of previous runs** —
everything you need to know is either in this file or in the repo's
`status/` files. Read this whole file before doing anything.

## What this project is

TheCapeTownHub is a business directory for the City of Cape Town metro.
Structured data (businesses, suburbs, categories) lives in a Cloudflare D1
database, not in git — **you do not have Cloudflare credentials and must
never try to run `wrangler d1 execute` yourself.** Instead:

- `status/capetown/db-snapshot.json` (committed to this repo) is a snapshot of
  current D1 state, refreshed after every deploy. Read it to know what
  already exists. It's compact JSON (no pretty-printing) and each business
  row deliberately omits `description` to keep this file cheap to read every
  run — job 4 is the only job that touches that column and always replaces
  it wholesale keyed off `description_enriched_at`, never reading the old
  text, so nothing here needs it.
- You propose changes by writing a SQL file to `db/routine-updates/capetown/`. A
  GitHub Actions workflow (which does have the Cloudflare credentials)
  applies any file it finds there to the real database on the next deploy,
  then regenerates the snapshot. Your job ends at "commit and push the SQL
  file" — you never touch the database directly.

**This site is brand new — expect near-empty runs at first.** Suburbs and
categories are seeded, but there are zero businesses and zero shopping
centres in D1 as of this routine's first run. Jobs 3, 4 and 5 all operate on
data those earlier jobs (or earlier runs) produce, so early runs will mostly
be job 1/2 suburb research with the other jobs quickly noting "nothing to do
yet" — that's expected, not a bug.

## Your five jobs, every run

**This routine mostly fetches new companies — it does not freely enrich or
edit existing listings.** If a business is already in
`status/capetown/db-snapshot.json`, leave its row alone entirely, even if you notice
it's missing a field — don't UPDATE it, **except** for the narrow,
explicit, logged carve-outs below. Every one of them touches only the
specific column(s) named, is tied to a specific job, and is tracked so
progress is visible.

1. Linking a *brand-new* business you're publishing this run to a shopping
   centre (see "Shopping centres" below) — `shopping_center_id` only.
2. Clearing `shopping_center_id` on an existing business during a
   **shopping centre official-site sweep** (job 3) when that centre's own
   website doesn't confirm the business as a tenant.
3. Setting `shopping_center_id` on an existing, previously-unlinked
   business during job 3 (or its new-mall discovery step) when that
   centre's own official site confirms it as a tenant.
4. Rewriting `description` (and setting `description_enriched_at`, and
   optionally `hours` and/or appending to `source_urls`) on an existing
   business during the **description enrichment sweep** (job 4) — see
   "Description enrichment sweep" below. Guarded by `description_enriched_at
   IS NULL` so it only ever happens once per business.
5. Setting `closed_at` on an existing business during the **closed-business
   check** (job 5) — see "Closed-business check" below. Guarded by
   `closed_at IS NULL` (nothing in `status/capetown/db-snapshot.json` ever carries a
   set `closed_at` in the first place — see that section for why) so it
   only ever happens once per business, and it's the only one of these five
   exceptions that removes a business from the live site rather than adding
   to it.

See "Shopping centre official-site sweep", "New-mall discovery sweep",
"Description enrichment sweep" and "Closed-business check" below for the
details of each. Nothing else about an existing row may ever change — not
the name, phone, address, or category, and not
`description`/`hours`/`source_urls` outside of job 4's own rule.

1. **Discover new businesses** in each of this run's suburbs (see "Which
   suburbs" below) that aren't in `status/capetown/db-snapshot.json` yet. **Before
   publishing anything as new, check the whole `businesses` array for the
   same business already existing under a different suburb — not just the
   suburb you searched under.** Cape Town has plenty of adjacent-suburb
   boundary risk (Sea Point/Green Point, Rondebosch/Mowbray, Bellville/Parow,
   to name a few) — a business right on a boundary street can plausibly get
   discovered and tagged under either neighbour on different runs. Same
   phone number or near-identical address for a business already in the
   snapshot — regardless of which suburb it's tagged under — means it's
   very likely the same business, not a new one; don't publish it again just
   because this run's search happened to surface it under a different
   suburb name. If in doubt, check each suburb's own `bio` for whether it
   names the other as a neighbour — that's usually a sign the boundary
   between them is exactly this kind of ambiguous.
2. **Discover shopping centres/malls** in those same suburbs (see
   "Shopping centres" below) and, for any you find (new or already known),
   discover their tenant businesses — tenants not yet in the dataset are
   new businesses too, so this is still job 1's kind of work, just scoped
   to a centre's directory instead of general search.
3. **Sweep one shopping centre's own official website** (see "Shopping
   centre official-site sweep" below) — this is a separate rotation from
   jobs 1-2, covering *every* shopping centre in the dataset over time
   (not just ones that happen to surface in this run's suburbs), and it's
   the only case where an existing business row's `shopping_center_id` may
   be changed. Once every full lap of this rotation, it also actively
   hunts for shopping centres you don't have at all yet, rather than
   waiting for job 2 to stumble onto one — see "New-mall discovery sweep"
   below. **Nothing to do here until `shopping_center_slugs` has at least
   one entry** — skip straight to jobs 1-2 on early runs.
4. **Description enrichment sweep** (see "Description enrichment sweep"
   below). Research a batch of existing businesses whose row was inserted
   with just a bare, fast-verified description (job 1/2's INSERTs are
   intentionally quick — a factual sentence and nothing more, to keep
   suburb throughput up) and rewrite each with something more specific,
   tracked via `description_enriched_at` so nothing is repeated and
   progress is visible over time. While researching each one, also capture
   its trading hours when you find them — the business page displays them
   right under the phone number and Google Maps button. **Nothing to do
   here until job 1/2 have actually published some businesses** — expect
   this to be empty on the very first run.
5. **Closed-business check** (see "Closed-business check" below) — the
   **lowest priority of the five**, only using turns left over after jobs
   1-2's suburb allocation is done. Works through a small batch of already-
   published businesses checking each one's Google Maps status, setting
   `closed_at` on any confirmed permanently closed — see that section for
   why this only ever hides a listing rather than deleting it.

Do jobs 1 and 2 for each suburb before moving to the next; jobs 3, 4 and 5
are independent of the suburb loop, using their own state (see below).
**Order this run's work as: job 4 first, then job 3, then jobs 1-2, then
job 5 with whatever turns remain** — jobs 3-5 all quickly no-op to "nothing
to do yet" on early runs (see above), so most early runs will really just be
jobs 1-2. Treat each suburb (jobs 1-2) as fully independent — finish one
(businesses, shopping centres, and logging, per "Logging your run" below),
**commit and push it** (see "Committing" below), and only then start the
next, rather than interleaving research across all of them or saving
everything up for one commit at the end of the run. If you run low on turns
partway through, whatever you've already committed is safe — you just won't
reach the remaining suburbs in `suburbs_per_run` this run, which is fine;
make sure `suburb_index` only reflects the suburbs you actually finished and
committed (see below). Given the job 4 > job 3 > jobs 1-2 > job 5 priority
order above, running short on turns should mean job 5 gets skipped
entirely and jobs 1-2 are the next to get trimmed this run (fine — both
are lower urgency than job 3 or job 4), not job 3 or job 4.

## Which suburbs this run covers

Read `status/capetown/routine-state.json`:

```json
{ "suburb_index": 0, "suburbs_per_run": 3, "suburb_slugs": ["cape-town-city-centre", "gardens", ...] }
```

This run's targets are `suburbs_per_run` consecutive entries starting at
`suburb_index`: `suburb_slugs[suburb_index]`,
`suburb_slugs[suburb_index + 1]`, ... wrapping around to the start of the
list if you reach the end. **As soon as you finish one suburb** (not at the
end of the whole run), advance `suburb_index` past it (wrapping modulo the
length of `suburb_slugs`) and commit that change together with that
suburb's SQL and log line — see "Committing". This is the entire mechanism
that spreads coverage across all suburbs over time — `suburbs_per_run`
suburbs per day, since this routine runs once daily. At 3 suburbs/run
across the 168 seeded suburbs, a full first pass takes roughly two months —
that's fine for a brand-new site; the owner can raise `suburbs_per_run` in
`status/capetown/routine-state.json` later if faster initial coverage is wanted.

## A known environment limitation — check this FIRST, don't rediscover it

This sandbox's network egress policy blocks WebFetch/curl to most domains —
only npm/pypi/GitHub/Anthropic's own API are reachable; business websites,
Facebook, even Wikipedia typically return a 403 from the egress proxy.
**Do one cheap check at the very start of the run** (one WebFetch to any
real source) to see whether this is still the case — don't burn many turns
retrying different domains or debugging the proxy if the first one fails,
that's already a known, understood state (confirmed true for the Polokwane
and Pretoria sister routines on this same infrastructure).

If WebFetch is blocked: **fall back to verifying against WebSearch result
snippets directly** (WebSearch is an Anthropic-hosted call, not a raw
fetch from this sandbox, so it works regardless). A snippet counts as a
source only if it **explicitly and literally states** the fact you're
using it for — a phone number actually printed in the snippet, an address
actually printed in the snippet — never inferred from surrounding context
or a business's general reputation. If WebFetch does work for a given
domain, prefer it (a fully fetched page is stronger evidence than a
snippet) — just don't let a handful of blocked domains stall the run.

## The verification rule (non-negotiable)

**Never invent or guess a fact.** Every field you write — name, address,
phone, description — must trace back to something you actually read
(a fetched page, or, per the fallback above, an explicit WebSearch
snippet) — not something you inferred or assumed plausible.

- **Google Maps, Google Places, and Google Search result content are
  allowed sources** — use them like any other source, same rules as
  everything else: a fact only counts if it's actually stated in what you
  read (a fetched page, or an explicit WebSearch snippet per the fallback
  above), never inferred. Also use general web search and other real
  pages: news articles, the business's own website, Facebook/Instagram
  business pages, other directory sites, Chamber of Commerce listings, etc.
  OpenStreetMap/Overpass is not a source for this routine — don't query it.
- **New business, to publish:** need at least 2 independent sources (fetched
  pages and/or explicit WebSearch snippets, per the fallback above)
  agreeing on the same name + rough location. If you only find one source,
  or the sources disagree, **discard it — do not write anything, do not
  queue it anywhere.** It's fine to rediscover it on a future run when
  better sources might exist.
- **Both a phone number AND a street address are mandatory to publish.**
  If your sources give you a name and rough location but are missing
  either field, **do not publish it** — discard it the same as a
  single-sourced business. It's fine to rediscover it on a future run if
  both turn up then. Cross-check that the phone number and address
  actually belong to *this specific location*, not just a business with
  the same name somewhere else — chains repeat constantly in this data
  (multiple Steers, KFC, Woolworths Food branches across the metro), so a
  phone number for "the Woolworths in Cape Town" is worthless if there are
  dozens of them and you can't tell which one your source means. If you
  can't confidently pin either field to this exact branch, treat it as not
  having that field, and don't publish.
- **Never name an individual in a description.** Don't write the owner,
  founder, director, partner, or an individual practitioner's personal
  name into `description` — not even when a source states it plainly, and
  not for doctors/dentists/attorneys whose names are on public
  professional registers. Describe what the business *does*, not who runs
  it: "an owner-managed gym", "a general practice", "founded in 2013", "a
  family-run bakery" are all fine; "run by Jane Doe", "founded by Dr John
  Smith" are not. The business's own registered name is not covered by
  this even when it contains a person's name (e.g. a practice literally
  called "Dr VH Meintjes") — use the name as it appears in the `name`
  field, just don't expand initials to a full name or add first names it
  doesn't already show.
- If in doubt, skip it. A smaller number of correct additions beats a
  larger number of half-confident ones — there is no human reviewing your
  output before it goes live on a real public site.

## Category and suburb slugs are fixed

Only use `category_slug` and `suburb_slug` values that already appear in
`status/capetown/db-snapshot.json`'s `categories`/`suburbs` arrays. Never invent a
new category or suburb slug. Unlike the Polokwane sister routine, this
site has no dedicated `banks-atms` category as of this routine's first
run — file bank branches and ATMs under `financial-investment-services`
until/unless the owner adds one.

## Shopping centres

`status/capetown/db-snapshot.json`'s `shopping_centers` array lists every known
mall/shopping centre (slug, name, suburb_slug, address) — empty at first,
since none are seeded; job 1/2 populate it as they go. Each business in
the `businesses` array also carries `shopping_center_slug` (null if it
isn't inside one) — that's how you tell which tenants are already known
for a given centre.

For each of this run's suburbs:

- **New shopping centre:** if your business research turns up a
  multi-tenant mall/centre in that suburb not already in
  `shopping_centers`, add it (see SQL below) — a shopping centre needs the
  same 2-independent-sources bar as a new business (see "The verification
  rule").
- **Tenant discovery, new or existing centre — go through the whole
  directory, not a sample:** once a suburb's shopping centre is known
  (whether it was already in the snapshot or you just added it this run),
  find its full tenant list — most centres publish a complete store
  directory on their own website (a "stores"/"store directory" page) or
  Facebook page. Read/fetch that whole list, not just the first handful of
  results a search happens to surface. Cross-reference every name on it
  against `status/capetown/db-snapshot.json`'s businesses already carrying that
  centre's `shopping_center_slug` to get the **missing set** — the tenants
  on the directory that aren't in the dataset yet — and work through all of
  them, not just a few, before moving on to the next suburb or centre. The
  directory page itself counts as one source per tenant; you still need a
  second independent source per *individual business* to publish it, same
  as any other new business (the tenant's own site, a news mention, a
  different directory, etc.). Skip any tenant you can't clear that bar for
  — it's fine to leave an unverifiable one for a future run — but don't
  stop working the list early just because you've already added a few; keep
  going until you've checked every name on the directory or run out of
  turns for this run. If a centre's directory is large, write and commit in
  batches of roughly 10 verified tenants at a time rather than holding
  everything until the whole centre is done — see "Committing".
- Link every business you place inside a centre with `shopping_center_id`
  in the same INSERT (see below) — don't create it as a plain business and
  leave the link for later.
- A business found through general suburb research (job 1) that turns out
  to be inside a known shopping centre should also get `shopping_center_id`
  set, even though you found it via general search rather than the
  centre's directory.

## Shopping centre official-site sweep (job 3)

This is a **separate rotation from suburbs**, and its whole point is
different from job 2's opportunistic tenant discovery: a shopping centre's
own official website (its own domain, not a directory/aggregator/review
site) is the **single authoritative source for who its tenants are** —
more authoritative than GPS proximity (linking a business to a centre just
because its coordinates land nearby produces real bugs — a business
across the road, or in the strip mall next door, gets mislinked) and more
authoritative than a tenant's own scraped address text claiming to be "at
Example Mall" (a business's own address line can say "at X Mall" while the
mall's own tenant directory doesn't list it at all — when they disagree, the
mall's own site wins). Job 2 finds
centres and tenants opportunistically while researching a suburb; job 3
guarantees every centre eventually gets this authoritative, no-other-way
reconciliation, regardless of whether it happens to come up in suburb
research.

**Nothing to do here until `shopping_center_slugs` has at least one
entry** (empty at first — see "Shopping centres" above) — skip straight to
jobs 1-2 until job 1/2 have added the first centre or two.

**Design note (carried over from the Polokwane/Pretoria sister
routines):** once a centre has been swept and comes back with no official
site (or a site on the blocked-domain list), its status is very unlikely to
change run to run — re-sweeping the same already-checked centres every
single run wastes turns on something structurally unlikely to have
changed. The two-tier system below avoids that from day one: brand-new,
never-swept centres get checked immediately (every run, no delay), but
already-swept centres — whatever their last outcome — only get
re-verified on a slow throttle, freeing job 3's slot most runs to fall
straight through to jobs 1-2.

Read `status/capetown/routine-state.json`'s `shopping_center_slugs_pending`,
`shopping_center_slugs` (every shopping centre ever known — append-only,
see "Keeping `shopping_center_slugs` current" below),
`shopping_center_index` and `shopping_center_recheck_countdown`.

1. **If `shopping_center_slugs_pending` is non-empty**, this run's target
   is `shopping_center_slugs_pending[0]` — a centre that has never had a
   job-3 sweep at all (brand new, from job 2 or the new-mall-discovery
   sweep). Always clear the pending queue before touching the recheck
   cadence below — a centre nobody has ever looked at takes priority over
   re-verifying one that's already been checked. Once this run's sweep
   (steps 1-4 below) is done and logged, remove that slug from the front
   of `shopping_center_slugs_pending` regardless of outcome — a centre
   never gets swept via this path twice; from then on it's part of the
   ordinary recheck rotation below like everything else.
2. **Otherwise**, decrement `shopping_center_recheck_countdown` by 1.
   - If it's still above `0` after decrementing: job 3 has nothing to do
     this run beyond saving that decremented number — log nothing extra,
     commit the state change with whatever else this run produces, and
     move straight to jobs 1-2.
   - If it hits `0`: this run's target is
     `shopping_center_slugs[shopping_center_index]` (wrapping modulo the
     list's length) — do one full sweep (steps 1-4 below) on it, then
     reset `shopping_center_recheck_countdown` to `30` (roughly once a
     month, since this job fires once a day) and advance
     `shopping_center_index` (wrapping). This is the only case that
     actually runs the sweep steps below.

For that one shopping centre (whichever rule above selected it):

1. **Find its own official website.** Search `"<centre name>" official
   website` or `"<centre name>" store directory <suburb>`. If you can't
   find a real, distinct website for this centre (a listing on a
   directory/aggregator site like Yellow Pages, Facebook-only
   presence, or nothing at all doesn't count) after a reasonable search,
   **stop here** — log it with `official_site_found: false` and zero
   counts (see "Logging and committing" below for what state to save) and
   move on. Not
   every `shopping_centers` row is a real multi-tenant mall — some are
   single-shop or brand-name entries that get miscategorised (e.g. a fuel
   station chain name) and will never have a "mall website"; that's an
   expected, fine outcome, not an error.
2. **Fetch its tenant/store list.** Most real malls have a "Stores",
   "Tenants", or "Store Directory" page (smaller centres sometimes just list
   their tenants on the homepage). Read the whole list, not a
   sample. This job leans harder on WebFetch actually working than jobs 1-2
   do — a WebSearch snippet is rarely going to contain a whole store
   directory. If WebFetch is blocked for this domain (see "A known
   environment limitation" above) and WebSearch snippets can't give you the
   *complete* list with confidence, don't guess at partial coverage —
   treat it the same as "no official website found" (step 1) and move on;
   a partial, unconfirmed list is worse than no sweep at all here, since
   step 3 would then unlink real tenants just because they weren't visible
   in a snippet.
3. **Cross-reference against `status/capetown/db-snapshot.json`:**
   - Businesses in the snapshot with this centre's `shopping_center_slug`
     that **are not on the official list** at all: unlink them —
     `UPDATE businesses SET shopping_center_id = NULL WHERE slug = '<business-slug>';`
     (the snapshot only gives you slugs, not numeric ids — always address a
     row by its unique `slug`, resolving the centre's own id with a
     subquery when you need one, e.g. `(SELECT id FROM shopping_centers
     WHERE slug = '<centre-slug>')`) — one of this routine's narrow UPDATE
     exceptions (see "Your five jobs" above). Do **not** touch any other
     column on that row (name, phone, address, description, category) even
     if the official site suggests a different value for it — correcting
     an existing field is a human/interactive-session judgment call, out
     of scope here. Don't delete the row, just clear the link.
   - Tenants on the official list that **already exist in the snapshot as
     a standalone business** (matching name and roughly the right
     location/suburb) but aren't yet linked to this centre: **link the
     existing row rather than inserting a new one** —
     `UPDATE businesses SET shopping_center_id = (SELECT id FROM shopping_centers WHERE slug = '<centre-slug>') WHERE slug = '<business-slug>';`
     — the other narrow UPDATE exception. This is the common case for a
     business that was published by an earlier run's general suburb
     research (job 1), before this centre had ever been swept. Same
     don't-touch-other-columns rule as above; only `shopping_center_id`
     changes.
   - Tenants on the official list **not yet in the snapshot at all**:
     publish them as new businesses, same bar as job 2's tenant discovery —
     the centre's own official site counts as one source, you still need a
     second independent source per individual tenant (its own site,
     Facebook page, a news mention, etc.), and the same phone-and-address
     mandatory rule applies. Skip any tenant you can't clear that bar for.
   - Tenants on the official list that are already correctly linked:
     nothing to do.
4. **New shopping centre discovered mid-sweep:** if the centre's official
   site links to a related property you didn't know about (rare), that's
   out of scope for this job — leave it for job 2 to pick up naturally via
   suburb research, don't chase it here.

**Keeping `shopping_center_slugs` current:** whenever job 2 adds a brand
new shopping centre this run, append its slug to *both*
`shopping_center_slugs` (the permanent record — anywhere in the array,
order doesn't matter beyond being deterministic; never remove or reorder
existing entries) *and* `shopping_center_slugs_pending` (so it gets its
first sweep on the very next run rather than waiting for the recheck
countdown).

**Logging and committing:** whichever path above actually ran a sweep
(pending-queue or countdown-triggered), log and commit it exactly as
before (see "Logging your run" and "Committing" below) — `official_site_found: false` is still a fine, expected outcome, not an
error. A quiet run where the countdown just ticked down with no sweep at
all still needs `shopping_center_recheck_countdown`'s new value committed
in `status/capetown/routine-state.json` (bundle it with whatever suburb/job-4
commit this run already produces — it doesn't need a commit of its own).

## New-mall discovery sweep (roughly once a month)

Job 2 only finds new shopping centres opportunistically — a mall in
whatever suburb this run's suburb rotation happens to touch. This step
catches malls that job 2 never happens to surface, by actively hunting for
them, but it's a bigger, unscoped task, so it only runs on its own
throttle (see "Trigger" below), not every run.

**Trigger:** independent of job 3's own pending/recheck logic above —
decrement `status/capetown/routine-state.json`'s `new_mall_discovery_countdown` by
1 every run. When it hits `0`, do this discovery sweep now as an extra
step in the same run, before you commit, then reset it to `30` (roughly
once a month, since this job fires once a day). This runs on its own
schedule so a long recheck countdown (job 3 above) never delays hunting
for genuinely new malls.

1. Actively search for shopping centres/malls in the City of Cape Town
   metro that **aren't** in `status/capetown/db-snapshot.json`'s
   `shopping_centers` array yet (e.g. `"shopping centres" OR "malls" list
   Cape Town`, or target a suburb you know is dense with retail
   but thin in the snapshot's shopping-centre coverage). This is a genuine
   search, not a re-check of centres you already know.
2. For each new one you find, verified with the same 2-independent-source
   bar as any other new shopping centre (see "The verification rule" and
   "Writing the SQL file"): add it, then immediately run the exact same
   process as a normal job-3 sweep on it (steps 1-3 above) — find its own
   official site, fetch its tenant list, and reconcile against
   `status/capetown/db-snapshot.json`. **The existing-business-linking case (step
   3's second bullet) matters most here**: a mall you're only discovering
   now may have tenants that were already published as standalone
   businesses by earlier runs' general suburb research — link those
   existing rows rather than inserting duplicates.
3. Append every newly-added centre's slug to `shopping_center_slugs` (its
   permanent record) so it joins the normal recheck rotation going
   forward — **not** to `shopping_center_slugs_pending`, since step 2
   above already gave it its first sweep in this same run; adding it to
   the pending queue too would just repeat that sweep next run for
   nothing.
4. Log this as its own checkpoint (see "Logging your run" below) separate
   from the regular job-3 sweep line, then commit everything from this
   step together (including the reset `new_mall_discovery_countdown`).

If the search turns up nothing new, that's a fine, expected outcome — log
it with zero counts and still commit the reset countdown.

## Description enrichment sweep (job 4)

Job 1/2's INSERTs are intentionally quick — a real, factual one-sentence
description and nothing more, to keep suburb research throughput up (see
"Writing the SQL file" below). This job is the second pass: research a
batch of those businesses in more depth and rewrite each one with
something more specific, tracked via `description_enriched_at` so nothing
is repeated and progress is visible over time. **If the dataset currently
has no backlog** (nothing published yet, or every published row already
has `description_enriched_at` set), job 4 simply has nothing to do this
run — note that and move straight to job 3. Expect this to be the case for
a while on this brand-new site, since job 4 can only work with what job 1/2
have already published.

**Finding this run's batch:** in `status/capetown/db-snapshot.json`'s `businesses`
array, filter for `description_enriched_at` being `null` — that's the
entire backlog, no separate rotation list to maintain (unlike job 3's
`shopping_center_slugs`). Work through them in the order they appear in
the array (alphabetical by name) so progress is predictable and every run
picks up roughly where the last one left off. **Target up to 20 businesses
this run** — more if you have turns to spare and quality doesn't suffer,
fewer if a run is going slower than usual; the 10-record commit cap (see
"Committing" below) still applies regardless, so a 20-business batch will
usually span two commits.

**For each business in the batch:**

1. **Research it.** Search `"<name>" <suburb> Cape Town` and, if the
   business has a `website` or a
   real URL in `source_urls`, try fetching that directly — a business's
   own site is the best source for "what do they actually do." Look for:
   what they specialise in, notable products/services, how long they've
   operated, anything that distinguishes them from a same-category
   business down the road, **and its trading/opening hours** (a "Hours",
   "Contact Us", or "Opening Times" page/section, or a Google Business
   Profile snippet that states them). Same chain-branch caution as
   everywhere else in this file — confirm anything you use, hours
   included, is about *this specific location*, not a different branch of
   the same chain (chains often keep different hours per branch).
2. **Write the new description** — one to two natural sentences, specific
   to this business, not a template. **Never name an individual** (owner,
   founder, practitioner) — see "The verification rule" above. Two
   outcomes, both acceptable and both count as "enriched":
   - **Researched:** you found genuine new facts. Write them up naturally
     (not a bare fact-dump) and add whatever source(s) you used to
     `source_urls` — **append, don't replace**, so the original
     provenance record is preserved (existing entries stay; add the new
     one(s) alongside).
   - **Reworded:** you found nothing beyond what's already on file (small
     business, no web presence beyond the original listing — expect this
     to be common). It's fine to write a more natural, category-specific
     sentence using *only* already-verified fields (name, category,
     suburb, and whether it's inside a shopping centre) — e.g. "A
     hairdresser and beauty salon in Blue Route Mall, Tokai." rather than
     the bare job-1 sentence — but **don't invent anything new**, and
     don't touch `source_urls` in this case (nothing new to cite).
   - **Hours, independent of the above:** if you found genuine trading
     hours (from either outcome above), write them as one compact,
     human-readable line, e.g. `'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun
     Closed'` or `'Open 24 hours'` — collapse identical consecutive days
     (`Mon-Fri`, not four repeats) but otherwise keep it literal to what
     the source states, don't round or guess at gaps. If no hours turn up
     — expect this often, most small businesses don't publish them — leave
     the `hours` column untouched (don't write anything, don't guess);
     the site already shows "Trading hours not available" for any
     business with no `hours` value, so there's nothing to fill in.
3. **Write the UPDATE**, guarded so it only ever applies once:

   ```sql
   UPDATE businesses
   SET description = 'New, specific description here.',
       description_enriched_at = datetime('now')
   WHERE slug = 'example-business-suburbslug' AND description_enriched_at IS NULL;
   ```

   With hours found too:

   ```sql
   UPDATE businesses
   SET description = 'New, specific description here.',
       description_enriched_at = datetime('now'),
       hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
   WHERE slug = 'example-business-suburbslug' AND description_enriched_at IS NULL;
   ```

   Or, for the "researched" case where you're also appending a source
   (hours included or not, independently):

   ```sql
   UPDATE businesses
   SET description = 'New, specific description here, citing what you found.',
       description_enriched_at = datetime('now'),
       hours = 'Mon-Sat 08:00-18:00, Sun 09:00-14:00',
       source_urls = '["https://original-source.example", "https://new-source-you-found.example"]'
   WHERE slug = 'example-business-suburbslug' AND description_enriched_at IS NULL;
   ```

   (`source_urls` here is the **full new array**, computed by you from the
   snapshot's current value plus the new URL(s) — the routine doesn't have
   a JSON-append SQL function to lean on, so write out the whole array.
   Omit the `hours =` line entirely from the UPDATE when you didn't find
   any — don't write `hours = NULL`, which would be indistinguishable from
   "not yet checked" versus "checked, has none," except this job never
   revisits a row anyway once `description_enriched_at` is set, so it
   doesn't actually matter which — omitting is just the clearer SQL.)

Do **not** touch `name`, `phone`, `address`, `category`, `lat`/`lng`, or
anything else on the row — this job's only columns are `description`,
`description_enriched_at`, `hours`, and (sometimes) `source_urls`. If you
notice one of those other fields looks wrong while researching, that's not
this job's problem to fix — leave it.

**Logging and committing:** same pattern as job 3 — see "Logging your run"
and "Committing" below for the exact checkpoint format. There's no index
to advance for this job (it's driven entirely by `description_enriched_at
IS NULL`, which naturally shrinks as runs complete), so a job-4 checkpoint
just needs its SQL file, its log line(s), and nothing else state-related.

## Closed-business check (job 5) — lowest priority, only with leftover turns

Businesses do shut down, and a listing with a dead phone number or a
"Permanently closed" Google Maps tag is exactly the kind of thing that
makes a directory look unmaintained. This job works through the published
dataset in a slow, perpetual loop — unlike job 4's backlog, it never
"finishes"; once it reaches the end it wraps around and starts again, since
a business that was open last month could have closed since. It only runs
at all if jobs 1-2 finished this run with turns to spare (see priority
order above) — treat it as pure background hygiene, never worth cutting a
suburb short for. **Nothing to check until job 1/2 have published some
businesses** — expect this to be empty for a while on this brand-new site.

**Never deletes a row.** A false match here (wrong branch of a chain, a
same-named business in a different suburb, a Google Maps listing that's
just temporarily/seasonally closed rather than permanently) would
otherwise be a silent, irreversible loss of verified data with no human
in the loop to catch it — a meaningfully bigger risk than this routine's
other UPDATE exceptions, which only ever add a link or replace a
description. Instead it sets `closed_at`, a nullable timestamp column;
`scripts/fetch-d1-data.mjs` excludes any row with `closed_at IS NOT NULL`
from what gets built into the live site, so a confirmed-closed business
disappears everywhere (listings, search, sitemap) immediately on the next
deploy, and its own `/business/<slug>/` page correctly 404s from then on
— but the row itself, and everything you'd researched about it, is still
sitting in D1 for a human to restore in one UPDATE if this job ever gets
a match wrong.

**Finding this run's batch:** read `status/capetown/routine-state.json`'s
`closed_check_last_slug` and `closed_check_batch_size` (normally `5`).
`status/capetown/db-snapshot.json`'s `businesses` array is alphabetical by name and
never contains an already-closed business (they're excluded from the
build the same way, so they never make it into the snapshot either) — find
`closed_check_last_slug` in that array (empty string / not found means
start from the beginning) and take the next `closed_check_batch_size`
entries after it, wrapping to the start of the array if you run off the
end. This "resume after last slug" approach (rather than a raw numeric
index) is deliberate: the array's length and order shift every run as
other jobs add new businesses or this job removes closed ones, so a plain
index would drift out of sync with what it's actually pointing at.

**For each business in the batch:**

1. Search `"<name>" "<suburb>" Cape Town` (or `"<name>" <address>`) and
   look for an explicit "Permanently closed" status — either fetch the
   business's Google Maps listing directly if you can, or (per "A known
   environment limitation" above) accept a WebSearch snippet only if it
   *literally* shows the "Permanently closed" tag for a listing that
   clearly matches this exact business at this exact address, not just a
   same-named business somewhere else. Same chain-branch caution as
   everywhere else in this file — a phone number or Maps pin for "the
   other branch" doesn't count.
2. **If confirmed permanently closed:**
   ```sql
   UPDATE businesses SET closed_at = datetime('now')
   WHERE slug = 'example-slug-suburbslug' AND closed_at IS NULL;
   ```
   Guarded so it only ever happens once, same pattern as job 4.
3. **If still open, or you can't confirm closure with confidence:** do
   nothing to the row — no SQL, no field changes. It's fine to re-check it
   again on some future lap of this rotation; a false "still open" costs
   nothing, unlike a false "closed".

**Advancing the cursor:** after this run's batch (whatever the mix of
confirmed-closed and still-open outcomes), set `closed_check_last_slug` to
the slug of the *last* business you checked this batch (even the ones that
turned out still-open) so the next run picks up right after it. If the
batch wrapped around the end of the array, the new value is simply the
last slug you reached after wrapping.

**Logging:** one log line per batch, whether or not anything closed:

```json
{"date": "2026-10-01T10:00:00Z", "action_taken": "closed_business_check", "checked": 5, "closed": 1, "short_summary": "Checked 5 businesses starting after 'example-earlier-shop-suburbslug' -- confirmed 'example-old-shop-suburbslug' permanently closed on Google Maps, the other 4 still open. closed_check_last_slug now 'example-old-shop-suburbslug'."}
```

**Committing:** bundle this job's SQL (if any business closed) and log
line with whatever other commit this run already makes (a suburb
checkpoint, job 3's sweep, etc.) rather than giving it a commit of its
own — it's cheap enough per run that a dedicated push isn't warranted,
unlike job 4's larger batches.

## Writing the SQL file

Each checkpoint (see "Committing" below) gets its own new file:
`db/routine-updates/capetown/<UTC timestamp, e.g. 2026-10-01T10-00-00>.sql`. Every
statement must be safely re-runnable (idempotent) since the apply step may
run more than once:

**New business (not in a shopping centre):**

```sql
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'example-slug-suburbslug', 'Example Name',
  (SELECT id FROM suburbs WHERE slug = 'suburbslug'),
  '123 Example St', '021 345 6789', NULL, NULL,
  'Example Name is a <one-sentence factual description>, in <suburb>.',
  NULL, NULL,
  '["https://real-source-one.example", "https://real-source-two.example"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'example-slug-suburbslug'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
```

Slug format: `slugify(name) + '-' + suburb_slug` (lowercase, non-alphanumeric
runs collapsed to single hyphens). If that slug is already in the snapshot,
append `-2`, `-3`, etc.

**New shopping centre:**

```sql
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'example-mall-suburbslug', 'Example Mall',
  (SELECT id FROM suburbs WHERE slug = 'suburbslug'),
  '456 Example Rd', NULL, NULL,
  '["https://real-source-one.example", "https://real-source-two.example"]',
  'mall'
);
```

Same slug format as businesses (`slugify(name) + '-' + suburb_slug`). Use
`lat`/`lng` only if a source actually gives coordinates — leave `NULL`
otherwise, same as for businesses.

**New business, tenant of a shopping centre (new or existing):**

Same as the plain business INSERT, but add `shopping_center_id`:

```sql
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tenant-slug-suburbslug', 'Tenant Name',
  (SELECT id FROM suburbs WHERE slug = 'suburbslug'),
  (SELECT id FROM shopping_centers WHERE slug = 'example-mall-suburbslug'),
  'Shop 12, Example Mall, 456 Example Rd', '021 345 6789', NULL, NULL,
  'Tenant Name is a <one-sentence factual description>, in Example Mall, <suburb>.',
  NULL, NULL,
  '["https://mall-directory.example/tenant-name", "https://second-source.example"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tenant-slug-suburbslug'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
```

Same phone-and-address bar as any other new business — the mall directory
page alone doesn't give you a phone number, so still track one down for
each tenant before publishing it (a shop number/unit within the mall's own
address counts as the address requirement).

**Unlinking an unconfirmed tenant (job 3 only):**

```sql
UPDATE businesses SET shopping_center_id = NULL WHERE slug = 'example-business-suburbslug';
```

**Linking an existing, previously-unlinked tenant (job 3 or its new-mall
discovery step only):**

```sql
UPDATE businesses
SET shopping_center_id = (SELECT id FROM shopping_centers WHERE slug = 'example-mall-suburbslug')
WHERE slug = 'example-business-suburbslug';
```

These are the only `UPDATE`s that touch `shopping_center_id` — both only
during a job 3 official-site sweep (or its new-mall discovery step), on
the terms described in "Shopping centre official-site sweep" and
"New-mall discovery sweep" above. The routine writes two other kinds of
`UPDATE`, each scoped to its own job and its own narrow set of columns:
job 4's description/`description_enriched_at`/`hours`/`source_urls`
rewrite (see "Description enrichment sweep") and job 5's `closed_at` flag
(see "Closed-business check"). Every other SQL statement this routine
writes is an `INSERT` for a brand-new business or shopping centre (per
"Your five jobs, every run" above) — nothing else about an existing row is
ever touched, and no `UPDATE` this routine writes ever spans more than
one of these five narrow exceptions at a time.

## Logging your run

Append one line **per checkpoint** (per suburb, per shopping-centre batch —
see "Committing") to `status/capetown/agent-log.jsonl` (create if missing), as part
of that checkpoint's commit:

```json
{"date": "2026-10-01T10:00:00Z", "suburb": "rondebosch", "action_taken": "research", "published_new": 3, "discarded_unverified": 4, "shopping_centers_added": 1, "short_summary": "Rondebosch: added 3 new businesses (all with verified phone numbers), added Example Centre with 2 verified tenants."}
```

`published_new` includes tenant businesses added inside a shopping centre —
don't double-count them separately. `shopping_centers_added` is the count
of new shopping-centre rows this suburb contributed this run (0 if none).

`short_summary` should be plain language, no housekeeping narration — what
changed and why, for a human skimming the log.

**Job 3 (shopping centre official-site sweep)** gets its own log line,
separate from any suburb lines this run also produced. `tenants_linked` is
the count of *existing* businesses that got `shopping_center_id` set
(distinct from `tenants_added`, which is brand-new business rows):

```json
{"date": "2026-10-05T10:00:00Z", "shopping_center": "example-mall-rondebosch", "action_taken": "shopping_center_sweep", "official_site_found": true, "tenants_added": 12, "tenants_linked": 1, "tenants_unlinked": 3, "discarded_unverified": 0, "short_summary": "Example Mall: reconciled against its own site (examplemall.co.za) -- added 12 confirmed tenants, linked 1 already-existing business, unlinked 3 that weren't on the mall's own list."}
```

If no official website was found: `"official_site_found": false,
"tenants_added": 0, "tenants_linked": 0, "tenants_unlinked": 0"` and a
short summary saying so (e.g. "no official website found, likely a
miscategorised entry").

**The new-mall discovery sweep** (its own monthly throttle — see "New-mall
discovery sweep" above) gets its own log line too, when it runs:

```json
{"date": "2026-11-01T10:00:00Z", "action_taken": "new_mall_discovery", "shopping_centers_found": 2, "tenants_added": 5, "tenants_linked": 3, "short_summary": "Found 2 new shopping centres not previously in the dataset (Example Plaza, Another Centre) via active search; reconciled both against their own sites -- 5 new tenants added, 3 already-existing businesses linked to their centre."}
```

If nothing new was found: `"shopping_centers_found": 0` and a short
summary saying so.

**Job 4 (description enrichment sweep)** gets its own log line per
checkpoint (there may be more than one per run if the batch spans multiple
10-record commits — see "Committing" below). `researched` is the count
written with genuine new facts (and a new source appended); `reworded` is
the count rewritten from already-known fields only; `hours_found` is how
many of this checkpoint's businesses also got a real `hours` value:

```json
{"date": "2026-10-10T10:00:00Z", "action_taken": "description_enrichment", "researched": 6, "reworded": 9, "hours_found": 4, "remaining_backlog": 41, "short_summary": "Rewrote 15 descriptions -- 6 with new facts found via research (added a source for each), 9 reworded from existing category/suburb data only (no web presence found beyond the original listing). Trading hours found and recorded for 4 of the 15."}
```

`remaining_backlog` is the count of businesses still showing
`description_enriched_at: null` in the snapshot *before* this checkpoint's
SQL is applied (i.e. including the ones this checkpoint is about to fix) —
a simple running total the owner can watch shrink across runs. Compute it
by counting `businesses` entries in `status/capetown/db-snapshot.json` with a null
`description_enriched_at`.

**Job 5 (closed-business check)** gets its own log line whenever it runs
(which isn't every run — see "Closed-business check" above for the
priority rule) — see that section for the exact format and an example.

## Committing — every 10 records, never one big commit at the end

**Hard rule: never let more than 10 records go uncommitted-and-unpushed.**
A "record" is one row you've written a SQL statement for — one new
business INSERT, one new shopping-centre INSERT, one job-3 link/unlink
UPDATE, or one job-4 description-rewrite UPDATE counts as one record each.
The moment you hit 10 records since your last push (even mid-suburb,
mid-centre, or mid-batch), stop, write the SQL file, and push — don't wait
for a natural boundary like finishing a suburb.

On top of that 10-record cap, also commit and push at these natural
boundaries even if you haven't hit 10 yet:

- After finishing both jobs for **one suburb** (jobs 1-2).
- After finishing **each shopping centre's** tenant sweep (job 2's
  opportunistic version).
- After finishing **job 3's sweep** for this run, on the runs where one
  actually happens (a pending-queue centre, or the recheck countdown
  hitting `0`) — its own commit, separate from any suburb commits this run
  also produced, with whichever of `shopping_center_slugs_pending` /
  `shopping_center_index` / `shopping_center_recheck_countdown` changed
  included. On a quiet run where job 3 only decremented the countdown,
  that single-number change just rides along in whatever other commit
  this run already makes — it doesn't need a commit of its own.
- After finishing the **new-mall discovery sweep**, on the runs where it
  fires (its own monthly throttle) — its own commit, separate from any
  job-3 commit this run also produced, with the reset
  `new_mall_discovery_countdown` included.
- After finishing **job 4's whole batch** for this run (up to the
  ~20-business target) — its own commit(s), separate from job 3 and any
  suburb commits this run also produced. Since 20 exceeds the 10-record
  cap, this normally means two job-4 commits per run rather than one, on
  runs where the backlog is that large.
- **Job 5 doesn't get its own commit** — bundle its small batch (if it ran
  at all this run) into whatever other commit this run already makes, per
  "Closed-business check" above.

So a checkpoint is whichever comes first: 10 records, or a natural
boundary above. A quiet suburb with only 2 records still gets its own
push at the boundary; a single shopping centre with 30 verified tenants
gets pushed three times (in batches of 10) before its boundary push.

Rationale: a run can be cut short (turn limit, session limit, a crash) at
any point, same as any other run — committing every 10 records means
whatever work already cleared verification is saved to the repo (and
picked up by the next deploy) even if the run doesn't reach the end of its
batch, rather than losing more than 10 records' worth of work at once.

Each commit: write a new `db/routine-updates/capetown/<UTC timestamp, e.g.
2026-10-01T10-00-00>.sql` file scoped to just that checkpoint's inserts
(one file per commit — don't reuse or append to a file from an earlier
commit this run), append the corresponding `status/capetown/agent-log.jsonl`
line(s) for what that checkpoint covered, and update `suburb_index` in
`status/capetown/routine-state.json` if that checkpoint completed a suburb;
`shopping_center_slugs_pending` and/or `shopping_center_index` /
`shopping_center_recheck_countdown` if it completed (or merely
decremented toward) a job-3 sweep; `shopping_center_slugs` and
`new_mall_discovery_countdown` if it completed the new-mall discovery
step; or `closed_check_last_slug` if job 5 ran this checkpoint. Stage exactly those files — the new SQL file, `status/capetown/agent-log.jsonl`,
`status/capetown/routine-state.json` — with a one-line commit message describing
that checkpoint, and push to `main`. Do not touch any other files.

If a checkpoint had nothing worth publishing (no new businesses cleared the
bar, no new tenants found), still commit its log line with zero counts and
its index advance — don't skip the commit just because the result was
empty. Only leave an index un-advanced for work you didn't actually get to
this run.
