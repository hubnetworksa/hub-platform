// Browser-side state + helpers shared by the four "Add your business" pages
// (/list-your-business/, /contact/, /review/, /checkout/). Bundled into each
// page's client script by Astro/Vite; must not import anything server-only.
//
// State lives in sessionStorage (tab-scoped, cleared when the tab closes).
// Nothing secret is kept: the draft is what the owner typed, and the result
// is the review link + PayFast redirect the server already handed to this
// browser.

export const DRAFT_KEY = 'hub_listing_draft_v1';
export const RESULT_KEY = 'hub_listing_result_v1';

export const DAYS = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'] as const;

export interface DayHours {
  open: string;
  close: string;
  closed: boolean;
}

export interface Draft {
  // step 1
  name: string;
  category: string;
  suburb: string;
  description: string;
  phone: string;
  email: string;
  tier: number;
  company_url: string; // honeypot — always empty for real users
  loadedAt: number;
  // step 2
  street: string;
  postal: string;
  centre: string;
  website: string;
  hours: DayHours[];
}

export interface FlowPlanData {
  tier: number;
  name: string;
  price: string;
  amount: string;
  note: string;
  summary: string;
}

export interface SubmitResult {
  name: string;
  tier: number;
  redirectUrl: string;
}

export function emptyDraft(): Draft {
  return {
    name: '',
    category: '',
    suburb: '',
    description: '',
    phone: '',
    email: '',
    tier: 0,
    company_url: '',
    loadedAt: Date.now(),
    street: '',
    postal: '',
    centre: '',
    website: '',
    hours: DAYS.map(() => ({ open: '', close: '', closed: false })),
  };
}

function readJson<T>(key: string): T | null {
  try {
    const raw = sessionStorage.getItem(key);
    return raw ? (JSON.parse(raw) as T) : null;
  } catch {
    return null;
  }
}

function writeJson(key: string, value: unknown): void {
  try {
    sessionStorage.setItem(key, JSON.stringify(value));
  } catch {
    /* storage blocked — the flow still works within a page, just not across reloads */
  }
}

export function loadDraft(): Draft {
  const base = emptyDraft();
  const stored = readJson<Partial<Draft>>(DRAFT_KEY);
  if (!stored) return base;
  const merged: Draft = { ...base, ...stored };
  if (!Array.isArray(merged.hours) || merged.hours.length !== DAYS.length) merged.hours = base.hours;
  if (!merged.loadedAt) merged.loadedAt = base.loadedAt;
  return merged;
}

export function saveDraft(patch: Partial<Draft>): Draft {
  const next = { ...loadDraft(), ...patch };
  writeJson(DRAFT_KEY, next);
  return next;
}

export function clearDraft(): void {
  try {
    sessionStorage.removeItem(DRAFT_KEY);
  } catch {
    /* ignore */
  }
}

export function loadResult(): SubmitResult | null {
  const r = readJson<SubmitResult>(RESULT_KEY);
  return r && typeof r.redirectUrl === 'string' && r.redirectUrl ? r : null;
}

export function saveResult(result: SubmitResult): void {
  writeJson(RESULT_KEY, result);
}

export function clearResult(): void {
  try {
    sessionStorage.removeItem(RESULT_KEY);
  } catch {
    /* ignore */
  }
}

/** True once the owner has finished step 1 (the minimum the server needs). */
export function draftHasBasics(d: Draft): boolean {
  return !!(d.name && d.category && d.suburb);
}

/** Street + postal code as one address string (the server has a single address column). */
export function buildAddress(d: Draft): string {
  return [d.street.trim(), d.postal.trim()].filter(Boolean).join(', ');
}

/**
 * "Mon–Fri 07:00–17:00, Sat 07:00–13:00, Sun Closed". Consecutive days with
 * identical hours are grouped; days left blank are skipped. '' if none set.
 */
export function formatHours(hours: DayHours[]): string {
  const label = (h: DayHours): string | null => {
    if (h.closed) return 'Closed';
    if (h.open && h.close) return `${h.open}–${h.close}`;
    return null;
  };
  const groups: { from: number; to: number; text: string }[] = [];
  hours.forEach((h, i) => {
    const text = label(h);
    if (!text) return;
    const last = groups[groups.length - 1];
    if (last && last.to === i - 1 && last.text === text) last.to = i;
    else groups.push({ from: i, to: i, text });
  });
  return groups
    .map((g) => {
      const days = g.from === g.to ? DAYS[g.from] : `${DAYS[g.from]}–${DAYS[g.to]}`;
      return `${days} ${g.text}`;
    })
    .join(', ');
}

export function readPlans(el: HTMLElement): FlowPlanData[] {
  try {
    return JSON.parse(el.dataset.plans || '[]') as FlowPlanData[];
  } catch {
    return [];
  }
}

export function readMap(el: HTMLElement, attr: string): Record<string, string> {
  try {
    return JSON.parse(el.getAttribute(attr) || '{}') as Record<string, string>;
  } catch {
    return {};
  }
}
