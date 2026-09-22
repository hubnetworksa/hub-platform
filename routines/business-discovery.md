# Routine 1: business discovery

Read `routines/_shared.md` first. This routine finds **new businesses** in a few suburbs per run. It runs every 3 hours while a city still has suburbs it has not covered, then weekly (the script decides).

**You own:** `INSERT`s of brand-new businesses (and their `business_categories` row), and, rarely, a brand-new shopping centre. **You never change an existing row.** Everything else about existing businesses belongs to the other routines (centres, enrichment, closed check).

Run: `node scripts/routines/next.mjs discovery --city <city>`

## The work packet

`suburbs` lists this run's suburbs (normally 3). For each one you get its `knownBusinesses` (slug, name, phone, address, centre) and `knownCentres`. `categories` is the only list of category slugs you may use. `mode` is `first-lap` (the city is still being covered for the first time) or `maintenance` (everything has been covered once; look for new openings).

## For each suburb, one at a time

1. Search for businesses in that suburb that are **not** in `knownBusinesses`. Cover a range of categories, not just restaurants. Read `categoryNotes` for city-specific rules (for example, where banks and ATMs are filed).
2. Verify each candidate per `_shared.md`: 2 independent sources, a real street address and phone for this exact branch, no individual named.
3. **Boundary suburbs:** a business on a boundary street can be found under either neighbour. The validator rejects a phone number that already exists anywhere in the city, but also skim the suburb's neighbours if you notice the same name.
4. **Shopping centres:** if a business is inside a centre listed in `knownCentres`, give it that centre's `shopping_center_id`. If you find a multi-tenant mall that is not in `knownCentres` and it clears the 2-source bar, insert it as a new shopping centre. It queues itself for its first sweep by the centres routine; you do not need to do anything else, and you do **not** research its tenants (the centres routine owns that).
5. Write the SQL (formats in `_shared.md`), then validate:

```
node scripts/routines/validate.mjs db/routine-updates/<city>/<file>.sql --routine discovery --city <city>
```

## Checkpoints

A checkpoint is whichever comes first: `maxRecordsPerFile` records, or the end of one suburb. After each suburb:

1. Validate the SQL file (`ok` required).
2. Record the suburb as done, **in the order the packet listed them**:
   `node scripts/routines/done.mjs discovery --city <city> --finished <suburb-slug>`
3. Append the log line, commit the SQL file, the log and `status/<city>/state/discovery.json`, and push.

If you run out of turns, only the suburbs you finished and committed are recorded, so the next run picks up where you stopped.

## Log line

```json
{"date": "2026-10-01T10:00:00Z", "suburb": "rondebosch", "action_taken": "research", "published_new": 3, "discarded_unverified": 4, "shopping_centers_added": 1, "short_summary": "Rondebosch: added 3 new businesses (all with verified phone numbers) and Example Centre."}
```

`published_new` counts every new business row, tenants included. `shopping_centers_added` is 0 when none.
