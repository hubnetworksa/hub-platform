import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSessionUser, isAdminEmail } from '../../_lib/auth';
import { json } from '../../_lib/messages';
import { getSite } from '../../_lib/site';
import {
  MAX_SCORE,
  DEFAULT_MIN_SCORE,
  POINTS,
  SIGNAL_LABELS,
  scoreBusiness,
  missingSignals,
  indexDecision,
  type SignalKey,
} from '../../../src/lib/index-gate';

interface Env {
  DB: D1Database;
  SITE: string;
}

interface Row {
  id: number;
  slug: string;
  name: string;
  suburb: string | null;
  description: string | null;
  hours: string | null;
  phone: string | null;
  website: string | null;
  lat: number | null;
  lng: number | null;
  logo_key?: string | null;
  owner_user_id: number | null;
  subscription_tier: number | null;
  subscription_status: string | null;
  photoCount: number;
  approvedReviewCount: number;
}

const COLS = `b.id, b.slug, b.name, s.name AS suburb, b.description, b.hours, b.phone, b.website, b.lat, b.lng, __LOGO__ b.owner_user_id, b.subscription_tier, b.subscription_status`;
const WHERE = `b.status = 'published' AND b.closed_at IS NULL AND b.is_test = 0`;

function listingsSql(withLogo: boolean, withReviews: boolean): string {
  return `SELECT ${COLS.replace('__LOGO__', withLogo ? 'b.logo_key,' : '')},
       COALESCE(p.n, 0) AS photoCount, ${withReviews ? 'COALESCE(r.n, 0)' : '0'} AS approvedReviewCount
     FROM businesses b
     LEFT JOIN suburbs s ON s.id = b.suburb_id
     LEFT JOIN (SELECT business_id, COUNT(*) n FROM business_photos GROUP BY business_id) p ON p.business_id = b.id
     ${withReviews ? `LEFT JOIN (SELECT business_id, COUNT(*) n FROM reviews WHERE status = 'approved' GROUP BY business_id) r ON r.business_id = b.id` : ''}
     WHERE ${WHERE}`;
}

async function loadRows(db: D1Database): Promise<Row[]> {
  // Older city DBs may lack logo_key or the reviews table: retry without.
  const attempts: Array<[boolean, boolean]> = [[true, true], [false, true], [true, false], [false, false]];
  let lastErr: unknown;
  for (const [logo, reviews] of attempts) {
    try {
      const res = await db.prepare(listingsSql(logo, reviews)).all<Row>();
      return res.results ?? [];
    } catch (err) {
      lastErr = err;
    }
  }
  throw lastErr;
}

async function loadProtected(slug: string): Promise<{ set: Set<string>; source: 'github' | 'missing'; generatedAt: string | null }> {
  const missing = { set: new Set<string>(), source: 'missing' as const, generatedAt: null };
  try {
    const res = await fetch(
      `https://raw.githubusercontent.com/hubnetworksa/hub-platform/main/status/seo/pages-with-impressions.${slug}.json`,
      { cf: { cacheTtl: 3600 } } as RequestInit
    );
    if (!res.ok) return missing;
    const body = (await res.json()) as { generatedAt?: string; paths?: unknown };
    if (!body || !Array.isArray(body.paths)) return missing;
    const set = new Set<string>(body.paths.filter((p): p is string => typeof p === 'string'));
    return { set, source: 'github', generatedAt: typeof body.generatedAt === 'string' ? body.generatedAt : null };
  } catch {
    return missing;
  }
}

async function handle(context: Parameters<PagesFunction<Env>>[0]): Promise<Response> {
  const db = context.env.DB;
  const user = await getSessionUser(context.request, db);
  if (!user || !isAdminEmail(user.email)) return json({ ok: false }, 403);

  const site = getSite(context.env.SITE);

  let threshold = DEFAULT_MIN_SCORE;
  try {
    const row = await db.prepare(`SELECT value FROM site_settings WHERE key = 'index_min_score'`).first<{ value: string }>();
    const n = row ? Number.parseInt(String(row.value), 10) : NaN;
    if (Number.isInteger(n) && n >= 0 && n <= MAX_SCORE) threshold = n;
  } catch {
    // table missing: default
  }

  const prot = await loadProtected(site.slug);
  const listAvailable = prot.source === 'github';

  let rows: Row[];
  try {
    rows = await loadRows(db);
  } catch (err) {
    return json({ ok: false, error: String((err as Error)?.message ?? err) }, 500);
  }

  const keys = Object.keys(SIGNAL_LABELS) as SignalKey[];
  const missingCounts = new Map<SignalKey, number>(keys.map((k) => [k, 0]));
  const histogram = Array.from({ length: MAX_SCORE + 1 }, (_, score) => ({ score, total: 0, forced: 0 }));
  const almost: Array<{ slug: string; name: string; suburb: string; score: number; missing: SignalKey[] }> = [];
  let almostCount = 0;
  let indexed = 0;
  let protectedCount = 0;
  let paidCount = 0;

  for (const r of rows) {
    const res = scoreBusiness({
      name: r.name,
      description: r.description ?? undefined,
      hours: r.hours ?? undefined,
      phone: r.phone ?? undefined,
      website: r.website ?? undefined,
      lat: r.lat ?? undefined,
      lng: r.lng ?? undefined,
      logo_key: r.logo_key ?? undefined,
      photoCount: r.photoCount ?? 0,
      approvedReviewCount: r.approvedReviewCount ?? 0,
      owner_user_id: r.owner_user_id ?? undefined,
      subscription_tier: r.subscription_tier ?? undefined,
      subscription_status: r.subscription_status ?? undefined,
    });
    const isProtected = prot.set.has(`/business/${r.slug}/`);
    const decision = indexDecision({ score: res.score, threshold, protected: isProtected, paidOrClaimed: res.paidOrClaimed, listAvailable });
    const forced = isProtected || res.paidOrClaimed;
    if (isProtected) protectedCount++;
    if (res.paidOrClaimed) paidCount++;

    const bucket = histogram[Math.min(Math.max(res.score, 0), MAX_SCORE)];
    bucket.total++;
    if (forced) bucket.forced++;

    const missing = missingSignals(res.signals);
    if (decision === 'index') {
      indexed++;
    } else {
      for (const k of missing) missingCounts.set(k, (missingCounts.get(k) ?? 0) + 1);
    }
    if (!forced && res.score === threshold - 1) {
      almostCount++;
      almost.push({ slug: r.slug, name: r.name, suburb: r.suburb ?? '', score: res.score, missing });
    }
  }

  almost.sort((a, b) => a.name.localeCompare(b.name));

  const pointsFor = (k: SignalKey): number => (k === 'description' ? POINTS.descriptionLong : (POINTS as unknown as Record<string, number>)[k]);

  return json({
    ok: true,
    site: site.slug,
    generatedAt: new Date().toISOString(),
    threshold,
    max: MAX_SCORE,
    protectedList: { count: prot.set.size, source: prot.source, generatedAt: prot.generatedAt },
    totals: { listings: rows.length, indexed, noindex: rows.length - indexed, protected: protectedCount, paidOrClaimed: paidCount },
    histogram,
    missingSignals: keys
      .map((key) => ({ key, label: SIGNAL_LABELS[key], points: pointsFor(key), count: missingCounts.get(key) ?? 0 }))
      .sort((a, b) => b.count - a.count),
    almost: almost.slice(0, 50),
    almostCount,
  });
}

export const onRequestPost: PagesFunction<Env> = handle;
export const onRequestGet: PagesFunction<Env> = handle;
