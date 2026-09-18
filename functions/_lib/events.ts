// Shared by the admin CRUD endpoint and the weekly discovery agent —
// mirrors the mockup's own SEED_EVENTS shape (Hub Redesign.dc.html) as
// closely as the real D1 schema allows.

export const EVENT_TYPES = ['Music', 'Market', 'Sport', 'Theatre', 'Food & Drink', 'Family', 'Other'] as const;
export type EventType = (typeof EVENT_TYPES)[number];

export function isEventType(v: unknown): v is EventType {
  return typeof v === 'string' && (EVENT_TYPES as readonly string[]).includes(v);
}

export interface EventTier {
  name: string;
  price: string;
  note?: string;
  url: string;
}

export interface EventLineupItem {
  name: string;
  role: string;
  time: string;
}

// Titles collide often enough (two different years' editions of the same
// market) that title-only isn't a safe unique key — the date makes it one.
export function eventSlug(title: string, date: string): string {
  const base = title
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
    .slice(0, 60);
  return `${base}-${date}`;
}

export function parseJsonArray<T>(raw: string | null): T[] {
  if (!raw) return [];
  try {
    const parsed = JSON.parse(raw);
    return Array.isArray(parsed) ? parsed : [];
  } catch {
    return [];
  }
}
