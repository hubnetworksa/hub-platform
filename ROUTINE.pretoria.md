# PretoriaHub research routine — runbook (every 3 hours)

You are a scheduled cloud agent. You have **zero memory of previous runs** —
everything you need to know is either in this file or in the repo's
`status/` files. Read this whole file before doing anything.

## What this project is

PretoriaHub is a business directory for Pretoria, Centurion and the greater
Tshwane metro. Structured data (businesses, suburbs, categories) lives in a
Cloudflare D1 database, not in git — **you do not have Cloudflare
credentials and must never try to run `wrangler d1 execute` yourself.**
Instead:

- `status/pretoria/db-snapshot.json` (committed to this repo) is a snapshot of
  current D1 state, refreshed after every deploy. Read it to know what
  already exists. It's compact JSON (no pretty-printing) and each business
  row deliberately omits `description` to keep this file cheap to read every
  run — job 4 is the only job that touches that column and always replaces
  it wholesale keyed off `description_enriched_at`, never reading the old
  text, so nothing here needs it.
- You propose changes by writing a SQL file to `db/routine-updates/pretoria/`. A
  GitHub Actions workflow (which does have the Cloudflare credentials)
  applies any file it finds there to the real database on the next deploy,
  then regenerates the snapshot. Your job ends at "commit and push the SQL
  file" — you never touch the database directly.

## Your four jobs, every run

**This routine mostly fetches new companies — it does not freely enrich or
edit existing listings** (per owner decision 2026-09-01; there used to be
an unscoped, unlogged enrichment job and a dataset-wide backlog sweep, both
removed for being too loose). If a business is already in
`status/pretoria/db-snapshot.json`, leave its row alone entirely, even if you notice
it's missing a field — don't UPDATE it, **except** for the narrow,
explicit, logged carve-outs below. Every one of them touches only the
specific column(s) named, is tied to a specific job, and is tracked so
progress is visible — that's what makes them different from the old
removed job.

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

See "Shopping centre official-site sweep", "New-mall discovery sweep", and
"Description enrichment sweep" below for the details of each. Nothing else
about an existing row may ever change — not the name, phone, address, or
category, and not `description`/`hours`/`source_urls` outside of job 4's
own rule.

1. **Discover new businesses** in each of this run's suburbs (see "Which
   suburbs" below) that aren't in `status/pretoria/db-snapshot.json` yet.
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
   below.
4. **Description enrichment sweep** (see "Description enrichment sweep"
   below) — **this is the current top priority, per owner request
   2026-09-02: do this job first, before jobs 1-3, every run, until the
   backlog is cleared.** Research a batch of existing businesses that
   still carry the generic bulk-import description and rewrite each one
   with something specific to that business, tracked via
   `description_enriched_at` so nothing is repeated and progress is
   visible over time. While researching each one, also capture its
   trading hours when you find them (per owner request 2026-09-02) — the
   business page displays them right under the phone number and Google
   Maps button.

Do jobs 1 and 2 for each suburb before moving to the next; jobs 3 and 4 are
independent of the suburb loop — each is done once per run (job 3 for one
shopping centre, job 4 for a batch of businesses), using their own state
(see below). **Order this run's work as: job 4 first, then job 3, then
jobs 1-2 with whatever turns remain** — job 4 is the current priority (see
above), job 3 is the next most valuable dedicated rotation, and jobs 1-2
are the steady-state background work that can absorb whatever's left.
Treat each suburb (jobs 1-2) as fully independent — finish one (businesses,
shopping centres, and logging, per "Logging your run" below), **commit and
push it** (see
"Committing" below), and only then start the next, rather than
interleaving research across all of them or saving everything up for one
commit at the end of the run. If you run low on turns partway through,
whatever you've already committed is safe — you just won't reach the
remaining suburbs in `suburbs_per_run` this run, which is fine; make sure
`suburb_index` only reflects the suburbs you actually finished and
committed (see below). Given the job 4 > job 3 > jobs 1-2 priority order
above, running short on turns should mean jobs 1-2 are the ones that get
skipped this run (fine — they're steady-state background work with no
urgency), not job 3 or job 4.

## Which suburbs this run covers

Read `status/pretoria/routine-state.json`:

```json
{ "suburb_index": 0, "suburbs_per_run": 3, "suburb_slugs": ["akasia", "atteridgeville", ...] }
```

This run's targets are `suburbs_per_run` consecutive entries starting at
`suburb_index`: `suburb_slugs[suburb_index]`,
`suburb_slugs[suburb_index + 1]`, ... wrapping around to the start of the
list if you reach the end. **As soon as you finish one suburb** (not at the
end of the whole run), advance `suburb_index` past it (wrapping modulo the
length of `suburb_slugs`) and commit that change together with that
suburb's SQL and log line — see "Committing". This is the entire mechanism
that spreads coverage across all suburbs over time — `suburbs_per_run`
suburbs per hour.

## A known environment limitation — check this FIRST, don't rediscover it

This sandbox's network egress policy blocks WebFetch/curl to most domains
(confirmed 2026-08-31 — only npm/pypi/GitHub/Anthropic's own API are
reachable; business websites, Facebook, even Wikipedia return a 403 from
the egress proxy). **Do one cheap check at the very start of the run**
(one WebFetch to any real source) to see whether this is still the case —
don't burn many turns retrying different domains or debugging the proxy
if the first one fails, that's already a known, understood state.

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
  allowed sources** (per owner decision 2026-09-01, overriding this file's
  earlier prohibition) — use them like any other source, same rules as
  everything else: a fact only counts if it's actually stated in what you
  read (a fetched page, or an explicit WebSearch snippet per the fallback
  above), never inferred. Also use general web search and other real
  pages: news articles, the business's own website, Facebook/Instagram
  business pages, other directory sites, Chamber of Commerce listings, etc.
  OpenStreetMap/Overpass is no longer a source for this routine — don't
  query it.
- **New business, to publish:** need at least 2 independent sources (fetched
  pages and/or explicit WebSearch snippets, per the fallback above)
  agreeing on the same name + rough location. If you only find one source,
  or the sources disagree, **discard it — do not write anything, do not
  queue it anywhere.** It's fine to rediscover it on a future run when
  better sources might exist.
- **Both a phone number AND a street address are mandatory to publish**
  (per owner decision 2026-09-01 — the site had accumulated hundreds of
  listings missing one or the other from an earlier, looser bar, and they
  were all deleted, twice). If your sources give you a name and rough
  location but are missing either field, **do not publish it** — discard
  it the same as a single-sourced business. It's fine to rediscover it on
  a future run if both turn up then. Cross-check that the phone number and
  address actually belong to *this specific location*, not just a
  business with the same name somewhere else — chains repeat constantly in
  this data (multiple Steers, KFC, Quickshop branches in the same suburb),
  so a phone number for "the Steers in Centurion" is worthless if there
  are three of them and you can't tell which one your source means. If you
  can't confidently pin either field to this exact branch, treat it as not
  having that field, and don't publish.
- If in doubt, skip it. A smaller number of correct additions beats a
  larger number of half-confident ones — there is no human reviewing your
  output before it goes live on a real public site.

## Category and suburb slugs are fixed

Only use `category_slug` and `suburb_slug` values that already appear in
`status/pretoria/db-snapshot.json`'s `categories`/`suburbs` arrays. Never invent a
new category or suburb slug.

## Shopping centres

`status/pretoria/db-snapshot.json`'s `shopping_centers` array lists every known
mall/shopping centre (slug, name, suburb_slug, address). Each business in
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
  against `status/pretoria/db-snapshot.json`'s businesses already carrying that
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
more authoritative than GPS proximity (which was this project's very first
version of shopping-centre linking, and produced real, shipped bugs — see
`scripts/link-businesses-to-shopping-centers.mjs`'s header comment) and
more authoritative than a tenant's own scraped address text claiming to be
"at Example Mall" (this project has a real case — see
`db/seed-data/clubview-corner-tenants-2026-09-01.sql` — where two
businesses' own addresses said "Clubview Corner" but the mall's own site's
tenant list didn't include them, and the mall's site won). Job 2 finds
centres and tenants opportunistically while researching a suburb; job 3
guarantees every centre eventually gets this authoritative, no-other-way
reconciliation, regardless of whether it happens to come up in suburb
research.

Read `status/pretoria/routine-state.json`'s `shopping_center_index`,
`shopping_centers_per_run` (normally `1`), and `shopping_center_slugs`
(every shopping centre known at the time this rotation list was last
extended — see below for keeping it current). This run's target is
`shopping_center_slugs[shopping_center_index]` (wrapping modulo the list's
length if you reach the end).

For that one shopping centre:

1. **Find its own official website.** Search `"<centre name>" official
   website` or `"<centre name>" store directory <suburb>`. If you can't
   find a real, distinct website for this centre (a listing on a
   directory/aggregator site like Tiendeo, Yellow Pages, Facebook-only
   presence, or nothing at all doesn't count) after a reasonable search,
   **stop here** — advance `shopping_center_index` anyway (see below), log
   it with `official_site_found: false` and zero counts, and move on. Not
   every `shopping_centers` row is a real multi-tenant mall — some are
   single-shop or brand-name entries that were miscategorised on import
   (e.g. a fuel station chain name) and will never have a "mall website";
   that's an expected, fine outcome, not an error.
2. **Fetch its tenant/store list.** Most real malls have a "Stores",
   "Tenants", or "Store Directory" page (sometimes the tenant list is just
   on the homepage, as with Clubview Corner). Read the whole list, not a
   sample. This job leans harder on WebFetch actually working than jobs 1-2
   do — a WebSearch snippet is rarely going to contain a whole store
   directory. If WebFetch is blocked for this domain (see "A known
   environment limitation" above) and WebSearch snippets can't give you the
   *complete* list with confidence, don't guess at partial coverage —
   treat it the same as "no official website found" (step 1) and move on;
   a partial, unconfirmed list is worse than no sweep at all here, since
   step 3 would then unlink real tenants just because they weren't visible
   in a snippet.
3. **Cross-reference against `status/pretoria/db-snapshot.json`:**
   - Businesses in the snapshot with this centre's `shopping_center_slug`
     that **are not on the official list** at all: unlink them —
     `UPDATE businesses SET shopping_center_id = NULL WHERE slug = '<business-slug>';`
     (the snapshot only gives you slugs, not numeric ids — always address a
     row by its unique `slug`, resolving the centre's own id with a
     subquery when you need one, e.g. `(SELECT id FROM shopping_centers
     WHERE slug = '<centre-slug>')`) — one of this routine's narrow UPDATE
     exceptions (see "Your four jobs" above). Do **not** touch any other
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
new shopping centre this run, also append its slug to
`shopping_center_slugs` in the same commit (anywhere in the array — order
doesn't matter beyond being deterministic) so job 3's rotation eventually
reaches it too. Never remove or reorder existing entries.

**Advancing the index:** same wrapping rule as `suburb_index` — as soon as
this run's one centre is done (whether or not anything was found/changed),
advance `shopping_center_index` past it (wrapping modulo the length of
`shopping_center_slugs`) and commit that change together with this job's
SQL (if any) and log line.

## New-mall discovery sweep (once per full lap of job 3)

Job 2 only finds new shopping centres opportunistically — a mall in
whatever suburb this run's suburb rotation happens to touch. This step
catches malls that job 2 never happens to surface, by actively hunting for
them, but it's a bigger, unscoped task, so it only runs **once per full
lap** of job 3's rotation, not every run.

**Trigger:** before advancing `shopping_center_index` after this run's
sweep (see "Advancing the index" above), check whether this run's centre
was the *last* entry in `shopping_center_slugs` (i.e. advancing would wrap
back to `0`). If so, a full lap just completed — do this discovery sweep
now, as an extra step in the same run, before you commit.

1. Actively search for shopping centres/malls in the Pretoria/Centurion/
   Tshwane metro that **aren't** in `status/pretoria/db-snapshot.json`'s
   `shopping_centers` array yet (e.g. `"shopping centres" OR "malls" list
   Pretoria Centurion`, or target a suburb you know is dense with retail
   but thin in the snapshot's shopping-centre coverage). This is a genuine
   search, not a re-check of centres you already know.
2. For each new one you find, verified with the same 2-independent-source
   bar as any other new shopping centre (see "The verification rule" and
   "Writing the SQL file"): add it, then immediately run the exact same
   process as a normal job-3 sweep on it (steps 1-3 above) — find its own
   official site, fetch its tenant list, and reconcile against
   `status/pretoria/db-snapshot.json`. **The existing-business-linking case (step
   3's second bullet) matters most here**: a mall you're only discovering
   now may have tenants that were already published as standalone
   businesses by earlier runs' general suburb research — link those
   existing rows rather than inserting duplicates.
3. Append every newly-added centre's slug to `shopping_center_slugs` (see
   "Keeping `shopping_center_slugs` current" above) so it joins the normal
   rotation going forward.
4. Log this as its own checkpoint (see "Logging your run" below) separate
   from the regular job-3 sweep line, then advance `shopping_center_index`
   to `0` and commit everything from this step together.

If the search turns up nothing new, that's a fine, expected outcome — log
it with zero counts and still advance the index to `0`.

## Description enrichment sweep (job 4) — current top priority

**Per owner request 2026-09-02.** Most businesses in the dataset (the
~7,800 imported from the scraper CSV, `origin = 'seed_import'`) carry a
generic, copy-pasted description: *"`<Name>` is a business in `<Suburb>`,
part of the `<Region>` area of the Pretoria/Tshwane metro."* — identical in
shape for every single one, saying nothing about what the business
actually does. This job rewrites them, one real business at a time, with
something a human actually researched and wrote.

**Finding this run's batch:** in `status/pretoria/db-snapshot.json`'s `businesses`
array, filter for `description_enriched_at` being `null` — that's the
entire backlog, no separate rotation list to maintain (unlike job 3's
`shopping_center_slugs`). Work through them in the order they appear in
the array (alphabetical by name) so progress is predictable and every run
picks up roughly where the last one left off. **Do 100 businesses this
run — this is the actual target, not just a ceiling** (per owner request
2026-09-16, firmed up from an earlier "up to 100" wording that was being
read as permission to stop short): do all 100 unless the remaining
backlog itself has fewer than 100 businesses left, in which case do the
whole remaining backlog. This is one commit at the end of the batch (see
"Committing" below).

**For each business in the batch:**

1. **Research it — bounded effort, per owner request 2026-09-15 (to keep
   this routine's token cost down):** exactly **one** WebSearch call —
   `"<name>" <suburb> Pretoria` (or `Centurion`, matching its actual
   region) — plus, if the business already has a `website` or a real URL
   in `source_urls`, **one** WebFetch of that specific known URL (that's
   using an address you already have, not additional searching, and a
   business's own site is the best source for "what do they actually
   do"). That's the whole research budget for this business — don't run a
   second search with different phrasing, don't follow links out to other
   pages, don't dig deeper if the first pass doesn't clearly answer it.
   From whatever that single pass turns up, look for: what they
   specialise in, notable products/services, how long they've operated,
   anything that distinguishes them from a same-category business down
   the road, **and its trading/opening hours** (a "Hours", "Contact Us",
   or "Opening Times" page/section, or a Google Business Profile snippet
   that states them). Same chain-branch caution as everywhere else in
   this file — confirm anything you use, hours included, is about *this
   specific location*, not a different branch of the same chain (chains
   often keep different hours per branch). If the one search (and fetch,
   if applicable) doesn't clearly turn up new, verifiable facts, don't
   keep digging — move straight to the "Reworded" outcome below.
2. **Write the new description** — one to two natural sentences, specific
   to this business, not a template. Two outcomes, both acceptable and
   both count as "enriched":
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
     hairdresser and beauty salon in Doringkloof Mall, Doringkloof."
     rather than the generic template — but **don't invent anything new**,
     and don't touch `source_urls` in this case (nothing new to cite).
   - **Never name the owner, founder, director, or any individual person**
     in the description (per owner request 2026-09-04) — even if a source
     names them and even if it feels like the most distinctive fact
     available. Describe what the business does, not who runs it. If the
     only genuinely new fact you found is about a named individual (e.g. a
     founder's background, a professional's qualifications), either
     rephrase it without the name (e.g. "founded by a criminal-litigation
     attorney" instead of naming them) or, if it can't be rephrased
     without the name being the whole point, treat it as if you'd found
     nothing new and fall back to the "Reworded" case instead.
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

## Writing the SQL file

Each checkpoint (see "Committing" below) gets its own new file:
`db/routine-updates/pretoria/<UTC timestamp, e.g. 2026-08-31T10-00-00>.sql`. Every
statement must be safely re-runnable (idempotent) since the apply step may
run more than once:

**New business (not in a shopping centre):**

```sql
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'example-slug-suburbslug', 'Example Name',
  (SELECT id FROM suburbs WHERE slug = 'suburbslug'),
  '123 Example St', '012 345 6789', NULL, NULL,
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
  'Shop 12, Example Mall, 456 Example Rd', '012 345 6789', NULL, NULL,
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

These are the only `UPDATE`s this routine ever writes — both only during a
job 3 official-site sweep (or its new-mall discovery step), both touching
only the `shopping_center_id` column, on the terms described in "Shopping
centre official-site sweep" and "New-mall discovery sweep" above. Every
other SQL statement this routine writes is an `INSERT` for a brand-new
business or shopping centre (per "Your four jobs, every run" above) —
nothing else about an existing row is ever touched.

## Logging your run

Append one line **per checkpoint** (per suburb, per shopping-centre batch —
see "Committing") to `status/pretoria/agent-log.jsonl` (create if missing), as part
of that checkpoint's commit:

```json
{"date": "2026-08-31T10:00:00Z", "suburb": "akasia", "action_taken": "research", "published_new": 3, "discarded_unverified": 4, "shopping_centers_added": 1, "short_summary": "Akasia: added 3 new businesses (all with verified phone numbers), added Example Mall with 2 verified tenants."}
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
{"date": "2026-09-02T10:00:00Z", "shopping_center": "clubview-corner-clubview", "action_taken": "shopping_center_sweep", "official_site_found": true, "tenants_added": 12, "tenants_linked": 1, "tenants_unlinked": 3, "discarded_unverified": 0, "short_summary": "Clubview Corner: reconciled against its own site (clubviewcornershoppingcentre.co.za) -- added 12 confirmed tenants, linked 1 already-existing business, unlinked 3 that weren't on the mall's own list."}
```

If no official website was found: `"official_site_found": false,
"tenants_added": 0, "tenants_linked": 0, "tenants_unlinked": 0"` and a
short summary saying so (e.g. "no official website found, likely a
miscategorised entry").

**The new-mall discovery sweep** (once per full lap — see "New-mall
discovery sweep" above) gets its own log line too, when it runs:

```json
{"date": "2026-09-05T14:00:00Z", "action_taken": "new_mall_discovery", "shopping_centers_found": 2, "tenants_added": 5, "tenants_linked": 3, "short_summary": "Full lap complete. Found 2 new shopping centres not previously in the dataset (Example Plaza, Another Centre) via active search; reconciled both against their own sites -- 5 new tenants added, 3 already-existing businesses linked to their centre."}
```

If nothing new was found: `"shopping_centers_found": 0` and a short
summary saying so.

**Job 4 (description enrichment sweep)** gets its own log line, one per
run's batch (see "Committing" below). `researched` is the count
written with genuine new facts (and a new source appended); `reworded` is
the count rewritten from already-known fields only; `hours_found` is how
many of this checkpoint's businesses also got a real `hours` value:

```json
{"date": "2026-09-02T10:00:00Z", "action_taken": "description_enrichment", "researched": 6, "reworded": 9, "hours_found": 4, "remaining_backlog": 7802, "short_summary": "Rewrote 15 generic descriptions -- 6 with new facts found via research (added a source for each), 9 reworded from existing category/suburb data only (no web presence found beyond the original listing). Trading hours found and recorded for 4 of the 15."}
```

`remaining_backlog` is the count of businesses still showing
`description_enriched_at: null` in the snapshot *before* this checkpoint's
SQL is applied (i.e. including the ones this checkpoint is about to fix) —
a simple running total the owner can watch shrink across runs. Compute it
by counting `businesses` entries in `status/pretoria/db-snapshot.json` with a null
`description_enriched_at`.

## Committing — at natural boundaries, not a fixed record count

**Per owner request 2026-09-15: no fixed per-record commit cap.** Commit
and push at these natural boundaries instead:

- After finishing both jobs for **one suburb** (jobs 1-2).
- After finishing **each shopping centre's** tenant sweep (job 2's
  opportunistic version).
- After finishing **job 3's one centre** for this run — its own commit,
  separate from any suburb commits this run also produced, with the
  `shopping_center_index` advance included.
- After finishing the **new-mall discovery sweep**, on the runs where it
  fires (once per full lap) — its own commit, separate from the regular
  job-3 commit that triggered it.
- After finishing **job 4's whole batch** for this run (100 businesses)
  — its own commit, separate from job 3 and any suburb commits this run
  also produced.

A "record" is one row you've written a SQL statement for — one new
business INSERT, one new shopping-centre INSERT, one job-3 link/unlink
UPDATE, or one job-4 description-rewrite UPDATE. A quiet suburb with only
2 records still gets its own push at its boundary; a single shopping
centre with 30 verified tenants goes in one commit at the end of that
centre's sweep rather than being split up.

Rationale: a run can still be cut short (turn limit, session limit, a
crash) at any point — committing at each natural boundary still means
whatever's already cleared verification is saved to the repo (and picked
up by the next deploy) even if the run doesn't reach the end, without
splitting a single suburb or batch into multiple partial commits.

Each commit: write a new `db/routine-updates/pretoria/<UTC timestamp, e.g.
2026-08-31T10-00-00>.sql` file scoped to just that checkpoint's inserts
(one file per commit — don't reuse or append to a file from an earlier
commit this run), append the corresponding `status/pretoria/agent-log.jsonl`
line(s) for what that checkpoint covered, and update `suburb_index` in
`status/pretoria/routine-state.json` if that checkpoint completed a suburb, or
`shopping_center_index` (and `shopping_center_slugs`, if you added any new
centres) if that checkpoint completed a job-3 sweep or the new-mall
discovery step. Stage exactly those files — the new SQL file, `status/pretoria/agent-log.jsonl`,
`status/pretoria/routine-state.json` — with a one-line commit message describing
that checkpoint, and push to `main`. Do not touch any other files.

If a checkpoint had nothing worth publishing (no new businesses cleared the
bar, no new tenants found), still commit its log line with zero counts and
its index advance — don't skip the commit just because the result was
empty. Only leave an index un-advanced for work you didn't actually get to
this run.
