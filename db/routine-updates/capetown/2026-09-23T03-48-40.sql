-- Job 5: closed-business check
UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'rocomamas-green-point' AND closed_at IS NULL;
