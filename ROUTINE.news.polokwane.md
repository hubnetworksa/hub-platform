# PolokwaneHub daily news routine — runbook

You are a scheduled cloud agent — **separate from this site's hourly
business-research routine** (`ROUTINE.polokwane.md`) and its weekly events
routine (`ROUTINE.events.polokwane.md`). You run **once a day** and own two
tables: `news` and `fuel_prices`. Never touch anything the other routines own, and they never
touch anything you own. You have zero memory of previous runs — everything
you need is in this file, in `status/polokwane/db-snapshot.json`, and in
`status/polokwane/news-agent-log.jsonl`.

## What this job is

PolokwaneHub has a Local news page (`/news/`) and a "today" panel on the
homepage. Your job is to find the day's genuinely useful local news for
Polokwane and the Capricorn district of Limpopo — the things that change someone's day: **traffic and road
works, utilities (water, electricity, load-shedding), business and
trading rules, sport fixtures, tourism** and notable **community**
announcements — and write a short article page for each one that passes the
checks below.

Same contract as the other routines: **you have no Cloudflare credentials and
must never run `wrangler d1 execute`.** You propose changes by writing a SQL
file to `db/routine-updates/polokwane/` — the same directory and GitHub Actions
apply-on-deploy mechanism the other routines use. Your job ends at "commit and
push the SQL file".

## Reading current state

`status/polokwane/db-snapshot.json`'s `news` array lists every article already
published (`slug`, `title`, `published_date`, `source_url`). Never propose a
story whose main source URL or subject is already in it.

## Where to look

Search the web and read the pages themselves. Good starting points for
Polokwane and the Capricorn district of Limpopo: Polokwane Municipality notices, Capricorn District Municipality, Limpopo Provincial Government, SANRAL, Polokwane Observer, Capricorn FM, Limpopo Mirror, Zoutpansberger, News24, IOL, EWN, Limpopo Tourism, Peter Mokaba Stadium / Baroka / Polokwane City. Official bodies (municipality, SANRAL, provincial
government, the venue or club itself) are the best primary sources.

Only consider stories **published in the last 7 days** and still relevant today.
Skip: crime and court reports about named private people, deaths and
accidents involving identifiable people, rumours, opinion pieces, party-political
commentary, celebrity gossip, paid/sponsored content, anything you cannot
verify. When in doubt, leave it out.

## The verification rule (non-negotiable)

For **every** article you write:

1. Open and **read** the main source page yourself. Every fact you use — every
   number, time, place, name and date — must be **stated** in a source you read.
   Never infer, estimate or fill in a detail.
2. Find **at least one more independent source** that reports the same facts
   (a different organisation — not a syndicated copy of the same wire story, not
   a re-post). An official statement plus a news outlet reporting it counts as
   two. If you cannot find a second independent source that agrees, **discard
   the story** — do not publish it.
3. If sources disagree on a fact, leave that fact out or discard the story.
4. Record every source you read in `verification_json` (JSON array of https
   URLs, must include the main `source_url`).

## Writing rules (copyright — non-negotiable)

**Write every article yourself, in your own words.** Never copy or lightly
paraphrase sentences from a source, and never copy a source's headline,
photo or caption. State the facts plainly in original wording, in the order
that is most useful to a resident.

- `title`: your own plain headline, 15-140 chars, no clickbait, not the source's headline.
- `summary`: one sentence, 40-240 chars, the who/what/when.
- `body`: 2-5 short paragraphs (separated by a blank line), 350-3500 chars, plain
  text only — **no HTML, no markdown, no `<` or `>`**. Cover what is happening, when,
  where it affects people, and what (if anything) they should do. Attribute
  claims: "the City says…", "according to SANRAL…". Do not add opinion.
- Never invent quotes. Only use a direct quote if a source prints it exactly,
  and keep it under 15 words.
- `category` must be exactly one of: `Traffic`, `Utilities`, `Business`, `Sport`,
  `Tourism`, `Community`.
- `published_date` is the date the main source published it (`YYYY-MM-DD`).
- `source_name` is the main source's name (e.g. `City of Cape Town`); `source_url` its https link.

## Images

News articles normally have **no image** — leave `image_url`, `image_credit`,
`image_source` as `NULL`. Only add one if you find a photo the publisher has
**explicitly** made free to reuse (`image_source` = `'official'`, `image_credit`
says why it is free), or a clearly generic themed stock photo from Pexels /
Unsplash / Pixabay that does not depict the specific event or any identifiable
person (`image_source` = `'stock'`, credit e.g. "Photo via Pexels"). Never use a
news outlet's photo.

## Writing the SQL file

One new file per run: `db/routine-updates/polokwane/<UTC timestamp, e.g.
2026-10-01T06-00-00>.sql`. Only `INSERT OR IGNORE INTO news` (and, monthly, `INSERT OR IGNORE INTO fuel_prices`) statements — nothing
else. Slug = lowercase-hyphenated title fragment + `-` + `published_date`
(e.g. `n1-resurfacing-two-lanes-closed-2026-10-01`); if taken, append `-2`.

```sql
INSERT OR IGNORE INTO news (
  slug, title, category, published_date, source_name, source_url,
  summary, body, image_url, image_credit, image_source, verification_json, source
) VALUES (
  'n1-resurfacing-two-lanes-closed-2026-10-01',
  'Two N1 lanes closed overnight for resurfacing this week',
  'Traffic', '2026-10-01', 'SANRAL', 'https://www.sanral.co.za/example',
  'Two inbound N1 lanes close from 22:00 to 05:00 on three nights this week while the road is resurfaced.',
  'SANRAL says two lanes of the N1 inbound carriageway will close each night ...

Motorists are advised to ...',
  NULL, NULL, NULL,
  '["https://www.sanral.co.za/example", "https://example-news-site.co.za/n1-works"]',
  'agent'
);
```

(Escape a single quote inside a string by doubling it.)

## Monthly fuel prices (the homepage "Fuel price" panel)

South African pump prices are regulated and change **once a month** (announced
by the Department of Mineral and Petroleum Resources / Central Energy Fund,
effective the first Wednesday of the month). The homepage shows this month's
prices for this site's region — **inland** for PolokwaneHub. You keep them current:

1. Check `status/polokwane/db-snapshot.json`'s `fuel_prices` array. If the current
   month (`YYYY-MM`) already has the four `inland` grades, do nothing here.
2. Otherwise, once the new prices are announced, find the official
   announcement and at least one more independent source (AA of South Africa,
   a major news outlet). Read them. Take the **inland** prices per litre for:
   `Petrol 95`, `Petrol 93`, `Diesel 50ppm`, `Diesel 500ppm`. Note `Diesel 50ppm` is the 0.005% sulphur grade and
   `Diesel 500ppm` is the 0.05% sulphur grade — announcements usually label them by sulphur %. (Use the
   inland region column — Gauteng/Limpopo are inland, Cape Town is coastal.)
3. Add one `INSERT OR IGNORE INTO fuel_prices` per grade to the same SQL file you
   write for news (or its own file if no news passed today):

```sql
INSERT OR IGNORE INTO fuel_prices (period, region, grade, price_cents, change_cents, source_url, verification_json)
VALUES ('2026-10', 'inland', 'Petrol 95', 2184, -42, 'https://official-announcement-url',
  '["https://official-announcement-url", "https://second-independent-source"]');
```

`price_cents` is rand-per-litre times 100 (R21.84 → 2184). `change_cents` is the
change versus last month's price for that grade (negative = cheaper); work it out
from the previous month's row in the snapshot, or take the announced change.
Only use figures that are printed in the sources — never estimate. The check
script verifies every price appears in a source and fails the file otherwise.

## Run the check — every time, before you push

```
node scripts/check-news.mjs db/routine-updates/polokwane/<your file>.sql --city polokwane --online
```

This gate checks the file only inserts news rows, every field is well formed, the
story is recent, there are >= 2 different source sites, **no 8 consecutive words
are copied from a source**, and **every number in your article appears in a source**.
It prints `ok` or `FAIL` for each article and exits non-zero on any failure.
Fix or delete every failing article and re-run until it passes. **Never push a
file that fails the check.** If a source is blocked from your environment (the
check says it could not read it), the article cannot be verified — discard it.

## Logging and committing

Append one line to `status/polokwane/news-agent-log.jsonl` every run:

```json
{"date": "2026-10-01T06:00:00Z", "action_taken": "news_discovery", "found": 8, "published": 4, "rejected": 4, "short_summary": "Found 8 candidate stories; 4 passed two-source verification and check-news (N1 resurfacing, dam levels, ...); 4 discarded (single source / older than 7 days / could not verify)."}
```

Commit the SQL file (only if at least one article passed) together with the log
line and push to `main`. A quiet run still gets a log line with zero counts.

**Target 3-8 articles per run.** Quality over quantity — a day with two solid
stories is a good day. Never publish just to hit a number.
