UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'bruegels-pizza-studio-mowbray' AND closed_at IS NULL;
