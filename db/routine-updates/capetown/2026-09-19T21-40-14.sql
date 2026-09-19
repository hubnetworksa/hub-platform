UPDATE businesses
SET description = 'Akiya Sushi is a Japanese and Chinese restaurant in Canal Walk Shopping Centre, Century City, serving an extensive sushi and sashimi menu alongside hot Asian dishes and vegetarian options.',
    description_enriched_at = datetime('now')
WHERE slug = 'akiya-sushi-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Billboard Barbershop is a barbershop in Brooklyn, Cape Town, offering haircuts and grooming services by appointment.',
    description_enriched_at = datetime('now')
WHERE slug = 'billboard-barbershop-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Town Fish Market is a seafood restaurant and fish-market-style eatery in Canal Walk Shopping Centre, Century City, offering fresh fish chosen from a market counter alongside a sushi bar and teppanyaki grill.',
    description_enriched_at = datetime('now')
WHERE slug = 'cape-town-fish-market-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Brooklyn Junction is a pharmacy and health, beauty and homeware retailer in Brooklyn Junction, Brooklyn.',
    description_enriched_at = datetime('now')
WHERE slug = 'clicks-brooklyn-junction-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Col''Cacchio Canal Walk is a Halaal-certified Italian restaurant in Canal Walk Shopping Centre, Century City, specialising in wood-fired pizzas, pastas and salads with an extensive menu of over 50 pizza varieties.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-21:30, Sat 09:00-22:00, Sun 09:00-21:00'
WHERE slug = 'colcacchio-canal-walk-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Columbit supplies and installs commercial meat-processing, packaging and food-coding equipment, serving the wine, food and beverage industries across South Africa.',
    description_enriched_at = datetime('now')
WHERE slug = 'columbit-kensington' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dew Spa is a beauty and wellness spa in Kensington offering facials, makeup and nail treatments, and caters for pamper parties, corporate groups and weddings.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat 09:00-18:00, Sun Closed'
WHERE slug = 'dew-spa-kensington' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Panarottis Century City is an Italian restaurant in Canal Walk Shopping Centre serving wood-fired-style pizzas and pastas made with slow-proofed dough, with gluten-free bases and vegetarian options available.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-22:00, Fri-Sat 09:00-23:00, Sun 09:00-21:00',
    source_urls = '["https://www.eatout.co.za/venue/panarottis-century-city/", "https://www.yep.co.za/biz/store/panarottis-pizza-pasta/630923", "https://canalwalk.co.za/shop/panarottis"]'
WHERE slug = 'panarottis-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Punjab Wok is a restaurant in Century City serving a fusion of Indian, Chinese and Thai street food.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g4464136-d10496650-Reviews-Punjab_Wok-Century_City_Western_Cape.html", "https://www.facebook.com/PunjabWok/", "https://www.eatout.co.za/venue/punjab-wok/"]'
WHERE slug = 'punjab-wok-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Vangate Mall is a supermarket inside Vangate Mall in Athlone, offering groceries, fresh produce and everyday essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-21:00'
WHERE slug = 'spar-vangate-mall-athlone' AND description_enriched_at IS NULL;
