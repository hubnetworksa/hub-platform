-- Google's own recorded average position/impressions/clicks for searches of
-- a business's exact NAME (Search Console Performance API, filtered to that
-- query string) — not the blended "average position across every query"
-- the owner already has, which can say "position 3" while a name search
-- finds nothing. One row per business; overwritten on each recheck, no
-- history kept (unlike gsv_checks) since this isn't tracked as a day-by-day
-- series, just a current reading.
CREATE TABLE name_position (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  site TEXT NOT NULL,
  business_id INTEGER NOT NULL,
  slug TEXT NOT NULL,
  name TEXT NOT NULL,
  position REAL,              -- NULL: no recorded searches for this exact name in the window
  impressions INTEGER,
  clicks INTEGER,
  checked_at TEXT,             -- NULL until first checked
  claimed_at TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now')),
  UNIQUE(site, business_id)
);
CREATE INDEX idx_name_position_due ON name_position(site, checked_at);
