-- Ports the old (pre-migration) Polokwane repo's closed_at column: an
-- hourly automated job there re-verifies published businesses and soft-flags
-- ones confirmed closed, rather than deleting the row outright.
ALTER TABLE businesses ADD COLUMN closed_at TEXT;
