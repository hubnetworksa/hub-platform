import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSite } from '../../_lib/site';
import { safeEqual } from '../../_lib/timing';
import { sendEmail } from '../../_lib/send-email';
import { listingLiveEmailHtml } from '../../_lib/email-template';

interface Env {
  DB: D1Database;
  SITE: string;
  CRON_SECRET?: string;
  RESEND_API_KEY?: string;
}

interface PendingRow {
  id: number;
  business_name: string;
  owner_email: string;
  listing_url: string;
}

// Called by .github/workflows/deploy.yml, once per site, right after that
// site's own "Deploy to Cloudflare Pages" step succeeds — this is the only
// place the "you're live" email actually goes out, so an owner never hears
// their listing is live before the rebuild that publishes it has finished.
// functions/api/owner-confirm-listing.ts only queues a row in
// pending_live_emails; it never sends from there. Production-only by
// construction: deploy-dev.yml and deploy-ethan-preview.yml don't call this.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const auth = context.request.headers.get('Authorization') ?? '';
  if (!context.env.CRON_SECRET || !safeEqual(auth, `Bearer ${context.env.CRON_SECRET}`)) {
    return json({ ok: false }, 401);
  }

  const site = getSite(context.env.SITE);
  const db = context.env.DB;
  const rows = (await db.prepare('SELECT id, business_name, owner_email, listing_url FROM pending_live_emails ORDER BY id LIMIT 50').all<PendingRow>()).results ?? [];

  let sent = 0;
  for (const row of rows) {
    const result = await sendEmail(context.env, {
      from: `${site.siteName} <${site.contactEmail}>`,
      to: row.owner_email,
      subject: `You're live on ${site.siteName}: ${row.business_name}`,
      text: `Thanks for confirming — "${row.business_name}" is now published on ${site.siteName}.\n\nView your listing: ${row.listing_url}`,
      html: listingLiveEmailHtml(site, { businessName: row.business_name, listingUrl: row.listing_url }),
    });
    // Only clear the row once it actually sent — a Resend hiccup leaves it
    // queued for this site's next deploy to retry, rather than silently
    // dropping a real "you're live" notification.
    if (!result.sent) continue;
    await db.prepare('DELETE FROM pending_live_emails WHERE id = ?').bind(row.id).run();
    sent++;
  }

  return json({ ok: true, sent });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
