-- Groups businesses by physical shopping centre/mall — independent of
-- suburb and category (a business belongs to at most one of these, in
-- addition to its suburb and categories). Directly fixes the "3 Steers in
-- the same suburb, all showing identically" problem: same chain, same
-- suburb, different malls.

CREATE TABLE shopping_centers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  slug TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL,
  suburb_id INTEGER REFERENCES suburbs(id),
  address TEXT,
  lat REAL,
  lng REAL,
  source_urls TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

ALTER TABLE businesses ADD COLUMN shopping_center_id INTEGER REFERENCES shopping_centers(id);

CREATE INDEX idx_businesses_shopping_center ON businesses(shopping_center_id);
