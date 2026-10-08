// Shared helpers for the routine scripts (next.mjs, validate.mjs, done.mjs,
// migrate-state.mjs, health.mjs). Nothing here talks to the network or to the
// database: routines read the committed snapshot in status/<city>/ and write
// small state files, exactly as the agents do.
import { existsSync, mkdirSync, readFileSync, writeFileSync } from 'node:fs';
import path from 'node:path';

export const CITIES = ['capetown', 'pretoria', 'polokwane'];

// Routines switched off for every city. next.mjs reports them not due (even with --force),
// so the cloud agent logs and stops without writing SQL, and health.mjs stops counting them
// as late. The routine prompts live in another account, so this is where they are turned off.
export const DISABLED_ROUTINES = {
  // Job 4 rewrote a paying owner's own description (Polokwane business 1418, 1 Oct 2026).
  // validate.mjs also rejects any SQL that sets description or description_enriched_at, and
  // a trigger (db/migrations/<city>/*_block_routine_description_rewrites.sql) drops such writes.
  enrichment: 'The enrichment routine is disabled: routines must never change an existing business description, hours or email. Log a not-due line and stop; write no SQL.',
  // Paused by the owner on 8 Oct 2026 while PretoriaHub recovers from the September 2026
  // spam update: no new business pages on any site until the existing ones are richer.
  discovery: 'Business discovery is paused on every site: no new businesses are to be added. Log a not-due line and stop; write no SQL.',
};
export const ROOT = process.cwd();

export function parseArgs(argv) {
  const positional = [];
  const flags = {};
  for (let i = 0; i < argv.length; i++) {
    const a = argv[i];
    if (a.startsWith('--')) {
      const key = a.slice(2);
      const next = argv[i + 1];
      if (next === undefined || next.startsWith('--')) flags[key] = true;
      else { flags[key] = next; i++; }
    } else positional.push(a);
  }
  return { positional, flags };
}

export function requireCity(flags) {
  const city = flags.city;
  if (!CITIES.includes(city)) {
    console.error(`--city must be one of: ${CITIES.join(', ')}`);
    process.exit(2);
  }
  return city;
}

export const readJson = (file, fallback = undefined) => {
  if (!existsSync(file)) {
    if (fallback !== undefined) return fallback;
    throw new Error(`Missing file: ${file}`);
  }
  return JSON.parse(readFileSync(file, 'utf8'));
};

export const loadConfig = (city) => readJson(path.join(ROOT, 'routines/cities', `${city}.json`));
export const loadSnapshot = (city) => readJson(path.join(ROOT, 'status', city, 'db-snapshot.json'));

export const stateFile = (city, routine) => path.join(ROOT, 'status', city, 'state', `${routine}.json`);
export const loadState = (city, routine, fallback = {}) => readJson(stateFile(city, routine), fallback);
export function saveState(city, routine, state) {
  const file = stateFile(city, routine);
  mkdirSync(path.dirname(file), { recursive: true });
  writeFileSync(file, JSON.stringify(state, null, 2) + '\n');
}

/** Whole days between an ISO timestamp and now (Infinity when never). */
export function daysSince(iso, now = new Date()) {
  if (!iso) return Infinity;
  return (now.getTime() - new Date(iso).getTime()) / 86_400_000;
}

export const slugify = (s) =>
  String(s).toLowerCase().normalize('NFKD').replace(/[̀-ͯ]/g, '').replace(/&/g, ' and ').replace(/[^a-z0-9]+/g, '-').replace(/^-+|-+$/g, '');

export const digits = (s) => String(s ?? '').replace(/\D/g, '');

/** Print JSON and exit 0 when work is due, or print the reason and exit 3. */
export function due(packet) {
  console.log(JSON.stringify({ due: true, ...packet }, null, 1));
  process.exit(0);
}
export function notDue(reason) {
  console.log(JSON.stringify({ due: false, reason }));
  process.exit(3);
}
