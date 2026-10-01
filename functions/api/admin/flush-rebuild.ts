import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { flushPendingRebuild } from '../../_lib/deploy-hook';
import { safeEqual } from '../../_lib/timing';

interface Env {
  DB: D1Database;
  CRON_SECRET?: string;
  GITHUB_DISPATCH_TOKEN?: string;
  REBUILD_WORKFLOW?: string;
  REBUILD_REF?: string;
}

// Called every 15 minutes by .github/workflows/rebuild-flush.yml. Anything
// that changed what the public pages show (a payment activating a plan or
// sponsorship, an expiry, an admin edit) asks for a rebuild through
// requestRebuild(), which dispatches at most once per 15 minutes and
// otherwise leaves a "rebuild owed" flag. This turns that flag into a real
// rebuild, so paid placements appear without anyone pressing a button.
//
// Body {"dispatch": false} marks an owed rebuild as covered without
// dispatching: the workflow sends it to the other cities once one city has
// already dispatched the (all-cities) deploy.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const auth = context.request.headers.get('Authorization') ?? '';
  if (!context.env.CRON_SECRET || !safeEqual(auth, `Bearer ${context.env.CRON_SECRET}`)) {
    return json({ ok: false }, 401);
  }
  let dispatch = true;
  try {
    const body = (await context.request.json()) as { dispatch?: unknown };
    if (body && body.dispatch === false) dispatch = false;
  } catch {
    // no body: default to dispatching
  }
  const rebuilt = await flushPendingRebuild(context.env, { dispatch });
  return json({ ok: true, rebuilt });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
