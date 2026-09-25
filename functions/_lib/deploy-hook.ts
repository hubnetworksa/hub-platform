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
export async function triggerRebuild(githubToken: string | undefined): Promise<void> {
  if (!githubToken) return;
  try {
    await fetch('https://api.github.com/repos/hubnetworksa/hub-platform/actions/workflows/deploy.yml/dispatches', {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${githubToken}`,
        Accept: 'application/vnd.github+json',
        'User-Agent': 'hub-platform-owner-confirm',
      },
      body: JSON.stringify({ ref: 'main' }),
    });
  } catch {
    // Best-effort — a failed trigger doesn't undo the fact that the
    // business is already published in D1.
  }
}

export interface RebuildEnv {
  DB: D1Database;
  GITHUB_DISPATCH_TOKEN?: string;
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
const LAST_DISPATCH_KEY = 'meta_rebuild_last_dispatched_ms';
const REQUESTED_KEY = 'meta_rebuild_requested_ms';

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
    const now = Date.now();
    const last = await readMs(env.DB, LAST_DISPATCH_KEY);
    if (now - last < REBUILD_WINDOW_MS || !env.GITHUB_DISPATCH_TOKEN) {
      // Inside the window (or no token to dispatch with, e.g. a preview
      // deploy): remember that a rebuild is owed and let the next caller or
      // the daily sweep pick it up.
      await writeMs(env.DB, REQUESTED_KEY, now);
      return;
    }
    await triggerRebuild(env.GITHUB_DISPATCH_TOKEN);
    await writeMs(env.DB, LAST_DISPATCH_KEY, now);
    await writeMs(env.DB, REQUESTED_KEY, 0);
  } catch (err) {
    console.error('requestRebuild failed', reason, err);
  }
}

/** For the daily cron sweeps: dispatch a rebuild if one was requested while
 *  the debounce window was closed and nothing has dispatched since. */
export async function flushPendingRebuild(env: RebuildEnv): Promise<boolean> {
  try {
    const requested = await readMs(env.DB, REQUESTED_KEY);
    if (!requested) return false;
    const last = await readMs(env.DB, LAST_DISPATCH_KEY);
    if (last >= requested) {
      await writeMs(env.DB, REQUESTED_KEY, 0);
      return false;
    }
    if (!env.GITHUB_DISPATCH_TOKEN) return false;
    await triggerRebuild(env.GITHUB_DISPATCH_TOKEN);
    await writeMs(env.DB, LAST_DISPATCH_KEY, Date.now());
    await writeMs(env.DB, REQUESTED_KEY, 0);
    return true;
  } catch (err) {
    console.error('flushPendingRebuild failed', err);
    return false;
  }
}
