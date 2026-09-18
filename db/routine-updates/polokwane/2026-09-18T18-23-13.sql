UPDATE businesses
SET description = 'RLH Pharmacy is a pharmacy in Annadale, Polokwane, providing prescription medicines, over-the-counter healthcare products and pharmacy services to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'rlh-pharmacy-annadale' AND description_enriched_at IS NULL;
