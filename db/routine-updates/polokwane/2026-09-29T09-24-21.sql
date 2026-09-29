UPDATE businesses
SET description = 'Rite Price Liquor Store is a liquor store serving the Ladanna area of Polokwane.',
    description_enriched_at = datetime('now')
WHERE slug = 'rite-price-liquor-store-ladanna' AND description_enriched_at IS NULL;
