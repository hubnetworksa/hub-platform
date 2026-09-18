import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { getSite } from '../../_lib/site';
import { eventSlug, isEventType, EVENT_TYPES } from '../../_lib/events';
import { logActivity } from '../../_lib/activity-log';
import { triggerRebuild } from '../../_lib/deploy-hook';

interface Env {
  DB: D1Database;
  SITE: string;
  CRON_SECRET?: string;
  ANTHROPIC_API_KEY?: string;
  PEXELS_API_KEY?: string;
  GITHUB_DISPATCH_TOKEN?: string;
}

// Called weekly by .github/workflows/event-discovery.yml (see that file for
// the cron schedule) — same CRON_SECRET-gated pattern as
// process-owner-reminders.ts/process-expired-subscriptions.ts, since there's
// no admin session here either.
//
// What this does, end to end:
//   1. Asks Claude (with its web-search tool) to find real, upcoming events
//      in this city that aren't already in `events`.
//   2. Requires each candidate to be corroborated by at least 3 independent
//      sources that are NOT ticket-resale/marketplace sites (a resale site
//      is fine as the original lead, just not as one of the 3 — the point
//      is confirming the event is real from sources with no financial
//      stake in selling the tickets). This is re-checked server-side
//      against RESALE_HOSTS below rather than trusted from the model's own
//      say-so.
//   3. For images: prefers one the organiser has explicitly marked reusable
//      (rare), otherwise falls back to a themed stock photo from Pexels
//      (free-to-use, no attribution legally required, but recorded anyway).
//   4. Only rows that clear both the verification and image steps are
//      inserted — anything short of that is dropped, not queued, per how
//      this was scoped.
const RESALE_HOSTS = [
  'quicket.co.za',
  'computicket.com',
  'webtickets.co.za',
  'ticketpro.co.za',
  'howler.co.za',
  'eventbrite.com',
  'eventbrite.co.za',
  'ticketmaster.com',
  'ticketmaster.co.za',
  'shoprite.co.za', // Shoprite/Checkers "Money Market" ticket counter listings
  'gigs-guide.co.za',
];

const MIN_CORROBORATING_SOURCES = 3;

export const onRequestPost: PagesFunction<Env> = async (context) => {
  const auth = context.request.headers.get('Authorization');
  if (!context.env.CRON_SECRET || auth !== `Bearer ${context.env.CRON_SECRET}`) {
    return json({ ok: false }, 401);
  }
  if (!context.env.ANTHROPIC_API_KEY) {
    return json({ ok: false, error: 'ANTHROPIC_API_KEY is not configured.' }, 503);
  }

  const site = getSite(context.env.SITE);
  const db = context.env.DB;

  const existing = await db.prepare('SELECT title, event_date FROM events').all<{ title: string; event_date: string }>();
  const existingSlugs = new Set(existing.results.map((e) => eventSlug(e.title, e.event_date)));

  let candidates: Candidate[];
  try {
    candidates = await discoverCandidates(context.env.ANTHROPIC_API_KEY, site.cityLabel, existing.results);
  } catch (err) {
    return json({ ok: false, error: `Discovery call failed: ${err instanceof Error ? err.message : String(err)}` }, 502);
  }

  let inserted = 0;
  let rejectedUnverified = 0;
  let skippedDuplicate = 0;

  for (const c of candidates) {
    if (!isValidCandidate(c)) continue;

    const sources = (c.verificationSources ?? []).filter((u) => typeof u === 'string' && isNonResaleUrl(u));
    if (sources.length < MIN_CORROBORATING_SOURCES) {
      rejectedUnverified++;
      continue;
    }

    const slug = eventSlug(c.title, c.eventDate);
    if (existingSlugs.has(slug)) {
      skippedDuplicate++;
      continue;
    }
    existingSlugs.add(slug);

    const image = await resolveImage(context.env.PEXELS_API_KEY, c);

    await db
      .prepare(
        `INSERT INTO events (
          slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
          image_url, image_credit, image_source, organiser, organiser_note, doors, ages, parking, traders,
          description, source, verification_json
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'agent', ?)`
      )
      .bind(
        slug,
        c.title,
        isEventType(c.type) ? c.type : 'Music',
        c.eventDate,
        c.eventTime ?? null,
        c.venue ?? null,
        c.suburb ?? null,
        c.address ?? null,
        c.price ?? 'Price TBC',
        c.ticketUrl ?? '#',
        c.host ?? null,
        image?.url ?? null,
        image?.credit ?? null,
        image?.source ?? null,
        c.organiser ?? null,
        c.organiserNote ?? null,
        c.doors ?? null,
        c.ages ?? null,
        c.parking ?? null,
        c.traders ?? null,
        c.description ?? '',
        JSON.stringify(sources)
      )
      .run();

    await logActivity(db, 'event_discovered', c.title, `Auto-published — verified against ${sources.length} independent sources.`);
    inserted++;
  }

  if (inserted > 0) await triggerRebuild(context.env.GITHUB_DISPATCH_TOKEN);

  return json({ ok: true, inserted, rejectedUnverified, skippedDuplicate, candidatesSeen: candidates.length });
};

interface Candidate {
  title: string;
  type: string;
  eventDate: string;
  eventTime?: string;
  venue?: string;
  suburb?: string;
  address?: string;
  price?: string;
  ticketUrl?: string;
  host?: string;
  organiser?: string;
  organiserNote?: string;
  doors?: string;
  ages?: string;
  parking?: string;
  traders?: string;
  description?: string;
  verificationSources?: string[];
  officialImageUrl?: string;
  officialImageLicenseNote?: string;
  imageSearchQuery?: string;
}

function isValidCandidate(c: unknown): c is Candidate {
  if (!c || typeof c !== 'object') return false;
  const o = c as Record<string, unknown>;
  return typeof o.title === 'string' && o.title.trim().length > 0 && typeof o.eventDate === 'string' && /^\d{4}-\d{2}-\d{2}$/.test(o.eventDate);
}

function isNonResaleUrl(url: string): boolean {
  try {
    const host = new URL(url).hostname.replace(/^www\./, '').toLowerCase();
    return !RESALE_HOSTS.some((resale) => host === resale || host.endsWith(`.${resale}`));
  } catch {
    return false;
  }
}

async function discoverCandidates(
  apiKey: string,
  cityLabel: string,
  existingEvents: { title: string; event_date: string }[]
): Promise<Candidate[]> {
  const knownList = existingEvents.length
    ? existingEvents.map((e) => `- ${e.title} (${e.event_date})`).join('\n')
    : '(none yet)';

  const prompt = `You are finding real, upcoming public events in ${cityLabel}, South Africa, for a local business directory's "Events" page (markets, gigs, sport, theatre, food & drink, family events). Search the web for events happening in roughly the next 10 weeks.

Already listed (do not repeat these — same title + same date counts as a repeat):
${knownList}

For EVERY candidate event you propose, you must independently corroborate it using at least ${MIN_CORROBORATING_SOURCES} DIFFERENT sources that are NOT ticket-resale or ticket-marketplace sites. Resale/marketplace sites (Quicket, Computicket, Webtickets, Ticketpro, Howler, Eventbrite, Ticketmaster, etc.) are fine as your initial lead or as the ticket-buying link, but they do NOT count toward the ${MIN_CORROBORATING_SOURCES}-source verification bar. Acceptable corroborating sources: the venue's own official website, the organiser's own official website or verified social media page, local news or community sites, municipal/tourism event calendars, or other independent local-events listing sites. If you cannot find ${MIN_CORROBORATING_SOURCES} qualifying independent sources confirming an event is real with matching date/venue, DO NOT include it.

For each verified event also try to find an image the organiser or venue has explicitly made free to reuse (their own press/media kit, a Creative Commons or public-domain photo, etc.) — this is rare, so if you can't find one, don't guess: instead give a short, generic stock-photo search phrase describing the event's theme/vibe (e.g. "outdoor food market stalls", "live rock concert crowd stage lights") that a stock photo site could match, and leave the official image fields empty.

Respond with ONLY a JSON code block (\`\`\`json ... \`\`\`) as the very last thing in your reply, containing an array of event objects with this exact shape:
[{
  "title": string,
  "type": one of ${JSON.stringify(EVENT_TYPES)},
  "eventDate": "YYYY-MM-DD",
  "eventTime": string (e.g. "19:30" or "08:00 – 14:00"),
  "venue": string,
  "suburb": string,
  "address": string,
  "price": string (shown exactly as typed, e.g. "R180 – R650" or "Free entry"),
  "ticketUrl": string (the seller's page, can be a resale site),
  "host": string (e.g. "Sold via Quicket", "No ticket needed"),
  "organiser": string,
  "organiserNote": string,
  "doors": string,
  "ages": string,
  "parking": string,
  "traders": string (optional, only if relevant e.g. for markets),
  "description": string (1-2 sentences),
  "verificationSources": string[] (the >= ${MIN_CORROBORATING_SOURCES} non-resale URLs you used to confirm this event is real),
  "officialImageUrl": string (only if you found one explicitly marked reusable, else omit),
  "officialImageLicenseNote": string (only if officialImageUrl is set — what makes it free to use),
  "imageSearchQuery": string (a stock-photo search phrase for this event's theme, used if no official image)
}]

If you find no qualifying events, respond with an empty array: \`\`\`json\n[]\n\`\`\``;

  const res = await fetch('https://api.anthropic.com/v1/messages', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'x-api-key': apiKey,
      'anthropic-version': '2023-06-01',
    },
    body: JSON.stringify({
      model: 'claude-sonnet-5',
      max_tokens: 8000,
      tools: [{ type: 'web_search_20250305', name: 'web_search', max_uses: 15 }],
      messages: [{ role: 'user', content: prompt }],
    }),
  });

  if (!res.ok) throw new Error(`Anthropic API returned ${res.status}: ${await res.text()}`);
  const data = (await res.json()) as { content: { type: string; text?: string }[] };

  const textBlocks = data.content
    .filter((b): b is { type: string; text: string } => b.type === 'text' && typeof b.text === 'string')
    .map((b) => b.text);
  const fullText = textBlocks.join('\n');
  const match = fullText.match(/```json\s*([\s\S]*?)```/);
  if (!match) throw new Error('No JSON block found in the model response.');

  const parsed = JSON.parse(match[1]);
  return Array.isArray(parsed) ? parsed : [];
}

interface ResolvedImage {
  url: string;
  credit: string | null;
  source: 'official' | 'stock';
}

async function resolveImage(pexelsKey: string | undefined, c: Candidate): Promise<ResolvedImage | null> {
  if (c.officialImageUrl && c.officialImageLicenseNote) {
    return { url: c.officialImageUrl, credit: c.officialImageLicenseNote, source: 'official' };
  }
  if (!pexelsKey || !c.imageSearchQuery) return null;

  try {
    const res = await fetch(`https://api.pexels.com/v1/search?query=${encodeURIComponent(c.imageSearchQuery)}&per_page=1&orientation=landscape`, {
      headers: { Authorization: pexelsKey },
    });
    if (!res.ok) return null;
    const data = (await res.json()) as { photos: { src: { large: string }; photographer: string; url: string }[] };
    const photo = data.photos?.[0];
    if (!photo) return null;
    return { url: photo.src.large, credit: `Photo by ${photo.photographer} on Pexels`, source: 'stock' };
  } catch {
    return null;
  }
}

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), { status, headers: { 'Content-Type': 'application/json' } });
}
