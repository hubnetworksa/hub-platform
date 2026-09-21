#!/usr/bin/env node
// Records that a routine checkpoint finished, so agents never hand-edit state files.
//
//   node scripts/routines/done.mjs discovery    --city C --finished slug1,slug2      (in the order next.mjs listed them)
//   node scripts/routines/done.mjs centres      --city C [--swept slug] [--new-mall] [--add-pending slug,slug] [--add-swept slug,slug]
//   node scripts/routines/done.mjs enrichment   --city C [--email-cursor slug]
//   node scripts/routines/done.mjs closed-check --city C --last-slug slug
//
// Only progress that was really made is recorded: run it after the checkpoint's SQL is written.
import { loadState, parseArgs, requireCity, saveState } from './lib.mjs';

const { positional, flags } = parseArgs(process.argv.slice(2));
const routine = positional[0];
const city = requireCity(flags);
const now = new Date().toISOString();
const list = (v) => (typeof v === 'string' ? v.split(',').map((s) => s.trim()).filter(Boolean) : []);

switch (routine) {
  case 'discovery': {
    const st = loadState(city, 'discovery');
    const finished = list(flags.finished);
    const len = st.suburb_slugs.length;
    finished.forEach((slug, i) => {
      const expected = st.suburb_slugs[(st.suburb_index + i) % len];
      if (slug !== expected) { console.error(`Suburbs must be finished in order: expected "${expected}" but got "${slug}".`); process.exit(1); }
    });
    const next = st.suburb_index + finished.length;
    st.laps_completed = (st.laps_completed ?? 0) + Math.floor(next / len);
    st.suburb_index = next % len;
    st.last_run_at = now;
    saveState(city, 'discovery', st);
    console.log(`discovery: next suburb index ${st.suburb_index} of ${len}, laps completed ${st.laps_completed}`);
    break;
  }
  case 'centres': {
    const st = loadState(city, 'centres');
    st.slugs ??= []; st.pending ??= []; st.swept ??= {};
    for (const s of list(flags['add-pending'])) { if (!st.slugs.includes(s)) st.slugs.push(s); if (!st.pending.includes(s)) st.pending.push(s); }
    for (const s of list(flags['add-swept'])) { if (!st.slugs.includes(s)) st.slugs.push(s); st.swept[s] = now; }
    if (typeof flags.swept === 'string') { st.swept[flags.swept] = now; st.pending = st.pending.filter((s) => s !== flags.swept); if (!st.slugs.includes(flags.swept)) st.slugs.push(flags.swept); }
    if (flags['new-mall']) st.last_new_mall_at = now;
    saveState(city, 'centres', st);
    console.log(`centres: ${st.slugs.length} known, ${st.pending.length} pending first sweep`);
    break;
  }
  case 'enrichment': {
    const st = loadState(city, 'enrichment', {});
    if (typeof flags['email-cursor'] === 'string') st.email_cursor = flags['email-cursor'];
    st.last_run_at = now;
    saveState(city, 'enrichment', st);
    console.log(`enrichment: email cursor "${st.email_cursor ?? ''}"`);
    break;
  }
  case 'closed-check': {
    const st = loadState(city, 'closed-check');
    if (typeof flags['last-slug'] !== 'string') { console.error('--last-slug is required'); process.exit(2); }
    st.last_slug = flags['last-slug'];
    st.last_run_at = now;
    saveState(city, 'closed-check', st);
    console.log(`closed-check: resume after "${st.last_slug}"`);
    break;
  }
  default:
    console.error('Usage: node scripts/routines/done.mjs <discovery|centres|enrichment|closed-check> --city <city> …');
    process.exit(2);
}
