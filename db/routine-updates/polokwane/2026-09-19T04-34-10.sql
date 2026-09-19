-- Job 4: description enrichment sweep, checkpoint 2 of 2 (records 11-20)
UPDATE businesses
SET description = 'A South African sneaker retailer inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now')
WHERE slug = 'bathu-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A biltong and dried-meat specialist inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00'
WHERE slug = 'biltong-pret-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The first Birkenstock store in Limpopo, featuring the brand''s newer sustainable store concept, inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now')
WHERE slug = 'birkenstock-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A menswear retailer offering stylish, fashionable clothing for men, inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now')
WHERE slug = 'bogart-man-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A fashion and clothing retailer inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00'
WHERE slug = 'brazilia-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A jewellery retailer inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00'
WHERE slug = 'browns-jewellers-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A Burger King fast-food restaurant inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now')
WHERE slug = 'burger-king-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A bank branch inside Savannah Mall, Fauna Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'capitec-bank-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A bank branch inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-14:00, Sun Closed'
WHERE slug = 'capitec-bank-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'A cafe and pizzeria inside Mall of the North, Bendor.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/cappuccinos-shop-u-mall-of-the-north-shopping-centre-corner-of-n-r-bendor/35806", "https://www.tripadvisor.com/Restaurant_Review-g312624-d5427168-Reviews-Cappuccino_s_Cafe_Pizzeria-Polokwane_Limpopo_Province.html"]'
WHERE slug = 'cappuccinos-mall-of-the-north-bendor' AND description_enriched_at IS NULL;
