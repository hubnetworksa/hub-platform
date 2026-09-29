# Routine: weekly events

Read `routines/_shared.md` first (the contract, Step 0, environment limitation and commit rules apply; the verification rule below is **stricter** than the business routines'). This routine finds real, upcoming public events (markets, gigs, sport, theatre, food and drink, family events) and proposes them for the city's Events page. You own one table: `events`. Nothing else.

Run: `node scripts/routines/next.mjs events --city <city>`. The packet gives the city's `area`, today's date, the `knownEvents` already on the site (slug, title, date, type) and the allowed `types`.

**Do not propose an event whose title and date are already in `knownEvents`**, or that is obviously the same event under a slightly different title.

## The verification rule (stricter)

For **every** event you must find it corroborated by **at least 3 different sources that are NOT ticket-resale or marketplace sites**. Quicket, Computicket, Webtickets, Ticketpro, Howler, Eventbrite, Ticketmaster and similar are fine as your initial lead and as the `ticket_url` you publish, but they **do not count** toward the 3. Sources that count: the venue's own official website, the organiser's own official website or verified social page, local news or community sites, a municipal or tourism events calendar, or another independent local-events listing. The point is to confirm the event is real from sources with no financial stake in selling the tickets.

If you cannot find 3 qualifying independent sources agreeing on the same event with a matching date and venue, **discard it: do not publish it and do not queue it.** It is fine to rediscover it later. A fact only counts if a source **actually states it**: a date, price or venue you infer does not count.

## Images

First try an image the organiser or venue has **explicitly made free to reuse** (their press or media kit, or a photo marked Creative Commons or public domain). This is rare: do not spend long hunting for one. Otherwise search a free stock site (Pexels, Unsplash, Pixabay) for a **themed** image matching the event's category, not the specific event, and set `image_source` to `'stock'` with a short `image_credit` such as "Photo via Pexels". Use `'official'` when you used an explicitly reusable organiser or venue image, with `image_credit` saying why it is free. **If nothing usable turns up, leave `image_url`, `image_credit` and `image_source` as `NULL` — do not skip the event over a missing image.** A separate step (below) fills in a generated one for anything still blank once the event is live, so every event ends up with an image either way, never a placeholder.

### Filling in the rest: `scripts/generate-event-images.mjs`

Run once per city after this run's SQL has been applied (i.e. after the deploy that inserts these events), not by the agent itself — it needs Cloudflare credentials the agent doesn't have:

```
node scripts/generate-event-images.mjs --site <city> [--limit 20]
```

It finds every event with `image_url IS NULL`, generates a free, non-copyrighted, flat-illustration scene matching the event's `type` (Market, Music, Sport, Theatre, Food & Drink, Family, Other) via Cloudflare Workers AI (`@cf/black-forest-labs/flux-1-schnell` — no external API key, billed against this account's own free daily neuron allowance, comfortably enough for the volume this routine produces), stores it in this site's own R2 bucket at `events/<slug>.jpg`, and sets `image_url = '/media/events/<slug>.jpg'`, `image_credit = 'AI-generated image'`, `image_source = 'ai'`. It never touches an event that already has an image (real or generated), so it's safe to run repeatedly or fold into the deploy workflow as its own step. `--dry-run` lists what it would generate without spending anything.

## The SQL file

One new file per run: `db/routine-updates/<city>/<UTC timestamp>.sql`, using `INSERT OR IGNORE` keyed on the unique `slug`:

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

- Slug: `slugify(title) + '-' + event_date`; if taken by an unrelated event, append `-2`.
- `type` is exactly one of the packet's `types`. `event_date` is `YYYY-MM-DD`; `event_time` is a free-text display string. Only future dates.
- `price` is shown exactly as written on the public page: write it the way a person reads it (`'R180 - R650'`, `'Free entry'`, `'R150 (includes tasting glass)'`).
- `host` is a short seller label (`'Sold via Quicket'`, `'No ticket needed'`, `'Pay at the door'`).
- `organiser`, `organiser_note`, `doors`, `ages`, `parking`, `traders` are optional: fill what you genuinely found, leave `NULL` for the rest.
- `verification_json` is the JSON array of your 3 or more non-resale source URLs: the audit trail. Do not pad it with resale URLs.

## Logging and committing

Append one line to `status/<city>/events-agent-log.jsonl` every run, even a quiet one, then commit the SQL file (only if at least one event cleared the bar) with the log line and push to `main`:

```json
{"date": "2026-10-01T09:00:00Z", "action_taken": "event_discovery", "found": 6, "published": 3, "rejected_unverified": 3, "short_summary": "Found 6 candidate events; 3 cleared the 3-source non-resale bar and were published, 3 discarded for lacking independent corroboration."}
```

**Target roughly 5 to 10 verified events per run.** Stop when you run out of qualifying candidates, and stop at 10 if there are more: the rest can wait for next week.
