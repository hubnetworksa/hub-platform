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
    'message',
    'Message',
    '/admin/enquiries/',
    `SELECT COALESCE(business_name, name, 'Contact form') AS title, CASE kind WHEN 'enquiry' THEN 'Enquiry' ELSE 'Contact form' END AS detail, created_at
     FROM messages WHERE status = 'open' ORDER BY created_at DESC LIMIT 25`,
  ],
  [
    'review',
    'Review',
    '/admin/reviews/',
    `SELECT b.name AS title, r.author_name AS detail, r.created_at FROM reviews r
     JOIN businesses b ON b.id = r.business_id WHERE r.status = 'pending' ORDER BY r.created_at DESC LIMIT 25`,
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
 *  morning briefing, and problems (site down, failed workflow run, database
 *  usage near the free limit, a late routine). */
export const ALERT_TYPES = [...QUEUE_TYPES, 'briefing', 'health', 'deploy', 'usage', 'routine'];
