import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, rows, type Env } from '../../_lib/sites';
import { notifyKeyOk } from '../../_lib/notify-key';
import {
  getNamePositionConfig,
  discoverNamePositions,
  claimPositionRow,
  checkOnePosition,
  bumpNamePositionQuota,
  type NamePositionRow,
} from '../../_lib/name-position';

// The ~every-3-hours "name position" run, called by
// .github/workflows/admin-name-position.yml (via
// scripts/admin-name-position-run.mjs) with X-Notify-Key (see
// _lib/notify-key.ts). Per site (Pretoria, Polokwane, Cape Town — a site is
// simply skipped if its DB binding is absent):
//   - discovers newly published businesses (inserted as never-checked)
//   - works through the due list — never-checked first, then oldest-checked
//     (simpler than GSV's 3-tier priority: there's no pass/fail status
//     here, just present-or-stale data) — via Search Console's Performance
//     API, filtered to each business's exact name (_lib/name-position.ts's
//     checkOnePosition)
//   - stops that site's loop early (resumes next call) on a quota/rate error
//
// Mirrors admin-app/functions/api/gsv/run.ts closely, applying the same
// four hard-won lessons from that run from the start:
//   1. D1 caps bound params at 100/query — discoverNamePositions chunks its
//      INSERT OR IGNORE accordingly (see that function's own comment for
//      this table's column-count math).
//   2. A single Cloudflare Pages Function invocation cannot sustain a
//      multi-minute loop, so each call here only advances the queue a
//      bounded amount PER SITE and reports `moreWork`; the trigger script
//      calls this endpoint repeatedly until the batch target is reached or
//      nothing is due.
//   3. A per-call "budget ran out" (`moreWork`) is never confused with a
//      real external quota/rate signal (`stoppedEarly`/`quotaOrRate`) — the
//      former just means try again next call, the latter means back off.
//   4. Checks run CONCURRENTLY in small fixed-size chunks (CHUNK_SIZE) via
//      Promise.all, since the bottleneck is I/O wait on Google's API, not
//      CPU; sites also run concurrently via Promise.all, not a sequential
//      loop, since they're fully independent (separate quota, separate
//      try/catch, separate rows).
//
// Timing reuses _lib/name-position.ts's same QUERY_TIMEOUT_MS (12s) and
// one-retry shape as GSV's Inspection calls, so the same worst-case math
// applies: one chunk's worst case is ~25.5s (12s timeout + 1.5s retry delay
// + another 12s timeout) regardless of CHUNK_SIZE, since a chunk's checks
// run concurrently (bounded by the slowest one, not their sum).
// CHECKS_PER_SITE_PER_CALL = 45 in chunks of 5 is 9 chunks, so one site's
// worst case is 9 * 25.5s = 229.5s, and since sites run concurrently too
// that's also the worst case for the whole call — identical to GSV's own
// numbers, so scripts/admin-name-position-run.mjs's CALL_TIMEOUT_MS keeps
// the same margin. (The Performance API's real-world latency hasn't been
// measured in production yet, unlike GSV's Inspection calls; reusing GSV's
// proven-safe numbers is the conservative starting point.)
const SITES = ['pretoria', 'polokwane', 'capetown'];
const CHECKS_PER_SITE_PER_CALL = 45;
const CHUNK_SIZE = 5;

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const db = env.ADMIN_DB;
  if (!(await notifyKeyOk(context.request, db))) return json({ ok: false }, 403);

  const config = await getNamePositionConfig(db);
  if (!config.enabled) return json({ ok: true, skipped: true, reason: 'disabled' });

  const sites = hubSites(env).filter((s) => SITES.includes(s.slug));
  const today = new Date().toISOString().slice(0, 10);
  const perSite: Record<string, unknown> = {};

  await Promise.all(
    sites.map(async (site) => {
      const siteUrl = `sc-domain:${site.domain}`;
      try {
        const discovered = await discoverNamePositions(db, site);
        const due = await rows<NamePositionRow>(
          db,
          `SELECT id, site, business_id, slug, name FROM name_position
           WHERE site = ? ORDER BY (checked_at IS NULL) DESC, checked_at ASC LIMIT ?`,
          site.slug,
          config.batchSizePerSite
        );
        const budgeted = due.slice(0, CHECKS_PER_SITE_PER_CALL); // this call's bounded slice of the due list
        let checked = 0;
        let calls = 0;
        let quotaHit = false; // a real Google quota/rate signal — NOT the same as this call's normal budget running out
        // Sequential chunks, concurrent checks WITHIN a chunk: counters are
        // only ever updated after a chunk's Promise.all has resolved, so
        // there's no cross-chunk race and no double counting.
        for (let i = 0; i < budgeted.length && !quotaHit; i += CHUNK_SIZE) {
          const chunk = budgeted.slice(i, i + CHUNK_SIZE);
          const outcomes = await Promise.all(
            chunk.map((row) => claimPositionRow(db, row.id).then((claimed) => (claimed ? checkOnePosition(env, db, row, siteUrl) : null)))
          );
          for (const outcome of outcomes) {
            if (!outcome) continue; // claimed by an overlapping run
            calls++;
            checked++;
            if (outcome.quotaOrRate) quotaHit = true; // stop starting new chunks for THIS site only; let this chunk's other checks finish
          }
        }
        if (calls) await bumpNamePositionQuota(db, site.slug, today, calls);
        perSite[site.slug] = { discovered, due: due.length, checked, calls, stoppedEarly: quotaHit, moreWork: !quotaHit && checked < due.length };
      } catch (e) {
        perSite[site.slug] = { error: e instanceof Error ? e.message : String(e) };
      }
    })
  );

  return json({ ok: true, ranAt: new Date().toISOString(), sites: perSite });
};
