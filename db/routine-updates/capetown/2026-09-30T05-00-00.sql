UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'knead-bakery-cafe-gardens' AND closed_at IS NULL;
