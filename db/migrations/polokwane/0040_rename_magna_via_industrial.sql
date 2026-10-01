-- Owner correction (2026-09-26): Magna Via is an industrial/commercial
-- area, not a residential suburb. Renaming its display name to make that
-- explicit -- property listings (Property24, Seeff, Century21, RealNet)
-- consistently call it "Magna Via Industrial". Slug is left unchanged
-- ('magna-via', seeded in 0037) so existing businesses filed under it
-- keep their link.

UPDATE suburbs SET name = 'Magna Via Industrial' WHERE slug = 'magna-via';
