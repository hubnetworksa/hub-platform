-- Job 4: description enrichment sweep, checkpoint 1 of 2 (records 1-10)
UPDATE businesses
SET description = 'A furniture, home décor and homeware retailer inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-17:00, Tue-Sat 09:00-19:00, Sun 09:00-17:00'
WHERE slug = 'at-home-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A footwear retailer inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now')
WHERE slug = 'aldo-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A fashion and clothing retailer inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00',
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/ackermans", "https://my-catalogue.co.za/stores/polokwane/ackermans/mall-of-the-north-r81-n1"]'
WHERE slug = 'ackermans-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A fashion and clothing retailer inside Checkers Centre, Polokwane Central.',
    description_enriched_at = datetime('now')
WHERE slug = 'ackermans-checkers-centre-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A bank branch inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now')
WHERE slug = 'african-bank-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A family-friendly Spur steakhouse serving steak, ribs, burgers and wings, inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now')
WHERE slug = 'amarillo-spur-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A jewellery and accessories retailer inside Savannah Mall, Fauna Park.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00',
    source_urls = '["https://savannahmall.co.za/shops/", "https://www.tiendeo.co.za/stores/polokwane/american-swiss-savannah-mall-cnr-grimm-thabo-mbeki-street/75940", "https://savannahmall.co.za/shop/24/"]'
WHERE slug = 'american-swiss-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A jewellery and accessories retailer inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now')
WHERE slug = 'american-swiss-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A footwear retailer inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00',
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://bash.com/store/archive-mall-of-the-north-polokwane-limpopo-0699/061173", "https://businessfindersa.com/business/archive---mall-of-the-north/"]'
WHERE slug = 'archive-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A baby and toddler products retailer inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00'
WHERE slug = 'babies-r-us-mall-of-the-north-bendor' AND description_enriched_at IS NULL;
