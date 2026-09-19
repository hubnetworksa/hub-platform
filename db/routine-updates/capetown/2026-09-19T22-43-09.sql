UPDATE businesses
SET description = 'Akiya Sushi is a sushi and Asian restaurant in Century City serving a menu of Japanese and Chinese dishes, including sushi, dim sum, and vegetarian options.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g4464136-d17417604-Reviews-Akiya_Sushi-Century_City_Western_Cape.html", "https://www.akiyasushi.co.za/new-shop", "https://restaurantguru.com/Akiya-Sushi-Century-Village-Cape-Town"]'
WHERE slug = 'akiya-sushi-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Billboard Barbershop is a barbershop in Brooklyn offering haircuts and grooming services for men.',
    description_enriched_at = datetime('now')
WHERE slug = 'billboard-barbershop-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Town Fish Market at Canal Walk is a seafood restaurant, fish bar and sushi bar offering a fresh-fish market experience where diners choose their own catch, alongside teppanyaki, sushi, and a kids'' menu.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d3371780-Reviews-Cape_Town_Fish_Market-Cape_Town_Central_Western_Cape.html", "https://canalwalk.co.za/shop/cape-town-fish-market", "https://ctfm.co.za/stores-canal-walk"]'
WHERE slug = 'cape-town-fish-market-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Brooklyn Junction is a pharmacy, health and beauty retailer in Brooklyn Junction, Brooklyn.',
    description_enriched_at = datetime('now')
WHERE slug = 'clicks-brooklyn-junction-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Col''Cacchio at Canal Walk is a Halaal-certified Italian restaurant known for wood-fired pizzas, pastas and salads, with a menu of more than 50 pizza options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-21:30, Sat 09:00-22:00, Sun 09:00-21:00',
    source_urls = '["https://www.eatout.co.za/venue/colcacchio-canal-walk/", "https://www.colcacchio.co.za/restaurants", "https://www.tripadvisor.com/Restaurant_Review-g4464136-d8277588-Reviews-Col_Cacchio_Canal_Walk_Halaal-Century_City_Western_Cape.html"]'
WHERE slug = 'colcacchio-canal-walk-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Columbit is a Kensington-based supplier of equipment, consumables and service to South Africa''s food and beverage industry, specialising in meat-processing equipment, closures, and food coding and marking solutions.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://columbit.com/contact-us/", "https://www.yellosa.co.za/company/181272/columbit-pty-ltd", "https://columbit.com/about-us/"]'
WHERE slug = 'columbit-kensington' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dew Spa is a beauty and wellness spa in Kensington offering facial treatments and makeup services, as well as packages for pamper parties, corporate groups and weddings.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 09:00-18:00, Sun Closed',
    source_urls = '["https://www.fresha.com/lvp/dew-spa-voortrekker-road-cape-town-D7LXER", "https://dewspa.co.za/contact/", "https://dewspa.co.za/"]'
WHERE slug = 'dew-spa-kensington' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Panarottis Century City is an Italian restaurant at Canal Walk serving wood-fired pizzas and pastas, including signature dishes like Margherita and Alfredo, with dine-in and takeaway options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-22:00, Fri-Sat 09:00-23:00, Sun 09:00-21:00',
    source_urls = '["https://www.eatout.co.za/venue/panarottis-century-city/", "https://www.yep.co.za/biz/store/panarottis-pizza-pasta/630923", "https://www.panarottis.com/za/restaurants/western-cape/panarottis-century-city/"]'
WHERE slug = 'panarottis-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Punjab Wok is an Indian eatery in Century City specialising in Indian street food and Oriental dishes, packed with bold flavours and spices.',
    description_enriched_at = datetime('now')
WHERE slug = 'punjab-wok-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Vangate Mall is a supermarket inside Vangate Mall, Athlone, stocking groceries, fresh produce, and household essentials for shoppers in the centre.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-vangate-mall-athlone' AND description_enriched_at IS NULL;
