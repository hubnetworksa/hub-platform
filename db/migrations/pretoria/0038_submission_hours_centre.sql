-- The "Add your business" form collects trading hours and a shopping centre.
-- Keep them on the pending submission so approving it can copy them onto the
-- published business (businesses.hours / businesses.shopping_center_id).
ALTER TABLE pending_submissions ADD COLUMN hours TEXT;
ALTER TABLE pending_submissions ADD COLUMN shopping_center_slug TEXT;
