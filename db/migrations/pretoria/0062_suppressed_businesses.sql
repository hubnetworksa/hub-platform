-- Tombstones for businesses an admin deleted, so the AI research routines
-- never re-add them. functions/api/admin/delete-business.ts writes one row
-- per delete; scripts/write-db-snapshot.mjs copies them (plus every hidden
-- business) into the routine snapshot's `suppressed` list, which
-- scripts/routines/validate.mjs checks every new INSERT against.
CREATE TABLE IF NOT EXISTS suppressed_businesses (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  slug TEXT,
  suburb_slug TEXT,
  phone_digits TEXT,
  website TEXT,
  reason TEXT NOT NULL CHECK (reason IN ('deleted','hidden')),
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_suppressed_businesses_phone ON suppressed_businesses(phone_digits);
CREATE INDEX IF NOT EXISTS idx_suppressed_businesses_slug ON suppressed_businesses(slug);
