UPDATE businesses
SET description = 'Francor Bakery is an independent bakery in Parow, Cape Town.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed'
WHERE slug = 'francor-bakery-parow' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Bellville Mall is a supermarket inside Bellville Mall, Bellville.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-bellville-mall-bellville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite Middestad is a supermarket inside Middestad Mall, Bellville.',
    description_enriched_at = datetime('now')
WHERE slug = 'shoprite-middestad-bellville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tosca Salon Durbanville is a hair and beauty salon inside Midville Centre, Durbanville.',
    description_enriched_at = datetime('now')
WHERE slug = 'tosca-salon-durbanville-durbanville' AND description_enriched_at IS NULL;
