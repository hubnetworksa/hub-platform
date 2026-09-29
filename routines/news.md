# Routine: daily local news

Read `routines/_shared.md` first (the contract, Step 0, environment limitation and commit rules apply; the verification and writing rules below are specific to news). You own one table: `news`. **Fuel prices are not yours:** they have their own monthly routine (`routines/fuel.md`).

Run: `node scripts/routines/next.mjs news --city <city>`. The packet gives the city's `area`, `sources` (good starting points), today's date, the `recentArticles` already published (slug, title, date, source URL) and the allowed `categories`.

Find the day's genuinely useful local news: the things that change someone's day, meaning **traffic and road works, utilities (water, electricity, load-shedding), business and trading rules, sport fixtures, tourism** and notable **community** announcements. Write a short article for each story that passes the checks below. **Never propose a story whose main source URL or subject is already in `recentArticles`.**

## Where to look

Search the web and read the pages themselves, starting from the packet's `sources`. Official bodies (the municipality, SANRAL, provincial government, the venue or club itself) are the best primary sources. Only consider stories **published in the last 7 days** and still relevant today. Skip: crime and court reports about named private people, deaths and accidents involving identifiable people, rumours, opinion pieces, party-political commentary, celebrity gossip, paid or sponsored content, and anything you cannot verify. When in doubt, leave it out.

## The verification rule (non-negotiable)

For **every** article:

1. Open and **read** the main source page yourself. Every fact you use (every number, time, place, name and date) must be **stated** in a source you read. Never infer, estimate or fill in a detail.
2. Find **at least one more independent source** reporting the same facts: a different organisation, not a syndicated copy of the same wire story or a re-post. An official statement plus a news outlet reporting it counts as two. If you cannot find a second independent source that agrees, **discard the story.**
3. If sources disagree on a fact, leave that fact out or discard the story.
4. Record every source you read in `verification_json` (a JSON array of https URLs that includes the main `source_url`).

## Writing rules (copyright, non-negotiable)

**Write every article yourself, in your own words.** Never copy or lightly paraphrase sentences from a source, and never copy a source's headline, photo or caption. State the facts plainly, in the order that is most useful to a resident.

- `title`: your own plain headline, 15 to 140 characters, no clickbait, not the source's headline.
- `summary`: one sentence, 40 to 240 characters: who, what, when.
- `body`: 2 to 5 short paragraphs separated by a blank line, 350 to 3,500 characters, plain text only (**no HTML, no markdown, no `<` or `>`**). Cover what is happening, when, where it affects people and what (if anything) they should do. Attribute claims ("the City says…", "according to SANRAL…"). No opinion.
- Never invent quotes. Use a direct quote only if a source prints it exactly, under 15 words.
- `category` is exactly one of the packet's `categories`. `published_date` is the date the main source published it (`YYYY-MM-DD`). `source_name` is the main source's name; `source_url` its https link.

## Images

News articles normally have **no image**: leave `image_url`, `image_credit` and `image_source` as `NULL`. Only add one if the publisher has **explicitly** made a photo free to reuse (`image_source = 'official'`, with `image_credit` saying why), or a clearly generic themed stock photo from Pexels, Unsplash or Pixabay that shows neither the specific event nor any identifiable person (`image_source = 'stock'`, credit such as "Photo via Pexels"). Never use a news outlet's photo.

## The SQL file

One new file per run: `db/routine-updates/<city>/<UTC timestamp>.sql`. **Only `INSERT OR IGNORE INTO news` statements, nothing else.** Slug = a lowercase-hyphenated title fragment + `-` + `published_date` (for example `n1-resurfacing-two-lanes-closed-2026-10-01`); if taken, append `-2`.

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

## The check: every time, before you push

```
node scripts/check-news.mjs db/routine-updates/<city>/<your file>.sql --city <city> --online
```

This gate confirms the file only inserts news rows, every field is well formed, the story is recent, there are at least 2 different source sites, **no 8 consecutive words are copied from a source** and **every number in your article appears in a source**. It prints `ok` or `FAIL` for each article and exits non-zero on any failure. Fix or delete every failing article and re-run. **Never push a file that fails.** If a source is blocked from your environment (the check says it could not read it), the article cannot be verified: discard it.

## Logging and committing

Append one line to `status/<city>/news-agent-log.jsonl` every run (a quiet run still logs zero counts), commit the SQL file (only if at least one article passed) with the log line, and push to `main`:

```json
{"date": "2026-10-01T06:00:00Z", "action_taken": "news_discovery", "found": 8, "published": 4, "rejected": 4, "short_summary": "Found 8 candidate stories; 4 passed two-source verification and check-news; 4 discarded (single source, older than 7 days, or could not verify)."}
```

**Target 3 to 8 articles per run.** Quality over quantity: a day with two solid stories is a good day. Never publish just to hit a number.
