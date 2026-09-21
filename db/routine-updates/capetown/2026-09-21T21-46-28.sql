UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'mzolis-place-gugulethu' AND closed_at IS NULL;
