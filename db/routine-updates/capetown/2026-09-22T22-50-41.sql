UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'punjab-wok-century-city' AND closed_at IS NULL;
