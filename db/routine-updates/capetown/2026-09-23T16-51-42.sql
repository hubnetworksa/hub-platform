-- Job 5: closed-business check, batch of 5 (Shoprite Bishop Lavis..Shoprite Durbanville)

UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'shoprite-bishop-lavis-bishop-lavis' AND closed_at IS NULL;

UPDATE businesses SET closed_at = datetime('now')
WHERE slug = 'shoprite-delft-mall-delft' AND closed_at IS NULL;
