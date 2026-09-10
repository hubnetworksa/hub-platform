import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { triggerRebuild } from '../../_lib/deploy-hook';

interface Env {
  DB: D1Database;
  GITHUB_DISPATCH_TOKEN?: string;
}

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const user = await getSessionUser(context.request, context.env.DB);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  if (!context.env.GITHUB_DISPATCH_TOKEN) return json({ ok: false, error: 'GITHUB_DISPATCH_TOKEN is not configured.' }, 503);

  await triggerRebuild(context.env.GITHUB_DISPATCH_TOKEN);
  return json({ ok: true });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
