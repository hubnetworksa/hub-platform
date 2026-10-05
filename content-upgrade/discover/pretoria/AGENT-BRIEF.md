# Thin-page fill: PretoriaHub, one batch

**Read `routines/_shared.md` and `routines/business-discovery.md` first — they are the actual rulebook.** Everything in those two files applies here exactly as written: the verification rule (2 independent sources, mandatory phone + street address pinned to the exact branch, never name an individual, OSM/Overpass not a valid source), the SQL format for a new business and a new shopping centre, the description/hours rule, slug rules, and the logging/commit/push mechanics. This file only covers the two things that differ from a normal discovery run.

## What's different from a normal discovery run

1. **Your work packet is category-targeted, not a general suburb sweep.** Normally `next.mjs discovery` hands you a few suburbs and says "find businesses in a range of categories." Here, instead, you have `content-upgrade/discover/pretoria/batch-NN.json` — the specific category/suburb combos on PretoriaHub that currently show fewer than 3 businesses (the "thin" pages), each with `catLabel`, `subLabel`, `need` (how many more to reach 3) and `existingNames` (don't duplicate). Work combo by combo instead of free-ranging across categories. The flat version for the discovery script is `batch-NN.combos.json`.

2. **No Claude WebSearch/WebFetch calls — use the local crawler script instead.** `_shared.md` assumes you can fall back to the Claude WebSearch tool; don't, here — it shares a small budget across everything running right now. Instead:
   ```
   node scripts/content-upgrade/discover-businesses.mjs content-upgrade/discover/pretoria/batch-NN.combos.json content-upgrade/discover/pretoria/batch-NN.results.json
   ```
   This is a local Python/Node crawler (no Claude-tool cost) — it takes a while on a ~88-combo batch, budget 30-60+ minutes. It writes up to ~4 candidates per combo (name guess, source URL, title/snippet, phone if visible). Expect a lot of noise — read every candidate for every combo, don't skim, and apply `_shared.md`'s verification rule in full before accepting anything. If a combo's candidates aren't enough, you can re-run the script on a smaller one-off combos.json with a different query angle, or write a short throwaway script calling the same crawler helpers — still no WebSearch/WebFetch.

A spot-check already run on a handful of Pretoria suburbs (Brooklyn, Sunnyside, Pretoria Central) found real, confirmable businesses more often than a same-sized Polokwane township sample did — expect a meaningfully better hit rate here than zero, but still expect plenty of combos to come up empty. **It is completely normal and expected for many combos to end at 0 or 1 added, not 3** — never pad with a weak or unverifiable candidate just to hit the number. One extra note beyond `_shared.md`: a search engine's own synthesized summary of results has been seen inventing business names/addresses not actually present on the page it cites — always check the actual snippet/page text, never trust the summary alone. Also prefer at least one primary source (the business's own site, Facebook/Instagram, or an established SA directory like yellowpages/cylex/brabys) over two lead-generation/scraper sites that likely pulled from the same underlying listing — those are weak even though they're technically different hostnames.

## The mechanical differences, to match this batch's scale

- Checkpoint cap for this run: `maxRecordsPerFile` is set high (500) in `routines/cities/pretoria.json` for this task specifically, so you are not forced into small 10-record files — but still **commit and push incrementally** (e.g. every 20-30 adds, or whenever you finish a suburb) rather than holding everything unsaved until the very end, so partial progress survives if you run out of turns.
- SQL file path: `db/routine-updates/pretoria/<UTC timestamp>.sql`, validated with:
  ```
  node scripts/routines/validate.mjs db/routine-updates/pretoria/<file>.sql --routine discovery --city pretoria
  ```
- Log file: append one line per checkpoint to `status/pretoria/thin-pages-log.jsonl` (create if missing) — same shape as `_shared.md`'s discovery log line, plus a `"batch": NN` field. Don't touch `status/pretoria/state/*.json` (that belongs to the separately-scheduled general discovery routine, not this task).
- Branch: you're on `thin-pages/pretoria`, not `main`. Push with `git push origin HEAD:thin-pages/pretoria` (fetch/rebase/push retry on conflict, same as `_shared.md`'s push procedure but targeting this branch). Keep both sides on a conflict in the shared log file. End commit messages with:
  ```
  Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>
  ```

## When you're done

Work through every combo in your batch, suburb by suburb, checkpointing periodically. When the whole batch is done (or you're running low on turns — commit and push whatever already cleared verification first), report back: combos closed to 3, combos still short and why, total businesses added, total discarded as unverifiable.
