UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'melissas-the-food-shop-gardens' AND closed_at IS NULL;
