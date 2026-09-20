UPDATE businesses
SET description = 'A Standard Bank service centre inside Savannah Mall, offering everyday banking services to shoppers in Fauna Park.',
    description_enriched_at = datetime('now')
WHERE slug = 'standard-bank-fauna-park-service-centre-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store is a variety discount retailer inside Savannah Mall, stocking thousands of everyday items across categories like toys, homeware, stationery, kitchenware and gifts at low prices.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://savannahmall.co.za/shop/62/", "https://www.bestdirectory.co.za/crazy-store-polokwane-savannah-mall-gifts-gift-store-retailers-retail-trade-in-faunapark-polokwane-limpopo.html", "https://dailyinvestor.com/retail/141291/south-africas-crazy-discount-store-chain-with-500-stores-and-more-than-6000-products/"]'
WHERE slug = 'the-crazy-store-savannah-mall-fauna-park' AND description_enriched_at IS NULL;
