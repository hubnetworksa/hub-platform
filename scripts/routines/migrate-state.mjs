#!/usr/bin/env node
// One-off: turns each city's old single status/<city>/routine-state.json into the
// per-routine state files the split routines use (status/<city>/state/<routine>.json).
// The old file is never modified, so the current routines keep working until cut-over.
//
//   node scripts/routines/migrate-state.mjs --city <city> [--write]
//
// Without --write it only prints what it would create.
import { CITIES, ROOT, loadConfig, parseArgs, readJson, saveState } from './lib.mjs';
import path from 'node:path';

const { flags } = parseArgs(process.argv.slice(2));
const cities = flags.city ? [flags.city] : CITIES;
const now = Date.now();

for (const city of cities) {
  if (!CITIES.includes(city)) { console.error(`unknown city ${city}`); process.exit(2); }
  const cfg = loadConfig(city);
  const old = readJson(path.join(ROOT, 'status', city, 'routine-state.json'));

  const discovery = {
    suburb_slugs: old.suburb_slugs ?? [],
    suburb_index: old.suburb_index ?? 0,
    laps_completed: 0,
    last_run_at: null,
  };

  // Every known centre was swept at some point under the old routine but the date was
  // never recorded. Spread the "last swept" dates evenly over the recheck window so the
  // centres come due gradually instead of all on day one. Centres still in the old
  // pending queue have never been swept and stay pending.
  const pending = old.shopping_center_slugs_pending ?? [];
  const all = old.shopping_center_slugs ?? [];
  const swept = {};
  const swept_list = all.filter((s) => !pending.includes(s));
  swept_list.forEach((slug, i) => {
    const ageDays = (i / Math.max(1, swept_list.length)) * cfg.centres.recheckDays;
    swept[slug] = new Date(now - ageDays * 86_400_000).toISOString();
  });
  const centres = { slugs: all, pending, swept, last_new_mall_at: new Date(now - (cfg.centres.newMallEveryDays / 2) * 86_400_000).toISOString() };

  const enrichment = { email_cursor: '', last_run_at: null };
  const closedCheck = { last_slug: old.closed_check_last_slug ?? '', last_run_at: null };

  const files = { discovery, centres, enrichment, 'closed-check': closedCheck };
  for (const [routine, state] of Object.entries(files)) {
    if (flags.write) saveState(city, routine, state);
    console.log(`${city}/${routine}: ${flags.write ? 'written' : 'would write'} ${JSON.stringify(state).slice(0, 110)}…`);
  }
}
