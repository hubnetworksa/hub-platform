UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'ellies-electronics-cape-ndabeni' AND closed_at IS NULL;
