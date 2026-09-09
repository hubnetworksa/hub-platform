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
