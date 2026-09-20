UPDATE businesses
SET description = '74 on 9th is an events and function venue in Schaapkraal, Philippi Horticultural Area, Cape Town, available for private functions and bookings.',
    description_enriched_at = datetime('now')
WHERE slug = '74-on-9th-philippi-horticultural' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Hair Connection is a hair salon in Quicktrip Centre, Portlands, Mitchells Plain, offering hairdressing services to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'hair-connection-portland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Portlands Indoor Sport Centre is a City of Cape Town-run indoor sports and recreation facility in Portlands, Mitchells Plain, used for community sport, fitness and recreational programmes.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://d7.westerncape.gov.za/facility/portlands-indoor-sport-centre", "https://www.thinklocal.co.za/biz/portlands-indoor-sports-centre-mitchells-plain", "https://www.capetown.gov.za/Family%20and%20home/See-all-city-facilities/Our-recreational-facilities/Indoor%20centres/portlands-indoor-centre"]'
WHERE slug = 'portlands-indoor-sport-centre-portland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Quicktrip Bakery is a bakery and coffee shop inside Quicktrip Shopping Centre in Portlands, Mitchells Plain, selling fresh baked goods, cakes and coffee.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-19:00, Sun 08:00-18:00',
    source_urls = '["https://quicktripbakery.co.za/", "https://cape-town-south-africa.bizfax.co.za/quicktrip-bakery.html", "https://heycafes.co.za/0999330/Quicktrip_Bakery"]'
WHERE slug = 'quicktrip-bakery-portland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Party Shop is a party supply and decor shop in Portlands, Mitchells Plain, offering themed party decorations and supplies for children''s parties and other occasions.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-party-shop-portland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Yuppiechef is a kitchenware and home retailer with a store in Gardens Shopping Centre, Gardens, selling cookware, small appliances and homeware.',
    description_enriched_at = datetime('now')
WHERE slug = 'yuppiechef-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zapata is a Mexican restaurant in Harfield Village Centre, Claremont, serving dinner and late-night meals with a full cocktail bar and outdoor seating.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 17:30-22:00, Sun Closed',
    source_urls = '["https://www.eatout.co.za/venue/zapata-mexican-restaurant/", "https://harfield-village.co.za/business/zapata-mexican-restaurant/", "https://www.tripadvisor.co.za/Restaurant_Review-g2144715-d3486173-Reviews-Zapata-Claremont_Western_Cape.html"]'
WHERE slug = 'zapata-harfield-village' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zara is an international fashion and clothing retailer with a store in Victoria Wharf Shopping Centre at the V&A Waterfront, Cape Town.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-21:00',
    source_urls = '["https://getoccupi.com/malls/victoria-wharf-shopping-centre", "https://www.shopshours.co.za/zara/cape-town", "https://www.waterfront.co.za/stores/zara"]'
WHERE slug = 'zara-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zenzero is a beachfront restaurant on the Camps Bay Promenade specialising in live-fire cooking, including coal-roasted seafood, wood-fired pizza and fire-roasted vegetables.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-late',
    source_urls = '["https://www.sa-venues.com/things-to-do/westerncape/zenzero/", "https://wetu.com/iBrochure/en/Information/20762/zenzero_restaurant_camps_bay/Contact", "https://www.kovecollection.co.za/zenzero/"]'
WHERE slug = 'zenzero-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Zone Fitness is a gym on the 1st floor of Fish Hoek Town Square, offering group and individual fitness training to the Fish Hoek community.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 05:30-21:00, Fri 05:30-20:00, Sat-Sun 07:00-15:00'
WHERE slug = 'zone-fitness-fish-hoek-town-square-fish-hoek' AND description_enriched_at IS NULL;
