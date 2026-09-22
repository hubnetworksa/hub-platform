# Routines (rewritten, dev branch)

These are the rewritten routines described in `ROUTINES-PLAN.md`. They live on the `Ethan` branch only and **nothing is scheduled yet**: the older `ROUTINE.<city>.md` runbooks at the repo root remain the live ones until the cut-over below. Nothing here has been pushed to `main`.

## What is here

| File | Routine | Replaces | Suggested schedule (UTC) |
|---|---|---|---|
| `business-discovery.md` | 1. Business discovery | Job 1 of the business runbook | Every 3 hours at :00 while a city has uncovered suburbs; the script drops it to weekly afterwards |
| `shopping-centres.md` | 2. Shopping centres | Jobs 2 and 3, new-mall search | Daily 08:30 (one centre per run) |
| `enrichment.md` | 3. Description, hours and email enrichment | Job 4, plus company emails | Daily 11:30 |
| `closed-check.md` | 4. Closed-business check | Job 5 | Weekly, Monday 12:30 |
| `events.md` | Events | `ROUTINE.events.<city>.md` | Weekly, Sunday 07:00 |
| `news.md` | Local news | `ROUTINE.news.<city>.md` (news only) | Daily 04:00 |
| `fuel.md` | Fuel prices (all three cities) | Fuel section of the news runbooks | Wednesday to Friday 06:00; `fuel-due.mjs` stops it except the first Wednesday and the two days after |
| `tourism-refresh.md` | Tourism refresh | New | Monthly, the 1st at 07:00; writes proposals only |
| `_shared.md` | Rules every routine follows | Repeated text in nine runbooks | n/a |
| `cities/<city>.json` | Per-city settings (areas, sources, batch sizes, category notes) | Three near-identical runbooks | n/a |

Stagger the three cities by 10 minutes (Cape Town :00, Pretoria :10, Polokwane :20) so they never commit at the same minute. Enrichment and the closed check start at a different time from discovery by design: they work on businesses that already exist.

One shared runbook per routine type serves all three cities: the city is passed as `--city`, and everything city-specific comes from `cities/<city>.json` and the work packet.

## Scripts (`scripts/routines/`)

| Script | What it does |
|---|---|
| `next.mjs <routine> --city C` | **Step 0.** Says whether anything is due (exit 3 and a reason if not, so the agent stops without searching) and otherwise prints a small work packet: the suburbs and their known businesses, the centre and its tenants, the enrichment batch, and so on. Agents no longer read the whole snapshot. |
| `validate.mjs <file.sql> --routine R --city C` | **The gate.** Rejects statements outside the routine's allow-list, unknown suburb or category slugs, a missing phone or address, fewer than two independent sources, duplicate slugs and phone numbers (across the whole city), UPDATEs without their one-time guard, dropped source URLs, personal-looking emails, and files over the record cap. |
| `done.mjs <routine> --city C …` | Records progress in `status/<city>/state/<routine>.json`. Agents never edit state by hand. |
| `migrate-state.mjs [--city C] [--write]` | One-off: builds the new per-routine state files from each city's old `routine-state.json` (which it does not modify). |
| `health.mjs [--json]` | Last run and lateness per routine and city, from the logs; exit code 1 when anything is late. For the admin health tile and a GitHub Action alert. |
| `../fuel-due.mjs` | Guard for the fuel routine (first Wednesday of the month, South African time). |
| `../check-news.mjs` | Existing gate for news and fuel rows. |
| `../generate-event-images.mjs --site C` | Gives every event with no image a free, non-copyrighted, AI-generated one matching its type (Cloudflare Workers AI, no external key). Run after an events deploy, not by the agent — done live for Pretoria on 21 September (all 20 events that had none). |

State lives in small per-routine files (`status/<city>/state/discovery.json`, `centres.json`, `enrichment.json`, `closed-check.json`) so two routines never edit the same file. A new shopping centre found by discovery queues itself for its first sweep because the centres routine treats "no recorded sweep" as "never swept", so no routine writes into another's state.

## Try it locally (safe: nothing is written except state and your own test files)

```
node scripts/routines/next.mjs discovery --city capetown          # what is due, and the packet
node scripts/routines/validate.mjs my-test.sql --routine discovery --city capetown
node scripts/routines/health.mjs
node scripts/fuel-due.mjs --date 2026-10-07
```

`done.mjs` changes the state files, so use it only when you mean it (`migrate-state.mjs --write` regenerates them).

## Cut-over checklist (when you decide to go live)

1. Merge the routines and scripts into `main` (only when you say so). Until then production is unchanged.
2. Let a deploy refresh `status/<city>/db-snapshot.json`: the snapshot writer now also records each business's `website` and whether it has an `email`, which the enrichment routine needs.
3. Run `node scripts/routines/migrate-state.mjs --write` once on `main` so the state files exist there.
4. Create the scheduled cloud agents from these runbooks (the prompt for each is simply: read `routines/_shared.md` and `routines/<routine>.md`, then run for `<city>`), paused, and trigger each once by hand.
5. Leave the old `ROUTINE.<city>.md` schedules running until each new routine has had two clean runs, then switch the old ones off.
6. Add the health check (`health.mjs`) to a weekly GitHub Action and to the admin overview.

## Still to build

- A validator for events (like `validate.mjs`) and for tourism proposals.
- A small GitHub Action that runs `fuel-due.mjs` first and only starts the fuel agent when due.
- A GitHub Action step that runs `generate-event-images.mjs` for each city right after an events deploy, so this stops being a manual step once the routine itself is scheduled.
- Batched daily apply-and-deploy of routine SQL, and lighter build reads, so routine commits do not each trigger a full three-city deploy (see `ROUTINES-PLAN.md`, phase 0).
- The database backup routine, the data health report and the expired-content tidy-up (script-only routines listed in the plan).
