// Live weather for the homepage's "<city> today" card (and anything else that
// wants a weather chip). Thin, cached proxy over MET Norway's Locationforecast
// (free, keyless, CC BY 4.0 — attribution shown on the page) so browsers don't
// each hit api.met.no directly (their terms require an identifying User-Agent,
// which a browser can't set) and so the whole site shares one upstream fetch
// per city per 30 minutes.
//
// GET /api/weather?lat=-33.92&lon=18.42
//   -> { ok: true, now: { temp, cond, icon }, today: { high, low }, days: [{ day, high, low, icon }] }
//   `icon` is one of 'sun' | 'cloud' | 'rain'.

import type { PagesFunction } from '@cloudflare/workers-types';

const SA_BOUNDS ={ latMin: -35.5, latMax: -21.5, lonMin: 16, lonMax: 33.5 };

interface MetEntry {
  time: string;
  data: {
    instant: { details: { air_temperature: number } };
    next_1_hours?: { summary: { symbol_code: string } };
    next_6_hours?: { summary: { symbol_code: string } };
    next_12_hours?: { summary: { symbol_code: string } };
  };
}

function json(body: unknown, status = 200, cache = 'public, max-age=900'): Response {
  return new Response(JSON.stringify(body), { status, headers: { 'Content-Type': 'application/json', 'Cache-Control': cache } });
}

function iconFor(symbol: string): 'sun' | 'cloud' | 'rain' {
  if (/rain|shower|sleet|drizzle|thunder/.test(symbol)) return 'rain';
  if (/^(clearsky|fair)/.test(symbol)) return 'sun';
  return 'cloud';
}

function condFor(symbol: string): string {
  if (symbol.includes('thunder')) return 'Thunderstorms';
  if (symbol.includes('snow')) return 'Snow';
  if (symbol.includes('sleet')) return 'Sleet';
  if (symbol.includes('shower')) return 'Showers';
  if (symbol.includes('rain')) return 'Rain';
  if (symbol.startsWith('clearsky')) return 'Clear';
  if (symbol.startsWith('fair')) return 'Mostly clear';
  if (symbol.startsWith('partlycloudy')) return 'Partly cloudy';
  if (symbol.startsWith('fog')) return 'Fog';
  return 'Cloudy';
}

const DAY_NAMES = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
const SAST_OFFSET_MS = 2 * 60 * 60 * 1000;

export const onRequestGet: PagesFunction = async (context) => {
  const url = new URL(context.request.url);
  const lat = Number(url.searchParams.get('lat'));
  const lon = Number(url.searchParams.get('lon'));
  if (!Number.isFinite(lat) || !Number.isFinite(lon) || lat < SA_BOUNDS.latMin || lat > SA_BOUNDS.latMax || lon < SA_BOUNDS.lonMin || lon > SA_BOUNDS.lonMax) {
    return json({ ok: false, error: 'Coordinates must be within South Africa.' }, 400, 'no-store');
  }
  // Two decimals (~1km) — plenty for a city forecast, and it keeps the cache key tight.
  const qLat = lat.toFixed(2);
  const qLon = lon.toFixed(2);

  const cache = (caches as unknown as { default: Cache }).default;
  const cacheKey = new Request(`https://weather.cache.invalid/${qLat}/${qLon}`);
  const hit = await cache.match(cacheKey);
  if (hit) return hit;

  let series: MetEntry[];
  try {
    const res = await fetch(`https://api.met.no/weatherapi/locationforecast/2.0/compact?lat=${qLat}&lon=${qLon}`, {
      headers: { 'User-Agent': `${url.hostname}-directory/1.0 (+https://${url.hostname}/)` },
    });
    if (!res.ok) return json({ ok: false, error: 'Weather unavailable.' }, 502, 'no-store');
    const body = (await res.json()) as { properties?: { timeseries?: MetEntry[] } };
    series = body.properties?.timeseries ?? [];
  } catch {
    return json({ ok: false, error: 'Weather unavailable.' }, 502, 'no-store');
  }
  if (series.length === 0) return json({ ok: false, error: 'Weather unavailable.' }, 502, 'no-store');

  const first = series[0];
  const nowSymbol = first.data.next_1_hours?.summary.symbol_code ?? first.data.next_6_hours?.summary.symbol_code ?? 'cloudy';

  // Group by South African calendar day (SAST is a fixed UTC+2, no DST).
  const byDay = new Map<string, MetEntry[]>();
  for (const e of series) {
    const local = new Date(new Date(e.time).getTime() + SAST_OFFSET_MS);
    const key = local.toISOString().slice(0, 10);
    if (!byDay.has(key)) byDay.set(key, []);
    byDay.get(key)!.push(e);
  }

  const days = [...byDay.entries()].slice(0, 5).map(([key, entries]) => {
    const temps = entries.map((e) => e.data.instant.details.air_temperature);
    // Representative symbol: the entry nearest local midday that carries a forecast summary.
    const withSymbol = entries
      .map((e) => ({ e, symbol: e.data.next_6_hours?.summary.symbol_code ?? e.data.next_12_hours?.summary.symbol_code ?? e.data.next_1_hours?.summary.symbol_code }))
      .filter((x): x is { e: MetEntry; symbol: string } => Boolean(x.symbol));
    const localHour = (e: MetEntry) => new Date(new Date(e.time).getTime() + SAST_OFFSET_MS).getUTCHours();
    withSymbol.sort((a, b) => Math.abs(localHour(a.e) - 12) - Math.abs(localHour(b.e) - 12));
    return {
      day: DAY_NAMES[new Date(`${key}T12:00:00Z`).getUTCDay()],
      high: Math.round(Math.max(...temps)),
      low: Math.round(Math.min(...temps)),
      icon: iconFor(withSymbol[0]?.symbol ?? nowSymbol),
    };
  });

  const response = json({
    ok: true,
    now: { temp: Math.round(first.data.instant.details.air_temperature), cond: condFor(nowSymbol), icon: iconFor(nowSymbol) },
    today: { high: days[0]?.high, low: days[0]?.low },
    days,
  }, 200, 'public, max-age=1800');
  context.waitUntil(cache.put(cacheKey, response.clone()));
  return response;
};
