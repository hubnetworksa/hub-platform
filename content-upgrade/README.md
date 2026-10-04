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

## Writing rules

- **80–150 words, 3–6 sentences, plain South African English.**
- **Order:**
  1. What the business does: specific services, products, brands and specialities from what you read.
  2. Anything distinctive: years trading, who it serves, appointments versus walk-ins.
  3. Where it is: the address, the shopping centre, the suburb and the city, from the batch data.
- **Only facts you read** in a snippet or page about **this** business, or from the batch data. For chains (banks, supermarkets, pharmacies, fast food, fuel), say only what this branch is and what the chain's own site says every branch offers.
- **Never:**
  - name a person (owner, doctor, partner);
  - put a phone number, email or link in the text;
  - use sales filler ("one-stop shop", "look no further", "best in town");
  - use HTML.
- **If your research adds nothing about the business itself** (rare), write the 80+ words from the batch data: what kind of business it is, its full address, the centre and the suburb, and that its phone number and directions are on the page. Never invent services. Mark it `"from_known_details"`.

## Output: one JSON file, then one command

Write `content-upgrade/out/<city>/chunk-NNN.json`:

```json
{ "items": [
  { "slug": "<slug>", "description": "<80-150 words>", "status": "researched", "sources": ["https://page-you-used"] },
  { "slug": "<slug>", "description": "<80-150 words>", "status": "from_known_details", "sources": [] }
] }
```

- **Include every listing in the batch,** exactly once.
- **`status`:** `researched` when the text has facts you found (list the pages you used in `sources`, https only), otherwise `from_known_details`.

Then run:

```
node scripts/content-upgrade/to-sql.mjs <city> <NNN>
```

It checks everything and writes the guarded SQL to `db/routine-updates/<city>/content-NNN.sql`. The SQL leaves any owned, claimed or paid listing untouched and keeps the old text for undo.
- **If it prints problems:** fix those items in your JSON and run it again.
- **When it prints `ok`:** commit both files and push to `main` with the message `content-upgrade <city> chunk <NNN>`. If the push is rejected, run `git pull --rebase` and push again.

Done. Don't do another batch unless you were asked to.
