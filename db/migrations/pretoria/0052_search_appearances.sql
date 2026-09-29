-- Widens business_stats to also record a business showing up in someone's
-- search results (functions/api/track-view.ts's new 'search_appearance'
-- event) — the last stat tile on the owner dashboard that still honestly
-- said "no data yet". SQLite can't ALTER a CHECK constraint in place, so
-- this recreates the table with the same shape and re-adds its indexes;
-- any existing rows carry over unchanged.
ALTER TABLE business_stats RENAME TO business_stats_old;
CREATE TABLE business_stats (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  business_id INTEGER NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  event TEXT NOT NULL CHECK (event IN ('view', 'phone_click', 'website_click', 'search_appearance')),
  ip_hash TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
INSERT INTO business_stats (id, business_id, event, ip_hash, created_at)
  SELECT id, business_id, event, ip_hash, created_at FROM business_stats_old;
DROP TABLE business_stats_old;
CREATE INDEX idx_business_stats_business_event ON business_stats(business_id, event, created_at);
CREATE INDEX idx_business_stats_dedupe ON business_stats(business_id, event, ip_hash, created_at);
