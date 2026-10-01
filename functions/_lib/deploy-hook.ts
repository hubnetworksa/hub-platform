import type { D1Database } from '@cloudflare/workers-types';

// Triggers the existing "Deploy to Cloudflare Pages" GitHub Actions workflow
// (workflow_dispatch, already enabled in .github/workflows/deploy.yml) so a
// newly published business shows up on the live static site within a few
// minutes, instead of waiting for whatever incidental rebuild happens next.
// Uses the GitHub Actions API rather than a Cloudflare Pages Deploy Hook
// because these projects aren't Git-connected in Cloudflare (they're
// deployed via this same GitHub Actions workflow using `wrangler pages
// deploy`) — a Cloudflare Deploy Hook only exists for Cloudflare's own Git
// integration. This dispatches the whole matrix (all three sites rebuild),
// since the workflow has no per-site input — an acceptable few extra
// minutes of CI time rather than added complexity.
// GITHUB_DISPATCH_TOKEN is a fine-grained PAT scoped to Actions:write on
// this repo only (Pages secret, set per project — `wrangler pages secret
// put GITHUB_DISPATCH_TOKEN --project-name=<project>`). Silently a no-op if
// unset — the business is still published in D1 either way, it just won't
// be visible on the static pages until the next rebuild happens some other
// way (e.g. the hourly research routine's commits).
export interface RebuildTarget {
  workflow: string;
  ref: string;
}

// Which deploy a rebuild request should run. Production uses deploy.yml on
// main; the Ethan preview sets REBUILD_WORKFLOW/REBUILD_REF in its
// wrangler env.preview vars so its own purchases rebuild the preview, not
// production.
export function rebuildTarget(env: object): RebuildTarget {
  const e = env as { REBUILD_WORKFLOW?: string; REBUILD_REF?: string };
  return { workflow: e.REBUILD_WORKFLOW || 'deploy.yml', ref: e.REBUILD_REF || 'main' };
}

export async function triggerRebuild(githubToken: string | undefined, target: RebuildTarget = { workflow: 'deploy.yml', ref: 'main' }): Promise<void> {
  if (!githubToken) return;
  try {
    await fetch(`https://api.github.com/repos/hubnetworksa/hub-platform/actions/workflows/${encodeURIComponent(target.workflow)}/dispatches`, {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${githubToken}`,
        Accept: 'application/vnd.github+json',
        'User-Agent': 'hub-platform-owner-confirm',
      },
      body: JSON.stringify({ ref: target.ref }),
    });
  } catch {
    // Best-effort — a failed trigger doesn't undo the fact that the
    // business is already published in D1.
  }
}

export interface RebuildEnv {
  DB: D1Database;
  GITHUB_DISPATCH_TOKEN?: string;
  REBUILD_WORKFLOW?: string;
  REBUILD_REF?: string;
}

// Every rebuild is a full three-city deploy that reads all three databases,
// so firing one per owner edit or per PayFast webhook would burn the D1 read
// quota (which has already taken the site down twice). This is the
// debounced front door every D1 write that changes public output should
// call instead of triggerRebuild(): the first request in a window
// dispatches immediately, later ones within the window are coalesced into a
// pending flag that the daily sweeps (or the next request after the window)
// flush. State lives in site_settings as epoch-millisecond strings, so
// allPrices()' Number() coercion stays sane if it ever sees these keys.
const REBUILD_WINDOW_MS = 15 * 60 * 1000;
// Preview and production share one database, so the bookkeeping is kept
// per deploy target — otherwise a preview dispatch would look like it had
// already covered a production rebuild that is still owed.
function keysFor(env: RebuildEnv): { last: string; requested: string } {
  const t = rebuildTarget(env);
  const suffix = t.workflow === 'deploy.yml' && t.ref === 'main' ? '' : `:${t.workflow}@${t.ref}`;
  return { last: `meta_rebuild_last_dispatched_ms${suffix}`, requested: `meta_rebuild_requested_ms${suffix}` };
}

async function readMs(db: D1Database, key: string): Promise<number> {
  const row = await db.prepare('SELECT value FROM site_settings WHERE key = ?').bind(key).first<{ value: string }>();
  const n = Number(row?.value);
  return Number.isFinite(n) ? n : 0;
}

async function writeMs(db: D1Database, key: string, ms: number): Promise<void> {
  await db
    .prepare(
      `INSERT INTO site_settings (key, value, updated_at) VALUES (?, ?, datetime('now'))
       ON CONFLICT(key) DO UPDATE SET value = excluded.value, updated_at = excluded.updated_at`
    )
    .bind(key, String(ms))
    .run();
}

/** Ask for the public site to be rebuilt soon. Never throws; a failure here
 *  must not undo the D1 write that prompted it. */
export async function requestRebuild(env: RebuildEnv, reason: string): Promise<void> {
  try {
    const k = keysFor(env);
    const now = Date.now();
    const last = await readMs(env.DB, k.last);
    if (now - last < REBUILD_WINDOW_MS || !env.GITHUB_DISPATCH_TOKEN) {
      // Inside the window (or no token to dispatch with): remember that a
      // rebuild is owed. The rebuild-flush workflow picks it up within
      // about 15 minutes.
      await writeMs(env.DB, k.requested, now);
      return;
    }
    await triggerRebuild(env.GITHUB_DISPATCH_TOKEN, rebuildTarget(env));
    await writeMs(env.DB, k.last, now);
    await writeMs(env.DB, k.requested, 0);
  } catch (err) {
    console.error('requestRebuild failed', reason, err);
  }
}

/** For the scheduled flush (and the daily sweeps): dispatch a rebuild if one
 *  was requested while the debounce window was closed and nothing has
 *  dispatched since. With `dispatch: false` the owed rebuild is only marked
 *  as covered — used when another city's flush has just dispatched the
 *  same all-cities workflow a moment ago. */
export async function flushPendingRebuild(env: RebuildEnv, opts: { dispatch?: boolean } = {}): Promise<boolean> {
  try {
    const k = keysFor(env);
    const requested = await readMs(env.DB, k.requested);
    if (!requested) return false;
    const last = await readMs(env.DB, k.last);
    if (last >= requested) {
      await writeMs(env.DB, k.requested, 0);
      return false;
    }
    if (opts.dispatch === false) {
      await writeMs(env.DB, k.last, Date.now());
      await writeMs(env.DB, k.requested, 0);
      return false;
    }
    if (!env.GITHUB_DISPATCH_TOKEN) return false;
    await triggerRebuild(env.GITHUB_DISPATCH_TOKEN, rebuildTarget(env));
    await writeMs(env.DB, k.last, Date.now());
    await writeMs(env.DB, k.requested, 0);
    return true;
  } catch (err) {
    console.error('flushPendingRebuild failed', err);
    return false;
  }
}
