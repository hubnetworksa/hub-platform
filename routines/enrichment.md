# Routine 3: description, hours and email enrichment

Read `routines/_shared.md` first. Discovery inserts businesses with a quick, bare description to keep coverage fast. This routine is the second pass: it researches existing businesses in more depth and fills in a better description, the trading hours and **the company's contact email**.

**You own:** on an **existing** business, only these columns: `description`, `description_enriched_at`, `hours`, `source_urls` (append only), and `email` (only when it is empty). Nothing else on the row may change (name, phone, address, category, coordinates), even if you notice it looks wrong: that is not this routine's job.

Run: `node scripts/routines/next.mjs enrichment --city <city>`. It gives one of two modes.

## Mode `full`: the backlog of businesses never enriched

The packet's `batch` lists the next businesses whose `description_enriched_at` is empty, in order, with `remainingBacklog` and `maxRecordsPerFile`. Do the whole batch. For each business:

1. **Research it.** Search `"<name>" <suburb>` and fetch its `website` or a real URL in `sourceUrls` if there is one; a business's own site is the best source for what it actually does. Look for what it specialises in, notable products or services, how long it has operated, what distinguishes it from a same-category neighbour, **its trading hours**, and **its company contact email** (see the email rules below). Same chain-branch caution as everywhere: everything you use, hours and email included, must be about *this specific location*.
2. **Write the new description**: one to two natural sentences, specific to this business, not a template, **never naming an individual** (see `_shared.md`). Two acceptable outcomes, both count as enriched:
   - **Researched:** you found genuine new facts. Write them naturally (not a bare fact-dump) and append the source(s) you used to `source_urls`. **Append, never replace**: the original entries stay.
   - **Reworded:** you found nothing beyond what is on file (common for small businesses). Write a more natural, category-specific sentence using only already-verified fields (name, category, suburb, whether it is inside a centre), invent nothing, and leave `source_urls` alone.
3. **Hours**, independent of the above: if you found genuine trading hours, write one compact human-readable line, for example `'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'` or `'Open 24 hours'`. Collapse identical consecutive days (`Mon-Fri`, not four repeats) but stay literal to the source: never round or guess at gaps. If no hours turn up, leave the `hours` column out of the UPDATE entirely (never `hours = NULL`).
4. **Write the guarded UPDATE:**

```sql
UPDATE businesses
SET description = 'New, specific description here.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://original-source.example", "https://new-source-you-found.example"]'
WHERE slug = 'example-business-suburbslug' AND description_enriched_at IS NULL;
```

   `source_urls` is the **full new array** (the existing value from the packet plus the new URL(s)); omit that line and the `hours` line when they do not apply.
5. **If you found an email, write a separate statement** (it counts as its own record):

```sql
UPDATE businesses SET email = 'info@example.co.za'
WHERE slug = 'example-business-suburbslug' AND (email IS NULL OR email = '');
```

## Mode `email-only`: enriched businesses that still have no email

The packet's `batch` lists businesses that already have a description but no email (`hasEmail: false`). For each, look **only** for a published company contact email; do not touch the description or hours. Write the email `UPDATE` above only when you find a valid one. After the batch, move the cursor whether or not you found anything, so the next run continues down the list:

`node scripts/routines/done.mjs enrichment --city <city> --email-cursor <last slug in the batch>`

## The email rules (non-negotiable)

- **Only a company contact address that the business itself publishes:** on its own website (contact page, footer, or page markup) or in its official listing. Generic role addresses such as `info@`, `hello@`, `sales@`, `accounts@`, `bookings@` are fine.
- **Never** use a named individual's personal address, an address from a third-party data-broker or lead-list site, or a guessed or pattern-built address (`firstname@domain`).
- The address must appear on a page that also carries the business's name or phone number, and its domain should match the business's website when it has one. Add that page to `source_urls` (append) when you use it in `full` mode.
- Never overwrite an email that is already on file (the guard in the SQL enforces this).
- Purpose and privacy: the address is used only to send the ownership-verification link when someone claims the business. It is not shown on the public pages. Do not include it in a description.

## Checkpoints

Validate every file: `node scripts/routines/validate.mjs <file> --routine enrichment --city <city>` (must print `ok`; the cap is `maxRecordsPerFile` records per file). Commit and push after each file. Progress in `full` mode is automatic: a finished business drops out of the backlog when its UPDATE is applied. In `email-only` mode run the `done.mjs` command above.

## Log line

One per checkpoint. `researched` = rewritten with genuine new facts, `reworded` = rewritten from known fields only, `hours_found` and `emails_found` = counts in this checkpoint, `remaining_backlog` = the packet's `remainingBacklog` at the start of this checkpoint:

```json
{"date": "2026-10-10T10:00:00Z", "action_taken": "description_enrichment", "mode": "full", "researched": 6, "reworded": 9, "hours_found": 4, "emails_found": 5, "remaining_backlog": 41, "short_summary": "Rewrote 15 descriptions: 6 with new facts (source added), 9 reworded from known fields only. Hours found for 4 and a company email for 5."}
```

For `email-only` runs use `"mode": "email-only"`, `"checked": 30`, `"emails_found": 7` and `"remaining_without_email"` instead of the description counts.
