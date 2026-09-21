UPDATE businesses
SET description = 'Standard Bank Fauna Park Service Centre is a Standard Bank banking service point inside Savannah Mall, offering everyday banking services to shoppers in Fauna Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'standard-bank-fauna-park-service-centre-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store Savannah Mall is a discount variety and gift store inside Savannah Mall, Fauna Park, part of the national Crazy Store retail chain, stocking gifts, stationery and household items.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun & public holidays 09:00-15:00',
    source_urls = '["https://savannahmall.co.za/shop/62/", "https://www.bestdirectory.co.za/crazy-store-polokwane-savannah-mall-gifts-gift-store-retailers-retail-trade-in-faunapark-polokwane-limpopo.html"]'
WHERE slug = 'the-crazy-store-savannah-mall-fauna-park' AND description_enriched_at IS NULL;
