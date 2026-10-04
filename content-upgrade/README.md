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

## Work fast: budget per listing

1. **Search once:** `"<name>" <suburb>` (add the city if the name is common). **Run the searches for 5–10 listings in parallel** in one step.
2. **Read the result snippets first.** Google, directory and Facebook snippets usually say what the business does, what it sells and since when.
3. **Open at most one page per listing,** and only if the snippets aren't enough. Prefer its `website`, else the first `existing_sources` link. If a page is blocked, don't retry it; use the snippets.
4. **Then write it and move on.** Aim for about 2 tool calls per listing on average. Don't polish.

Every listing came from online sources, so there is almost always something to use. When a business's own pages are blocked, the snippets and `existing_sources` are enough.

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

- **At least 100 words (never less), ideally 100–150, never over 1,500 characters including spaces** (the site's limit for the description field). That's 4–7 flowing sentences in plain South African English, warm and professional, like a short "About us". The RE/MAX example above shows the quality to match; yours must be longer (100+ words). Use the extra room only for real, sourced detail, never padding.
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
- **If your research adds nothing about the business itself** (rare), still write a full, natural introduction (at least 100 words) from the batch data: what kind of business it is, where it is with that area context, the centre it's in, and who it serves (only if that's obvious from the category). Never invent services. Mark it `"from_known_details"`.

## Output: one JSON file, then one command

Write `content-upgrade/out/<city>/chunk-NNN.json`:

```json
{ "items": [
  { "slug": "<slug>", "description": "<100-150 words, max 1,500 characters>", "status": "researched", "sources": ["https://page-you-used"] },
  { "slug": "<slug>", "description": "<100-150 words, max 1,500 characters>", "status": "from_known_details", "sources": [] }
] }
```

- **Include every listing in the batch,** exactly once.
- **`status`:** `researched` when the text has facts you found (list the pages you used in `sources`, https only), otherwise `from_known_details`.

Then run:

```
node scripts/content-upgrade/to-sql.mjs <city> <NNN>
```

It checks everything (at least 100 words, the 1,500-character limit) and writes the guarded SQL to `db/routine-updates/<city>/content-NNN.sql`. The SQL leaves any owned, claimed or paid listing untouched (the database also blocks those), and the old text can be restored from the backup taken before the run.
- **If it prints problems:** fix those items in your JSON and run it again.
- **When it prints `ok`:** commit both files and push to `main` with the message `content-upgrade <city> chunk <NNN>`. If the push is rejected, run `git pull --rebase` and push again.

Done. Don't do another batch unless you were asked to.
