UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'brads-grill-harfield-village' AND closed_at IS NULL;
