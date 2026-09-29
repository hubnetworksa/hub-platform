# Routine: monthly tourism refresh

Read `routines/_shared.md` first (the contract, Step 0 and environment limitation apply). This routine keeps the city's "Things to do" page (`/tourism/`) accurate: attraction prices, opening times and closures, plus new attractions worth adding. The current prices and times on the page were taken from the design mockup and **must be confirmed**; this routine is how they get confirmed and then stay current.

**You never edit the website's code and you never write SQL.** The page's content lives in `src/site-content/tourism.ts` (a code file), so a wrong edit could break the site build. Instead you write a **proposal for a human to review and apply**.

Run: `node scripts/routines/next.mjs tourism --city <city>`. The packet's `currentPicks` lists each attraction on the page with the price and time it currently shows.

## For each attraction in `currentPicks`

1. Find the attraction's own official website (or the operator's official page). Read its current **entry price** (adult and, where relevant, child), **typical visit time**, **opening days and hours**, and any **closure notice** (maintenance, weather, seasonal). Verify with the same rule as everywhere: the figure must be **stated** on a page you read, and for a price or time change you need **at least 2 independent sources or the operator's own page** (an operator's own current price page is authoritative on its own).
2. Compare with what the page shows. Note **only real differences**: a changed price, changed hours, a permanent closure, a renamed attraction. Do not rewrite blurbs for style.
3. Never invent a figure. If you cannot confirm a value, write "could not confirm" for that item and leave the page's value alone.

## New attractions

Suggest at most **3** new attractions per run that are clearly worth a visitor's time (a proper attraction with its own official site and public opening details), with the same facts the page shows for each pick: name, category (`Landmark`, `Heritage`, `Outdoors`, `Family` or `Day trip`), area, price, time, and a one-sentence blurb in your own words. Skip anything you cannot verify.

## Output

Append a dated section to `status/<city>/tourism-proposals.md` (create it if missing), in this shape:

```
## 2026-10-01

### Changes to existing attractions
- **Table Mountain Cableway**: price shown R420 return, official site now shows R435 return (source: https://…). Hours unchanged.
- **Robben Island Museum**: could not confirm current ferry price; leave as is.

### Closures and notices
- Cableway closed 13-19 October for annual maintenance (source: https://…).

### Suggested new attractions
- **Example Attraction** (Heritage, Sea Point, R120, 2 hours): one-sentence blurb. Sources: https://…, https://…
```

Then append one line to `status/<city>/tourism-agent-log.jsonl`, commit only those two files, and push to `main`:

```json
{"date": "2026-10-01T06:00:00Z", "action_taken": "tourism_refresh", "checked": 6, "changes": 1, "closures": 1, "suggested_new": 1, "short_summary": "Checked 6 attractions: 1 price change, 1 upcoming closure, 1 new attraction suggested. Proposals in status/capetown/tourism-proposals.md for review."}
```

A person reviews the proposal and edits `src/site-content/tourism.ts` (or asks for the edit). A run with no differences still logs zero counts.
