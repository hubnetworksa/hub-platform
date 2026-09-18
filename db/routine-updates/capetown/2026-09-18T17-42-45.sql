UPDATE businesses
SET description = 'Belthazar Restaurant & Wine Bar is a steakhouse and wine bar in Victoria Wharf at the V&A Waterfront, known for its extensive by-the-glass wine list alongside grilled steak and seafood dishes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 12:00-22:00',
    source_urls = '["https://www.belthazar.co.za/contact", "https://www.dineplan.com/restaurants/belthazar", "https://www.waterfront.co.za/eat-and-drink/belthazar-restaurant"]'
WHERE slug = 'belthazar-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bertha''s Restaurant is a restaurant on Wharf Road in Simon''s Town, next to the harbour.',
    description_enriched_at = datetime('now')
WHERE slug = 'berthas-restaurant-simons-town' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Blackburns Pharmacy is a pharmacy on Victoria Road in Southfield.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-16:00, Sun 08:30-15:00'
WHERE slug = 'blackburns-pharmacy-southfield' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bootlegger Coffee Company (Bakoven) is a specialty coffee café on Victoria Road in Bakoven, serving all-day breakfast, lunch and brunch seven days a week with a kids'' menu and takeaway options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 06:00-17:00, Sat-Sun 07:00-17:00',
    source_urls = '["https://wanderlog.com/place/details/2263423/bootlegger-bakoven", "https://www.tripadvisor.com/Restaurant_Review-g4574140-d12969770-Reviews-Bootlegger_Coffee_Company_Bakoven-Bakoven_Camps_Bay_Western_Cape.html", "https://ourcafes.bootlegger.coffee/FoodDrink-CapeTown-BootleggerBakoven"]'
WHERE slug = 'bootlegger-bakoven' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bootlegger Coffee Company (Cape Quarter) is a specialty grade coffee café inside the Cape Quarter Lifestyle Centre in De Waterkant, serving all-day breakfast and lunch seven days a week.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-18:30, Sat-Sun and Public Holidays 08:00-17:00',
    source_urls = '["https://capequarter.co.za/shops/", "https://www.facebook.com/BootleggerCapeQuarter/"]'
WHERE slug = 'bootlegger-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Bootlegger - Dean Street is a specialty coffee café in the Dean Street Arcade in Newlands, serving all-day breakfast, lunch and brunch with free wifi, a kids'' menu and takeaway options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 06:30-17:30, Sat 07:00-17:30, Sun 07:00-15:00',
    source_urls = '["https://coffeedec.com/shop/listing/bootlegger-dean-street-newlands-cape-town-coffee-shop/", "https://ourcafes.bootlegger.coffee/FoodDrink-CapeTown-BootleggerDeanStreet"]'
WHERE slug = 'bootlegger-dean-street-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Broadway Confectionery & Bakery is a Portuguese-style bakery and café on Voortrekker Road in Maitland.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 06:30-16:00, Sat 06:30-14:00, Sun Closed',
    source_urls = '["https://www.cybo.com", "https://za.africabz.com", "https://broadwayconfectionery.co.za/"]'
WHERE slug = 'broadway-confectionery-bakery-maitland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Buitenverwachting is a historic wine estate on Klein Constantia Road in Constantia, part of the original Constantia Estate founded by Simon van der Stel, dating back to 1773. Wine tastings are held in its historic thatched-roof cellar.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 10:00-16:00, Sun Closed',
    source_urls = '["https://www.buitenverwachting.com/", "https://constantiawineroute.com/buitenverwachting/", "https://www.sa-venues.com/things-to-do/westerncape/taste-wine-at-buitenverwachting/"]'
WHERE slug = 'buitenverwachting-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cafe Extrablatt is a German-style all-day cafe on Main Road in Green Point, inside the Exhibition Building near DHL Stadium, known for its breakfast buffet, pizzas and hamburgers.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Thu 09:00-01:00, Fri-Sat 09:00-02:00',
    source_urls = '["https://www.cafe-extrablatt.co.za/", "https://www.sa-venues.com/things-to-do/westerncape/cafe-extrablatt/", "https://www.capetownmagazine.com/cafe-extrablatt-green-point"]'
WHERE slug = 'cafe-extrablatt-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cafe Caprice is a well-known beach bar and restaurant on the Victoria Road strip in Camps Bay, popular for cocktails, sundowners and nightlife.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 12:00-24:00, Tue-Thu 09:00-24:00, Fri-Sun 09:00-01:00',
    source_urls = '["https://www.cafecaprice.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g312658-d1989589-Reviews-Cafe_Caprice-Camps_Bay_Western_Cape.html", "https://www.capetownmagazine.com/cafe-caprice-cape-town"]'
WHERE slug = 'cafe-caprice-camps-bay' AND description_enriched_at IS NULL;
