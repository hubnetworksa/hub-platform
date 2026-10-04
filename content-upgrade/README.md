# Content upgrade: brief for one agent, one batch

**Your job:** write a better description for each of the 50 listings in **one** batch file:

- `content-upgrade/<city>/chunk-NNN.json`
- **Descriptions only.** Don't touch hours, email, phone, name, address or anything else.
- **Don't read other files** in the repo; everything you need is here and in the batch file.

Each listing in the batch gives you:
- `slug`, `name`, `category`, `suburb`, `address`
- `shopping_centre` and `website` when known
- `existing_sources`: the pages the listing was originally built from
- `current_description`: the thin text you're replacing
- `hours` when known: the business's own trading hours (already stored on the listing, the same text its page already shows). **If `hours` is present, work it naturally into the description** — one clause near the end is enough ("...and is open Monday to Friday from 8am to 5pm, and Saturdays until 1pm"). It's a real, sourced fact, not filler, even if several nearby businesses happen to share the same hours text; don't force it in if it reads awkwardly for that business. Cape Town and Polokwane chunks don't have this field backfilled yet — don't invent hours for a listing that doesn't have one.

## Research first, then write

The owner's instruction, verbatim: **"there must be something about the business — find it"**. Every listing is a real business that exists online, so the research step must surface something about it, and you must use it.

1. **Run the research script FIRST** (plain HTTP fetches, no Claude tools):

   ```
   node scripts/content-upgrade/research.mjs <city> <N>
   ```

   It runs three passes per listing: (1) the business's own website (home, /about, /about-us, /services, /contact) and its non-OSM `existing_sources`; (2) searches (Bing, name + suburb / city / category / facebook / street) until at least two relevant results; (3) opens up to three relevant result pages (own domain, Facebook, then directories such as snupit, procompare, yellowpages, cylex, brabys, hotfrog, medpages). It writes `content-upgrade/research/<city>/chunk-NNN.json` with, per listing: `pages` (title, description, text, bullets), `search` (title, url, snippet), `facts` (years trading, hours lines, service lists), `confidence` (`strong` = own site or owner-written directory text, `medium` = relevant snippets only, `none`) and a `note`. It prints the strong/medium/none counts and the slugs with `none`. It takes a minute or two.
2. **Read EVERY page and snippet** the research file holds for a listing before giving up on it. Snippets, page titles and meta descriptions all count. Don't skim the first one.
3. **No WebSearch and no WebFetch calls at all.** The Claude web tools share a ~200-call limit across the whole bulk run, so they are reserved. Everything you need is in the research file.
4. **Nothing generic, ever.** If the research file truly has nothing relevant about the business (every page and snippet is about something else, or only chain-level or mall-level facts), do NOT write a description. Mark the listing `"status": "deferred"` with a `reason` (what was tried, why nothing was usable). It is held back for a deeper pass. Padded or boilerplate text is worse than the current one-liner: Google treats it as low-value content. Read everything before deferring.
5. **Never repeat a sentence across listings.** The same sentence in three or more descriptions in a batch fails validation as templated filler.
6. Write it and move on. Don't polish.

The research file is intermediate output: it is gitignored, don't commit it.

## Writing rules: write it the way a good business owner would

Aim for the quality of the best owner-written listings on the sites. This one, by RE/MAX Northland Realty in Polokwane, is the model:

> RE/MAX Northland Realty is a well-established real estate office operating under the globally recognized RE/MAX brand. Benefiting from the international network and reputation while providing localized expertise, based in Polokwane (formerly Pietersburg), the Capital of Limpopo Province and the largest urban center North of Gauteng, RE/MAX Northland Realty has in-depth knowledge of the local property market. Our agents are familiar with the various suburbs and areas within and around Polokwane. Our office handles a diverse portfolio of properties, catering to various needs and budgets.

Why it works:
- It says what the business is and what it does.
- It says what it brings: the brand behind it and its local knowledge.
- It places the business in its area with real context, not just a suburb name.
- It says who it serves.
- It reads like a confident introduction, not a database line.

Write every description like that:

- **Length:** every description is `researched`: **100–250 words allowed, target 110–150**, at most 1,500 characters including spaces (the site's limit for the field). Count before you save. If a draft is short, add more sourced detail about what the business offers, never filler; if the sources can't carry 100 real words, mark the listing `deferred` instead. That's 4–7 flowing sentences in plain South African English, warm and professional, like a short "About us". The RE/MAX example above shows the quality to match; yours must be longer (100+ words). Use the extra room only for real, sourced detail, never padding.
- **Third person** ("the team", "the practice", "the store"), never "we" or "our". The business didn't write it, so don't speak for it.
- **Cover, in this order:**
  1. **What it is and what it does:** the specific services, products, brands and specialities you read about.
  2. **What sets it apart:** years trading, the brand or group behind it, who it serves (homeowners, trade, families, businesses), how it works (appointments, walk-ins, delivery, call-outs).
  3. **Where it is:** the centre, suburb and city, in one sentence at most. No area trivia ("the capital of Limpopo", "a sought-after suburb", "with around 180 stores"): the same area sentence repeated across many listings is exactly the low-value content this upgrade must avoid.
  4. **A natural close:** who it's a good fit for, or what visitors can expect.
- **Paragraph breaks — never one dense block.** Split the description into 2 paragraphs (3 if it runs to 7+ sentences) with a blank line between them: `\n\n` in the JSON string. A natural split is after part 2 (what it is/does + what sets it apart) and before part 3 (where it is + the close). The site renders a blank line as a new `<p>`, so without one the whole description shows as a single wall of text. A single `\n` would show as a line break instead, so always use a full blank line, never one newline.
- **Only facts you read** in a snippet or page about **this** business, or from the batch data. For chains (banks, supermarkets, pharmacies, fast food, fuel), the branch needs its own facts (its store page, hours, services, in-store departments, the centre it trades from); one sentence about the chain is fine as support, but a description made only of chain-level facts is not allowed: defer it.
- **Never:**
  - name a person (owner, doctor, partner);
  - put a phone number, email or link in the text;
  - make up claims ("award-winning", "the best", "leading") unless a source says so;
  - use sales filler ("one-stop shop", "look no further");
  - use HTML.
- **If the research file truly has nothing about the business** (and you read everything), mark it `{"slug": "...", "status": "deferred", "reason": "..."}` with **no description**. Never write from the address and category alone, never a "could not be confirmed" line, never invented services.

## Output: one JSON file, then one command

Write `content-upgrade/out/<city>/chunk-NNN.json`:

```json
{ "items": [
  { "slug": "<slug>", "description": "<110-150 words, max 1,500 characters>", "status": "researched", "sources": ["https://page-you-used"] },
  { "slug": "<slug>", "status": "deferred", "reason": "<what was tried / why nothing was usable>" }
] }
```

- **Include every listing in the batch,** exactly once.
- **`status`:** `researched` when the text has facts you found (list the pages you used in `sources`), otherwise `deferred` with a `reason` and no description.

Then run:

```
node scripts/content-upgrade/to-sql.mjs <city> <NNN>
```

It checks everything (researched 100–250 words, the 1,500-character limit, no sentence repeated in 3+ descriptions, every source of a researched description must be a URL in the research file for that listing, every deferred item has a reason and no description) and writes the guarded SQL to `db/routine-updates/<city>/content-NNN.sql` for the researched listings only (deferred listings get no SQL and stay as they are), plus a small sidecar `content-upgrade/<city>/done-NNN.json` (`{ city, chunk, generated_at, items: [{slug, status, sources | reason}] }`). The status is **not stored in the database** (there is no column); it exists only in that sidecar and as a comment in the SQL, so the deeper pass later lists the `deferred` listings from `done-NNN.json`. Each UPDATE only applies if the listing's description is still exactly the `current_description` from the batch file, so a hand-written rewrite made after the batch was prepared is never overwritten. The SQL leaves any owned, claimed or paid listing untouched (the database also blocks those), and the old text can be restored from the backup taken before the run.
- **If it lists descriptions to fix** (e.g. one under 100 words, or a source not in the research file), rewrite each in your JSON and run it again, or mark that listing `deferred` if the sources can't carry 100 real words. Repeat until it prints `ok`. Never drop a listing from the file.
- **Trial mode:** if you are told "trial", do NOT push. Commit locally only, and also append each listing's before/after to `status/content-upgrade-trial.md` in this format:

  ```
  ### <name> (<city>, <suburb>)
  status: <researched|deferred>   (deferred: give the reason instead of Before/After)
  sources: <urls, or none>
  **Before:** <current_description>
  **After:** <new description>
  ```
- **When it prints `ok` (and you were not told "trial"):** commit the JSON, the SQL and `done-NNN.json`, and push to `main` with the message `content-upgrade <city> chunk <NNN>`. If the push is rejected, run `git pull --rebase` and push again.

Done. Don't do another batch unless you were asked to.

## Deferred listings and owner descriptions

The site owner has said: if a business can't be found or described from sources, ask him and he will provide a description. Deferred listings are therefore collected for him:

```
node scripts/content-upgrade/deferred-report.mjs [pretoria|polokwane|capetown|all]
```

Reads every `content-upgrade/<city>/done-NNN.json`, writes `status/content-upgrade-deferred.md` (per city: name, what we know, reason, public listing URL, a blank `Description:` line) and creates or merges the fill-in template `content-upgrade/owner/<city>.json` (`{ "<slug>": "" }`). Filled text is never overwritten; slugs already researched or already written from owner text are skipped.

The owner fills the text in `content-upgrade/owner/<city>.json` (slug to description, one string each; leave `""` for ones not done). Then:

```
node scripts/content-upgrade/owner-sql.mjs <city>
```

Rules: owner text is published as-is after validation. It must be 100-250 words, at most 1,500 characters, with no phone number, email address, link or HTML, no sales filler, and no sentence repeated across 3+ descriptions. Third person is preferred but not enforced. Same paragraph-break rule as above: split it into 2-3 paragraphs with a blank line (`\n\n`) between them, never one dense block. It writes `db/routine-updates/<city>/owner-<YYYYMMDD-HHMM>.sql` behind the same guard as `to-sql.mjs` (shared in `scripts/content-upgrade/lib.mjs`; owned, claimed, paid, photographed or hand-edited listings are untouched), leaves `source_urls` alone, moves the written slugs to `content-upgrade/owner/<city>.done.json` and out of `<city>.json`.
