-- Honest, first-party counters for the owner dashboard's "Profile views" /
-- "Phone clicks" / "Website clicks" tiles, which previously always showed
-- "No data yet" because nothing tracked them at all. One row per event, so
-- it can be aggregated over any window (last 30 days, all time, etc.) and
-- so a single dedupe check (same visitor, same business, same event, same
-- day) can keep casual page-reloads from inflating the count — see
-- functions/api/track-view.ts, the only writer.
CREATE TABLE business_stats (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  business_id INTEGER NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  event TEXT NOT NULL CHECK (event IN ('view', 'phone_click', 'website_click')),
  ip_hash TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX idx_business_stats_business_event ON business_stats(business_id, event, created_at);
-- Dedupe lookups filter by ip_hash within the last day; this index serves that.
CREATE INDEX idx_business_stats_dedupe ON business_stats(business_id, event, ip_hash, created_at);
