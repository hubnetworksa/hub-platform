UPDATE businesses
SET description = 'Real Fish and Chips is a branch of the South African fish-and-chips franchise founded in 2009, serving old-fashioned fried fish and chips from its Game Centre outlet in Polokwane Central.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.realfishandchips.co.za/real-fish-and-chips-stores/", "https://restaurantguru.com/REAL-Fish-Chicken-and-Chips-Polokwane", "https://realfishandchips.co.za/our-franchise/"]'
WHERE slug = 'real-fish-and-chips-game-centre-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sterns is the Mall of the North branch of a South African jewellery chain founded in 1896, known for its bridal and diamond jewellery ranges and now part of The Foschini Group.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/sterns", "https://sternsonline.co.za/"]'
WHERE slug = 'sterns-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steve Madden is the Mall of the North outlet of the US footwear and accessories brand founded in 1990, known internationally for its platform shoes and fashion-forward designs.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.facebook.com/mallofthenorth/posts/871282278369366/", "https://stevemadden.co.za/apps/store-locator", "https://en.wikipedia.org/wiki/Steve_Madden,_Ltd."]'
WHERE slug = 'steve-madden-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Studio 88 is the Mall of the North branch of South Africa''s largest branded footwear and clothing retailer, an official reseller of international sneaker and sportswear brands such as Nike, adidas and Puma.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/studio-88", "https://mrpricegroup.com/studio-88/"]'
WHERE slug = 'studio-88-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sunglass Hut is the Mall of the North branch of the international eyewear retail chain founded in Miami in 1971, now part of the Luxottica group and operating thousands of stores worldwide.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/sunglass-hut", "https://en.wikipedia.org/wiki/Sunglass_Hut"]'
WHERE slug = 'sunglass-hut-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tekkie Town is the Mall of the North branch of the South African branded-footwear retailer founded in 2001, part of the Pepkor group, known for bringing name-brand sports and casual shoes to towns across the country.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/tekkie-town", "https://tekkietown.co.za/pages/about-us"]'
WHERE slug = 'tekkie-town-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'This Telkom store at Mall of the North is a retail outlet of South Africa''s state-linked telecommunications operator, offering fixed-line, mobile, broadband and device services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/telkom", "https://en.wikipedia.org/wiki/Telkom_(South_Africa)"]'
WHERE slug = 'telkom-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Body Shop is the Mall of the North branch of the ethical cosmetics chain founded in 1976, known for natural-ingredient skincare and body care and its early stand against animal testing.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/the-body-shop", "https://www.across-magazine.com/brand-history-the-body-shop/"]'
WHERE slug = 'the-body-shop-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store at Mall of the North is a branch of the South African discount variety chain founded in 1995, stocking a wide mix of household, stationery, toy and gift items across its 450-plus stores nationwide.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://evendo.com/locations/south-africa/polokwane/shop/the-crazy-store-mall-of-the-north", "https://www.biznizdirectory.co.za/crazy-store-mall-north-gift-store-retailers-retail-trade-in-polokwane-limpopo-70409.html", "https://cbn.co.za/featured/the-crazy-store-celebrates-the-opening-of-their-500th-store/"]'
WHERE slug = 'the-crazy-store-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Crazy Store at Game Centre is a branch of the South African discount variety chain founded in 1995, stocking a wide mix of household, stationery, toy and gift items across its 450-plus stores nationwide.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tiendeo.co.za/stores/polokwane/crazy-store-market-st-shop-game-centre-polokwane-south-africa/7409", "https://za.near-place.com/the-crazy-store-polokwane-game-centre-market-st-shop-3-game-centre-polokwane", "https://cbn.co.za/featured/the-crazy-store-celebrates-the-opening-of-their-500th-store/"]'
WHERE slug = 'the-crazy-store-game-centre-polokwane-central' AND description_enriched_at IS NULL;
