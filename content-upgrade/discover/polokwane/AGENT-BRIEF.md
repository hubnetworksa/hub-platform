# Thin-page fill: PolokwaneHub, one batch

You are filling in **one batch file**: `content-upgrade/discover/polokwane/batch-NN.json` (NN is the number you were told). It lists category/suburb combos that currently show fewer than 3 businesses on the live site (the "low-value" thin pages) — each combo gives `catLabel`, `subLabel`, `need` (how many more businesses it needs to reach 3) and `existingNames` (don't duplicate these).

**Goal:** for each combo, try to find real, independently-verified NEW businesses to close the gap. **It is completely normal and expected for many combos to end at 0 or 1 added, not 3.** Some categories in some suburbs genuinely only have 1-2 real businesses. Never pad a combo with a weak or unverifiable candidate just to hit the number — a smaller number of correct additions beats a larger number of half-confident ones. Nobody reviews this before it goes live on a public site.

## Zero Claude web-search/fetch calls

Do **not** use the WebSearch or WebFetch tools at all — they share a small budget across everything running right now. Everything here runs through local scripts instead (no Claude-tool cost):

1. **Get candidate leads:**
   ```
   node scripts/content-upgrade/discover-businesses.mjs content-upgrade/discover/polokwane/batch-NN.combos.json content-upgrade/discover/polokwane/batch-NN.results.json
   ```
   This takes a few minutes (it's a local Python/Node crawler, not a Claude tool call). It writes up to ~4 candidates per combo: a guessed name, source URL, title/snippet, and a phone number if one was visible on the page. Expect a lot of noise — directory aggregator pages, wrong cities, login pages, the chain's head-office page, the business you already have. Read every candidate for every combo; don't skim.

2. **If a combo's candidates aren't enough to confirm something, you may re-run the script** on a smaller one-off combos.json (same format, one entry) with a different angle, or inspect a specific candidate URL further. You have Bash, so you can write a tiny one-combo JSON and re-run the script, or call `crawlerGet`/the search helpers inside `scripts/content-upgrade/discover-businesses.mjs` yourself from a short throwaway script. Still no WebSearch/WebFetch.

## The verification bar (non-negotiable — same bar the production discovery routine uses)

**Never invent or guess a fact.** Every field you write must trace back to something you actually read on a page.

- **At least 2 independent sources** (different websites/hostnames) agreeing on the same business name and rough location. One source, or sources that disagree: discard it, write nothing. It's fine to leave it for a later pass.
- **A phone number AND a street address are both mandatory**, and both must belong to **this exact branch** in **this exact suburb** — not just "the chain" or "Polokwane generally". A number for "the KFC in Polokwane" is worthless if you can't tell which branch.
- **Never name an individual** in a description (owner, founder, director, doctor, attorney by name), even if a source states it. Describe what the business does, not who runs it. A business's registered name containing a person's name is fine as the `name` field itself; just don't expand it with first names in the text.
- Google Maps/Search result content, the business's own site, Facebook/Instagram business pages, other directories (yellowpages, cylex, brabys, infoisinfo, sayellow, hotfrog, medpages...), Chamber of Commerce listings, news articles — all fine as sources. OpenStreetMap/Overpass are **not** valid sources.
- Check `status/polokwane/db-snapshot.json`'s `suppressed` array (filtered to your suburbs) before adding anything: these were hidden or deleted by an admin and must never be re-added, under any slug, phone or name variant.
- If in doubt, skip it.

## Writing the description

Every business you add needs a **full 100–250 word description** (target 110–150 words), at most 1,500 characters — not a one-liner. Write it the way a good business owner would introduce their own business:

- **Third person** ("the practice", "the store"), never "we"/"our".
- Cover, in this order: (1) what it is and what it does — the specific services/products you actually read about; (2) what sets it apart — years trading, brand/group, who it serves, how it works; (3) where it is — suburb and city, one sentence, no trivia ("the capital of Limpopo" etc. — the same sentence repeated across listings is exactly the low-value content this is meant to fix); (4) a natural close — who it's a good fit for.
- **Paragraph breaks are mandatory — never one dense block.** Split into 2 paragraphs (3 only if it runs 7+ sentences), with a full blank line (`\n\n`) between them in the SQL string, at a natural pivot (usually right before the "where it is" sentence). A single `\n` renders as a line break, not a new paragraph — always use the full blank line. It must read like a person wrote two distinct paragraphs, never a mechanically chopped sentence count.
- Never: a phone number, email or link in the text; a named individual; invented superlatives ("award-winning", "the best") unless a source says so; sales filler ("one-stop shop", "look no further"); HTML.
- Only facts you actually read about **this** business. For a chain branch, one sentence of chain-level support is fine, but the description needs real branch-specific detail (services, what it stocks, how it operates at that location) — a description made only of chain-level facts isn't enough; skip the branch instead.
- Never repeat the same sentence across descriptions in your batch.

## Writing and checking the SQL

Checkpoint every **10 businesses** (the cap for this city) into one file: `db/routine-updates/polokwane/<UTC timestamp, e.g. 2026-10-05T14-30-00>.sql`. Never reuse or append to an earlier file. Format (from `routines/_shared.md`):

```sql
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'example-name-suburbslug', 'Example Name',
  (SELECT id FROM suburbs WHERE slug = 'suburbslug'),
  '123 Example St', '015 123 4567', NULL, NULL,
  'A full 100-250 word description...\n\nSecond paragraph...',
  NULL, NULL,
  '["https://real-source-one.example", "https://real-source-two.example"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'example-name-suburbslug'),
  (SELECT id FROM categories WHERE slug = 'the-combo-category-slug'),
  1
);
```

- `slug` = `slugify(name) + '-' + suburb_slug` (lowercase, non-alphanumeric runs → single hyphen); if it collides, append `-2`, `-3`.
- Omit `website`/`email`/`lat`/`lng` as `NULL` unless a source actually gives them.
- `source_urls` must be a JSON array of **at least 2 https URLs on different hostnames**, the exact ones you used.
- If the business sits inside a known shopping centre, add `shopping_center_id` — check `status/polokwane/db-snapshot.json`'s `shopping_centers` list for one in the same suburb; otherwise omit the column entirely.
- Use the category slug from the combo you're filling (`category` field in the batch file), not a guess.

Then validate every file before moving on:

```
node scripts/routines/validate.mjs db/routine-updates/polokwane/<file>.sql --routine discovery --city polokwane
```

It must print `ok`. Fix whatever it flags and re-run — never push a file that fails. It already checks: slug/suburb/category validity, duplicate phone/slug/address against the live snapshot, the suppressed list, the 2-source rule, the 100-250 word count, filler language, and the 10-record cap.

## Logging, committing and pushing

Append one JSON line to `status/polokwane/thin-pages-log.jsonl` (create it if missing) per checkpoint:

```json
{"date": "2026-10-05T19:00:00Z", "batch": NN, "suburbs": ["ladanna"], "published_new": 7, "discarded_unverified": 11, "short_summary": "Ladanna: added 7 across accommodation, automotive-repairs, bakeries; 4 categories had nothing verifiable."}
```

Commit exactly the checkpoint's SQL file(s) and the log file (don't touch `status/polokwane/state/*.json` — that belongs to the separate scheduled discovery routine, not this task). One short commit message per checkpoint, e.g. `thin-pages polokwane: ladanna batch NN (+7)`. End your commit message with:
```
Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>
```

You're on branch `thin-pages/polokwane`. Push with:
```
git add db/routine-updates/polokwane/<file>.sql status/polokwane/thin-pages-log.jsonl
git commit -m "..."
git fetch origin thin-pages/polokwane
git rebase origin/thin-pages/polokwane
git push origin HEAD:thin-pages/polokwane
```
If the push is rejected (another batch pushed first), repeat the `fetch` / `rebase` / `push` lines, up to 5 times. If a rebase conflict is only in `status/polokwane/thin-pages-log.jsonl` (another batch appended a line too), keep **both** lines — delete just the `<<<<<<<`/`=======`/`>>>>>>>` markers, `git add` it, `git rebase --continue`. Never `git push --force`, never merge, never touch another batch's SQL file.

## When you're done

Work through every combo in your batch, suburb by suburb, checkpointing every 10 adds (or sooner if you finish a suburb). When the whole batch is done (or you're running low on turns — commit and push whatever already cleared verification, don't leave it uncommitted), report back: combos closed to 3, combos still short and why, total businesses added, total discarded as unverifiable.
