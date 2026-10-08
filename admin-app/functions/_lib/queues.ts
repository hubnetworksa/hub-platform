import type { HubSite } from './sites';
import { rows } from './sites';

// The "needs attention" queues, shared by the Overview screen and the
// notifier (push notifications). Each item deep-links to the matching screen
// of that site's own admin (/admin/... on its domain).

export interface QueueItem {
  site: string;
  type: string;
  label: string;
  title: string;
  detail: string;
  created_at: string;
  link: string;
}

// [type, label, admin path, SQL returning title, detail, created_at]
export const QUEUES: [string, string, string, string][] = [
  [
    'submission',
    'New listing',
    '/admin/submissions/',
    `SELECT name AS title, COALESCE(suburb_slug, '') AS detail, created_at FROM pending_submissions
     WHERE owner_confirm_token IS NULL AND admin_approved_at IS NULL ORDER BY created_at DESC LIMIT 25`,
  ],
  [
    'claim',
    'Business claim',
    '/admin/claims/',
    `SELECT b.name AS title, COALESCE(bc.contact_name, '') AS detail, bc.created_at FROM business_claims bc
     JOIN businesses b ON b.id = bc.business_id WHERE bc.status = 'pending' ORDER BY bc.created_at DESC LIMIT 25`,
  ],
  [
    'report',
    'Report',
    '/admin/reports/',
    `SELECT business_name AS title, CASE kind WHEN 'removal' THEN 'Removal request' ELSE 'Problem report' END AS detail, created_at
     FROM reports WHERE status = 'open' ORDER BY created_at DESC LIMIT 25`,
  ],
  [
    // Contact-form messages only: a business enquiry is between the
    // visitor and the business (emailed straight to them), and Hub Admin
    // must neither surface it as a pending item nor let anyone reply to it
    // on the business's behalf.
    'message',
    'Message',
    '/admin/enquiries/',
    `SELECT COALESCE(name, 'Contact form') AS title, 'Contact form' AS detail, created_at
     FROM messages WHERE status = 'open' AND kind != 'enquiry' ORDER BY created_at DESC LIMIT 25`,
  ],
  [
    'review',
    'Review',
    '/admin/reviews/',
    `SELECT b.name AS title, r.author_name AS detail, r.created_at FROM reviews r
     JOIN businesses b ON b.id = r.business_id WHERE r.status = 'pending' OR r.flagged = 1 ORDER BY r.created_at DESC LIMIT 25`,
  ],
  [
    'event',
    'Event',
    '/admin/events/',
    `SELECT title, COALESCE(contact_name, '') AS detail, created_at FROM event_submissions
     WHERE status = 'pending' ORDER BY created_at DESC LIMIT 25`,
  ],
  [
    'event-claim',
    'Event claim',
    '/admin/events/',
    `SELECT e.title AS title, COALESCE(ec.contact_name, '') AS detail, ec.created_at FROM event_claims ec
     JOIN events e ON e.id = ec.event_id WHERE ec.status = 'pending' ORDER BY ec.created_at DESC LIMIT 25`,
  ],
];

// True totals per type (the lists above are capped at 25 per type). Same
// filters as QUEUES and as the Inbox, so the numbers always agree.
const COUNTS: Record<string, string> = {
  submission: `SELECT COUNT(*) AS n FROM pending_submissions WHERE owner_confirm_token IS NULL AND admin_approved_at IS NULL`,
  claim: `SELECT COUNT(*) AS n FROM business_claims WHERE status = 'pending'`,
  report: `SELECT COUNT(*) AS n FROM reports WHERE status = 'open'`,
  message: `SELECT COUNT(*) AS n FROM messages WHERE status = 'open' AND kind != 'enquiry'`,
  review: `SELECT COUNT(*) AS n FROM reviews WHERE status = 'pending' OR flagged = 1`,
  event: `SELECT COUNT(*) AS n FROM event_submissions WHERE status = 'pending'`,
  'event-claim': `SELECT COUNT(*) AS n FROM event_claims WHERE status = 'pending'`,
};

/** Uncapped count of waiting items per type on one site. */
export async function siteQueueCounts(site: HubSite): Promise<Record<string, number>> {
  const out: Record<string, number> = {};
  await Promise.all(
    Object.entries(COUNTS).map(async ([type, sql]) => {
      const r = await rows<{ n: number }>(site.db, sql);
      out[type] = Number(r[0]?.n) || 0;
    })
  );
  return out;
}

/** Every pending item on one site, newest first per queue. */
export async function siteQueue(site: HubSite): Promise<QueueItem[]> {
  const lists = await Promise.all(
    QUEUES.map(async ([type, label, path, sql]) =>
      (await rows<{ title: string; detail: string; created_at: string }>(site.db, sql)).map(
        (r): QueueItem => ({ site: site.slug, type, label, title: r.title, detail: r.detail, created_at: r.created_at, link: `https://${site.domain}${path}` })
      )
    )
  );
  return lists.flat();
}

export const QUEUE_TYPES = QUEUES.map(([type]) => type);

/** Everything a device can choose to be alerted about: the queues, the
 *  morning briefing, the Monday weekly summary, and problems (site down, failed workflow run, database
 *  usage near the free limit, a late routine). */
export const ALERT_TYPES = [...QUEUE_TYPES, 'briefing', 'weekly', 'health', 'deploy', 'usage', 'routine'];
