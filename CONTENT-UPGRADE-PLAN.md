# Content upgrade plan: low-content listings and pages

Status: **migration deployed (4 October 2026); trial next**. Written 4 October 2026, updated the same day for the all-at-once agent approach (section 9). Scope: PretoriaHub, PolokwaneHub and TheCapeTownHub.

> **Current approach (latest decisions, 4 October 2026):**
> - **Scope:** descriptions only. No hours, emails or short descriptions.
> - **Coverage:** every eligible listing (9,408) gets a description: at least 100 words (never less) when researched, ideally 100–150, or 50–80 words (never under 50) for listings with no sources found (at most 1,500 characters, the site's limit for the field since 4 October); there is no "skip".
> - **How:** all at once, by agents working in parallel on 50-listing batches (section 9). The agent brief is `content-upgrade/README.md`.
> - **Keeping it cheap:** about 2 tool calls per listing. Agents only write a small JSON file; `scripts/content-upgrade/to-sql.mjs` checks it and generates the guarded SQL.
> - **Quality bar:** owner-quality, third-person introductions, modelled on RE/MAX Northland Realty's own description (`content-upgrade/README.md`).
> - **Marking upgraded listings:** the existing `description_enriched_at`. The content-upgrade migration clears it on every listing and narrows the 1 October lock to owner-managed and claimed listings. The upgrade stamps it again as each description is written. The undo point is a database backup taken just before the agents start (`scripts/content-upgrade/undo.mjs`).
> - **The database lock:** the 1 October lock that blocks every enrichment write is narrowed to owner-managed and claimed listings (migration `*_content_upgrade_enrichment_guard.sql`), so those stay locked at database level.
>
> Where older sections below mention hours, emails, short descriptions, a slow routine or a "no sources" list, this box overrides them.

**Goal:** replace thin, generic content with real, specific, sourced content, starting with the pages that bring the most visitors. Thin pages are a large part of why Google indexes so little of the sites, especially Pretoria. **Claimed businesses are never touched.**

---

## 1. The hard rule: what is never changed

A business is **protected** (its description, short description, hours, email and every other field stay exactly as they are) if **any** of these is true:

| Check | Why |
|---|---|
| `owner_user_id IS NOT NULL` | It has an owner: the owner manages the listing. |
| A `business_claims` row exists (pending, approved **or** rejected) | Someone is claiming it, or did. |
| `subscription_tier >= 1`, or any `subscriptions` row exists | It's a paying (or once-paying) customer. |
| It has `business_photos` or owner-written custom page content (`custom_blocks`, `page_html`, `draft_*`) | Someone has curated it by hand. |
| `is_test = 1`, or `status != 'published'`, or `closed_at` is set | Not a live listing. |

How this is enforced. Three layers, so a mistake in one can't change a protected listing:

1. **The work packet never contains protected listings.** `next.mjs` filters them out before the routine ever sees them.
2. **The validator rejects any statement that could touch one.** `validate.mjs` refuses every `UPDATE businesses` that doesn't carry the full guard below.
3. **The database itself re-checks at the moment the change is applied.** Every update carries the guard in its own `WHERE`. If someone claims the business between the routine writing the file and the deploy applying it, the update simply changes nothing.

```sql
UPDATE businesses SET description = ..., description_enriched_at = datetime('now')
WHERE slug = 'example-slug'
  AND owner_user_id IS NULL
  AND COALESCE(subscription_tier, 0) = 0
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id)
  AND (description_enriched_at IS NULL OR description_enriched_at < '2026-10-04 00:00:00')  -- not already upgraded
  AND length(COALESCE(description, '')) < 700;     -- only short descriptions are replaced
```

The last two lines mean a listing is upgraded once only, and a description that has since been written up properly (by an admin, or an owner who just claimed) is never overwritten. The exact SQL agents use is in `content-upgrade/README.md`.

**Undo:** a full database backup is taken just before the run ("Weekly database backup" workflow, run by hand). `scripts/content-upgrade/undo.mjs` restores the old text from it for one batch or a whole city, and clears the stamp so those listings can be redone.

**Database-level lock:** the 1 October trigger (`block_routine_description_enrichment`) is kept but narrowed by the content-upgrade migration (`pretoria/0070`, `polokwane/0073`, `capetown/0071`). Any write to `description_enriched_at` is still silently dropped for a listing with an owner, a paid plan or any subscription, an owner submission, or any claim. So even a faulty file can't stamp, and therefore can't upgrade, a claimed listing.

---

## 2. What counts as "low content"

### 2.1 Business listings (the main job)

**What counts as thin, in words:**

| Description length | Verdict |
|---|---|
| Under 50 words | **Thin**: one or two generic sentences. |
| 50–79 words | **Still thin** for a business page: a short paragraph. |
| **100–150 words** | **Not thin (the target for researched listings):** 4–7 specific, sourced sentences. Listings with no sources found (`from_known_details`) are 50–80 words of only what is known; padding them would create near-duplicate text across a suburb. |
| Over 150 words | Fine, but not needed. Don't pad to get there. |

Google sets no official word count. The rule of thumb for a directory listing is to say enough to be clearly more useful than the bare name/phone/address card every other directory shows. 100+ specific words (researched), plus hours and a one-line summary, does that.

**Exact counts:** every live listing's description, read through the sites' own listing API on 4 October 2026.

| | Live listings | Owner-managed (skipped) | Under 25 words | 25–49 | 50–79 | **80 words or more** | Median |
|---|---|---|---|---|---|---|---|
| Pretoria | 5,958 | 3 | 1,096 | 4,748 | 111 | **0** | 31 words |
| Polokwane | 1,262 | 5 | 516 | 734 | 7 | **0** | 27 words |
| Cape Town | 2,197 | 1 | 991 | 1,195 | 10 | **0** | 25 words |
| **Total** | **9,417** | **9** | **2,603** | **6,677** | **128** | **0** | |

**So every listing that isn't owner-managed (9,408) is thin and in scope.** No listing on any site reaches 80 words today; the longest is 87.

"Owner-managed" means it has an owner, was submitted by its owner, or is on a paid plan. Pending claims aren't in that count, but the SQL guard (section 1) still skips them.

The same eligible listings are also missing:

| | No opening hours | No email | Have a website to research |
|---|---|---|---|
| Pretoria | 4,666 | 5,792 | 4,806 |
| Polokwane | 820 | 1,067 | 372 |
| Cape Town | 1,071 | 2,022 | 527 |

A listing is **low content** if it is not protected and **any** of these is true:

- **The description is under 80 words.** Most are one sentence, e.g. "Francor Bakery is an independent bakery in Parow, Cape Town."
- **The description is generic.** It only restates the name, category and place ("X is a Y in Z"), whatever its length. The validator detects this pattern.
- **There is no short description** (the one-line summary used in cards and search results).
- **There are no opening hours.**
- **There is no email address** (only one the business publishes itself).

Map location, address, phone and category gaps are **not** in scope. Those need the original sources, and the Listings screen in Hub Admin already lists them for manual fixing.

### 2.2 Other thin pages

| Page type | Low content when | What we do |
|---|---|---|
| **Suburb pages** (`suburbs.bio`, `landmarks`) | No bio, or a bio under 300 characters / no landmarks | Write a 2–3 paragraph sourced suburb guide: where it is, what it's known for, main roads, centres, schools, landmarks. |
| **Shopping centre pages** (`shopping_centers.description`) | No description, or under 250 characters | Write 1–2 sourced paragraphs: location, anchor stores, type of centre, parking/hours when published. |
| **Category-in-suburb pages** with 1–2 businesses | Thin by nature | **Don't pad them with filler.** Add businesses through the discovery routine (prioritised to these gaps), or keep them out of the sitemap until they have 3+ listings. |
| **Category pages** | No intro text | One sourced intro paragraph per category per city (what's offered locally, which suburbs have most). |
| **Events** | No description or under 150 characters | Fill from the organiser's or ticket page, or leave as is. Events are short-lived, so they're low priority. |
| **Pages for deleted Pretoria listings** (3,772, now "page not found") | Not content, but they hurt crawling | 301-redirect each to its matching category-in-suburb page. A separate, one-off task. |

---

## 3. How the new text is written

These rules go into the new runbook, `routines/content-upgrade.md`. It replaces the disabled `routines/enrichment.md`, which was switched off because it rewrote a paying owner's description.

**Business description: researched 100–150 words (minimum 100); `from_known_details` 50–80 words (minimum 50); both at most 1,500 characters; plain South African English.**

- **What it does:** say what the business actually does, and what it specialises in.
- **Specifics, only if sourced:** how long it has operated, brands stocked, services, who it serves.
- **Where it is:** the suburb, the centre it's in, or a nearby landmark or main road (only from sources or our own data).
- **Practical details when known:** trading pattern ("open on Saturdays"), appointments, parking.
- **No filler:** no "one-stop shop", "look no further", "best in town", keyword stuffing, or claims about quality.
- **No people:** never name an individual (same rule as today, in `routines/_shared.md`).
- **No contact details in the text:** phone numbers, emails and links have their own fields.

**Short description: one sentence, at most 160 characters.** It's what shows in cards and Google snippets.

**Opening hours and email:** follow the existing rules in `routines/enrichment.md`. They must be for this exact branch, and the email must be one the business publishes itself.

**Sources:**
- Every new fact must come from something read: the business's own website, its Google listing, Facebook or Instagram page, the centre's tenant page, a chamber or association listing, or a news article.
- Each source URL is appended to `source_urls`.
- Facts we already hold (name, category, suburb, centre) need no new source.

**Every listing gets a full description; there is no "skip" outcome.** Research comes first: existing sources, website, Google listing, social pages, directories, the centre's site, and the chain's own site for chain branches. If that adds nothing about the business itself, the agent writes 50–80 words from only the details we already hold: category, address, the centre, the suburb, trading pattern if known, and at most one sentence of area context. Nothing is invented and nothing is padded (identical filler across a suburb is near-duplicate thin content). The status (`from_known_details`, the others `researched`) is **not stored in the database**; it is written to `content-upgrade/<city>/done-NNN.json` and as a comment in the SQL, so a later pass can list those listings and look for more online. They never stay as one-liners. The full rules and an example are in `content-upgrade/README.md`.

**Never** shorten a description, change the business name, phone, address or category, or upgrade a protected listing.

---

## 4. Order of work (busiest first)

Each run takes the next batch from one queue, ordered by:

1. **City:** Pretoria first (its Google recovery matters most), then Cape Town, then Polokwane, in a rotating 2:1:1 ratio.
2. **Value:**
   - Google impressions for the page in the last 28 days (from the daily Search Console data Hub Admin already collects);
   - then listing views and contact taps in the last 90 days;
   - then listings in categories with the most listings.
3. **Weakness:** within equal value, under 140 characters first, then generic, then under 250.

**Pages:** suburb and shopping centre pages slot in at one batch in every five, busiest suburbs first.

---

## 5. Build steps

> For the all-at-once approach you chose, **section 9 replaces phases 1–3 and the timeline in section 6**. The safety rules, writing rules and monitoring stay the same.

### Phase 0: measure and prepare (about 1 day, me)

1. **Audit script** `scripts/routines/content-audit.mjs`, run by a workflow. Uses read-only queries and gives exact counts per city:
   - low-content listings by reason,
   - protected listings excluded, and why,
   - suburbs and centres without proper text.
   It writes `status/<city>/content-audit.json` and shows it in Hub Admin → Listings.
2. **Migration**, for all three cities:
   - superseded: no new columns or tables. The migration clears `description_enriched_at` on every listing and narrows the 1 October lock;
   - the same "upgraded at" and "status" columns on `suburbs` and `shopping_centers`.
3. **Snapshot:** add description length, protected yes/no, upgrade status and has-hours to `status/<city>/db-snapshot.json`. Lengths and flags only, not full text, so the snapshot stays small. The routine needs this to pick work without reading the database.

### Phase 1: the routine (about 1–2 days, me)

4. **`next.mjs content-upgrade`:** builds the queue (sections 2 and 4) and leaves protected listings out. Each batch carries the current description text, so the update can check that it hasn't changed since.
5. **`validate.mjs`** rejects any statement that:
   - lacks the full guard from section 1;
   - writes a description outside the word rules (researched 100–250, from_known_details 50–120, both at most 1,500 characters) or a short description over 160 characters;
   - contains a phone number, email address or URL in the text;
   - matches the generic "X is a Y in Z" pattern with nothing else added;
   - adds a fact without appending a new source URL;
   - names a person, using the existing checks.
6. **Runbook `routines/content-upgrade.md`:** the writing rules from section 3, with good and bad examples from real listings.
7. **`done.mjs`** records progress; every upgraded listing drops out of the queue.
8. **Retire `enrichment`** for good. It's disabled today; it gets removed from `next.mjs`.

### Phase 2: trial run (about 1 week, needs your OK)

9. **One trial batch per city, 15 listings each, Pretoria first.**
   - The SQL is committed **but not applied**.
   - I put the before/after text in a short review file, `status/content-upgrade-trial.md`, for you to read.
10. **You approve, or ask for changes to tone, length or rules.** Nothing goes live until you say so.

### Phase 3: run it (ongoing)

11. **Schedule:** a Claude routine (same as the other research routines) runs several times a day, about 10–15 listings per run.
12. **Applying changes:** the 3-hourly deploy applies the SQL files as it does today.
    - **Database cost:** each update reads and writes a few rows, far inside the free limit.
    - **Rebuilds:** they already happen every 3 hours, so this adds none. The Health screen's database meter shows the real cost.
13. **Suburb and centre text** is written by the same routine, in its own batches.

### Phase 4: watch and adjust (ongoing)

14. **Hub Admin → Listings** shows:
    - the counts going down (descriptions under 160 / 250, generic, no hours),
    - the most recent upgrades with before/after text,
    - how many are `researched` and how many are `from_known_details` (re-checked later).
15. **Hub Admin → Google** shows whether it's working: "Pages seen in Google per day" and the "not in Google" list should improve over 2–8 weeks.
16. **Monthly check:** I read 20 random upgrades per city and tighten the rules if anything slips.

---

## 6. Rough timeline

Every listing is upgraded. The share written from known details rather than new research depends on how many businesses are online.

| Rate | Weakest ~1,100 (under 140 characters) | Busiest 2,000 | All ~7,000 under 250 |
|---|---|---|---|
| ~60 listings a day (4 runs × 15) | ~3 weeks | ~5 weeks | ~4 months |
| ~120 a day (8 runs × 15) | ~1.5 weeks | ~2.5 weeks | ~2 months |

Busiest-first means most of the traffic gain comes in the first month.

---

## 7. Known limits

- **Blocked websites:** the routine's sandbox often can't open business websites (the egress proxy blocks many). It then uses search result snippets, and a snippet counts only if it literally states the fact. This keeps text accurate; when it adds nothing, the description is written from the details we hold (`from_known_details`), never padded with invented claims.
- **Chains:** facts must be about this exact branch. Chain branches (Woolworths, Steers, banks) usually get a shorter, factual description of the branch: centre, anchor services, branch-specific hours.
- **Owners:** a claimed business can still have a thin description. That's for the owner to improve. Hub Admin could nudge them (a "your listing could be better" email) as a separate, later step.

---

## 8. Decisions for you

1. **Length:** researched 100–150 words, from_known_details 50–80 words. More, less, or fine?
2. **Hours and email:** fill these too while researching (recommended), or descriptions only?
3. **Decided:** every listing gets a full description; nothing is left as is.
4. **Pace:** decided: all at once with agents (section 9).
5. **Other pages:** include suburb and shopping-centre text in the same routine (recommended), or listings only for now?
6. **Trial review:** read the 45 trial upgrades yourself before it starts (recommended), or start straight away?

---

## 9. Doing it all at once with agents (chosen 4 October 2026)

Instead of a slow routine, the whole backlog is split into ready-made batches, and you run agents on them in parallel, per site.

### The batches (ready now)

**Where they are:** `content-upgrade/<city>/chunk-NNN.json`.
- **Size:** 50 listings per batch, thinnest first.
- **Each listing has:** slug, name, category, suburb, website, has_hours, has_email, the current word count and the current text.
- **Already removed:** owner-managed listings.

| City | Listings | Batches |
|---|---|---|
| Pretoria | 5,955 | 120 (chunk-001 to chunk-120) |
| Polokwane | 1,257 | 26 |
| Cape Town | 2,196 | 44 |
| **Total** | **9,408** | **190** |

**Agent brief:** `content-upgrade/README.md`, a self-contained brief for one agent and one batch. Give each agent its city and batch number, e.g. *"Follow content-upgrade/README.md for pretoria, chunk 007."* Each agent:
- researches its 50 listings,
- writes one guarded SQL file to `db/routine-updates/<city>/content-NNN.sql`,
- validates it, logs, commits and pushes.

Batches don't overlap, so any number of agents can work on the same city at once.

### What must be in place before the first agent runs

1. **Done: `scripts/content-upgrade/to-sql.mjs`.** It checks an agent's JSON: every listing present once, researched 100–250 words (target 110–150) or from_known_details 50–120 words (target 50–80), both at most 1,500 characters, no phone/email/link/HTML/sales filler, valid statuses and sources. It then writes one guarded `UPDATE` per listing, which also stamps `description_enriched_at`. The guard includes a text-unchanged condition (`description` must still equal the batch file's `current_description`), because admin edits through the Edit modal don't stamp `description_enriched_at`. It also writes the sidecar `content-upgrade/<city>/done-NNN.json` (slug, status, sources), the only record of researched vs from_known_details.
2. **Done and DEPLOYED (live 2026-10-04 ~06:15 UTC; `description_enriched_at` is already cleared on all three sites): content-upgrade migration** (`pretoria/0070`, `polokwane/0073`, `capetown/0071`). It clears every `description_enriched_at` and narrows the lock as described in section 1.
   - **Tested on a copy of the database with the original lock:**
     - every date was cleared;
     - the batch upgraded the unclaimed listings and left the owned and claimed ones alone;
     - a direct overwrite of the owned listing (as the old routine would have done) was still dropped;
     - re-applying the batch changed nothing.
3. **Done: undo.** `node scripts/content-upgrade/undo.mjs <city> <backup.sql> <NNN|all>`.
4. **Before the first agent runs: take the backup FIRST (the undo point).** Done: triggered 2026-10-04 06:24 UTC via the "Weekly database backup" workflow, run 37182710594. Keep the artifact (90 days).
5. **DONE: deploy filter.** It is already in `.github/workflows/deploy.yml`: the contentUpgrade paths are routine-only, so agent pushes don't each rebuild all three sites.
6. **Trial review:** chunk-001 for each city is written but NOT pushed (agents told "trial" commit locally only). The before/after text is in `status/content-upgrade-trial.md`. The owner fact-checks 10–15 listings against sources before the rest runs.

### How long "all at once" takes

- **Per batch:** roughly 30–60 minutes for an agent, at about 2 tool calls per listing with searches run in parallel.
- **10 agents in parallel:** about 190 batches ÷ 10 = 19 rounds, so roughly 1–2 days.
- **More agents:** each one shortens it further.
- **Going live:** each pushed batch goes live at the next 3-hourly deploy.

### Database cost

All 9,408 upgrades write about 9,400 rows in total, one update each. The free limit is 100,000 rows written per day, and reads are small. If many batches land at once the 3-hourly deploy can still apply them in one go; the Health screen's database meter shows the real cost.

### Every listing is upgraded

Many small businesses have nothing online beyond a directory card, and the agents' sandbox can't open every website. Expect perhaps 20–40% of listings to be written `from_known_details` (location, centre, category and access details we already hold) rather than `researched`. Every one still gets a real description (50–80 words, only what is known, no padding), with no invented facts. The `done-NNN.json` sidecar lets a later pass add more detail when the business appears online.
