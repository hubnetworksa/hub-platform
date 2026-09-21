# Routine 2: shopping centres

Read `routines/_shared.md` first. This routine keeps the link between shopping centres and their tenants correct, one centre per run. It replaces the old jobs 2 and 3 and the monthly new-mall search.

**Why a centre's own website wins:** a shopping centre's official website (its own domain, not a directory or aggregator) is the single authoritative source for who its tenants are. It beats GPS proximity (a shop across the road gets mislinked) and beats a business's own address line saying "at Example Mall". When they disagree, the centre's own site wins.

**You own:** `INSERT`s of new tenant businesses and new centres, and two narrow `UPDATE`s that change only `shopping_center_id` on one business (link or unlink). **Nothing else on an existing row may change**, not the name, phone, address, category or description, even if the centre's site suggests a different value.

Run: `node scripts/routines/next.mjs centres --city <city>`. The packet's `mode` decides what to do.

## Mode `first-sweep` or `recheck`

The packet gives one `centre`, its `knownTenants`, `unlinkedInSuburb`, `categories` and `suburbs`. (`first-sweep` is a centre that has never been swept, including ones discovery just added; `recheck` is a routine re-verification, about monthly.)

1. **Find the centre's own official website.** Search `"<centre name>" official website` or `"<centre name>" store directory <suburb>`. If there is no real, distinct website (a directory listing, Facebook-only presence, or nothing), **stop here**: log `official_site_found: false` and record the centre as swept (below). This is a normal outcome: some rows are single shops or brand names that will never have a mall website.
2. **Fetch its full tenant list** (a "Stores", "Tenants" or "Store Directory" page). Read the whole list, not a sample. If fetching is blocked and search snippets cannot give you the **complete** list with confidence, treat it exactly like "no official website found". A partial list is worse than no sweep, because step 3 would unlink real tenants who were merely not visible.
3. **Reconcile against `knownTenants` and the city:**
   - **Known tenant not on the official list:** unlink it.
     `UPDATE businesses SET shopping_center_id = NULL WHERE slug = '<business-slug>';`
   - **Tenant on the official list that already exists as a standalone business** (same name, right area) **but is not linked:** link the existing row, do not insert a duplicate. Find the business in the packet's `unlinkedInSuburb` list (existing businesses in the centre's suburb that are not linked to any centre). Use:
     `UPDATE businesses SET shopping_center_id = (SELECT id FROM shopping_centers WHERE slug = '<centre-slug>') WHERE slug = '<business-slug>';`
   - **Tenant on the official list not in the directory at all:** publish it as a new business with the centre's `shopping_center_id` (format in `_shared.md`). The official site counts as one source; you still need a second independent source per tenant and the mandatory phone and street address (a shop number inside the centre's address counts as the address). Skip any tenant that cannot clear that bar; work through **every** name on the list, in batches of `maxRecordsPerFile` records per file.
   - **Already correctly linked:** nothing to do.
4. If the official site mentions another property you did not know about, leave it. The monthly new-mall search or discovery will find it.

## Mode `new-mall-discovery`

The packet gives `knownCentres`. Actively search the city for shopping centres and malls that are **not** in that list (for example lists of malls for the city, or dense retail suburbs with thin coverage). For each new one that clears the 2-source bar, insert the centre and immediately run the sweep steps above on it. The existing-business linking case matters most here: a mall you only discover now may have tenants that earlier discovery runs already published as standalone businesses, so link those rather than inserting duplicates. If nothing new is found, that is a fine outcome: log zero counts.

## Checkpoints

Validate every file: `node scripts/routines/validate.mjs <file> --routine centres --city <city>` (must print `ok`).

After the sweep is finished (or every `maxRecordsPerFile` records), commit and push, then record progress:

- Centre sweep finished: `node scripts/routines/done.mjs centres --city <city> --swept <centre-slug>`
- New-mall discovery finished: `node scripts/routines/done.mjs centres --city <city> --new-mall --add-swept <slug,slug>` (the centres you added and already swept in this run; leave `--add-swept` off if none)

## Log lines

```json
{"date": "2026-10-05T10:00:00Z", "shopping_center": "example-mall-rondebosch", "action_taken": "shopping_center_sweep", "official_site_found": true, "tenants_added": 12, "tenants_linked": 1, "tenants_unlinked": 3, "discarded_unverified": 0, "short_summary": "Example Mall: reconciled against its own site -- added 12 confirmed tenants, linked 1 existing business, unlinked 3 not on the mall's own list."}
{"date": "2026-11-01T10:00:00Z", "action_taken": "new_mall_discovery", "shopping_centers_found": 2, "tenants_added": 5, "tenants_linked": 3, "short_summary": "Found 2 new shopping centres via active search; reconciled both against their own sites."}
```

When no official site was found: `"official_site_found": false` with all counts 0 and a short summary saying so.
