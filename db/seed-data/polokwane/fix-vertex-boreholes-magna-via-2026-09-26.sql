-- Correction (2026-09-26, owner request): Magna Via has its own suburb row
-- (seeded independently on main by
-- db/migrations/polokwane/0037_seed_industria_laboria_magna_via_suburbs.sql,
-- since renamed to "Magna Via Industrial" by 0040). Vertex Boreholes was
-- filed under Bendor for lack of one when it was added (see
-- db/routine-updates/polokwane/2026-09-16T13-05-30.sql) -- move it to
-- Magna Via now that the row exists. Slug is left unchanged (it embeds the
-- old suburb) to avoid breaking any existing link to it.

UPDATE businesses
SET suburb_id = (SELECT id FROM suburbs WHERE slug = 'magna-via')
WHERE slug = 'vertex-boreholes-bendor';
