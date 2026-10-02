// Best-effort "open now" from a business's free-text trading hours (the
// `hours` column is whatever the owner/importer typed, e.g.
// "Mon-Fri 08:00-17:00, Sat 09:00-13:00, Sun Closed"). We only ever claim
// open/closed when the WHOLE string parses cleanly; anything odd (seasonal
// schedules, "late", free prose) returns null so the UI says nothing rather
// than guessing. Runs client-side (the current time is only known there) and
// always evaluates in South African time, whatever the visitor's timezone.

export interface OpenStatus {
  open: boolean;
  /** Open: when the current session ends ("17:00"). */
  closesAt?: string;
  /** Closed: when it next opens ("07:00" if later today, else "Mon 07:00"). */
  opensAt?: string;
}

type Interval = [number, number]; // minutes from 00:00; end may exceed 1440 for an overnight session
type Week = Interval[][]; // index 0 = Monday … 6 = Sunday

const DAY_INDEX: Record<string, number> = { mon: 0, tue: 1, wed: 2, thu: 3, fri: 4, sat: 5, sun: 6 };
const DAY_LABEL = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

const cache = new Map<string, Week | null>();

function dayNum(token: string): number | undefined {
  return DAY_INDEX[token.slice(0, 3).toLowerCase()];
}

function parseDays(spec: string): number[] | null {
  const s = spec.trim().toLowerCase();
  if (!s) return null;
  if (/^(daily|every ?day|7 days( a week)?)$/.test(s)) return [0, 1, 2, 3, 4, 5, 6];
  if (/^week ?days?$/.test(s)) return [0, 1, 2, 3, 4];
  if (/^week ?ends?$/.test(s)) return [5, 6];
  const out = new Set<number>();
  for (const part of s.split(/\s*(?:&|\band\b|\+)\s*/)) {
    const range = part.match(/^([a-z]+)\s*(?:-|–|—|to)\s*([a-z]+)$/);
    if (range) {
      const a = dayNum(range[1]);
      const b = dayNum(range[2]);
      if (a === undefined || b === undefined) return null;
      for (let d = a; ; d = (d + 1) % 7) {
        out.add(d);
        if (d === b) break;
      }
      continue;
    }
    if (!/^[a-z]+$/.test(part)) return null;
    const d = dayNum(part);
    if (d === undefined) return null;
    out.add(d);
  }
  return out.size ? [...out] : null;
}

const TIME = String.raw`(\d{1,2})(?:[:h.](\d{2}))?\s*(am|pm)?`;
const RANGE_RE = new RegExp(String.raw`^${TIME}\s*(?:-|–|—|to)\s*${TIME}$`, 'i');

function toMinutes(h: string, m: string | undefined, ap: string | undefined): number | null {
  let hour = Number(h);
  const min = m ? Number(m) : 0;
  if (min > 59) return null;
  if (ap) {
    if (hour < 1 || hour > 12) return null;
    hour = (hour % 12) + (ap.toLowerCase() === 'pm' ? 12 : 0);
  }
  if (hour > 24 || (hour === 24 && min > 0)) return null;
  return hour * 60 + min;
}

function parseRange(text: string): Interval | null {
  const m = text.trim().match(RANGE_RE);
  if (!m) return null;
  const b = toMinutes(m[4], m[5], m[6]);
  let a = toMinutes(m[1], m[2], m[3] ?? m[6]);
  if (a === null || b === null) return null;
  // "8-5pm": the opening time inherits the closing am/pm, unless that would
  // put it after closing ("8pm"), in which case it's the morning one.
  if (!m[3] && m[6] && a >= b) a = toMinutes(m[1], m[2], m[6].toLowerCase() === 'pm' ? 'am' : 'pm');
  if (a === null) return null;
  return [a, b <= a ? b + 1440 : b];
}

function parseWeek(hours: string): Week | null {
  const week: Week = [[], [], [], [], [], [], []];
  const segments = hours
    .split(/[,;\n]+/)
    .map((s) => s.trim().replace(/^open\s+/i, ''))
    .filter(Boolean);
  if (segments.length === 0) return null;
  let lastDays: number[] | null = null;
  let anyOpen = false;
  for (const seg of segments) {
    // Leading day spec (letters/spaces/dashes), then the rest.
    const m = seg.match(/^([A-Za-z][A-Za-z\s&+\-–—]*?)?\s*(closed|\d.*)$/i);
    if (!m) return null;
    let days: number[] | null;
    if (m[1] && m[1].trim()) {
      days = parseDays(m[1].replace(/\s*$/, ''));
      if (!days) return null;
      lastDays = days;
    } else {
      days = lastDays;
      if (!days) return null;
    }
    const rest = m[2].trim();
    if (/^closed$/i.test(rest)) continue;
    const ranges = rest.split(/\s*(?:&|\band\b)\s*/i).map(parseRange);
    if (ranges.some((r) => r === null)) return null;
    for (const d of days) for (const r of ranges) week[d].push(r as Interval);
    anyOpen = true;
  }
  return anyOpen ? week : null;
}

/** Current SA day (0 = Monday) and minutes since midnight. */
function saNow(now: Date): { day: number; minutes: number } {
  const parts = new Intl.DateTimeFormat('en-GB', {
    timeZone: 'Africa/Johannesburg',
    weekday: 'short',
    hour: '2-digit',
    minute: '2-digit',
    hourCycle: 'h23',
  }).formatToParts(now);
  const get = (t: string) => parts.find((p) => p.type === t)?.value ?? '';
  return { day: dayNum(get('weekday')) ?? 0, minutes: Number(get('hour')) * 60 + Number(get('minute')) };
}

function hhmm(mins: number): string {
  const m = ((mins % 1440) + 1440) % 1440;
  return `${String(Math.floor(m / 60)).padStart(2, '0')}:${String(m % 60).padStart(2, '0')}`;
}

const DAY_NAME = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

/** One line summing up a week's trading hours ("Open 7 days a week",
 *  "Open Monday to Saturday, closed Sunday"), or null when the hours don't
 *  parse cleanly — the same all-or-nothing rule as openStatus. */
export function hoursSummary(hours: string | null | undefined): string | null {
  if (!hours) return null;
  const week = parseWeek(hours);
  if (!week) return null;
  const open = week.map((d) => d.length > 0);
  const openCount = open.filter(Boolean).length;
  if (openCount === 7) return 'Open 7 days a week';
  const closedDays = DAY_NAME.filter((_, i) => !open[i]);
  const closed = closedDays.length > 1 ? `${closedDays.slice(0, -1).join(', ')} and ${closedDays[closedDays.length - 1]}` : closedDays[0];
  // A single run of open days (Monday to Friday, Monday to Saturday...).
  const first = open.indexOf(true);
  const last = open.lastIndexOf(true);
  if (openCount >= 2 && open.slice(first, last + 1).every(Boolean)) {
    return `Open ${DAY_NAME[first]} to ${DAY_NAME[last]}, closed ${closed}`;
  }
  return `Open ${openCount} day${openCount === 1 ? '' : 's'} a week, closed ${closed}`;
}

/** null = can't tell (unparseable or no hours). */
export function openStatus(hours: string | null | undefined, now: Date = new Date()): OpenStatus | null {
  if (!hours) return null;
  let week = cache.get(hours);
  if (week === undefined) {
    week = parseWeek(hours);
    cache.set(hours, week);
  }
  if (!week) return null;

  const { day, minutes } = saNow(now);
  const prev = (day + 6) % 7;

  // Overnight sessions that started yesterday.
  for (const [, e] of week[prev]) {
    if (e > 1440 && minutes < e - 1440) return { open: true, closesAt: hhmm(e) };
  }
  for (const [s, e] of week[day]) {
    if (minutes >= s && minutes < e) return { open: true, closesAt: hhmm(e) };
  }

  // Closed — find the next opening within the coming week.
  for (let offset = 0; offset < 8; offset++) {
    const d = (day + offset) % 7;
    const starts = week[d].map((r) => r[0]).filter((s) => offset > 0 || s > minutes).sort((a, b) => a - b);
    if (starts.length) return { open: false, opensAt: offset === 0 ? hhmm(starts[0]) : `${offset === 1 ? 'tomorrow' : DAY_LABEL[d]} ${hhmm(starts[0])}` };
  }
  return { open: false };
}

// ---- Static metadata helpers (titles, meta descriptions, JSON-LD). ----

const DAY_SCHEMA = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
const ALL_DAY_RE = /^(?:open\s+)?(?:24\s*(?:hours|hrs|h)(?:\s+a\s+day)?(?:,?\s*7\s+days(?:\s+a\s+week)?)?|24\/7)$/i;

/** Parsed week for static metadata, the same all-or-nothing parse as
 *  openStatus, plus a plain "Open 24 hours" / "24/7". Never used for the
 *  visible open-now badge, so that keeps its exact current behaviour. */
function metaWeek(hours: string | null | undefined): Week | null {
  const text = (hours ?? '').trim();
  if (!text) return null;
  if (ALL_DAY_RE.test(text)) return [0, 1, 2, 3, 4, 5, 6].map(() => [[0, 1440] as Interval]);
  return parseWeek(text);
}

/** Runs of consecutive days with identical sessions, Monday first. */
function dayGroups(week: Week): { days: number[]; ranges: Interval[] }[] {
  const key = (d: number) => week[d].map(([s, e]) => `${s}-${e}`).join(',');
  const groups: { days: number[]; ranges: Interval[] }[] = [];
  for (let d = 0; d < 7; d++) {
    if (week[d].length === 0) continue;
    const last = groups[groups.length - 1];
    if (last && last.days[last.days.length - 1] === d - 1 && key(last.days[0]) === key(d)) last.days.push(d);
    else groups.push({ days: [d], ranges: week[d] });
  }
  return groups;
}

/** Static one-line hours for a meta description, e.g.
 *  "Mon–Fri 08:00–17:00, Sat 08:00–13:00" or "Open 24 hours, 7 days".
 *  null when the hours don't parse cleanly. Not time-dependent. */
export function hoursCompact(hours: string | null | undefined): string | null {
  const week = metaWeek(hours);
  if (!week) return null;
  const groups = dayGroups(week);
  const fmt = ([s, e]: Interval) => `${hhmm(s)}–${e === 1440 ? '24:00' : hhmm(e)}`;
  if (groups.length === 1 && groups[0].days.length === 7) {
    const r = groups[0].ranges;
    if (r.length === 1 && r[0][0] === 0 && r[0][1] === 1440) return 'Open 24 hours, 7 days';
    return `Daily ${r.map(fmt).join(' & ')}`;
  }
  return groups
    .map((g) => {
      const label = g.days.length === 1 ? DAY_LABEL[g.days[0]] : `${DAY_LABEL[g.days[0]]}–${DAY_LABEL[g.days[g.days.length - 1]]}`;
      return `${label} ${g.ranges.map(fmt).join(' & ')}`;
    })
    .join(', ');
}

export interface OpeningHoursSpecification {
  '@type': 'OpeningHoursSpecification';
  dayOfWeek: string[];
  opens: string;
  closes: string;
}

/** schema.org openingHoursSpecification entries for the hours text, or null
 *  when it doesn't parse cleanly (never guessed). Closed days are omitted;
 *  an overnight session closes at the next day's clock time, and one ending
 *  at midnight closes at "23:59". */
export function openingHoursSpecification(hours: string | null | undefined): OpeningHoursSpecification[] | null {
  const week = metaWeek(hours);
  if (!week) return null;
  const out: OpeningHoursSpecification[] = [];
  const byRange = new Map<string, OpeningHoursSpecification>();
  for (let d = 0; d < 7; d++) {
    for (const [s, e] of week[d]) {
      const opens = hhmm(s);
      const closes = e === 1440 ? '23:59' : hhmm(e);
      const k = `${opens}-${closes}`;
      let spec = byRange.get(k);
      if (!spec) {
        spec = { '@type': 'OpeningHoursSpecification', dayOfWeek: [], opens, closes };
        byRange.set(k, spec);
        out.push(spec);
      }
      spec.dayOfWeek.push(DAY_SCHEMA[d]);
    }
  }
  return out.length ? out : null;
}
