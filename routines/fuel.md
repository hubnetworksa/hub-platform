# Monthly fuel-price routine — runbook (all three cities)

You are a scheduled cloud agent. You have **zero memory of previous runs**: everything you need is in this file and the repo's `status/` files. Read all of it and `routines/_shared.md` (the contract, environment limitation and commit rules) before doing anything.

## What this job is

South African pump prices are regulated and change **once a month, effective the first Wednesday of the month**. TheCapeTownHub, PretoriaHub and PolokwaneHub each show this month's prices in the homepage "Fuel price" panel. This routine keeps that panel current for all three sites in one run.

It is **separate from the daily news routine** (`routines/news.md`), which no longer touches fuel prices. You own one table: `fuel_prices`. Never touch anything the other routines own.

Same contract as every routine: **you have no Cloudflare credentials and must never run `wrangler d1 execute`.** You propose changes by writing SQL files to `db/routine-updates/<city>/`, which the deploy workflow applies. Your job ends at "commit and push the SQL files".

## Step 0: is anything due? (do this first, every run)

```
node scripts/fuel-due.mjs
```

- It prints `not due: …` and exits with code 3 on every day except the first Wednesday of the month and the two days after it (Thursday and Friday are catch-up days for a source that could not be read, or an announcement that was late). **If it says not due, write one log line (see below) and stop.** Do not search the web.
- Otherwise it prints JSON with the `period` (`YYYY-MM`) and, per city, which region and which grades are still missing. Only work on what it lists.

## Regions

Prices differ between the coast and the inland region:

| City | Region to use |
|---|---|
| Cape Town | `coastal` |
| Pretoria | `inland` |
| Polokwane | `inland` |

So one research pass covers all three cities: you read the **coastal** and **inland** columns once, and Pretoria and Polokwane get identical figures.

## Research (once, for all cities)

1. Find the official announcement (Department of Mineral and Petroleum Resources / Central Energy Fund) and **at least one more independent source from a different website** (AA of South Africa, or a major news outlet). Read them.
2. Take the per-litre prices for both regions for these four grades: `Petrol 95`, `Petrol 93`, `Diesel 50ppm`, `Diesel 500ppm`. `Diesel 50ppm` is the 0.005% sulphur grade and `Diesel 500ppm` the 0.05% sulphur grade. Announcements usually label them by sulphur percentage.
3. **Only use figures printed in the sources. Never estimate.** If the prices for the current month are not published yet, or a source cannot be read, do not write anything: log it and stop. The routine runs again the next day inside the window.
4. **Never load prices before their effective Wednesday.** An announcement usually appears a few days earlier. Loading it early would show next month's prices on the homepage before they apply. Step 0 already enforces this.

## Writing the SQL (one file per city)

For each city that Step 0 listed, write `db/routine-updates/<city>/<YYYY-MM-DDTHH-MM-SS>-fuel-<period>.sql` containing one statement per missing grade for that city's region:

```sql
INSERT OR IGNORE INTO fuel_prices (period, region, grade, price_cents, change_cents, source_url, verification_json)
VALUES ('2026-10', 'coastal', 'Petrol 95', 2184, -42, 'https://official-announcement-url',
  '["https://official-announcement-url", "https://second-independent-source"]');
```

- `price_cents` is rand per litre times 100 (R21.84 is `2184`).
- `change_cents` is the change against last month's price for that grade (negative means cheaper). Work it out from the previous period's row in `status/<city>/db-snapshot.json` (`fuel_prices`), or use the announced change.
- `verification_json` lists at least two source URLs from at least two different sites, and `source_url` is the main one.
- `INSERT OR IGNORE` keeps a re-run harmless.

## Check before you push

```
node scripts/check-news.mjs db/routine-updates/<city>/<your file>.sql --city <city> --online
```

Run it for each city's file. The gate confirms the file only inserts into `fuel_prices`, every field is well formed, there are at least two different source sites, and every price actually appears in a source. It prints `ok` or `FAIL` and exits non-zero on any failure. Fix or remove every failing row and re-run. **Never push a file that fails the check.** If a source is blocked from your environment, that price cannot be verified: discard it.

## Logging and committing

Append one line to `status/fuel-agent-log.jsonl` every run, including runs that stop at Step 0:

```json
{"date": "2026-10-07T06:00:00Z", "action_taken": "fuel_prices", "period": "2026-10", "cities": ["capetown", "pretoria", "polokwane"], "loaded": 8, "short_summary": "Loaded October coastal and inland prices from the CEF announcement and AA; check-news ok for all three files."}
```

A "not due" run logs `"action_taken": "fuel_not_due"` with a one-line reason. Commit the SQL files (only if at least one passed) together with the log line, and push to `main`.

## Schedule

Wednesday, Thursday and Friday at 08:00 South African time (06:00 UTC). A cron expression cannot say "first Wednesday" on its own (day-of-month and weekday combine as "either"), so Step 0 decides. In the three weeks of the month that are not the first, the run stops at Step 0 within seconds. To avoid even those starts, a GitHub Action can run `node scripts/fuel-due.mjs` first and only start the agent when it exits 0.
