-- The date of the last real search impression for this exact name — distinct
-- from checked_at (when OUR tool last asked Google), since Search Console can
-- report a decent average position while the underlying impressions are
-- weeks old. NULL alongside position IS NULL (no recorded searches at all).
ALTER TABLE name_position ADD COLUMN last_impression_date TEXT;
