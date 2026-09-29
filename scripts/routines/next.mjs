#!/usr/bin/env node
// Step 0 of every routine: decide whether anything is due and, if so, hand the agent a
// SMALL work packet instead of making it read the whole snapshot and runbook.
//
//   node scripts/routines/next.mjs <routine> --city <capetown|pretoria|polokwane>
//
// routines: discovery | centres | enrichment | closed-check | events | news | tourism
// Exit 0 + JSON packet when due; exit 3 + {"due":false,"reason":...} when nothing is due.
// (Fuel prices have their own guard: scripts/fuel-due.mjs.)
import { existsSync, readFileSync } from 'node:fs';
import path from 'node:path';
import { ROOT, daysSince, due, loadConfig, loadSnapshot, loadState, notDue, parseArgs, requireCity } from './lib.mjs';

const { positional, flags } = parseArgs(process.argv.slice(2));
const routine = positional[0];
const city = requireCity(flags);
const cfg = loadConfig(city);
const snap = loadSnapshot(city);
const today = new Date().toISOString().slice(0, 10);

const bySuburb = new Map();
for (const b of snap.businesses) {
  if (!bySuburb.has(b.suburb_slug)) bySuburb.set(b.suburb_slug, []);
  bySuburb.get(b.suburb_slug).push(b);
}
const slim = (b) => ({ slug: b.slug, name: b.name, phone: b.phone, address: b.address, centre: b.shopping_center_slug ?? null });

function lastLogDate(file, action) {
  const p = path.join(ROOT, 'status', city, file);
  if (!existsSync(p)) return null;
  const lines = readFileSync(p, 'utf8').trim().split('\n').filter(Boolean).reverse();
  for (const l of lines) {
    try {
      const j = JSON.parse(l);
      if (!action || j.action_taken === action) return j.date;
    } catch { /* skip malformed line */ }
  }
  return null;
}

switch (routine) {
  case 'discovery': {
    const st = loadState(city, 'discovery', null);
    if (!st?.suburb_slugs?.length) notDue('No discovery state yet: run scripts/routines/migrate-state.mjs --write first.');
    const maintenance = (st.laps_completed ?? 0) >= 1;
    if (maintenance && daysSince(st.last_run_at) < cfg.discovery.maintenanceEveryDays) {
      notDue(`Every suburb has been covered once; maintenance runs every ${cfg.discovery.maintenanceEveryDays} days (last run ${st.last_run_at}).`);
    }
    const n = cfg.discovery.suburbsPerRun;
    const targets = [];
    for (let i = 0; i < n; i++) targets.push(st.suburb_slugs[(st.suburb_index + i) % st.suburb_slugs.length]);
    const suburbById = new Map(snap.suburbs.map((s) => [s.slug, s]));
    due({
      routine, city, mode: maintenance ? 'maintenance' : 'first-lap',
      maxRecordsPerFile: cfg.discovery.maxRecordsPerFile,
      suburbs: targets.map((slug) => ({
        slug, name: suburbById.get(slug)?.name ?? slug, region: suburbById.get(slug)?.region ?? null,
        knownBusinesses: (bySuburb.get(slug) ?? []).map(slim),
        knownCentres: snap.shopping_centers.filter((c) => c.suburb_slug === slug).map((c) => ({ slug: c.slug, name: c.name })),
      })),
      categories: snap.categories,
      categoryNotes: cfg.categoryNotes,
    });
    break;
  }

  case 'centres': {
    const st = loadState(city, 'centres', null);
    if (!st) notDue('No centres state yet: run scripts/routines/migrate-state.mjs --write first.');
    const known = new Map(snap.shopping_centers.map((c) => [c.slug, c]));
    const tenants = (slug) => snap.businesses.filter((b) => b.shopping_center_slug === slug).map(slim);
    const centrePacket = (slug, mode) => ({
      routine, city, mode, maxRecordsPerFile: cfg.centres.maxRecordsPerFile,
      centre: known.get(slug) ?? { slug },
      knownTenants: tenants(slug),
      // Existing businesses in the same suburb that are not linked to any centre: candidates to LINK instead of inserting a duplicate.
      unlinkedInSuburb: (bySuburb.get(known.get(slug)?.suburb_slug) ?? []).filter((b) => !b.shopping_center_slug).map(slim),
      categories: snap.categories,
      suburbs: snap.suburbs.map((s) => s.slug),
    });
    const swept = st.swept ?? {};
    // A centre with no recorded sweep has never been swept (including ones discovery just added),
    // so first sweeps need no state written by any other routine.
    const pending = [...new Set([...(st.pending ?? []), ...[...known.keys()].filter((s) => !swept[s])])].filter((s) => known.has(s) && !swept[s]);
    if (pending.length) due(centrePacket(pending[0], 'first-sweep'));
    const overdue = [...known.keys()]
      .map((slug) => ({ slug, age: daysSince(swept[slug]) }))
      .filter((c) => c.age >= cfg.centres.recheckDays)
      .sort((a, b) => b.age - a.age);
    if (overdue.length) due(centrePacket(overdue[0].slug, 'recheck'));
    if (daysSince(st.last_new_mall_at) >= cfg.centres.newMallEveryDays) {
      due({ routine, city, mode: 'new-mall-discovery', maxRecordsPerFile: cfg.centres.maxRecordsPerFile, knownCentres: snap.shopping_centers, categories: snap.categories, suburbs: snap.suburbs.map((s) => s.slug) });
    }
    notDue(`No centre is due for a re-sweep (every ${cfg.centres.recheckDays} days) and new-mall discovery runs every ${cfg.centres.newMallEveryDays} days.`);
    break;
  }

  case 'enrichment': {
    const st = loadState(city, 'enrichment', {});
    const item = (b) => ({ slug: b.slug, name: b.name, suburb: b.suburb_slug, category: b.category_slug, address: b.address, phone: b.phone, website: b.website ?? null, sourceUrls: b.source_urls, centre: b.shopping_center_slug ?? null, hours: b.hours ?? null, hasEmail: b.has_email ?? null });
    const backlog = snap.businesses.filter((b) => b.description_enriched_at == null);
    if (backlog.length) {
      due({ routine, city, mode: 'full', remainingBacklog: backlog.length, maxRecordsPerFile: cfg.enrichment.maxRecordsPerFile, batch: backlog.slice(0, cfg.enrichment.batch).map(item), categoryNotes: cfg.categoryNotes });
    }
    const noEmail = snap.businesses.filter((b) => b.description_enriched_at != null && b.has_email === false);
    if (!noEmail.length) {
      const unknown = snap.businesses.some((b) => b.has_email === undefined);
      notDue(unknown ? 'No description backlog; the snapshot has no has_email field yet (refresh it with scripts/write-db-snapshot.mjs), so the email pass cannot run.' : 'Every business is enriched and has an email or was already checked.');
    }
    let start = st.email_cursor ? noEmail.findIndex((b) => b.slug === st.email_cursor) + 1 : 0;
    if (start >= noEmail.length) start = 0;
    const batch = [];
    for (let i = 0; i < Math.min(cfg.enrichment.emailBatch, noEmail.length); i++) batch.push(noEmail[(start + i) % noEmail.length]);
    due({ routine, city, mode: 'email-only', remainingWithoutEmail: noEmail.length, maxRecordsPerFile: cfg.enrichment.maxRecordsPerFile, batch: batch.map(item) });
    break;
  }

  case 'closed-check': {
    const st = loadState(city, 'closed-check', null);
    if (!st) notDue('No closed-check state yet: run scripts/routines/migrate-state.mjs --write first.');
    if (daysSince(st.last_run_at) < cfg.closedCheck.everyDays) notDue(`Runs every ${cfg.closedCheck.everyDays} days (last run ${st.last_run_at}).`);
    if (!snap.businesses.length) notDue('No published businesses to check yet.');
    let start = st.last_slug ? snap.businesses.findIndex((b) => b.slug === st.last_slug) + 1 : 0;
    if (start <= 0 && st.last_slug) start = 0;
    const batch = [];
    for (let i = 0; i < Math.min(cfg.closedCheck.batch, snap.businesses.length); i++) batch.push(snap.businesses[(start + i) % snap.businesses.length]);
    due({ routine, city, mode: 'batch', batch: batch.map((b) => ({ slug: b.slug, name: b.name, suburb: b.suburb_slug, address: b.address, phone: b.phone })) });
    break;
  }

  case 'events': {
    const last = lastLogDate('events-agent-log.jsonl');
    if (daysSince(last) < 6.5) notDue(`Runs weekly (last run ${last}).`);
    const cutoff = new Date(Date.now() - 7 * 86_400_000).toISOString().slice(0, 10);
    due({ routine, city, area: cfg.eventsArea, today, knownEvents: (snap.events ?? []).filter((e) => e.event_date >= cutoff), types: ['Music', 'Market', 'Sport', 'Theatre', 'Food & Drink', 'Family', 'Other'] });
    break;
  }

  case 'news': {
    const last = lastLogDate('news-agent-log.jsonl');
    if (daysSince(last) * 24 < 20) notDue(`Runs daily (last run ${last}).`);
    const cutoff = new Date(Date.now() - 14 * 86_400_000).toISOString().slice(0, 10);
    due({ routine, city, area: cfg.newsArea, sources: cfg.newsSources, today, recentArticles: (snap.news ?? []).filter((n) => n.published_date >= cutoff), categories: ['Traffic', 'Utilities', 'Business', 'Sport', 'Tourism', 'Community'] });
    break;
  }

  case 'tourism': {
    const last = lastLogDate('tourism-agent-log.jsonl');
    if (daysSince(last) < 28) notDue(`Runs monthly (last run ${last}).`);
    const file = path.join(ROOT, 'src/site-content/tourism.ts');
    const text = existsSync(file) ? readFileSync(file, 'utf8') : '';
    const block = text.split(new RegExp(`\\n  ${city}: \\{`))[1]?.split(/\n  \},?\n/)[0] ?? '';
    const picks = [...block.matchAll(/\{ name: '([^']+)'[^}]*?price: '([^']*)', time: '([^']*)'/g)].map((m) => ({ name: m[1], price: m[2], time: m[3] }));
    due({ routine, city, file: 'src/site-content/tourism.ts', currentPicks: picks });
    break;
  }

  default:
    console.error('Usage: node scripts/routines/next.mjs <discovery|centres|enrichment|closed-check|events|news|tourism> --city <city>');
    process.exit(2);
}
