import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { clearSessionCookie, endSession } from '../../_lib/auth';
import { jsonBody } from '../../_lib/body';

// Signs out this device, or every device with { everywhere: true }.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const db = context.env.ADMIN_DB;
  const body = await jsonBody(context.request);
  const user = context.data.user as { id: number } | undefined;
  if (body?.everywhere && user) await db.prepare('DELETE FROM admin_sessions WHERE user_id = ?').bind(user.id).run();
  else await endSession(context.request, db);
  return json({ ok: true }, 200, { 'Set-Cookie': clearSessionCookie });
};
