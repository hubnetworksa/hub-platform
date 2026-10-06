-- An admin can mark a flagged "possible duplicate" group (Hub Admin's
-- Listings screen, admin-app/functions/_lib/quality.ts) as not actually a
-- duplicate. group_key is the group's business slugs, sorted and joined
-- by comma — the same identity quality.ts already uses to dedupe a pair
-- found by more than one reason, so it's stable regardless of which rule
-- (phone/website/name) flagged it.
CREATE TABLE dismissed_duplicates (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  group_key TEXT NOT NULL UNIQUE,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
