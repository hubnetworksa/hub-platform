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

## Research first, then write

The owner's instruction, verbatim: **"there must be something about the business — find it"**. Every listing is a real business that exists online, so the research step must surface something about it, and you must use it.

1. **Run the research script FIRST** (plain HTTP fetches, no Claude tools):

   ```
   node scripts/content-upgrade/research.mjs <city> <N>
   ```

   It runs three passes per listing: (1) the business's own website (home, /about, /about-us, /services, /contact) and its non-OSM `existing_sources`; (2) searches (Bing, name + suburb / city / category / facebook / street) until at least two relevant results; (3) opens up to three relevant result pages (own domain, Facebook, then directories such as snupit, procompare, yellowpages, cylex, brabys, hotfrog, medpages). It writes `content-upgrade/research/<city>/chunk-NNN.json` with, per listing: `pages` (title, description, text, bullets), `search` (title, url, snippet), `facts` (years trading, hours lines, service lists), `confidence` (`strong` = own site or owner-written directory text, `medium` = relevant snippets only, `none`) and a `note`. It prints the strong/medium/none counts and the slugs with `none`. It takes a minute or two.
2. **Read EVERY page and snippet** the research file holds for a listing before giving up on it. Snippets, page titles and meta descriptions all count. Don't skim the first one.
3. **No WebSearch and no WebFetch calls at all.** The Claude web tools share a ~200-call limit across the whole bulk run, so they are reserved. Everything you need is in the research file.
4. **`from_known_details` is only for a listing whose research file truly has nothing relevant** (`confidence: none`, or every page and snippet is about something else). Then write **30–80 words** using only facts you actually have (name, category, address, suburb, a website if listed). **No** sentences about the area, the mall or the suburb, and **no** "could not be confirmed" or "no further details" sentences. A short, factual description is fine.
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

- **Length depends on the status.** `researched` (you found facts about this business): **100–250 words allowed, target 110–150**. `from_known_details` (research file has nothing relevant): **30–120 words allowed, target 30–80**. Both: at most 1,500 characters including spaces (the site's limit for the field). Count before you save. If a researched draft is short, add more sourced detail about what the business offers and more about the area, never filler. That's 4–7 flowing sentences in plain South African English, warm and professional, like a short "About us". The RE/MAX example above shows the quality to match; yours must be longer (100+ words when researched). Use the extra room only for real, sourced detail, never padding.
- **Third person** ("the team", "the practice", "the store"), never "we" or "our". The business didn't write it, so don't speak for it.
- **Cover, in this order:**
  1. **What it is and what it does:** the specific services, products, brands and specialities you read about.
  2. **What sets it apart:** years trading, the brand or group behind it, who it serves (homeowners, trade, families, businesses), how it works (appointments, walk-ins, delivery, call-outs).
  3. **Where it is, with context:** the centre, suburb and city, plus a well-known fact about the area when it helps. For example, "Polokwane, the capital of Limpopo", or "Bendor, one of Polokwane's main residential and retail suburbs". Only use facts that are true and widely known, or that you read; no guesses about roads or distances.
  4. **A natural close:** who it's a good fit for, or what visitors can expect.
- **Only facts you read** in a snippet or page about **this** business, or from the batch data. For chains (banks, supermarkets, pharmacies, fast food, fuel), describe this branch plus what the chain's own site says every branch offers.
- **Never:**
  - name a person (owner, doctor, partner);
  - put a phone number, email or link in the text;
  - make up claims ("award-winning", "the best", "leading") unless a source says so;
  - use sales filler ("one-stop shop", "look no further");
  - use HTML.
- **If the research file truly has nothing about the business** (`confidence: none` and you read everything), mark it `"from_known_details"` and write **30–80 words** (30–120 allowed). Write ONLY what is actually known: the category, address, suburb and trading pattern if it is in the data. No sentence about the area, the mall or the suburb, no "could not be confirmed" line, no invented services. It is fine to be short: the same padding repeated across a suburb is near-duplicate thin content, which is the exact problem this upgrade is meant to fix.

## Output: one JSON file, then one command

Write `content-upgrade/out/<city>/chunk-NNN.json`:

```json
{ "items": [
  { "slug": "<slug>", "description": "<110-150 words, max 1,500 characters>", "status": "researched", "sources": ["https://page-you-used"] },
  { "slug": "<slug>", "description": "<30-80 words, only what is known, max 1,500 characters>", "status": "from_known_details", "sources": [] }
] }
```

- **Include every listing in the batch,** exactly once.
- **`status`:** `researched` when the text has facts you found (list the pages you used in `sources`, https only), otherwise `from_known_details`.

Then run:

```
node scripts/content-upgrade/to-sql.mjs <city> <NNN>
```

It checks everything (researched 100–250 words, from_known_details 30–120, the 1,500-character limit, no sentence repeated in 3+ descriptions, and every source of a researched description must be a URL in the research file for that listing) and writes the guarded SQL to `db/routine-updates/<city>/content-NNN.sql`, plus a small sidecar `content-upgrade/<city>/done-NNN.json` (`{ city, chunk, generated_at, items: [{slug, status, sources}] }`). The status (`researched` / `from_known_details`) is **not stored in the database** (there is no column); it exists only in that sidecar and as a comment in the SQL, so a later pass can list the `from_known_details` listings from `done-NNN.json`. Each UPDATE only applies if the listing's description is still exactly the `current_description` from the batch file, so a hand-written rewrite made after the batch was prepared is never overwritten. The SQL leaves any owned, claimed or paid listing untouched (the database also blocks those), and the old text can be restored from the backup taken before the run.
- **If it lists descriptions to fix** (e.g. a researched one under 100 words, or a from_known_details one outside 30–120), rewrite each in your JSON and run it again. Repeat until it prints `ok`. Never drop a listing from the file.
- **Trial mode:** if you are told "trial", do NOT push. Commit locally only, and also append each listing's before/after to `status/content-upgrade-trial.md` in this format:

  ```
  ### <name> (<city>, <suburb>)
  status: <researched|from_known_details>
  sources: <urls, or none>
  **Before:** <current_description>
  **After:** <new description>
  ```
- **When it prints `ok` (and you were not told "trial"):** commit the JSON, the SQL and `done-NNN.json`, and push to `main` with the message `content-upgrade <city> chunk <NNN>`. If the push is rejected, run `git pull --rebase` and push again.

Done. Don't do another batch unless you were asked to.
