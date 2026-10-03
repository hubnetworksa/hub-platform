import { rows, type HubSite } from './sites';

// Listing quality for one city: how complete the published listings are,
// likely duplicates, stale listings and thin pages. Built from a few reads of
// the city database, so the Listings screen keeps one copy per city per day
// (reports 'quality:<slug>') instead of re-reading on every visit.

interface Biz {
  id: number;
  slug: string;
  name: string;
  suburb: string | null;
  phone: string | null;
  whatsapp: string | null;
  hours: string | null;
  website: string | null;
  address: string | null;
  lat: number | null;
  lng: number | null;
  dl: number;
  updated_at: string | null;
  verified_at: string | null;
  created_at: string;
  tier: number;
  owned: number;
  cats: number;
}

export interface Listing {
  slug: string;
  name: string;
  suburb: string | null;
  detail?: string;
}

const SHORT_DESC = 160;
const STALE_DAYS = 180;

const digits = (p: string | null) => {
  let d = (p ?? '').replace(/\D/g, '');
  if (d.startsWith('27') && d.length === 11) d = `0${d.slice(2)}`;
  return d.length >= 9 ? d : '';
};
const domainOf = (w: string | null) => {
  try {
    return w ? new URL(/^https?:\/\//i.test(w) ? w : `https://${w}`).hostname.replace(/^www\./, '').toLowerCase() : '';
  } catch {
    return '';
  }
};
// Big chains share one website (and sometimes one call centre); those aren't duplicates.
const SHARED_DOMAINS = /(^|\.)(facebook\.com|instagram\.com|google\.com|wa\.me|linktr\.ee|business\.site|yoco\.com|gov\.za)$/;

export async function qualityReport(site: HubSite) {
  const list = await rows<Biz>(
    site.db,
    `SELECT b.id, b.slug, b.name, s.name AS suburb, b.phone, b.whatsapp, b.hours, b.website, b.address, b.lat, b.lng,
            length(COALESCE(b.description, '')) AS dl, b.updated_at, b.verified_at, b.created_at,
            COALESCE(b.subscription_tier, 0) AS tier, (b.owner_user_id IS NOT NULL) AS owned,
            (SELECT COUNT(*) FROM business_categories bc WHERE bc.business_id = b.id) AS cats
     FROM businesses b LEFT JOIN suburbs s ON s.id = b.suburb_id
     WHERE b.status = 'published' AND b.closed_at IS NULL AND b.is_test = 0`
  );
  const views = new Map(
    (
      await rows<{ business_id: number; n: number }>(
        site.db,
        `SELECT business_id, COUNT(*) AS n FROM business_stats WHERE event = 'view' AND created_at > datetime('now', '-90 days') GROUP BY business_id`
      )
    ).map((r) => [r.business_id, r.n])
  );
  const L = (b: Biz, detail?: string): Listing => ({ slug: b.slug, name: b.name, suburb: b.suburb, ...(detail ? { detail } : {}) });
  const total = list.length;

  const checks: { key: string; label: string; why: string; list: Biz[] }[] = [
    { key: 'phone', label: 'No phone or WhatsApp', why: 'People can’t call; Google ranks listings without a phone lower.', list: list.filter((b) => !digits(b.phone) && !digits(b.whatsapp)) },
    { key: 'hours', label: 'No opening hours', why: 'Hours are one of the most-looked-at details.', list: list.filter((b) => !b.hours || b.hours.trim().length < 3) },
    { key: 'description', label: `Description under ${SHORT_DESC} characters`, why: 'Short pages are often left out of Google (thin content).', list: list.filter((b) => b.dl < SHORT_DESC) },
    { key: 'location', label: 'No map location', why: 'They don’t show on maps or “near me” results.', list: list.filter((b) => b.lat == null || b.lng == null) },
    { key: 'address', label: 'No street address', why: 'Visitors can’t find them.', list: list.filter((b) => !b.address || b.address.trim().length < 5) },
    { key: 'category', label: 'No category', why: 'They don’t appear on any category page.', list: list.filter((b) => !b.cats) },
  ];
  // Completeness: the share of these six that each listing has, averaged.
  const missing = new Map<number, number>();
  for (const c of checks) for (const b of c.list) missing.set(b.id, (missing.get(b.id) ?? 0) + 1);
  const score = total ? Math.round((1 - [...missing.values()].reduce((a, n) => a + n, 0) / (total * checks.length)) * 100) : 100;
  const complete = list.filter((b) => !missing.has(b.id)).length;

  // Duplicates: same phone, same website (not a shared/chain domain), or same name in the same suburb.
  const groups: { reason: string; key: string; listings: Listing[] }[] = [];
  const groupBy = (reason: string, keyOf: (b: Biz) => string) => {
    const m = new Map<string, Biz[]>();
    for (const b of list) {
      const k = keyOf(b);
      if (k) m.set(k, [...(m.get(k) ?? []), b]);
    }
    for (const [k, bs] of m) if (bs.length > 1 && bs.length <= 6) groups.push({ reason, key: k, listings: bs.map((b) => L(b)) });
  };
  groupBy('Same phone number', (b) => digits(b.phone));
  groupBy('Same website', (b) => {
    const d = domainOf(b.website);
    return d && !SHARED_DOMAINS.test(d) ? d : '';
  });
  groupBy('Same name in the same suburb', (b) => (b.suburb ? `${b.name.toLowerCase().replace(/[^a-z0-9]+/g, ' ').trim()}|${b.suburb}` : ''));
  // A pair found by two reasons is shown once (the first reason).
  const seen = new Set<string>();
  const dupes = groups.filter((g) => {
    const id = g.listings.map((l) => l.slug).sort().join(',');
    if (seen.has(id)) return false;
    seen.add(id);
    return true;
  });

  const ageDays = (t: string | null) => (t ? (Date.now() - new Date(`${t.replace(' ', 'T')}${t.includes('Z') ? '' : 'Z'}`).getTime()) / 86400000 : Infinity);
  const stale = list
    .filter((b) => Math.min(ageDays(b.updated_at), ageDays(b.verified_at), ageDays(b.created_at)) > STALE_DAYS)
    .sort((a, b) => (a.updated_at ?? '').localeCompare(b.updated_at ?? ''));
  const noViews = list.filter((b) => !views.get(b.id) && ageDays(b.created_at) > 90);

  const combos = await rows<{ cat: string; cname: string; sub: string; sname: string; n: number }>(
    site.db,
    `SELECT c.slug AS cat, c.name AS cname, s.slug AS sub, s.name AS sname, COUNT(*) AS n
     FROM businesses b JOIN business_categories bc ON bc.business_id = b.id JOIN categories c ON c.id = bc.category_id JOIN suburbs s ON s.id = b.suburb_id
     WHERE b.status = 'published' AND b.closed_at IS NULL AND b.is_test = 0
     GROUP BY c.id, s.id`
  );
  const thin = combos.filter((c) => c.n <= 2).sort((a, b) => a.n - b.n || a.cname.localeCompare(b.cname));

  return {
    site: site.slug,
    total,
    score,
    complete,
    checks: checks.map((c) => ({ key: c.key, label: c.label, why: c.why, count: c.list.length, listings: c.list.slice(0, 150).map((b) => L(b)) })),
    duplicates: { count: dupes.length, groups: dupes.slice(0, 150) },
    stale: { days: STALE_DAYS, count: stale.length, listings: stale.slice(0, 150).map((b) => L(b, b.updated_at ? `last updated ${b.updated_at.slice(0, 10)}` : 'never updated')) },
    no_views: { count: noViews.length, listings: noViews.slice(0, 150).map((b) => L(b, b.tier ? 'paid plan' : undefined)) },
    thin: { pages: combos.length, count: thin.length, list: thin.slice(0, 200).map((c) => ({ path: `/category/${c.cat}/${c.sub}/`, label: `${c.cname} in ${c.sname}`, n: c.n })) },
  };
}
