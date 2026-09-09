// Fires this site's Cloudflare Pages Deploy Hook (Settings → Builds &
// deployments → Deploy hooks, one per Pages project — set its URL as this
// project's DEPLOY_HOOK_URL environment variable/secret) so a newly
// published business shows up on the live static site within a few minutes,
// instead of waiting for whatever incidental rebuild happens next (e.g. the
// hourly research routine's commits). Silently a no-op if DEPLOY_HOOK_URL
// isn't set — the business is still published in D1 either way, it just
// won't be visible on the static pages until the next rebuild happens some
// other way.
export async function triggerRebuild(deployHookUrl: string | undefined): Promise<void> {
  if (!deployHookUrl) return;
  try {
    await fetch(deployHookUrl, { method: 'POST' });
  } catch {
    // Best-effort — a failed trigger doesn't undo the fact that the
    // business is already published in D1.
  }
}
