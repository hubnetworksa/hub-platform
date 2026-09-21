#!/usr/bin/env node
// Routine health: when each routine last ran for each city and whether that is late.
//
//   node scripts/routines/health.mjs [--json]
//
// Reads the routines' own log files (status/<city>/*.jsonl and status/fuel-agent-log.jsonl), so it needs no
// database and no network. Exit code 1 when anything is late, so a GitHub Action can alert on it.
import { existsSync, readFileSync } from 'node:fs';
import path from 'node:path';
import { CITIES, ROOT, daysSince, parseArgs } from './lib.mjs';

const { flags } = parseArgs(process.argv.slice(2));

// routine -> { log file, action_taken values that count as a run, how many days is "late" }
const ROUTINES = {
  discovery: { file: 'agent-log.jsonl', actions: ['research'], lateAfterDays: 9 },
  centres: { file: 'agent-log.jsonl', actions: ['shopping_center_sweep', 'new_mall_discovery'], lateAfterDays: 35 },
  enrichment: { file: 'agent-log.jsonl', actions: ['description_enrichment'], lateAfterDays: 3 },
  'closed-check': { file: 'agent-log.jsonl', actions: ['closed_business_check'], lateAfterDays: 9 },
  events: { file: 'events-agent-log.jsonl', actions: ['event_discovery'], lateAfterDays: 9 },
  news: { file: 'news-agent-log.jsonl', actions: ['news_discovery'], lateAfterDays: 2 },
  tourism: { file: 'tourism-agent-log.jsonl', actions: ['tourism_refresh'], lateAfterDays: 35 },
};

function lastRun(file, actions) {
  if (!existsSync(file)) return null;
  const lines = readFileSync(file, 'utf8').trim().split('\n').filter(Boolean).reverse();
  for (const l of lines) {
    try {
      const j = JSON.parse(l);
      if (actions.includes(j.action_taken)) return j.date;
    } catch { /* skip */ }
  }
  return null;
}

const rows = [];
for (const city of CITIES) {
  for (const [name, r] of Object.entries(ROUTINES)) {
    const date = lastRun(path.join(ROOT, 'status', city, r.file), r.actions);
    const age = daysSince(date);
    rows.push({ routine: name, city, lastRun: date, daysAgo: Number.isFinite(age) ? Math.round(age * 10) / 10 : null, status: date == null ? 'never' : age > r.lateAfterDays ? 'late' : 'ok' });
  }
}
// Fuel is one routine for all cities. "fuel_not_due" logs still count as a healthy run.
const fuelDate = lastRun(path.join(ROOT, 'status', 'fuel-agent-log.jsonl'), ['fuel_prices', 'fuel_not_due']);
const fuelAge = daysSince(fuelDate);
rows.push({ routine: 'fuel', city: 'all', lastRun: fuelDate, daysAgo: Number.isFinite(fuelAge) ? Math.round(fuelAge * 10) / 10 : null, status: fuelDate == null ? 'never' : fuelAge > 10 ? 'late' : 'ok' });

if (flags.json) console.log(JSON.stringify(rows, null, 1));
else for (const r of rows) console.log(`${r.status.padEnd(6)} ${r.routine.padEnd(13)} ${r.city.padEnd(10)} ${r.lastRun ?? 'no runs logged'}${r.daysAgo != null ? ` (${r.daysAgo} days ago)` : ''}`);
process.exit(rows.some((r) => r.status === 'late') ? 1 : 0);
