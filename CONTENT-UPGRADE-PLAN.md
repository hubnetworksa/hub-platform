# Content upgrade plan: low-content listings and pages

Status: **plan, not started**. Written 4 October 2026, updated the same day for the all-at-once agent approach (section 9). Scope: PretoriaHub, PolokwaneHub and TheCapeTownHub.

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
UPDATE businesses SET description = ..., short_description = ..., content_upgraded_at = datetime('now'), ...
WHERE slug = 'example-slug'
  AND owner_user_id IS NULL
  AND COALESCE(subscription_tier, 0) = 0
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id)
  AND content_upgraded_at IS NULL                  -- never changed twice
  AND length(COALESCE(description, '')) < 700;     -- only short descriptions are replaced
```

The last two lines mean a listing is upgraded once only, and a description that has since been written up properly (by an admin, or an owner who just claimed) is never overwritten. The exact SQL agents use is in `content-upgrade/README.md`.

**History and undo:** before each change, the old text is copied into a new `description_history` table (business id, old description, old short description, old hours, when, which routine run). Any change can be undone one listing at a time, or a whole run at once.

---

## 2. What counts as "low content"

### 2.1 Business listings (the main job)

**What counts as thin, in words:**

| Description length | Verdict |
|---|---|
| Under 50 words | **Thin**: one or two generic sentences. |
| 50–79 words | **Still thin** for a business page: a short paragraph. |
| **80–150 words** | **Not thin (the target):** 3–6 specific, sourced sentences. |
| Over 150 words | Fine, but not needed. Don't pad to get there. |

Google sets no official word count. The rule of thumb for a directory listing is to say enough to be clearly more useful than the bare name/phone/address card every other directory shows. 80+ specific words, plus hours and a one-line summary, does that.

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

**Business description: 80–150 words (3–6 sentences), in plain South African English.**

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

**If nothing new can be found, the listing is not reworded.** Rewording our own fields into another one-liner is what produced the generic text in the first place. Instead the listing is marked `content_upgrade_status = 'no_sources'` and appears in Hub Admin, under Listings → "Couldn't find more", for a human decision:
- find a source by hand,
- invite the business to claim the listing, or
- (for Pretoria only, and only if you agree) keep it out of the sitemap so it doesn't drag the site down.

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
   - on `businesses`: `content_upgraded_at`, `content_upgrade_status` (`upgraded` / `no_sources` / `skipped`) and `content_upgrade_run`;
   - a new `description_history` table;
   - the same "upgraded at" and "status" columns on `suburbs` and `shopping_centers`.
3. **Snapshot:** add description length, protected yes/no, upgrade status and has-hours to `status/<city>/db-snapshot.json`. Lengths and flags only, not full text, so the snapshot stays small. The routine needs this to pick work without reading the database.

### Phase 1: the routine (about 1–2 days, me)

4. **`next.mjs content-upgrade`:** builds the queue (sections 2 and 4) and leaves protected listings out. Each batch carries the current description text, so the update can check that it hasn't changed since.
5. **`validate.mjs`** rejects any statement that:
   - lacks the full guard from section 1;
   - writes a description outside 80–150 words (a little slack allowed) or a short description over 160 characters;
   - contains a phone number, email address or URL in the text;
   - matches the generic "X is a Y in Z" pattern with nothing else added;
   - adds a fact without appending a new source URL;
   - names a person, using the existing checks.
6. **Runbook `routines/content-upgrade.md`:** the writing rules from section 3, with good and bad examples from real listings.
7. **`done.mjs`** records progress, and listings marked `no_sources` drop out of the queue.
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
    - the "Couldn't find more" list.
15. **Hub Admin → Google** shows whether it's working: "Pages seen in Google per day" and the "not in Google" list should improve over 2–8 weeks.
16. **Monthly check:** I read 20 random upgrades per city and tighten the rules if anything slips.

---

## 6. Rough timeline

The rate depends on how many listings have sources online. Expect roughly 60–80% to be upgradable, with the rest marked "no sources".

| Rate | Weakest ~1,100 (under 140 characters) | Busiest 2,000 | All ~7,000 under 250 |
|---|---|---|---|
| ~60 listings a day (4 runs × 15) | ~3 weeks | ~5 weeks | ~4 months |
| ~120 a day (8 runs × 15) | ~1.5 weeks | ~2.5 weeks | ~2 months |

Busiest-first means most of the traffic gain comes in the first month.

---

## 7. Known limits

- **Blocked websites:** the routine's sandbox often can't open business websites (the egress proxy blocks many). It then uses search result snippets, and a snippet counts only if it literally states the fact. This keeps text accurate but sometimes short of detail; those listings end up "no sources" rather than padded.
- **Chains:** facts must be about this exact branch. Chain branches (Woolworths, Steers, banks) usually get a shorter, factual description of the branch: centre, anchor services, branch-specific hours.
- **Owners:** a claimed business can still have a thin description. That's for the owner to improve. Hub Admin could nudge them (a "your listing could be better" email) as a separate, later step.

---

## 8. Decisions for you

1. **Length:** 80–150 words for descriptions. More, less, or fine?
2. **Hours and email:** fill these too while researching (recommended), or descriptions only?
3. **No sources:** if nothing can be found for a Pretoria listing, keep it as is (default), or keep it out of the sitemap?
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

### What must be in place before the first agent runs (me, about half a day)

1. **Database migration** for all three cities:
   - on `businesses`: `content_upgraded_at` and `content_upgrade_status`;
   - a new `description_history` table (the undo copy every upgrade writes first).
   Without it, the agents' SQL fails when applied.
2. **`validate.mjs --routine content-upgrade`:** checks every statement has the full protection guard, 80–150 words, a short description of at most 160 characters, no phone/email/links/people's names in the text, and a new source URL for new facts. Agents must get `ok` before pushing.
3. **Deploy filter:** `content-upgrade/` and this plan are added to the deploy workflow's "routine-only" paths. That way agents' pushes don't each rebuild all three sites; the 3-hourly scheduled deploy applies their SQL in bulk.
4. **Undo script:** `scripts/content-upgrade-undo.mjs --city <c> [--chunk NNN]` restores the old text from `description_history`.
5. **Trial:** run chunk-001 for each city first, then read the before/after text in Hub Admin → Listings before letting the rest go.

### How long "all at once" takes

- **Per batch:** roughly 1–2 hours for an agent, since each listing needs 2–5 searches and page reads.
- **10 agents in parallel:** about 190 batches ÷ 10 = 19 rounds, so roughly 1.5–3 days.
- **More agents:** each one shortens it further.
- **Going live:** each pushed batch goes live at the next 3-hourly deploy.

### Database cost

All 9,408 upgrades write about 19,000 rows in total (history plus update). The free limit is 100,000 rows written per day, and reads are small. If many batches land at once the 3-hourly deploy can still apply them in one go; the Health screen's database meter shows the real cost.

### Expect some "no sources"

Many small businesses have nothing online beyond a directory card, and the agents' sandbox can't open every website. Expect roughly 20–40% of listings to come back as `no_sources` rather than upgraded. That's by design: no padding, no invented facts. They appear in Hub Admin → Listings for a human decision.
