-- Remove "Guys Shop" (Bendor) at the owner's request. Its live description
-- was literal Lorem ipsum placeholder text -- this was test/placeholder
-- data that ended up published (is_test = 0) rather than a real business,
-- so there's nothing here worth a closed_at "this business shut down"
-- marker. Using status = 'rejected' (per the businesses table's own
-- comment: "kept for audit/dedupe only, never rendered") rather than a
-- hard DELETE, so it stays out of the live build (scripts/fetch-d1-data.mjs
-- filters status = 'published') while leaving an audit trail.

UPDATE businesses SET status = 'rejected'
WHERE slug = 'guys-shop-bendor' AND status = 'published';
