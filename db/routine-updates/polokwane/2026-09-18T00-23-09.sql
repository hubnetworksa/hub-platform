UPDATE businesses
SET description = 'A dental therapy practice in Mankweng, providing general dental treatment and care to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'dr-dm-moetlo-mankweng' AND description_enriched_at IS NULL;
