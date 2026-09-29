# Routine 4: closed-business check

Read `routines/_shared.md` first. Businesses shut down, and a listing with a dead phone number or a "Permanently closed" Google Maps tag makes a directory look unmaintained. This routine works through the published businesses in a slow, perpetual loop (weekly, small batches; when it reaches the end it wraps around).

**You own one change:** setting `closed_at` on an existing business. **You never delete a row.** A false match (wrong branch of a chain, a same-named business in another suburb, a listing that is only temporarily or seasonally closed) would otherwise be a silent, irreversible loss of verified data with no human in the loop. Setting `closed_at` only hides the listing: the site build excludes any business with `closed_at` set, so it disappears from listings, search and the sitemap on the next deploy and its own page correctly 404s, but the row and everything researched about it stays in the database, and a human can restore it with one UPDATE.

Run: `node scripts/routines/next.mjs closed-check --city <city>`. The packet's `batch` lists the next businesses after the last one checked (normally 5).

## For each business in the batch

1. Search `"<name>" "<suburb>"` (or the name and address) and look for an explicit **"Permanently closed"** status: either fetch the business's Google Maps listing, or (when fetching is blocked, see `_shared.md`) accept a WebSearch snippet only if it **literally** shows the "Permanently closed" tag for a listing that clearly matches this exact business at this exact address. A pin or number for "the other branch" does not count. "Temporarily closed", news of a closure "amid tough trading" or a dead website alone do **not** count.
2. **Confirmed permanently closed:**

```sql
UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'example-slug-suburbslug' AND closed_at IS NULL;
```

3. **Still open, or you cannot confirm closure with confidence:** do nothing, write no SQL. A false "still open" costs nothing; a false "closed" costs a real business its listing.

## Finish

- Validate any SQL: `node scripts/routines/validate.mjs <file> --routine closed-check --city <city>` (must print `ok`).
- Record where you stopped, **even when nothing closed**, using the slug of the last business you checked: `node scripts/routines/done.mjs closed-check --city <city> --last-slug <slug>`
- Append the log line, commit the SQL (if any), the log and `status/<city>/state/closed-check.json`, and push.

```json
{"date": "2026-10-01T10:00:00Z", "action_taken": "closed_business_check", "checked": 5, "closed": 1, "short_summary": "Checked 5 businesses after 'example-earlier-shop-suburbslug': confirmed 'example-old-shop-suburbslug' permanently closed on Google Maps, the other 4 still open."}
```
