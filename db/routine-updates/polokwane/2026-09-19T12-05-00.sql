UPDATE businesses
SET description = 'Timberland is the Mall of the North branch of the American outdoor footwear and apparel brand whose roots trace to 1918, famous for its original yellow work boot launched in 1973.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/timberland", "https://www.timberland.com/en-us/about-us"]'
WHERE slug = 'timberland-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tops at Spar at Game Centre is a branch of the SPAR Group''s liquor store format, stocking spirits, wine, beer and cider alongside a home delivery service.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-19:00, Sun 09:00-14:00',
    source_urls = '["https://my-catalogue.co.za/stores/polokwane/tops-at-spar/game-shopping-centre-corner-hospital-and-market-str", "https://www.tiendeo.co.za/polokwane/spar-tops", "https://www.topsatspar.co.za/Home/"]'
WHERE slug = 'tops-game-centre-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Torga Optical is the Mall of the North branch of a South African optical chain founded in 1984, the country''s only vertically integrated optical retailer with its own German-precision lens manufacturing facility.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://torgaoptical.co.za/mall-of-the-north", "https://torgaoptical.co.za/about-us"]'
WHERE slug = 'torga-optical-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Totalsports at Mall of the North is a branch of the sporting goods retailer founded in 1982, now part of The Foschini Group and the largest sports retail chain in Southern Africa, stocking footwear and apparel from brands including Nike, adidas and Puma.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/totalsports", "https://startupmag.co.za/2025/02/totalsports-from-humble-beginnings-to-south-africas-premier-sports-retailer/"]'
WHERE slug = 'totalsports-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Travelex at Mall of the North is a branch of the international foreign exchange company founded in London in 1976, offering currency exchange and related travel money services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://rsa.worldorgs.com/catalog/polokwane/currency-exchange-service/travelex-mall-of-the-north", "https://www.travelex-corporate.com/about-us/our-history"]'
WHERE slug = 'travelex-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Truworths Elements at Mall of the North is a beauty and cosmetics department of the Truworths retail group, a concept launched in 1999 and now operating in dozens of Truworths stores nationwide.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00',
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/truworths", "https://www.clarins.co.za/en/stores/southafrica/polokwane/truworths_mall_of_the_north-68040"]'
WHERE slug = 'truworths-elements-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'United Furniture Outlets (UFO) at Game Centre is a branch of the cash furniture retailer established in 2004 and acquired by the Lewis Group in 2018, offering household furniture and appliances.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:30, Sat 09:00-16:00, Sun 09:00-14:00',
    source_urls = '["https://www.unitedfurnitureoutlets.co.za/stores/polokwane-game-centre/", "https://www.brabys.com/za/limpopo/polokwane/u-f-o-united-furniture-outlets", "https://www.lewisgroup.co.za/our-brands/united-furniture-outlets/"]'
WHERE slug = 'united-furniture-outlets-game-centre-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Vodacom Shop at Mall of the North is a retail outlet of South Africa''s largest mobile network operator, a subsidiary of the Vodafone Group, offering mobile contracts, devices and related services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/vodacom", "https://en.wikipedia.org/wiki/Vodacom"]'
WHERE slug = 'vodacom-shop-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wimpy at Mall of the North is a branch of the family restaurant chain that first opened in South Africa in 1967 and has been part of Famous Brands since 2007, serving burgers, breakfasts and all-day meals.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/wimpy", "https://businesstech.co.za/news/business/790931/how-an-international-food-chain-became-a-south-african-icon/"]'
WHERE slug = 'wimpy-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'iStore at Mall of the North is a branch of South Africa''s largest Apple Premium Reseller, founded in 2005, selling Apple products alongside trade-in and Apple-certified repair services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.istore.co.za/storelocator/istore_mall_of_the_north", "https://www.cybo.com/ZA-biz/istore-mall-of-the-north", "https://www.istore.co.za/about-us"]'
WHERE slug = 'istore-bendor' AND description_enriched_at IS NULL;
