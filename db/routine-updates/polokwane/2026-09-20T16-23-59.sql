UPDATE businesses
SET description = 'Standard Bank Fauna Park Service Centre is a Standard Bank branch offering banking services, located inside Savannah Mall in Fauna Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'standard-bank-fauna-park-service-centre-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store Savannah Mall is a general retail store inside Savannah Mall in Fauna Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-crazy-store-savannah-mall-fauna-park' AND description_enriched_at IS NULL;
