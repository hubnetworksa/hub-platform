UPDATE businesses
SET description = 'Nampak Liquid Packaging is an industrial supplier and manufacturer in Seshego, producing packaging for liquid products.',
    description_enriched_at = datetime('now')
WHERE slug = 'nampak-liquid-packaging-seshego' AND description_enriched_at IS NULL;
