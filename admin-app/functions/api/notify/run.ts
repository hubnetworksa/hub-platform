import type { PagesFunction } from '@cloudflare/workers-types';
import { json, type Env } from '../../_lib/sites';
import { notifyKeyOk } from '../../_lib/notify-key';
import { checkAndNotify } from '../../_lib/notifier';
import { checkRoutines, ingestD1, ingestRuns, runHealthChecks } from '../../_lib/health';
import { maybeSendWeekly } from '../../_lib/weekly';

// The 5-minute run, called by .github/workflows/admin-notify.yml with
// X-Notify-Key (see _lib/notify-key.ts). It:
//   - announces new items in every city's queues (_lib/notifier.ts)
//   - checks each site is up and its database answers (_lib/health.ts)
//   - stores the GitHub workflow runs and Cloudflare D1 usage the workflow
//     sends in the body ({ runs, d1 }), alerting on failures / high usage
//   - alerts when a routine becomes late
//   - on Monday morning, sends the weekly summary (_lib/weekly.ts)
// Each part runs even if another fails, so one problem never hides the rest.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const env = context.env;
  if (!(await notifyKeyOk(context.request, env.ADMIN_DB))) return json({ ok: false }, 403);
  let body: { runs?: unknown; d1?: unknown } = {};
  const text = await context.request.text();
  if (text.length > 1_000_000) return json({ ok: false, error: 'Body too large.' }, 413);
  if (text) {
    try {
      body = JSON.parse(text);
    } catch {
      return json({ ok: false, error: 'Body must be JSON.' }, 400);
    }
  }
  const out: Record<string, unknown> = {};
  const errors: string[] = [];
  const step = async (name: string, fn: () => Promise<unknown>) => {
    try {
      out[name] = await fn();
    } catch (e) {
      errors.push(`${name}: ${e instanceof Error ? e.message : String(e)}`);
    }
  };
  await step('queues', () => checkAndNotify(env));
  await step('health', () => runHealthChecks(env));
  if (body.runs !== undefined) await step('runs', () => ingestRuns(env, body.runs));
  if (body.d1 !== undefined) await step('d1', () => ingestD1(env, body.d1));
  await step('routines', () => checkRoutines(env));
  await step('weekly', () => maybeSendWeekly(env));
  const q = (out.queues ?? { newItems: 0, sent: 0 }) as { newItems: number; sent: number };
  return json({ ok: errors.length === 0, newItems: q.newItems, sent: q.sent, ...out, errors });
};
