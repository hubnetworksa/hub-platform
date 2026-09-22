-- Job 4: description enrichment sweep, batch 2/2 this run (10 records) -- clears backlog

UPDATE businesses
SET description = 'The Creamery Café is an ice cream and coffee café in Mouille Point, its first branch on the Atlantic Seaboard, serving handmade, locally sourced ice cream alongside coffee, milkshakes and desserts.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d8090934-Reviews-The_Creamery_Cafe_Mouille_Point-Cape_Town_Central_Western_Cape.html", "http://www.thecreamery.co.za/", "https://www.eatout.co.za/venue/creamery-mouille-point/"]'
WHERE slug = 'the-creamery-cafe-mouille-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Fat Cactus is a Mexican restaurant in Mowbray, part of a small Cape Town chain, serving fajitas, enchiladas, quesadillas and nachos alongside jugs of frozen margaritas in a lively pub-style setting.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 11:00-Late',
    source_urls = '["https://www.dining-out.co.za/md/The-Fat-Cactus-Mowbray/1011", "https://za.africabz.com/western-cape/the-fat-cactus-mowbray-3736", "https://www.sa-venues.com/things-to-do/westerncape/the-fat-cactus/"]'
WHERE slug = 'the-fat-cactus-cafe-mowbray' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Hussar Grill is a steakhouse in Mouille Point, part of a South African chain running for over 55 years, specialising in aged steaks plus ostrich and game options such as springbok and kudu, with an award-winning wine list and a no-corkage policy.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 12:00-22:00',
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g312659-d1020422-Reviews-The_Hussar_Grill_Mouille_Point-Cape_Town_Central_Western_Cape.html", "https://www.eatout.co.za/venue/hussar-grill-mouille-point/", "https://www.weliveincapetown.com/restaurants-in-cape-town/steakhouses/hussar-grill-moullie-point/"]'
WHERE slug = 'the-hussar-grill-mouille-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Little Fisherman is a fresh fish and seafood retailer in Dean Street Arcade, Newlands, selling fresh fish and prawns with staff on hand to clean and prepare portions to order.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://za.ypgo.net/The+Little+Fisherman+Newlands,+Western+Cape-51852928913", "https://za.africabz.com/western-cape/the-little-fisherman-130016", "https://thelittlefisherman.co.za/contact-the-little-fisherman.php"]'
WHERE slug = 'the-little-fisherman-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Pantry is a quick-counter bakery and coffee shop in Pick n Pay Centre, Plumstead, part of a small Cape Town chain, serving artisan baked goods such as croissants, pastries, pies, muffins and cakes delivered fresh twice daily, alongside made-to-order sandwiches, burgers and wraps.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-pantry-plumstead-plumstead' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Pool Team Tokai is a swimming pool equipment and chemical store in Kirstenhof Shopping Centre, Kirstenhof, part of South Africa''s largest chain of independent pool stores, stocking pumps, filters, chemicals and maintenance equipment.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:30-13:00, Sun Closed',
    source_urls = '["https://za.africabz.com/western-cape/the-pool-team-tokai-253184", "https://www.facebook.com/ThePoolTeam/photos/weve-moved-visit-us-at-our-new-storethe-pool-team-tokaikirstenhof-shopping-centr/778577780938300/", "https://thepoolteam.co.za/pool-equipment"]'
WHERE slug = 'the-pool-team-tokai-kirstenhof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Two Oceans Aquarium is a marine conservation and education aquarium at the V&A Waterfront, opened in 1995 and named for its position where the Atlantic and Indian Oceans meet, home to more than 8,000 animals across 200-plus species including sharks, rays, turtles, penguins and the rare Knysna seahorse across exhibits such as the Kelp Forest and Predator galleries.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 09:30-18:00',
    source_urls = '["https://www.aquarium.co.za/visit-us", "https://www.aquarium.co.za/contact-us", "https://www.aquarium.co.za/visit-us/plan-your-trip"]'
WHERE slug = 'two-oceans-aquarium-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Walmer Butchery is a full-range butchery in Walmer Estate, offering fresh meat alongside a wide selection of sosaties and kebabs.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:30, Sat 08:00-15:00'
WHERE slug = 'walmer-butchery-walmer-estate' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths is a supermarket and general retailer in The Promenade, Camps Bay, part of the national Woolworths chain.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 08:00-20:00'
WHERE slug = 'woolworths-the-promenade-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Woolworths is a supermarket and general retailer in Constantia Village, Constantia, part of the national Woolworths chain.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 08:00-20:00',
    source_urls = '["https://constantiavillage.co.za/stores/woolworths/", "https://za.africabz.com/western-cape/woolworths-constantia-village-70881", "https://my-catalogue.co.za/stores/constantia/woolworths/constantia-village-main-road"]'
WHERE slug = 'woolworths-constantia-village-constantia' AND description_enriched_at IS NULL;
