-- Events: markets/gigs/sport with ticket prices up front, ported from the
-- mockup's new Events screen. Admin-managed like everything else here, plus
-- a weekly agent (see functions/api/admin/discover-events.ts) that finds
-- real upcoming events, cross-verifies them against independent non-resale
-- sources, and auto-publishes the ones that pass.
CREATE TABLE events (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT NOT NULL UNIQUE,
  title TEXT NOT NULL,
  type TEXT NOT NULL DEFAULT 'Music',
  event_date TEXT NOT NULL,
  event_time TEXT,
  venue TEXT,
  suburb TEXT,
  address TEXT,
  price TEXT NOT NULL DEFAULT 'Price TBC',
  ticket_url TEXT NOT NULL DEFAULT '#',
  host TEXT,
  image_url TEXT,
  image_credit TEXT,
  image_source TEXT,
  organiser TEXT,
  organiser_note TEXT,
  doors TEXT,
  ages TEXT,
  parking TEXT,
  traders TEXT,
  lineup_json TEXT,
  tiers_json TEXT,
  description TEXT NOT NULL DEFAULT '',
  featured INTEGER NOT NULL DEFAULT 0,
  -- 'admin' (added by hand in the admin console) or 'agent' (the weekly
  -- discovery job) — image_source/verification_json are audit trail for
  -- the copyright and fact-checking asked for alongside this table.
  source TEXT NOT NULL DEFAULT 'admin',
  verification_json TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX idx_events_date ON events(event_date);

INSERT INTO site_settings (key, value) VALUES ('price_event_feature_cents', '45000');
