import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, rows, type Env, type HubSite } from '../../_lib/sites';

// The Inbox: every waiting item on every site with its full details (the
// listing that was submitted, the review text, the message, the reason for a
// report, ...), so you can decide without opening each site. Acting on an
// item still happens in that site's own admin (each item links there).
// Read-only: nothing here changes a city database.

interface Item {
  site: string;
  type: string;
  id: number;
  title: string;
  created_at: string;
  link: string;
  fields: [string, string][];
  text: string | null;
  flags: string[];
}

const DOCS = (keys: string | null) => {
  try {
    const list = JSON.parse(keys ?? '[]');
    return Array.isArray(list) ? list.length : 0;
  } catch {
    return 0;
  }
};

const f = (pairs: [string, unknown][]): [string, string][] => pairs.filter(([, v]) => v !== null && v !== undefined && String(v).trim() !== '').map(([k, v]) => [k, String(v)]);

async function siteInbox(s: HubSite): Promise<Item[]> {
  const admin = (p: string) => `https://${s.domain}/admin/${p}/`;
  const out: Item[] = [];

  for (const r of await rows<Record<string, string | number | null>>(
    s.db,
    `SELECT id, name, category_slug, suburb_slug, address, phone, email, website, description, hours, chosen_tier, payment_status, created_at,
            (SELECT u.email FROM users u WHERE u.id = submitted_by_user_id) AS submitter
     FROM pending_submissions WHERE owner_confirm_token IS NULL AND admin_approved_at IS NULL ORDER BY created_at DESC LIMIT 100`
  )) {
    const tier = Number(r.chosen_tier) || 0;
    out.push({
      site: s.slug, type: 'submission', id: Number(r.id), title: String(r.name), created_at: String(r.created_at), link: admin('submissions'),
      fields: f([['Category', r.category_slug], ['Suburb', r.suburb_slug], ['Address', r.address], ['Phone', r.phone], ['Email', r.email], ['Website', r.website], ['Hours', r.hours], ['Plan', tier ? (tier === 2 ? 'Featured' : 'Verified') : 'Free'], ['Payment', r.payment_status], ['Submitted by', r.submitter]]),
      text: (r.description as string) ?? null,
      flags: [...(tier && r.payment_status !== 'paid' ? ['Paid plan, not paid yet'] : []), ...(r.payment_status === 'paid' ? ['Paid'] : [])],
    });
  }

  for (const r of await rows<Record<string, string | number | null>>(
    s.db,
    `SELECT bc.id, b.name, b.slug, bc.contact_name, bc.contact_phone, bc.contact_email, bc.role_note, bc.document_keys, bc.email_verified_at, bc.created_at, u.email AS account_email,
            (b.owner_user_id IS NOT NULL) AS has_owner
     FROM business_claims bc JOIN businesses b ON b.id = bc.business_id JOIN users u ON u.id = bc.user_id
     WHERE bc.status = 'pending' ORDER BY bc.created_at DESC LIMIT 100`
  )) {
    const age = (Date.now() - new Date(`${String(r.created_at).replace(' ', 'T')}Z`).getTime()) / 86400000;
    out.push({
      site: s.slug, type: 'claim', id: Number(r.id), title: String(r.name), created_at: String(r.created_at), link: admin('claims'),
      fields: f([['Name', r.contact_name], ['Phone', r.contact_phone], ['Email', r.contact_email], ['Account', r.account_email], ['Documents', `${DOCS(r.document_keys as string)} uploaded`], ['Listing', `https://${s.domain}/business/${r.slug}/`]]),
      text: (r.role_note as string) ?? null,
      flags: [...(r.email_verified_at ? ['Email confirmed'] : ['Email not confirmed']), ...(Number(r.has_owner) ? ['Listing already has an owner'] : []), ...(age > 14 ? ['Older than 14 days: can only be dismissed'] : [])],
    });
  }

  for (const r of await rows<Record<string, string | number | null>>(
    s.db,
    `SELECT id, kind, business_slug, business_name, reason, relationship, requester_email, created_at FROM reports WHERE status = 'open' ORDER BY created_at DESC LIMIT 100`
  )) {
    out.push({
      site: s.slug, type: 'report', id: Number(r.id), title: String(r.business_name), created_at: String(r.created_at), link: admin('reports'),
      fields: f([['Kind', r.kind === 'removal' ? 'Removal request' : 'Problem report'], ['Relationship', r.relationship], ['From', r.requester_email], ['Listing', `https://${s.domain}/business/${r.business_slug}/`]]),
      text: (r.reason as string) ?? null,
      flags: r.kind === 'removal' ? ['Removal request'] : [],
    });
  }

  for (const r of await rows<Record<string, string | number | null>>(
    s.db,
    `SELECT id, kind, name, contact, topic, message, business_slug, business_name, emailed, created_at FROM messages WHERE status = 'open' ORDER BY created_at DESC LIMIT 100`
  )) {
    out.push({
      site: s.slug, type: 'message', id: Number(r.id), title: String(r.business_name ?? r.name ?? 'Contact form'), created_at: String(r.created_at), link: admin('enquiries'),
      fields: f([['Kind', r.kind === 'enquiry' ? 'Enquiry to a business' : 'Contact form'], ['From', r.name], ['Contact', r.contact], ['Topic', r.topic], ['Business', r.business_slug ? `https://${s.domain}/business/${r.business_slug}/` : null]]),
      text: (r.message as string) ?? null,
      flags: r.kind === 'enquiry' && !Number(r.emailed) ? ['Never reached the business (no email on file)'] : [],
    });
  }

  for (const r of await rows<Record<string, string | number | null>>(
    s.db,
    `SELECT r.id, r.rating, r.author_name, r.comment, r.flagged, r.flagged_reason, r.status, r.created_at, b.name, b.slug
     FROM reviews r JOIN businesses b ON b.id = r.business_id WHERE r.status = 'pending' OR r.flagged = 1 ORDER BY r.created_at DESC LIMIT 100`
  )) {
    out.push({
      site: s.slug, type: 'review', id: Number(r.id), title: String(r.name), created_at: String(r.created_at), link: admin('reviews'),
      fields: f([['Rating', `${'★'.repeat(Number(r.rating))}${'☆'.repeat(5 - Number(r.rating))}`], ['By', r.author_name], ['Listing', `https://${s.domain}/business/${r.slug}/`], ['Owner says', Number(r.flagged) ? r.flagged_reason : null]]),
      text: (r.comment as string) ?? null,
      flags: Number(r.flagged) ? ['Flagged by the owner'] : [],
    });
  }

  for (const r of await rows<Record<string, string | number | null>>(
    s.db,
    `SELECT id, title, type, event_date, event_time, venue, suburb, price, ticket_url, host, description, contact_name, contact_email, contact_phone, wants_feature, payment_status, created_at
     FROM event_submissions WHERE status = 'pending' ORDER BY created_at DESC LIMIT 100`
  )) {
    out.push({
      site: s.slug, type: 'event', id: Number(r.id), title: String(r.title), created_at: String(r.created_at), link: admin('events'),
      fields: f([['Type', r.type], ['When', `${r.event_date}${r.event_time ? ` ${r.event_time}` : ''}`], ['Where', [r.venue, r.suburb].filter(Boolean).join(', ')], ['Price', r.price], ['Tickets', r.ticket_url !== '#' ? r.ticket_url : null], ['Host', r.host], ['Contact', [r.contact_name, r.contact_email, r.contact_phone].filter(Boolean).join(' · ')], ['Payment', r.payment_status]]),
      text: (r.description as string) || null,
      flags: Number(r.wants_feature) ? ['Wants to be featured'] : [],
    });
  }

  for (const r of await rows<Record<string, string | number | null>>(
    s.db,
    `SELECT ec.id, e.title, e.slug, ec.contact_name, ec.contact_phone, ec.contact_email, ec.role_note, ec.created_at
     FROM event_claims ec JOIN events e ON e.id = ec.event_id WHERE ec.status = 'pending' ORDER BY ec.created_at DESC LIMIT 100`
  )) {
    out.push({
      site: s.slug, type: 'event-claim', id: Number(r.id), title: String(r.title), created_at: String(r.created_at), link: admin('events'),
      fields: f([['Name', r.contact_name], ['Phone', r.contact_phone], ['Email', r.contact_email], ['Event', `https://${s.domain}/events/${r.slug}/`]]),
      text: (r.role_note as string) ?? null,
      flags: [],
    });
  }
  return out;
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const lists = await Promise.all(hubSites(context.env).map(siteInbox));
  const items = lists.flat().sort((a, b) => b.created_at.localeCompare(a.created_at));
  return json({ ok: true, items });
};
