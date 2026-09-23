UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'shoprite-eerste-river-grand-central-eerste-river' AND closed_at IS NULL;

UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'shoprite-khayelitsha-cbd-khayelitsha' AND closed_at IS NULL;

UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'shoprite-lansdowne-corner-lansdowne' AND closed_at IS NULL;
