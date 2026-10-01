-- Records the search term behind each 'search_appearance' row, so the owner
-- dashboard's "What people searched to find you" card can list real terms
-- instead of only counting appearances. Only search_appearance rows carry a
-- value (functions/api/track-view.ts); every other event leaves it NULL.
ALTER TABLE business_stats ADD COLUMN query TEXT;
