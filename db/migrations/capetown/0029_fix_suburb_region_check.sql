-- 0001_init.sql copy-pasted Polokwane's schema wholesale, including its
-- region CHECK constraint (region IN ('polokwane','seshego','limpopo-other'))
-- -- meaningless for Cape Town. Caught while seeding real suburbs (0030).
-- No suburb, business, or shopping_center rows exist yet for this site, so
-- this is a straight recreate, not a data migration.
DROP TABLE suburbs;

CREATE TABLE suburbs (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL,
  region TEXT NOT NULL CHECK (region IN (
    'city-bowl',
    'atlantic-seaboard',
    'southern-suburbs',
    'northern-suburbs',
    'cape-flats',
    'west-coast',
    'south-peninsula',
    'helderberg'
  )),
  bio TEXT,
  landmarks TEXT, -- JSON array of strings
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);
