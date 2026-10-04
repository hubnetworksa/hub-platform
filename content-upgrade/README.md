# Content upgrade: brief for each agent

You upgrade the thin descriptions of **one batch of 50 listings** on one city site. The batches are in `content-upgrade/<city>/chunk-NNN.json`, thinnest first. The full plan is in `CONTENT-UPGRADE-PLAN.md`. Read `routines/_shared.md` as well: its verification and "never name an individual" rules apply.

**You are given:** a city and a chunk number, e.g. "pretoria, chunk 007".

**You produce:** one SQL file, `db/routine-updates/<city>/content-<NNN>.sql`, with an upgrade for **every one of the 50 listings**, plus one log line. Then you commit and push. You never touch the database directly.

---

## Every listing gets a full description

**There is no "skip" or "couldn't find anything" outcome.** Every listing in your batch must leave with an 80–150 word description, a one-line summary, and every detail you could verify. What changes is where the content comes from, and you must never invent a fact to get there.

### 1. Research (always, every listing)

Work through these until you have enough for 80–150 words of specific content:

1. **The listing's `existing_sources`.** These are the pages the listing was built from: centre tenant lists, directory entries (Cylex, Brabys and others). Re-read them; they often carry services, brands, hours or a short "about".
2. **The business's `website`**, if there is one: home, about, services and contact pages.
3. **A search for `"<name>" <suburb>`, then `"<name>" <city>`**, looking for:
   - its Google listing (category, hours, review highlights);
   - Facebook or Instagram pages;
   - other directories (Brabys, Yellow Pages SA, Snupit, Cylex);
   - Hellopeter;
   - industry body registers;
   - news.
4. **For a chain branch** (bank, supermarket, pharmacy, fast food, fuel): the chain's own store locator page for **this branch** (hours and branch services), plus the chain's own site for what **every** branch offers.
5. **For a listing inside a shopping centre:** the centre's own site (`shopping_centre`). Use the tenant page, the centre's trading hours, anchors and parking.

### 2. Write: 80–150 words, 3–6 sentences, plain South African English

Use everything you verified, in this order:

- **What it does:** the category, then the specific services, products and brands from your sources. For a chain, what this branch offers. Chain-wide facts must come from the chain's own site and must apply to every branch.
- **What makes it specific:** years trading, who it serves, appointments versus walk-ins, delivery, languages. Sourced only.
- **Where it is:** the full address detail you hold, the centre it's in and what that centre is (e.g. "Savannah Mall, a regional shopping centre on the corner of Grobler Street and Grid Road"), the suburb and where that sits in the city, and the nearest main road or landmark. Use only facts from the batch data or a source you read; nothing from memory.
- **Practical details:** trading hours (yours or the centre's, clearly labelled as the centre's if that's what they are), parking at the centre, and that the phone number and directions are on this page.

**If your research really adds nothing about the business itself,** the description is built from the verified details above: what the category is, the full location context, the centre, the suburb, practical access and hours. That still reaches 80 words without a single invented claim. Mark it `from_known_details` (SQL below) so a later pass can look again.

**Never, in any case:**
- **Never claim a service, product, brand, price, year or quality** you didn't read in a source about this business (or, for chains, on the chain's own site for all branches).
- **Never write "they offer X" from the category name alone.** You can say what kind of business it is, not what it does on a given day.
- **Never name a person.**
- **Never put a phone number, email or link in the text.**
- **Never use sales filler** ("one-stop shop", "look no further", "best in town").

Example of a "from known details" description for a listing with nothing extra online. It has 88 words, and every fact comes from the batch data or its existing sources:

> Capitec Bank in Savannah Mall is a bank branch in Fauna Park, Polokwane. It is at Shop G35 in Savannah Mall, on the corner of Grobler Street and Grid Road, and is one of the stores listed on the centre's own tenant directory. Being inside the mall, it is easy to combine a visit with other shopping at the centre. The branch's phone number and map directions are on this page. Trading hours have not been confirmed here yet, so it is worth calling ahead before you visit.

(For Capitec the chain's own site would add sourced details too; that would be the "researched" version.)

### 3. Also fill when found (for this exact branch)

- **Short description:** one sentence, at most 160 characters. Always written.
- **Hours:** only if `has_hours` is false. Use one compact line, e.g. `Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed`. A centre's hours aren't the shop's hours: put them in the description text, not in this field.
- **Email:** only if `has_email` is false, and only an address the business publishes itself.

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
  content_upgrade_status = '<researched | from_known_details>'
WHERE slug = '<slug>' AND content_upgraded_at IS NULL AND length(COALESCE(description, '')) < 700
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id);
```

The `WHERE` guard is what keeps claimed, paid and owner-managed businesses untouched, even ones claimed after your batch file was made. **Never shorten or remove any part of it.** Because `content_upgraded_at` is set on success, the same statement can't change a listing twice.

`content_upgrade_status` is `researched` when the description contains new sourced facts about the business, and `from_known_details` when it was built from the details we already held. Leave out the `source_urls` line only if you used no new source at all.

## Before you push

- **Validate the file:** run `node scripts/routines/validate.mjs db/routine-updates/<city>/content-<NNN>.sql --routine content-upgrade --city <city>`. It must print `ok`. Fix or remove any failing statement.
- **Log one line** to `status/<city>/content-upgrade-log.jsonl`:
  `{"date":"<ISO>","chunk":<NNN>,"researched":<n>,"from_known_details":<n>,"hours_found":<n>,"emails_found":<n>}`
- **Make sure all 50 listings have an UPDATE.** Then commit and push to `main` with the message `content-upgrade <city> chunk <NNN>: <n> researched, <n> from known details`. If the push is rejected, pull with rebase and push again.

The 3-hourly deploy applies the file. Batches are independent, so any number of agents can run at once on different chunks of the same city.
