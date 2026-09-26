UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'cheynes-hout-bay' AND closed_at IS NULL;
