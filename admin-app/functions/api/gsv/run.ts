import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, rows, type Env } from '../../_lib/sites';
import { notifyKeyOk } from '../../_lib/notify-key';
import { getGsvConfig, discoverUrls, claimUrl, checkOne, bumpGsvQuota, upsertGsvDaily, pruneGsvChecks, type GsvCheckRow } from '../../_lib/gsv';

// The ~every-2-hours Google Visibility run, called by
// .github/workflows/admin-gsv.yml (via scripts/admin-gsv-run.mjs) with
// X-Notify-Key (see _lib/notify-key.ts). Per site (Pretoria, Polokwane,
// Cape Town — a site is simply skipped if its DB binding is absent):
//   - discovers newly published business URLs (inserted as 'pending')
//   - works through the due list — pending first, then longest-not-indexed,
//     then oldest-checked — via Search Console's URL Inspection API
//     (_lib/gsv.ts's checkOne, shared with the admin "Check now"/"Recheck")
//   - stops that site's loop early (resumes next call) on a quota/rate error
//
// A single Cloudflare Pages Function invocation CANNOT sustain a multi-minute
// loop (an earlier version tried a 4-minute wall-clock budget inside one
// request and it simply hung until the caller's HTTP client timed out at 5
// minutes, with nothing ever written). So each call here only advances the
// queue by a bounded amount PER SITE (not shared across sites — a shared
// budget let whichever site has the bigger backlog starve the other one
// completely, since it always exhausted the budget first) and reports
// `moreWork` per site; the trigger script calls this endpoint repeatedly,
// each call fast and bounded, until the run's batchSizePerSite target is
// reached or nothing is left due. Likewise, a quota/rate signal only stops
// THAT site's budget — Google's quota is per property, so one site running
// out says nothing about the other's.
//
// The real bottleneck here is I/O wait on Google's Inspection API (measured
// ~10-12s per check in practice, not CPU), so checks run CONCURRENTLY
// instead of one at a time: each site's claimed batch
// (CHECKS_PER_SITE_PER_CALL) is processed in fixed-size CHUNKS (CHUNK_SIZE),
// firing Promise.all over one chunk, awaiting it, and only THEN deciding
// whether to start the next chunk — so a real quota/rate hit stops new
// chunks from starting but never aborts a chunk already in flight. The 3
// sites themselves also now run concurrently (Promise.all), not in a
// sequential for-loop — they're already fully independent (separate quota,
// separate try/catch, separate DB rows), so sequencing them bought nothing
// but wall-clock time.
//
// Worst-case timing: per _lib/gsv.ts's inspect(), one check's absolute worst
// case is 12s timeout + 1.5s retry delay + another 12s timeout = 25.5s. A
// chunk's worst case is still ~25.5s regardless of CHUNK_SIZE, since the
// checks in it run concurrently (bounded by the slowest one, not their
// sum). CHECKS_PER_SITE_PER_CALL = 45 in chunks of 5 is 9 chunks, so one
// site's worst case is 9 * 25.5s = 229.5s; because sites run concurrently
// too, that 229.5s is also the worst case for the WHOLE call (not 3x) — the
// exact same number as the OLD worst case (3 sites sequential * 3 checks
// sequential * 25.5s = 229.5s), so the trigger script's existing 300s
// CALL_TIMEOUT_MS keeps the identical margin (70.5s, ~31%) while each call
// now gets through 15x more checks per site (45 vs 3).
const SITES = ['pretoria', 'polokwane', 'capetown'];
const CHECKS_PER_SITE_PER_CALL = 45;
const CHUNK_SIZE = 5;

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const db = env.ADMIN_DB;
  if (!(await notifyKeyOk(context.request, db))) return json({ ok: false }, 403);

  const config = await getGsvConfig(db);
  if (!config.enabled) return json({ ok: true, skipped: true, reason: 'disabled' });

  const sites = hubSites(env).filter((s) => SITES.includes(s.slug));
  const today = new Date().toISOString().slice(0, 10);
  const perSite: Record<string, unknown> = {};

  await Promise.all(
    sites.map(async (site) => {
      const siteUrl = `sc-domain:${site.domain}`;
      try {
        const discovered = await discoverUrls(db, site);
        const due = await rows<GsvCheckRow>(
          db,
          `SELECT id, site, url, consecutive_not_indexed, total_indexed_checks, total_not_indexed_checks
           FROM gsv_urls WHERE site = ?
           ORDER BY (status = 'pending') DESC, (status = 'not_indexed') DESC, last_attempt_at ASC
           LIMIT ?`,
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
            chunk.map((row) => claimUrl(db, row.id).then((claimed) => (claimed ? checkOne(env, db, row, siteUrl) : null)))
          );
          for (const outcome of outcomes) {
            if (!outcome) continue; // claimed by an overlapping run
            calls++;
            checked++;
            if (outcome.quotaOrRate) quotaHit = true; // stop starting new chunks for THIS site only; let this chunk's other checks finish
          }
        }
        if (calls) await bumpGsvQuota(db, site.slug, today, calls);
        await upsertGsvDaily(db, site, today);
        perSite[site.slug] = { discovered, due: due.length, checked, calls, stoppedEarly: quotaHit, moreWork: !quotaHit && checked < due.length };
      } catch (e) {
        perSite[site.slug] = { error: e instanceof Error ? e.message : String(e) };
      }
    })
  );

  const pruned = await pruneGsvChecks(db);
  return json({ ok: true, ranAt: new Date().toISOString(), sites: perSite, pruned });
};
