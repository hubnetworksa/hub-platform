-- Cleanup: removes a duplicate I introduced in 2026-09-19T10-37-10.sql.
-- The events table already had "Cape Town International Kite Festival"
-- (2026-10-24) before that commit -- I didn't check the pre-existing
-- events array first, so my agent independently found and published the
-- same real-world festival under a slightly different title (with "2026"
-- and the "(Colour the Sky)" subtitle appended). Removing my duplicate,
-- keeping the pre-existing entry.
DELETE FROM events WHERE slug = 'cape-town-international-kite-festival-2026-2026-10-24';
