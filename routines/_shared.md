# Shared rules for every routine

Read this file and then your own routine's runbook. You are a scheduled cloud agent with **no memory of previous runs**: everything you need is in these two files, the work packet from Step 0, and the repo's `status/` files.

## The contract

- Structured data (businesses, suburbs, categories, shopping centres, events, news) lives in a Cloudflare D1 database, not in git. **You have no Cloudflare credentials and must never run `wrangler d1 execute`.**
- You propose changes by writing SQL files to `db/routine-updates/<city>/`. A GitHub Actions workflow with the credentials applies them to the real database on the next deploy and refreshes `status/<city>/db-snapshot.json`. Your job ends at "commit and push".
- Never touch anything another routine owns. Each routine's runbook lists exactly what it may write.
- Scripts do the mechanical work (choosing what is due, duplicate checks, slug and category checks, one-time guards, state). **You do the judgement work: finding and verifying facts.** Do not redo what a script already decided.

## Every run, in this order

1. **Step 0: what is due?** Run `node scripts/routines/next.mjs <routine> --city <city>`. If it prints `{"due":false,…}` and exits with code 3, append one log line with `"action_taken": "<routine>_not_due"` and the reason, and **stop. Do not search the web.** Otherwise it prints a small JSON work packet: work only on what the packet lists. Do not read `db-snapshot.json` in full.
2. **Do the work** in the runbook's checkpoints (small batches).
3. **Validate every SQL file** before pushing: `node scripts/routines/validate.mjs <file> --routine <routine> --city <city>`. It must print `ok`. Fix or remove every failing statement and re-run. **Never push a file that fails.**
4. **Record progress** with `node scripts/routines/done.mjs …` (the exact command is in each runbook). Never edit `status/<city>/state/*.json` by hand.
5. **Log and push** (see "Logging and committing" below).

If you run low on turns, stop cleanly after the last completed checkpoint. Whatever you already committed is safe; do not record progress for work you did not finish.

## A known environment limitation: check it once, first

This sandbox may block WebFetch and curl to most domains (business websites, Facebook, even Wikipedia often return 403 from the egress proxy). Do **one** cheap check at the start (one WebFetch to a real source). If it fails, do not spend turns debugging the proxy: fall back to verifying against **WebSearch result snippets**. A snippet counts as a source only if it **explicitly and literally states** the fact you use it for (a phone number actually printed in the snippet, an address actually printed), never inferred from context or reputation. When a fetch works, prefer it: a fetched page is stronger evidence than a snippet.

## The verification rule (non-negotiable)

**Never invent or guess a fact.** Every field you write (name, address, phone, hours, email, description) must trace back to something you actually read.

- Allowed sources: Google Maps / Places / Search result content, the business's own website, Facebook or Instagram business pages, other directories, Chamber of Commerce listings, news articles. OpenStreetMap and Overpass are **not** sources for these routines.
- **A new business or shopping centre needs at least 2 independent sources** (different websites) agreeing on the same name and rough location. One source, or disagreeing sources: **discard it, write nothing, queue nothing.** It is fine to rediscover it later.
- **A phone number AND a street address are both mandatory** to publish a business. Confirm they belong to this exact branch: chains repeat constantly (Steers, KFC, Woolworths Food), so a number for "the Woolworths in the city" is worthless if you cannot tell which branch it belongs to. If you cannot pin either field to this exact location, treat it as missing and do not publish.
- **Never name an individual in a description** (owner, founder, director, partner, individual practitioner), even when a source states it and even for professionals on public registers. Describe what the business does, not who runs it: "an owner-managed gym", "a general practice", "founded in 2013" are fine. A business's registered name that contains a person's name is fine as the `name`; just do not expand initials or add first names.
- If in doubt, skip it. No human reviews your output before it goes live on a public site: a smaller number of correct additions beats a larger number of half-confident ones.

## Slugs are fixed

Only use `category_slug` and `suburb_slug` values that appear in your work packet (they come from the snapshot). Never invent a category or suburb. Read the packet's `categoryNotes` for city-specific category rules.

## SQL files

- One new file per checkpoint: `db/routine-updates/<city>/<UTC timestamp, e.g. 2026-10-01T10-00-00>.sql`. Never reuse or append to an earlier file.
- Every statement must be safe to run twice (`INSERT OR IGNORE`, or an `UPDATE` with its one-time guard).
- Escape a single quote inside a string by doubling it (`'Producers'' Market'`).

**New business** (the `shopping_center_id` line is only for tenants of a known centre):

```sql
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'example-name-suburbslug', 'Example Name',
  (SELECT id FROM suburbs WHERE slug = 'suburbslug'),
  (SELECT id FROM shopping_centers WHERE slug = 'example-mall-suburbslug'),
  '123 Example St', '021 345 6789', NULL, NULL,
  '<a real, 100-250 word description built only from what your sources actually say -- see "Description and hours" below>',
  '<real trading hours if a source states them, e.g. ''Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'', else NULL>',
  NULL, NULL,
  '["https://real-source-one.example", "https://real-source-two.example"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'example-name-suburbslug'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
```

Omit the `shopping_center_id` column and its value for a business that is not inside a centre. Slug format: `slugify(name) + '-' + suburb_slug` (lowercase, non-alphanumeric runs become single hyphens); if it already exists, append `-2`, `-3`. Use `lat`/`lng` only when a source actually gives coordinates; otherwise `NULL`. If a source gives the business's own website or a company contact email, you may fill `website` and `email` (see the enrichment runbook for the email rules).

### Description and hours

A new business's description is written once, at discovery, and (enrichment being disabled) never revisited -- so get it right here, to the same bar as a manually researched listing:

- **100 to 250 words** (aim for 110-150), third person, built only from facts your sources actually state. `validate.mjs` rejects anything shorter as a one-liner and anything longer as needing a trim.
- No sales filler ("one-stop-shop", "look no further", "world-class"), no phone number, email or link inside the text itself (those have their own columns), and never a named individual -- see the rule above.
- If your sources only support a thin, one- or two-sentence description, that is a sign you do not have enough to publish this business yet, not a reason to pad it with invented detail: find more sourced detail (what it sells or specialises in, who it serves, what makes this branch or location specific) or skip the candidate.
- Fill `hours` with the business's real trading hours, in free text (e.g. `'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'`), whenever a source actually states them -- most Google/Maps and directory listings do. Otherwise leave it `NULL`. Never guess typical hours for the category or chain.

**New shopping centre:**

```sql
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'example-mall-suburbslug', 'Example Mall',
  (SELECT id FROM suburbs WHERE slug = 'suburbslug'),
  '456 Example Rd', NULL, NULL,
  '["https://real-source-one.example", "https://real-source-two.example"]',
  'mall'
);
```

## Logging and committing

- Append one JSON line per checkpoint to `status/<city>/agent-log.jsonl` (create it if missing). Each runbook gives the exact line for its routine. `short_summary` is plain language, for a human skimming the log: what changed and why, no housekeeping narration.
- Commit exactly these files and nothing else: the checkpoint's SQL file(s), `status/<city>/agent-log.jsonl`, and any `status/<city>/state/*.json` that `done.mjs` changed. One-line commit message describing the checkpoint. Push to `main` with the "How to push" procedure below, exactly as written.
- **Commit at every checkpoint, and never let more than the routine's record cap go uncommitted** (the cap is in the packet as `maxRecordsPerFile`; `validate.mjs` enforces it). A run can be cut short at any time, so work that cleared verification must already be saved.
- A checkpoint with nothing worth publishing still gets its log line (zero counts) and its progress recorded. Do not skip the commit because the result was empty.

### How to push

The sandbox checks out a **shallow clone**, and up to 16 routines push to `main` within the same minute. A plain `git pull` fails there ("divergent branches", then "refusing to merge unrelated histories") and the run's work is lost when the sandbox is reclaimed. So every routine pushes with exactly this sequence, every checkpoint:

1. Identity, then commit **only** the files listed above:
   ```
   git config user.name "Routine bot" && git config user.email "noreply@anthropic.com"
   git add <only the files listed above>
   git commit -m "<one line>"
   ```
2. Deepen the clone, rebase onto the latest `main`, push:
   ```
   git fetch --unshallow origin main 2>/dev/null || git fetch origin main
   git pull --rebase origin main        # never --no-rebase, never a merge commit
   git push origin HEAD:main
   ```
3. If the push is rejected (someone else pushed in between), repeat the `fetch` / `pull --rebase` / `push` lines of step 2; up to 5 attempts, a few seconds apart.
4. If the rebase reports a conflict in a file you did not change this run, it is another routine's log or state: take the version from `main` (`git checkout --ours <file>`; during a rebase `--ours` means `main`), then `git add <file> && git rebase --continue`. If the conflict is in a `.jsonl` log that you and another routine both appended to, keep **both** sides: delete only the `<<<<<<<`, `=======` and `>>>>>>>` marker lines, then `git add <file> && git rebase --continue`.
5. Do **not** run `git pull` without `--rebase`, and do not use `git merge`. Never `git push --force`, never rewrite history, never amend other people's commits.
6. If after 5 attempts the push still fails, leave the commit in place, write the failure in your final message and stop.

## Where this runs

These routines are developed on the `Ethan` branch and are **not scheduled yet**. Until the cut-over described in `routines/README.md`, the older `ROUTINE.<city>.md` runbooks remain the live ones.
