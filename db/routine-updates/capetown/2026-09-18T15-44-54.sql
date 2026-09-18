-- Job 5: closed-business check
UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'royale-eatery-cape-town-cbd' AND closed_at IS NULL;
