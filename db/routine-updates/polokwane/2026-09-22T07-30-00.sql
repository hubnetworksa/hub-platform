UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'royal-auto-body-superbia' AND closed_at IS NULL;
