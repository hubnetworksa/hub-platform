// Triggers the GitHub Actions workflow that rebuilds/redeploys whichever
// Cloudflare Pages environment this Function is actually running in —
// production (main -> deploy.yml), the hosted dev preview (dev ->
// deploy-dev.yml), or a feature-branch preview like Ethan's
// (Ethan -> deploy-ethan.yml) — so a newly published business/page-design
// change shows up on the live static site within a few minutes, instead of
// only ever rebuilding production regardless of where the write actually
// came from. Uses the GitHub Actions API rather than a Cloudflare Pages
// Deploy Hook because these projects aren't Git-connected in Cloudflare
// (they're deployed via these same GitHub Actions workflows using `wrangler
// pages deploy`) — a Cloudflare Deploy Hook only exists for Cloudflare's own
// Git integration. This dispatches the whole matrix (all three sites
// rebuild), since none of these workflows have a per-site input — an
// acceptable few extra minutes of CI time rather than added complexity.
// GITHUB_DISPATCH_TOKEN is a fine-grained PAT scoped to Actions:write on
// this repo only (Pages secret, set per project — `wrangler pages secret
// put GITHUB_DISPATCH_TOKEN --project-name=<project>`). Silently a no-op if
// unset — the write is still committed to D1 either way, it just won't be
// visible on the static pages until the next rebuild happens some other way
// (e.g. the hourly research routine's commits).
interface DeployHookEnv {
  GITHUB_DISPATCH_TOKEN?: string;
  // Cloudflare injects this automatically into every Pages Function's env —
  // no config needed on our end. Undefined only in genuinely odd contexts
  // (e.g. a local `wrangler pages dev` without a real deployment behind it).
  CF_PAGES_BRANCH?: string;
}

// Maps a deployment's branch to the workflow that rebuilds that same
// environment, and the git ref to dispatch it against. Falls back to the
// `deploy-<branch>.yml` naming convention (lowercased) for anything besides
// main/dev — matches how deploy-ethan.yml was added, so a future preview
// branch's own rebuild-on-publish "just works" the moment it gets a
// matching workflow file, no further change needed here. If no such
// workflow exists yet, GitHub's API 404s and triggerRebuild's own
// catch swallows it the same as any other best-effort failure.
function workflowFor(branch: string | undefined): { workflow: string; ref: string } {
  if (!branch || branch === 'main') return { workflow: 'deploy.yml', ref: 'main' };
  if (branch === 'dev') return { workflow: 'deploy-dev.yml', ref: 'dev' };
  return { workflow: `deploy-${branch.toLowerCase()}.yml`, ref: branch };
}

export async function triggerRebuild(env: DeployHookEnv): Promise<void> {
  if (!env.GITHUB_DISPATCH_TOKEN) return;
  const { workflow, ref } = workflowFor(env.CF_PAGES_BRANCH);
  try {
    await fetch(`https://api.github.com/repos/hubnetworksa/hub-platform/actions/workflows/${workflow}/dispatches`, {
      method: 'POST',
      headers: {
        Authorization: `Bearer ${env.GITHUB_DISPATCH_TOKEN}`,
        Accept: 'application/vnd.github+json',
        'User-Agent': 'hub-platform-owner-confirm',
      },
      body: JSON.stringify({ ref }),
    });
  } catch {
    // Best-effort — a failed trigger doesn't undo the fact that the
    // business is already published in D1.
  }
}
