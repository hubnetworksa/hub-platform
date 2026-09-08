-- Adds a slot for a suburb hero photo, stored in R2 (the polokwanehub-media
-- bucket) rather than committed to git — these are
-- real photos supplied by the site owner per suburb, not build-time assets.
-- Stores the R2 object key (e.g. 'suburbs/bendor.jpg'), not a full URL,
-- so the serving path (functions/media/[[path]].ts) can change without a
-- data migration.

ALTER TABLE suburbs ADD COLUMN image_key TEXT;
