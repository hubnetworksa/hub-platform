-- Events: markets/gigs/sport with ticket prices up front. Admin-manageable
-- in principle, but for now populated exclusively by the weekly events
-- research routine (see ROUTINE.events.polokwane.md), which finds real
-- upcoming events, cross-verifies them against independent non-resale
-- sources, and proposes them the same way the hourly business routine
-- proposes businesses (a SQL file under db/routine-updates/).
--
-- IF NOT EXISTS: this production database already had an `events` table
-- with this exact schema before this migration was ever tracked (created
-- by hand during earlier feature work, outside the migrations system).
-- A bare CREATE TABLE fails with "table already exists" against that
-- state, so this is written to be safe whether or not the table is
-- already there -- it never alters an existing table's columns or rows.
CREATE TABLE IF NOT EXISTS events (
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
  -- 'admin' (added by hand) or 'agent' (the weekly discovery routine) —
  -- image_source/verification_json are the audit trail for copyright and
  -- fact-checking.
  source TEXT NOT NULL DEFAULT 'admin',
  verification_json TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_events_date ON events(event_date);
