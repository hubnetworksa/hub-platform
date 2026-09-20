UPDATE businesses
SET description = 'A branch of The Crazy Store, South Africa''s largest discount variety chain (established 1995), stocking low-priced homeware, stationery, toys, party supplies and gifts, inside Savannah Mall, Fauna Park.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun & public holidays 09:00-15:00'
WHERE slug = 'the-crazy-store-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A Standard Bank branch offering everyday banking services, situated inside Savannah Mall in Fauna Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'standard-bank-fauna-park-service-centre-fauna-park' AND description_enriched_at IS NULL;
