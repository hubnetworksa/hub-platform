-- Job 4: description enrichment sweep, checkpoint 1 of 2 (10 businesses)

UPDATE businesses
SET description = 'Ackermans is a South African value retailer offering affordable clothing, footwear and homeware for women, men, kids and babies; this branch trades from Shop 33 in Delft Mall, Delft.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-20:00, Sat 09:00-18:00, Sun 09:00-17:00',
    source_urls = '["https://www.tiendeo.co.za/stores/mfuleni/ackermans-delft-mallcnr-hindle-delft-main-rd/45343", "https://my-catalogue.co.za/stores/cape-town/ackermans/cnr-hindle-road-and-delft-main-road-delft", "https://www.ackermans.co.za/"]'
WHERE slug = 'ackermans-delft-mall-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks is a South African health, beauty and pharmacy retail chain, offering personal care, beauty products, over-the-counter medication and an in-store pharmacy; this Shop 7 branch trades in Delft Mall, Delft.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-14:00, Tue-Wed 08:30-18:00, Thu 09:00-18:00, Fri-Sat 08:30-18:00, Sun 08:00-17:00',
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/clicks-delft-mall-shop-delft-mall-hindle-road/55798", "https://clicks.co.za/store/Delft/1859", "https://en.wikipedia.org/wiki/Clicks_(South_Africa)"]'
WHERE slug = 'clicks-delft-mall-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Esack''s Pharmacy is a pharmacy in Hanover Park, operating from Shop 6b in the Town Centre on Surran Road.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat-Sun Closed'
WHERE slug = 'esacks-pharmacy-hanover-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lord''s Unisex Hairstylists is a hair salon offering cuts, styling and grooming for men and women, trading from Shop 9 in Sherwood Shopping Centre, Bergvliet.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 08:00-17:00, Sun Closed'
WHERE slug = 'lords-unisex-hairstylists-bergvliet' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP is South Africa''s largest single-brand retailer, offering affordable clothing, footwear and homeware alongside cellular and financial services; this branch trades from Shop 32 in Delft Mall, Delft.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:30-17:30, Wed 09:00-17:30, Thu-Fri 08:30-17:30, Sat 08:30-16:00, Sun 09:00-14:00',
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-delft-mall-cnr-hindle-delft-main-road-delft-cape-town-western-cape/69682", "https://www.facebook.com/PepDelftMall/", "https://www.pepstores.com/"]'
WHERE slug = 'pep-delft-mall-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP is South Africa''s largest single-brand retailer, offering affordable clothing, footwear and homeware alongside cellular and financial services; this branch trades from Shop 51-52 in Nyanga Junction Shopping Centre, Manenberg.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-15:00, Sun 09:00-13:00',
    source_urls = '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop--nyanga-junction-shopping-centre-duinefontein-road-manenberg-cape-town-western-cape/12465", "https://www.sayellow.com/view/south-africa/pep-nyanga-junction-shopping-centre-in-cape-town", "https://www.pepstores.com/"]'
WHERE slug = 'pep-nyanga-junction-manenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite is South Africa''s largest supermarket retailer, offering groceries, fresh produce and household goods alongside bill payments and financial services in many stores; this branch trades in Delft Mall, Delft.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.shoprite.co.za/Western-Cape/Cape-Town/Shoprite-Delft/store-details/34817", "https://my-catalogue.co.za/stores/cape-town/shoprite/cnr-of-hindle-delft-main-road", "https://www.shopriteholdings.co.za/group/brands/shoprite.html"]'
WHERE slug = 'shoprite-delft-mall-delft' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Shoprite is South Africa''s largest supermarket retailer, offering groceries, fresh produce and household goods alongside bill payments and financial services in many stores; this branch trades in Nyanga Junction Shopping Centre, Manenberg.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.shoprite.co.za/Western-Cape/Cape-Town/Nyanga/Shoprite-Nyanga-Junction/store-details/39299", "https://mydorpie.com/m/?page=chain_shoprite_nyanga_junction_centre", "https://www.shopriteholdings.co.za/group/brands/shoprite.html"]'
WHERE slug = 'shoprite-nyanga-junction-manenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Southfield Pawn Shop is a pawn shop in Southfield, Cape Town, trading from Nobbies Corner on Victoria Road.',
    description_enriched_at = datetime('now')
WHERE slug = 'southfield-pawn-shop-southfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Southfield Primary School is a public primary school in Southfield founded in 1926, marking its centenary in 2026; it serves pupils from Southfield and neighbouring areas including Parkwood, Grassy Park, Steenberg, Retreat and Mitchell''s Plain.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://educationsouthafrica.com/schools/western-cape/city-of-cape-town/southfield-primary-school", "https://schoolfindersa.co.za/southfield-primary-school-city-of-cape-town/", "https://plainsman.co.za/news/2026-02-13-southfield-primary-school-marks-100-years-of-educational-excellence/"]'
WHERE slug = 'southfield-primary-school-southfield' AND description_enriched_at IS NULL;
