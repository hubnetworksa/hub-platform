-- Test businesses used to verify the (dev-only) page builder live on the
-- same shared D1 database production reads from — a status of 'published'
-- alone can't tell "visible on dev" apart from "visible on production",
-- since both sites' builds run the identical query against this same
-- database. is_test marks a row as dev-only: scripts/fetch-d1-data.mjs
-- excludes it unless INCLUDE_TEST_DATA=true, which only the dev preview's
-- deploy workflow sets — production never sees it regardless of status.
ALTER TABLE businesses ADD COLUMN is_test INTEGER NOT NULL DEFAULT 0;
