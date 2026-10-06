-- An admin can dismiss a "what's missing" quality flag (Hub Admin's
-- Listings screen, admin-app/functions/_lib/quality.ts) for one business
-- when there's genuinely nothing to fix — e.g. "No opening hours" on a
-- business that just doesn't have fixed hours. check_key matches one of
-- quality.ts's own check keys (phone, hours, description, address,
-- category); slug is the business. Generic across every check rather than
-- hours-only, since the same "I checked, there's nothing here" need applies
-- equally to the others.
CREATE TABLE dismissed_checks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  check_key TEXT NOT NULL,
  slug TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  UNIQUE(check_key, slug)
);
