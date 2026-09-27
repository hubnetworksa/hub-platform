UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'dolce-bakery-observatory' AND closed_at IS NULL;
