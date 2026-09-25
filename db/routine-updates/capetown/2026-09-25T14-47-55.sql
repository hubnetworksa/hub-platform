UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'casa-labia-muizenberg' AND closed_at IS NULL;
