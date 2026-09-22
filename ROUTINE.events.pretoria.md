# PretoriaHub weekly events routine — runbook

You are a scheduled cloud agent — **separate from this site's hourly
business-research routine** (`ROUTINE.pretoria.md`). You run **once a
week**, not hourly, and you own a completely different part of the
dataset (the `events` table, not `businesses`/`suburbs`/`shopping_centers`)
— never touch anything the business routine owns, and it never touches
anything you own. You have zero memory of previous runs — everything you
need is in this file or in `status/pretoria/`.

## What this job is

PretoriaHub has an Events page (markets, gigs, sport, theatre, food &
drink, family events) alongside its business directory. Your job is to
find real, upcoming public events in the Pretoria, Centurion and the greater Tshwane metro and
propose them for that page.

Same contract as the business routine: **you do not have Cloudflare
credentials and must never try to run `wrangler d1 execute` yourself.**
You propose changes by writing a SQL file to
`db/routine-updates/pretoria/` — the exact same directory and GitHub
Actions apply-on-deploy mechanism the business routine uses (it applies
whatever `.sql` files it finds there, regardless of which routine wrote
them). Your job ends at "commit and push the SQL file."

## Reading current state

`status/pretoria/db-snapshot.json`'s `events` array (refreshed after every
deploy) lists every event already on the site: `slug`, `title`,
`event_date`, `type`. That's your only state — there's no rotation index
or cursor to track (unlike the business routine's `routine-state.json`),
since this job just does a fresh broad search every run. **Don't propose
an event whose title + date combination is already in that array**, or is
obviously the same event under a slightly different title.

## The verification rule (non-negotiable — stricter than the business routine's)

For **every** event you propose, you must find it corroborated by **at
least 3 different sources that are NOT ticket-resale or ticket-marketplace
sites**. Resale/marketplace sites — Quicket, Computicket, Webtickets,
Ticketpro, Howler, Eventbrite, Ticketmaster, and similar — are perfectly
fine as your initial lead, and as the `ticket_url` you publish, but they
**do not count** toward the 3. Sources that do count: the venue's own
official website, the organiser's own official website or a verified
social media page, local news or community sites, a municipal/tourism
events calendar, or another independent local-events listing site. The
point is confirming the event is real from sources with no financial
stake in selling the tickets, not just re-reading the same resale listing
from a different domain.

If you can't find 3 qualifying independent sources agreeing on the same
event with a matching date and venue, **discard it — do not publish it,
do not queue it anywhere.** It's fine to rediscover it on a future run
once more sources exist (common for events announced far in advance).

A fact only counts if a source **actually states it** — a date, price, or
venue you're inferring or assuming from context doesn't count, same rule
as the business routine's "never invent or guess a fact."

## Image sourcing

Try first to find an image the organiser or venue has **explicitly made
free to reuse** — their own press/media kit page, a photo they've marked
Creative Commons or public domain. This is rare; don't force it or spend
long hunting for one.

If you can't find one, search a free stock-photo site (Pexels, Unsplash,
Pixabay) for a **themed** image matching the event's category/vibe — not
the specific event — e.g. "outdoor food market stalls" for a market,
"live rock concert crowd stage lights" for a gig, "family fun day
outdoors" for a family event. Use a direct image URL from the result and
set `image_source` to `'stock'` with a short `image_credit` (e.g. "Photo
via Pexels"). Set `image_source` to `'official'` instead if you used an
explicitly-reusable organiser/venue image, with `image_credit` noting why
it's free to use.

If neither turns up anything usable, leave `image_url`/`image_credit`/
`image_source` as `NULL` — the site shows a placeholder in that case,
which is fine.

## Writing the SQL file

One new file per run: `db/routine-updates/pretoria/<UTC timestamp, e.g.
2026-10-01T09-00-00>.sql`. Use `INSERT OR IGNORE`, keyed on the unique
`slug` column, so a re-applied file is always safe:

```sql
INSERT OR IGNORE INTO events (
  slug, title, type, event_date, event_time, venue, suburb, address, price, ticket_url, host,
  image_url, image_credit, image_source, organiser, organiser_note, doors, ages, parking, traders,
  description, source, verification_json
) VALUES (
  'example-market-2026-10-11', 'Example Producers'' Market', 'Market', '2026-10-11', '08:00 - 14:00',
  'Example Village Centre', 'Example Suburb', 'Example Village Centre, 12 Example Rd, Example Suburb',
  'Free entry', 'https://www.quicket.co.za/events/example', 'No ticket needed',
  NULL, NULL, NULL,
  'Example Producers Collective', 'Running weekly since 2019', '08:00', 'All ages, dog friendly', 'Free on-site parking',
  '40 local producers and food stalls',
  'A weekly producers'' market with fresh produce, baked goods and live acoustic music.',
  'agent',
  '["https://examplevillagecentre.co.za/events/market", "https://facebook.com/exampleproducers/posts/123", "https://examplelocalnews.co.za/article/market-returns"]'
);
```

Slug format: `slugify(title) + '-' + event_date` (lowercase, non-alphanumeric
runs collapsed to single hyphens) — e.g. `example-market-2026-10-11`. If
that slug is somehow already taken by an unrelated event, append `-2`.

- `type` must be exactly one of: `Music`, `Market`, `Sport`, `Theatre`,
  `Food & Drink`, `Family`, `Other`.
- `event_date` is `YYYY-MM-DD`. `event_time` is a free-text display string
  (e.g. `'19:30'` or `'08:00 - 14:00'`).
- `price` is shown **exactly as you write it** on the public page — write
  it the way a person would read it (`'R180 - R650'`, `'Free entry'`,
  `'R150 (includes tasting glass)'`).
- `host` is a short seller label (e.g. `'Sold via Quicket'`, `'No ticket
  needed'`, `'Pay at the door'`).
- `organiser`/`organiser_note`/`doors`/`ages`/`parking`/`traders` are all
  optional enrichment — fill in what you genuinely found, leave `NULL`
  for anything you didn't (the page falls back sensibly on missing
  values, it doesn't need every field).
- `verification_json` is the JSON array of your >= 3 non-resale source
  URLs — this is the audit trail, don't skip it or pad it with resale
  URLs to hit the count.

## Logging and committing

Whether or not anything cleared the bar this run, append one line to
`status/pretoria/events-agent-log.jsonl`:

```json
{"date": "2026-10-01T09:00:00Z", "action_taken": "event_discovery", "found": 6, "published": 3, "rejected_unverified": 3, "short_summary": "Found 6 candidate events via web search; 3 cleared the 3-source non-resale verification bar and were published (Example Market, Example Gig, Example Fun Run), 3 discarded for lacking independent corroboration."}
```

Commit the SQL file (only if at least one event cleared the bar) together
with that log line, and push to `main`. A quiet run that found nothing
publishable still gets a log line with zero counts — don't skip the
commit just because the result was empty.

**Target roughly 5-10 verified events per run** — enough to keep the page
genuinely fresh without turning this into an all-day research task. If
you run out of qualifying candidates sooner, stop there; if you're
finding more than that, it's fine to stop at 10 and pick up the rest next
week.
