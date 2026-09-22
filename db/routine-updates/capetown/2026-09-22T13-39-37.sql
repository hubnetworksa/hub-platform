UPDATE businesses
SET description = 'KFC Maitland is a fast-food restaurant on Voortrekker Road in Maitland, serving the chain''s fried chicken, burgers and wings.',
    description_enriched_at = datetime('now')
WHERE slug = 'kfc-maitland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Keedo is a children''s clothing factory shop on Transvaal Street in Paarden Eiland, selling designer kidswear that has been designed and manufactured in South Africa since 1993.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.yep.co.za/biz/store/keedo-international/620928", "https://www.africanadvice.com/1173381/Kids_Clothing/Cape_Town/Keedo/", "https://www.keedo.co.za"]'
WHERE slug = 'keedo-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'McDonald''s Maitland is a drive-thru restaurant on Voortrekker Road in Maitland, with an indoor dining area, free WiFi, and breakfast served until 10:30am.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/mcdonalds-maitland-27937", "https://www.findmy.co.za/food/category-detail/mcdonalds-maitland/24332", "https://www.mcdonalds.co.za/location/mcdonalds-maitland"]'
WHERE slug = 'mcdonalds-maitland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP is a general retail store inside Maitland Square on Voortrekker Road in Maitland.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-13:00, Tue-Wed 08:30-17:30, Thu 09:00-17:30, Fri-Sat 08:30-17:30, Sun 08:30-14:30'
WHERE slug = 'pep-maitland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Stellenberg Pharmacy is a pharmacy on the corner of Reiger and Haarlem Road in Stellenberg, Bellville.',
    description_enriched_at = datetime('now')
WHERE slug = 'stellenberg-pharmacy-stellenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Shred Coffee Shop is a retro-styled coffee shop on site at The Shred indoor skatepark in Paarden Eiland, serving pizzas, burgers, treats and coffee, with weekly burger specials, including vegan options, from Friday to Sunday.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://nearbyza.com/place/the-shred", "https://za.africabz.com/western-cape/the-shred-skatepark-17197", "https://www.theshred.co.za/pages/the-shred-coffee-shop"]'
WHERE slug = 'the-shred-coffee-shop-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tifgifts Factory Shop is a bath and body factory shop on Industry Road in Paarden Eiland, selling manufactured toiletries, liquid soaps, lotions and facial skincare products, and has been trading for 25 years.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.africabz.com/western-cape/tifgifts-factory-shop-163134", "https://www.yoys.co.za/phone,27-215143106,Gift-Basket-Store,Cape-Town,ZA17352.html", "https://factoryshops.co.za/tifgifts-paarden-eiland/"]'
WHERE slug = 'tifgifts-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'vida e caffè Paarden Eiland is a coffee shop inside the TDC Campus on Marine Drive in Paarden Eiland.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Thu 07:00-16:30, Fri 07:00-18:00, Sat 07:00-17:00'
WHERE slug = 'vida-e-caffe-paarden-eiland' AND description_enriched_at IS NULL;
