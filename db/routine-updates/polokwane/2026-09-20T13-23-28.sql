UPDATE businesses
SET description = 'Standard Bank Fauna Park Service Centre is a bank branch operating inside Savannah Mall in Fauna Park, offering everyday banking services to shoppers and the surrounding suburb.',
    description_enriched_at = datetime('now')
WHERE slug = 'standard-bank-fauna-park-service-centre-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store Savannah Mall is the Fauna Park branch of the national Crazy Store discount variety chain, stocking toys, homeware, stationery, party goods and gifts at Shop 62 in Savannah Mall.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://savannahmall.co.za/shop/62/", "https://www.bestdirectory.co.za/crazy-store-polokwane-savannah-mall-gifts-gift-store-retailers-retail-trade-in-faunapark-polokwane-limpopo.html", "https://www.crazystore.co.za/"]'
WHERE slug = 'the-crazy-store-savannah-mall-fauna-park' AND description_enriched_at IS NULL;
