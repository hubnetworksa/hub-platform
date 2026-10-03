import type { ExportedHandler, ScheduledController, ExecutionContext } from '@cloudflare/workers-types';
import { checkAndNotify } from '../functions/_lib/notifier';
import type { Env } from '../functions/_lib/sites';

// Hub Admin notifier: every 5 minutes, checks every city's "needs attention"
// queues for new items and pushes a notification to subscribed devices.
// No public URL (workers_dev/preview_urls off); fetch() only exists so a
// stray request gets a 404.
export default {
  async scheduled(_controller: ScheduledController, env: Env, ctx: ExecutionContext) {
    ctx.waitUntil(
      checkAndNotify(env).then(
        (r) => console.log(`notifier: ${r.newItems} new item(s), pushed to ${r.sent} device(s)`),
        (e) => console.error('notifier failed:', e instanceof Error ? e.message : e)
      )
    );
  },
  async fetch() {
    return new Response('Not found', { status: 404 });
  },
} satisfies ExportedHandler<Env>;
