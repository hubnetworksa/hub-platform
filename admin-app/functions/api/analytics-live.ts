import type { PagesFunction } from '@cloudflare/workers-types';
import { selectSites, rows, json, type Env, type HubSite } from '../_lib/sites';
import { readReport, writeReport } from '../_lib/alerts';
import { getAccessToken } from '../_lib/google-token';
import { firstPartySince } from './stats';

// GET /api/analytics-live?site=<slug>&fresh=1
// The "Right now" card: live visitors from GA4 (realtime + today), what the
// sites counted themselves since local midnight, and the latest uptime check.
// Each site's result is cached 60 s in the reports table (kind realtime:<slug>).
// GA failures (including missing credentials) leave live/today null and add an
// `error`; the first-party and uptime parts still come back.
// Signed-in only: _middleware.ts gates every /api/* route not in PUBLIC_API.

const TTL_MS = 60_000;
const LOCAL_MIDNIGHT = `datetime(date('now','+2 hours'),'-2 hours')`; // South Africa, UTC+2

interface GaRow {
  dimensionValues?: { value: string }[];
  metricValues?: { value: string }[];
}
interface GaResponse {
  rows?: GaRow[];
  error?: { code?: number; message?: string };
}

async function ga(token: string, propertyId: string, method: 'runRealtimeReport' | 'runReport', body: unknown): Promise<GaResponse> {
  for (let attempt = 0; ; attempt++) {
    const res = await fetch(`https://analyticsdata.googleapis.com/v1beta/properties/${propertyId}:${method}`, {
      method: 'POST',
      headers: { Authorization: `Bearer ${token}`, 'Content-Type': 'application/json' },
      body: JSON.stringify(body),
    });
    const j = (await res.json().catch(() => ({}))) as GaResponse;
    if (res.status >= 500 && attempt < 1) continue;
    if (!res.ok) throw new Error(`Google Analytics ${res.status}: ${String(j.error?.message ?? 'error').slice(0, 120)}`);
    return j;
  }
}

const n = (r: GaRow | undefined, i = 0) => Number(r?.metricValues?.[i]?.value ?? 0) || 0;
const AU = [{ name: 'activeUsers' }];

interface Live {
  activeUsers: number;
  byMinute: number[];
  pages: { name: string; users: number }[];
  devices: { name: string; users: number }[];
}
interface Today {
  sessions: number;
  views: number;
  users: number;
}

async function liveParts(token: string, id: string): Promise<{ live: Live; today: Today }> {
  const [total, pages, devices, minutes, today] = await Promise.all([
    ga(token, id, 'runRealtimeReport', { metrics: AU }),
    ga(token, id, 'runRealtimeReport', { dimensions: [{ name: 'unifiedScreenName' }], metrics: AU, limit: 8, orderBys: [{ metric: { metricName: 'activeUsers' }, desc: true }] }),
    ga(token, id, 'runRealtimeReport', { dimensions: [{ name: 'deviceCategory' }], metrics: AU }),
    ga(token, id, 'runRealtimeReport', { dimensions: [{ name: 'minutesAgo' }], metrics: AU, minuteRanges: [{ startMinutesAgo: 29, endMinutesAgo: 0 }] }),
    ga(token, id, 'runReport', { dateRanges: [{ startDate: 'today', endDate: 'today' }], metrics: [{ name: 'sessions' }, { name: 'screenPageViews' }, { name: 'activeUsers' }] }),
  ]);
  const byMinute = new Array<number>(30).fill(0); // oldest -> newest
  for (const r of minutes.rows ?? []) {
    const ago = Number(r.dimensionValues?.[0]?.value);
    if (ago >= 0 && ago < 30) byMinute[29 - ago] = n(r);
  }
  const t = today.rows?.[0];
  return {
    live: {
      activeUsers: n(total.rows?.[0]),
      byMinute,
      pages: (pages.rows ?? []).map((r) => ({ name: r.dimensionValues?.[0]?.value ?? '', users: n(r) })),
      devices: (devices.rows ?? []).map((r) => ({ name: r.dimensionValues?.[0]?.value ?? '', users: n(r) })),
    },
    today: { sessions: n(t, 0), views: n(t, 1), users: n(t, 2) },
  };
}

async function siteResult(env: Env, site: HubSite) {
  const [fp, up] = await Promise.all([
    firstPartySince(site.db, LOCAL_MIDNIGHT),
    rows<{ ok: number; ms: number; checked_at: string }>(env.ADMIN_DB, `SELECT ok, ms, checked_at FROM health_checks WHERE site = ? ORDER BY checked_at DESC LIMIT 1`, site.slug),
  ]);
  let live: Live | null = null;
  let today: Today | null = null;
  let error: string | undefined;
  if (!site.gaPropertyId) error = 'No Google Analytics property for this site';
  else {
    try {
      const token = await getAccessToken(env);
      ({ live, today } = await liveParts(token, site.gaPropertyId));
    } catch (e) {
      error = e instanceof Error ? e.message : 'Google Analytics error';
    }
  }
  const taps = fp.contacts.phone + fp.contacts.whatsapp + fp.contacts.website;
  return {
    slug: site.slug,
    name: site.city,
    live,
    today,
    firstParty: { views: fp.views, taps, phone: fp.contacts.phone, whatsapp: fp.contacts.whatsapp, website: fp.contacts.website, enquiries: fp.enquiries, searches: fp.searches },
    up: up[0] ? { ok: !!up[0].ok, ms: up[0].ms, checkedAt: up[0].checked_at } : null,
    ...(error ? { error } : {}),
  };
}

export const onRequestGet: PagesFunction<Env> = async (context) => {
  const url = new URL(context.request.url);
  const sites = selectSites(context.env, url.searchParams.get('site'));
  if (!sites.length) return json({ ok: false, error: 'Unknown site.' }, 400);
  const fresh = url.searchParams.get('fresh') === '1';
  const db = context.env.ADMIN_DB;

  const results = await Promise.all(
    sites.map(async (site) => {
      const kind = `realtime:${site.slug}`;
      if (!fresh) {
        try {
          const hit = await readReport<Awaited<ReturnType<typeof siteResult>>>(db, kind);
          // updated_at is a UTC SQLite datetime without a zone marker.
          if (hit && Date.now() - Date.parse(hit.updated_at.replace(' ', 'T') + 'Z') < TTL_MS) return hit.data;
        } catch {
          /* unreadable cache: recompute */
        }
      }
      const r = await siteResult(context.env, site);
      try {
        await writeReport(db, kind, r);
      } catch {
        /* caching is best-effort */
      }
      return r;
    })
  );
  return json({ ok: true, generatedAt: new Date().toISOString(), sites: results });
};
