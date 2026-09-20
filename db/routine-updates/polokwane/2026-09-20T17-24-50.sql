UPDATE businesses
SET description = 'The Crazy Store at Savannah Mall is a discount variety retailer, part of a national chain of more than 375 stores, stocking an eclectic mix of gifts, toys, stationery and home decor items in Fauna Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-crazy-store-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Standard Bank''s Fauna Park Service Centre is a bank branch inside Savannah Mall, offering everyday banking services to shoppers and residents in Fauna Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'standard-bank-fauna-park-service-centre-fauna-park' AND description_enriched_at IS NULL;
