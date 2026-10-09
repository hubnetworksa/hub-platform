import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, rows, type Env } from '../../_lib/sites';
import { notifyKeyOk } from '../../_lib/notify-key';
import { getGsvConfig, discoverUrls, claimUrl, checkOne, bumpGsvQuota, upsertGsvDaily, pruneGsvChecks, type GsvCheckRow } from '../../_lib/gsv';

// The ~every-3-hours Google Visibility run, called by
// .github/workflows/admin-gsv.yml (via scripts/admin-gsv-run.mjs) with
// X-Notify-Key (see _lib/notify-key.ts). Per site (Pretoria, Polokwane only —
// Cape Town is excluded per the brief, including when its DB binding is
// simply absent):
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
// queue by MAX_CHECKS_PER_CALL total (across both sites combined) and reports
// `moreWork` per site; the trigger script calls this endpoint repeatedly,
// each call fast and bounded, until the run's batchSizePerSite target is
// reached or nothing is left due.
const SITES = ['pretoria', 'polokwane'];
const MAX_CHECKS_PER_CALL = 5;

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const db = env.ADMIN_DB;
  if (!(await notifyKeyOk(context.request, db))) return json({ ok: false }, 403);

  const config = await getGsvConfig(db);
  if (!config.enabled) return json({ ok: true, skipped: true, reason: 'disabled' });

  const sites = hubSites(env).filter((s) => SITES.includes(s.slug));
  const today = new Date().toISOString().slice(0, 10);
  const perSite: Record<string, unknown> = {};
  let budget = MAX_CHECKS_PER_CALL;

  for (const site of sites) {
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
      let checked = 0;
      let calls = 0;
      let stoppedEarly = false;
      for (const row of due) {
        if (budget <= 0) {
          stoppedEarly = true;
          break;
        }
        if (!(await claimUrl(db, row.id))) continue; // claimed by an overlapping run
        calls++;
        budget--;
        const outcome = await checkOne(env, db, row, siteUrl);
        checked++;
        if (outcome.quotaOrRate) {
          stoppedEarly = true;
          budget = 0; // don't let the other site burn through its share either
          break;
        }
      }
      if (calls) await bumpGsvQuota(db, site.slug, today, calls);
      await upsertGsvDaily(db, site, today);
      perSite[site.slug] = { discovered, due: due.length, checked, calls, stoppedEarly, moreWork: !stoppedEarly ? checked < due.length : false };
    } catch (e) {
      perSite[site.slug] = { error: e instanceof Error ? e.message : String(e) };
    }
  }

  const pruned = await pruneGsvChecks(db);
  return json({ ok: true, ranAt: new Date().toISOString(), sites: perSite, pruned });
};
