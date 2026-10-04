# Content upgrade: brief for each agent

You upgrade the thin descriptions of **one batch of 50 listings** on one city site. The batches are in `content-upgrade/<city>/chunk-NNN.json`, thinnest first. The full plan is in `CONTENT-UPGRADE-PLAN.md`. Read `routines/_shared.md` as well: its verification and "never name an individual" rules apply.

**You are given:** a city and a chunk number, e.g. "pretoria, chunk 007".

**You produce:** one SQL file, `db/routine-updates/<city>/content-<NNN>.sql`, plus one log line. Then you commit and push. You never touch the database directly.

---

## For each listing in your batch

1. **Research it.** Search `"<name>" <suburb>`. If there's a `website`, open it; it's the best source.
   - Find what the business actually does, what it specialises in, notable services, products or brands, how long it has traded, and who it serves.
   - Look for its **trading hours** and **published company email** too.
   - Everything must be about **this exact branch**. Chains repeat: a Woolworths fact must be about this Woolworths.
2. **Write a new description: 80–150 words, 3–6 sentences, plain South African English.**
   - Lead with what the business does. Then specifics from your sources. Then where it is (suburb, centre, landmark or main road from the listing data or sources).
   - **Don't:** use sales filler ("one-stop shop", "look no further", "best in town"), stuff keywords, make claims about quality, or invent anything.
   - **Don't** name any person. Describe the business, not who runs it.
   - **Don't** put a phone number, email or link in the text.
3. **Write a short description: one sentence, at most 160 characters.** This is the summary shown in cards and search results.
4. **Hours:** only if found for this branch, and only if `has_hours` is false. Use one compact line, e.g. `Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed`, or `Open 24 hours`.
5. **Email:** only if `has_email` is false, and only an address the business publishes itself (`info@`, `hello@` and similar are fine).
6. **If you can't find anything new and specific, skip the listing.** Don't reword the old text into a longer version of the same thing. Write the "no sources" statement instead (below).

---

## SQL for one upgraded listing

Copy this exactly, changing only the values. Escape `'` as `''`. Leave out the `hours`, `email` or `source_urls` lines when they don't apply.

```sql
-- <slug>
INSERT INTO description_history (business_id, old_description, old_short_description, old_hours, changed_by)
SELECT id, description, short_description, hours, 'content-upgrade:<city>:<NNN>'
FROM businesses
WHERE slug = '<slug>' AND content_upgraded_at IS NULL AND length(COALESCE(description, '')) < 700
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);

UPDATE businesses SET
  description = '<80–150 words>',
  short_description = '<one sentence, max 160 characters>',
  hours = CASE WHEN hours IS NULL OR trim(hours) = '' THEN '<hours line>' ELSE hours END,
  email = CASE WHEN email IS NULL OR email = '' THEN '<email>' ELSE email END,
  source_urls = json_insert(COALESCE(source_urls, '[]'), '$[#]', '<https://source-1>', '$[#]', '<https://source-2>'),
  content_upgraded_at = datetime('now'),
  content_upgrade_status = 'upgraded'
WHERE slug = '<slug>' AND content_upgraded_at IS NULL AND length(COALESCE(description, '')) < 700
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);
```

The `WHERE` guard is what keeps claimed, paid and owner-managed businesses untouched, even ones claimed after your batch file was made. **Never shorten or remove any part of it.** Because `content_upgraded_at` is set on success, the same statement can't change a listing twice.

## SQL for a listing you couldn't upgrade

```sql
-- <slug>: no sources
UPDATE businesses SET content_upgrade_status = 'no_sources'
WHERE slug = '<slug>' AND content_upgraded_at IS NULL AND content_upgrade_status IS NULL;
```

---

## Before you push

- **Validate the file:** run `node scripts/routines/validate.mjs db/routine-updates/<city>/content-<NNN>.sql --routine content-upgrade --city <city>`. It must print `ok`. Fix or remove any failing statement.
- **Log one line** to `status/<city>/content-upgrade-log.jsonl`:
  `{"date":"<ISO>","chunk":<NNN>,"upgraded":<n>,"no_sources":<n>,"hours_found":<n>,"emails_found":<n>}`
- **Commit and push** to `main` with the message `content-upgrade <city> chunk <NNN>: <n> upgraded`. If the push is rejected, pull with rebase and push again.

The 3-hourly deploy applies the file. Batches are independent, so any number of agents can run at once on different chunks of the same city.
