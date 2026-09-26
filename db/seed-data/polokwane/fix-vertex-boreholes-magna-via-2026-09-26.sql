-- Correction (2026-09-26, owner request): Magna Via now has its own suburb
-- row (see db/migrations/polokwane/0036_seed_magna_via_suburb.sql). Vertex
-- Boreholes was filed under Bendor for lack of one when it was added (see
-- db/routine-updates/polokwane/2026-09-16T13-05-30.sql) -- move it to
-- Magna Via now that the row exists. Slug is left unchanged (it embeds the
-- old suburb) to avoid breaking any existing link to it.

UPDATE businesses
SET suburb_id = (SELECT id FROM suburbs WHERE slug = 'magna-via')
WHERE slug = 'vertex-boreholes-bendor';
