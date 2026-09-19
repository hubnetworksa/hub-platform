-- Cleanup: removes a duplicate I introduced in 2026-09-19T10-37-10.sql.
-- The events table already had "Vodacom Bulls vs Lions (URC)"
-- (2026-10-10) before that commit -- I didn't check the pre-existing
-- events array first, so my agent independently found and published the
-- same fixture under a slightly different title. Removing my duplicate,
-- keeping the pre-existing entry.
DELETE FROM events WHERE slug = 'bulls-vs-lions-united-rugby-championship-round-3-2026-10-10';
