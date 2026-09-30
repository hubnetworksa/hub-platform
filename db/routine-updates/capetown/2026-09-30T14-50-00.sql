UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'lekker-vegan-zonnebloem' AND closed_at IS NULL;
