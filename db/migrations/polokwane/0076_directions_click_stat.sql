-- Widens business_stats to also record clicks on the Directions link
-- (functions/api/track-view.ts's new 'directions_click' event). SQLite can't
-- ALTER a CHECK constraint in place, so this recreates the table with the same
-- shape (including the search_terms migration's `query` column) and re-adds
-- every index; existing rows carry over unchanged.
ALTER TABLE business_stats RENAME TO business_stats_old;
CREATE TABLE business_stats (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  business_id INTEGER NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  event TEXT NOT NULL CHECK (event IN ('view', 'phone_click', 'website_click', 'search_appearance', 'whatsapp_click', 'directions_click')),
  ip_hash TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  query TEXT
);
INSERT INTO business_stats (id, business_id, event, ip_hash, created_at, query)
  SELECT id, business_id, event, ip_hash, created_at, query FROM business_stats_old;
DROP TABLE business_stats_old;
CREATE INDEX idx_business_stats_business_event ON business_stats(business_id, event, created_at);
CREATE INDEX idx_business_stats_dedupe ON business_stats(business_id, event, ip_hash, created_at);
CREATE INDEX IF NOT EXISTS idx_business_stats_created ON business_stats(created_at, event);
