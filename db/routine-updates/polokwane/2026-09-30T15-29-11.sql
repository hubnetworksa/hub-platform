UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'food-lovers-market-thornhill-thornhill-estate' AND closed_at IS NULL;
