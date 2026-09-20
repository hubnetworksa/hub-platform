UPDATE businesses
SET description = 'A Standard Bank branch inside Savannah Mall, Fauna Park, providing banking services to the surrounding area.',
    description_enriched_at = datetime('now')
WHERE slug = 'standard-bank-fauna-park-service-centre-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A general retail store inside Savannah Mall, Fauna Park, part of the Crazy Store chain.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-crazy-store-savannah-mall-fauna-park' AND description_enriched_at IS NULL;
