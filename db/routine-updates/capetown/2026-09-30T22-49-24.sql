UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'lupa-osteria-durbanville' AND closed_at IS NULL;
