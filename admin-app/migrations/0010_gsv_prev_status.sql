-- Tracks each check's status immediately before it ran, so a day's genuine
-- "became indexed" / "dropped from index" counts can be computed later —
-- the net day-over-day change already shown elsewhere hides this (10 pages
-- becoming indexed while 8 different ones drop nets to +2, not 10).
ALTER TABLE gsv_checks ADD COLUMN prev_status TEXT;
