-- 0029's DROP TABLE/CREATE TABLE (fixing the region CHECK constraint) only
-- copied 0001_init.sql's original suburbs columns, forgetting that 0004
-- and 0013 had each already ALTERed the live table to add lat/lng and
-- image_key by the time 0029 ran -- so 0029 silently dropped those three
-- columns, breaking scripts/fetch-d1-data.mjs (which selects them) on the
-- very next deploy. Already applied against the real D1 database, so this
-- is a forward fix (restore via ALTER), not an edit to 0029 itself.
ALTER TABLE suburbs ADD COLUMN lat REAL;
ALTER TABLE suburbs ADD COLUMN lng REAL;
ALTER TABLE suburbs ADD COLUMN image_key TEXT;
