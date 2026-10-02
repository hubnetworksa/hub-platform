// Search-intent <title> / meta description for business pages. Search
// Console shows people search "<store> <mall or suburb>" and "<store> trading
// hours", so the title leads with exactly that and the description with the
// facts the page shows (where it is, its hours, its phone number). Metadata
// only: nothing here renders inside the page body.

import { hoursCompact } from './openNow';
import { formatPhoneZA } from './phone';

const MAX_TITLE = 65;
const MAX_DESCRIPTION = 160;

function words(s: string): string[] {
  return s.trim().split(/\s+/).filter(Boolean);
}

function norm(w: string): string {
  return w.toLowerCase().replace(/[^a-z0-9]/g, '');
}

/** "Checkers Westgate" + "Westgate Mall" -> "Checkers Westgate Mall";
 *  "Pick n Pay Mall of the North" + "Mall of the North" -> unchanged;
 *  "Woolworths" + "The Greenery" -> "Woolworths The Greenery". */
export function nameWithPlace(name: string, place: string | null | undefined): string {
  if (!place) return name;
  const n = words(name);
  let p = words(place);
  const nn = n.map(norm).join(' ');
  const bare = /^the$/i.test(p[0] ?? '') && p.length > 1 ? p.slice(1) : p;
  // Place already in the name (ignoring a leading "The").
  if (` ${nn} `.includes(` ${bare.map(norm).join(' ')} `)) return name;
  // Name ends with the start of the place: merge the overlap.
  for (const cand of [p, bare]) {
    for (let k = Math.min(n.length - 1, cand.length); k > 0; k--) {
      const tail = n.slice(-k).map(norm).join(' ');
      const head = cand.slice(0, k).map(norm).join(' ');
      if (tail === head) return [...n, ...cand.slice(k)].join(' ');
    }
  }
  return `${name} ${place}`;
}

function joinList(items: string[]): string {
  if (items.length <= 1) return items.join('');
  return `${items.slice(0, -1).join(', ')} & ${items[items.length - 1]}`;
}

export interface BusinessMetaInput {
  name: string;
  hours: string | null | undefined;
  phone: string | null | undefined;
  address: string | null | undefined;
  hasDirections: boolean;
  centreName?: string | null;
  suburbName?: string | null;
  cityLabel: string;
  siteName: string;
  /** The owner's short description (or description) as plain text. */
  summary?: string | null;
}

/** How many businesses on this site share each title, computed once per
 *  build (every business page asks for the same map). */
const titleCounts = new Map<string, Map<string, number>>();
export function titleIsShared(title: string, allTitles: () => string[], key = 'plain'): boolean {
  let counts = titleCounts.get(key);
  if (!counts) {
    counts = new Map();
    for (const t of allTitles()) counts.set(t, (counts.get(t) ?? 0) + 1);
    titleCounts.set(key, counts);
  }
  return (counts.get(title) ?? 0) > 1;
}

/** qualifier: only for the rare listings whose plain title collides with
 *  another listing's (the same store listed twice), e.g. the category. */
export function businessTitle(b: BusinessMetaInput, qualifier?: string): string {
  // The centre is the search key ("<store> <mall>"), so it always stays; a
  // suburb is dropped when it would make an already long name unwieldy.
  let place = nameWithPlace(b.name, b.centreName || b.suburbName || null);
  if (!b.centreName && place.length > 50) place = b.name;
  const head = qualifier ? `${place} (${qualifier})` : place;
  const hasHours = !!b.hours?.trim();
  const facts = hasHours
    ? ['Trading Hours', b.phone ? 'Phone' : '', b.hasDirections ? 'Directions' : ''].filter(Boolean)
    : [b.phone ? 'Phone' : '', b.address ? 'Address' : '', b.hasDirections ? 'Directions' : ''].filter(Boolean);
  if (facts.length === 0) facts.push('Contact Details');
  const full = joinList(facts);
  const short = joinList(facts.slice(0, 2));
  const candidates = [
    `${head} – ${full} | ${b.siteName}`,
    `${head} – ${full}`,
    `${head} – ${short}`,
    `${head} – ${facts[0]}`,
  ];
  return candidates.find((c) => c.length <= MAX_TITLE) ?? (candidates[candidates.length - 1].length <= 72 ? candidates[candidates.length - 1] : head);
}

function clip(text: string, max: number): string {
  if (text.length <= max) return text;
  const cut = text.slice(0, max - 1);
  const sp = cut.lastIndexOf(' ');
  return `${(sp > max * 0.5 ? cut.slice(0, sp) : cut).replace(/[\s,.;:–-]+$/, '')}…`;
}

export function businessDescription(b: BusinessMetaInput): string {
  const centreInName = !!b.centreName && nameWithPlace(b.name, b.centreName) === b.name;
  const where = b.centreName
    ? `${b.name}${centreInName ? '' : ` at ${b.centreName}`}${b.suburbName ? `, ${b.suburbName}` : ''}.`
    : `${b.name}${b.suburbName ? ` in ${b.suburbName}` : ''}, ${b.cityLabel}.`;
  const facts: string[] = [];
  const raw = b.hours?.trim() ?? '';
  const compact = hoursCompact(raw);
  if (compact) facts.push(compact);
  else if (raw && raw.length <= 60 && !raw.includes('\n')) facts.push(`Hours: ${raw}`);
  const phone = formatPhoneZA(b.phone).split(' / ')[0];
  if (phone) facts.push(`Phone ${phone}`);
  let out = facts.length ? `${where} ${facts.join(' · ')}.` : where;
  const summary = (b.summary ?? '').trim();
  const room = MAX_DESCRIPTION - out.length - 1;
  const generic = `Trading hours, directions and contact details on ${b.siteName}.`;
  if (summary && room >= 40) out += ` ${clip(summary, room)}`;
  else if (generic.length <= room) out += ` ${generic}`;
  else if (`Directions on ${b.siteName}.`.length <= room) out += ` Directions on ${b.siteName}.`;
  return out;
}
