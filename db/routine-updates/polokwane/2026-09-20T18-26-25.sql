UPDATE businesses
SET description = 'Standard Bank Fauna Park Service Centre is a bank branch providing everyday banking services, located inside Savannah Mall in Fauna Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'standard-bank-fauna-park-service-centre-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store Savannah Mall is a discount variety store inside Savannah Mall, Fauna Park, stocking books and gifts, home decor, and toys.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-crazy-store-savannah-mall-fauna-park' AND description_enriched_at IS NULL;
