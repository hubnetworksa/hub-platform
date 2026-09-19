UPDATE businesses
SET description = 'Legit is a South African women''s fashion and accessories retailer aimed at the middle-to-lower income market, operating in over 460 stores across South Africa, Namibia, Botswana, Lesotho and eSwatini under the Retailability group; this Mall of the North store is one of its Polokwane branches.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.sayellow.com/view/south-africa/legit-mall-of-the-north-in-polokwane", "https://www.bizcommunity.com/Article/196/182/205965.html"]'
WHERE slug = 'legit-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Levi''s is a global denim and jeans brand founded in 1873; the company re-entered the South African market in 1994 following the country''s first democratic elections and now has offices in Cape Town, Johannesburg and Durban, with some ranges manufactured locally at its Epping facility.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/levis", "https://www.levi.co.za/pages/about"]'
WHERE slug = 'levis-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lovisa is an Australian fast-fashion jewellery chain founded in Sydney in 2010, with more than 1,000 stores across over 50 countries including South Africa; stores stock affordable, trend-led jewellery with new styles arriving weekly.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.ivote.co.za/view/south-africa/lovisa-mall-of-the-north-in-polokwane", "https://www.facebook.com/mallofthenorth/photos/the-beautiful-new-look-lovisa-store-in-shoppolokwane-mallofthenorth-is-official-/1474937712572501/", "https://en.wikipedia.org/wiki/Lovisa_(company)"]'
WHERE slug = 'lovisa-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'MTN is a South African mobile network operator; this Savannah Mall store sells SIM cards, contracts, devices and accessories, and handles account and support queries for customers in Fauna Park and the surrounding suburbs.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-15:00',
    source_urls = '["https://savannahmall.co.za/shops/", "https://www.mtn.co.za/home/coverage/store/mtn-store-savanna-mall", "https://savannahmall.co.za/shop/64/"]'
WHERE slug = 'mtn-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Markham is a men''s fashion retail chain selling jeans, smartwear, footwear and accessories, and is the largest standalone men''s fashion chain in Southern Africa with over 325 stores; it operates as part of TFG (The Foschini Group). This branch trades from Savannah Mall in Fauna Park.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://savannahmall.co.za/shops/", "https://www.tiendeo.co.za/stores/polokwane/markham-savannah-mall-cnr-grimm-thabo-mbeki-street/72776", "https://en.wikipedia.org/wiki/TFG_Limited"]'
WHERE slug = 'markham-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Maxi''s is a long-running South African restaurant and takeaway chain, in operation for more than 30 years and known for generous portions and affordable pricing; this branch trades from the Game Centre in Polokwane''s CBD.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.near-place.com/maxis-polokwane", "https://www.yep.co.za/biz/store/maxis-restaurant/340576", "https://maxisfood.com/"]'
WHERE slug = 'maxis-game-centre-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Miladys is a South African women''s fashion retailer founded in 1947 in Pinetown, KwaZulu-Natal, and part of the Mr Price Group since 1987; it stocks clothing, footwear and accessories in sizes 32 to 50. This branch trades from Savannah Mall in Fauna Park.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://savannahmall.co.za/shops/", "https://www.yep.co.za/biz/store/miladys-savannah-mall/296829", "https://www.miladys.com/our_story_ml"]'
WHERE slug = 'miladys-savannah-mall-fauna-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Miladys is a South African women''s fashion retailer founded in 1947 in Pinetown, KwaZulu-Natal, and part of the Mr Price Group since 1987; it stocks clothing, footwear and accessories in sizes 32 to 50. This branch trades from Mall of the North in Bendor.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.miladys.com/miladys-mall-of-the-north-polokwane-40418", "https://www.yep.co.za/biz/store/miladys/285732", "https://www.miladys.com/our_story_ml"]'
WHERE slug = 'miladys-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Price is a South African discount fashion retailer founded in 1985 in Durban, now the group''s flagship chain with over 3,000 stores nationwide, known for affordable, on-trend clothing and homeware. This branch trades from Mall of the North in Bendor.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/mr-price", "https://en.wikipedia.org/wiki/Mr_Price_Group"]'
WHERE slug = 'mr-price-mall-of-the-north-bendor' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Mr Price Home is the homeware and furniture chain of the Mr Price Group, with around 150 stores across South Africa offering contemporary, affordable homeware, furniture and decor. This branch trades from Mall of the North in Bendor.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://mallofthenorth.co.za/stores/", "https://www.tiendeo.co.za/stores/polokwane/mr-price-home", "https://en.wikipedia.org/wiki/Mr_Price_Group"]'
WHERE slug = 'mr-price-home-mall-of-the-north-bendor' AND description_enriched_at IS NULL;
