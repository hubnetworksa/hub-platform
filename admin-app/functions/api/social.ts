import type { PagesFunction } from '@cloudflare/workers-types';
import { hubSites, json, rows, type Env, type HubSite } from '../_lib/sites';
import { jsonBody, str } from '../_lib/body';
import { getSetting, logActivity, setSetting } from '../_lib/alerts';

// The Social tab: each city's Facebook / Instagram setup checklist (shared by
// every admin), the page links once they exist, and ready-to-post captions
// built from what's new on the site (new listings, upcoming events, news),
// each linking back with UTM tags so the visits show up in Analytics.
// Follower numbers and automatic posting need the Meta API (SOCIALS-PLAN.md).

export const SOCIAL_STEPS = [
  'Meta Business portfolio created',
  'Facebook Page created (name, category, intro, about)',
  'Profile picture and cover uploaded',
  'Instagram account created and switched to Business',
  'Instagram linked to the Facebook Page',
  'Two-factor sign-in on for Facebook and Instagram',
  'Launch post published on both',
  'Page links added below (Claude adds them to the site)',
];

interface SocialState {
  steps: boolean[];
  facebook: string | null;
  instagram: string | null;
}

async function stateOf(env: Env, slug: string): Promise<SocialState> {
  try {
    const v = JSON.parse((await getSetting(env.ADMIN_DB, `social:${slug}`)) ?? '{}');
    return { steps: SOCIAL_STEPS.map((_, i) => !!v.steps?.[i]), facebook: v.facebook ?? null, instagram: v.instagram ?? null };
  } catch {
    return { steps: SOCIAL_STEPS.map(() => false), facebook: null, instagram: null };
  }
}

const utm = (url: string, campaign: string) => `${url}?utm_source=facebook&utm_medium=social&utm_campaign=${campaign}`;

async function ideas(s: HubSite) {
  const base = `https://${s.domain}`;
  const out: { kind: string; title: string; caption: string; link: string }[] = [];
  for (const b of await rows<{ slug: string; name: string; suburb: string | null; cat: string | null; short: string | null }>(
    s.db,
    `SELECT b.slug, b.name, su.name AS suburb, b.short_description AS short,
            (SELECT c.name FROM business_categories bc JOIN categories c ON c.id = bc.category_id WHERE bc.business_id = b.id AND bc.is_primary = 1 LIMIT 1) AS cat
     FROM businesses b LEFT JOIN suburbs su ON su.id = b.suburb_id
     WHERE b.status = 'published' AND b.closed_at IS NULL AND b.is_test = 0 AND b.created_at >= datetime('now', '-7 days')
     ORDER BY b.created_at DESC LIMIT 6`
  )) {
    const link = utm(`${base}/business/${b.slug}/`, 'new-listing');
    out.push({
      kind: 'New listing',
      title: b.name,
      link,
      caption: `New on ${s.name}: ${b.name}${b.suburb ? ` in ${b.suburb}` : ''}${b.cat ? ` (${b.cat})` : ''}.${b.short ? ` ${b.short}` : ''}\n\nPhone, hours and directions 👉 ${link}\n\n#${s.city.replace(/\s+/g, '')} #SupportLocal`,
    });
  }
  for (const e of await rows<{ slug: string; title: string; event_date: string; event_time: string | null; venue: string | null; suburb: string | null; price: string | null }>(
    s.db,
    `SELECT slug, title, event_date, event_time, venue, suburb, price FROM events WHERE event_date >= date('now') AND event_date <= date('now', '+10 days') ORDER BY event_date LIMIT 6`
  )) {
    const link = utm(`${base}/events/${e.slug}/`, 'event');
    const when = new Date(`${e.event_date}T00:00:00Z`).toLocaleDateString('en-ZA', { weekday: 'long', day: 'numeric', month: 'long', timeZone: 'UTC' });
    out.push({
      kind: 'Event',
      title: e.title,
      link,
      caption: `📅 ${e.title}\n${when}${e.event_time ? `, ${e.event_time}` : ''}${e.venue ? ` at ${e.venue}` : ''}${e.suburb ? `, ${e.suburb}` : ''}.${e.price ? ` ${e.price}.` : ''}\n\nAll the details 👉 ${link}\n\n#${s.city.replace(/\s+/g, '')}Events`,
    });
  }
  for (const n of await rows<{ slug: string; title: string; summary: string }>(
    s.db,
    `SELECT slug, title, summary FROM news WHERE published_date >= date('now', '-3 days') ORDER BY published_date DESC LIMIT 4`
  )) {
    const link = utm(`${base}/news/${n.slug}/`, 'news');
    out.push({ kind: 'News', title: n.title, link, caption: `📰 ${n.title}\n\n${n.summary}\n\nRead more 👉 ${link}` });
  }
  // Instagram gets its own tagged link so its visits aren't counted as Facebook's.
  return out.map((o) => {
    const linkIg = o.link.replace('utm_source=facebook', 'utm_source=instagram');
    return { ...o, linkIg, captionIg: o.caption.split(o.link).join(linkIg) };
  });
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const sites = await Promise.all(hubSites(env).map(async (s) => ({ slug: s.slug, name: s.name, domain: s.domain, ...(await stateOf(env, s.slug)), ideas: await ideas(s) })));
  return json({ ok: true, steps: SOCIAL_STEPS, sites });
};

// { site, step, done } ticks a checklist step; { site, facebook, instagram } saves the links.
export const onRequestPost: PagesFunction<Env> = async (context) => {
  const env = context.env;
  const body = await jsonBody(context.request);
  const site = hubSites(env).find((s) => s.slug === body?.site);
  if (!body || !site) return json({ ok: false, error: 'Unknown site.' }, 400);
  const st = await stateOf(env, site.slug);
  if (typeof body.step === 'number') {
    if (!Number.isInteger(body.step) || body.step < 0 || body.step >= SOCIAL_STEPS.length) return json({ ok: false, error: 'Unknown step.' }, 400);
    st.steps[body.step] = !!body.done;
    if (body.done) await logActivity(env.ADMIN_DB, String(context.data.email), site.slug, 'social_step_done', SOCIAL_STEPS[body.step]);
  }
  for (const [k, re] of [
    ['facebook', /^https:\/\/(www\.|m\.)?facebook\.com\/[\w./?=-]+$/],
    ['instagram', /^https:\/\/(www\.)?instagram\.com\/[\w.]+\/?$/],
  ] as const) {
    if (k in body) {
      const v = str(body[k], 200);
      if (v && !re.test(v)) return json({ ok: false, error: `That doesn’t look like a ${k === 'facebook' ? 'Facebook Page' : 'Instagram profile'} link.` }, 400);
      st[k] = v || null;
    }
  }
  await setSetting(env.ADMIN_DB, `social:${site.slug}`, JSON.stringify(st));
  return json({ ok: true, ...st });
};
