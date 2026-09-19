UPDATE businesses
SET description = 'Akiya Sushi is a sushi and sashimi restaurant in Canal Walk Shopping Centre, Century City, also serving a range of Asian dishes including dim sum and Chinese specialities.',
    description_enriched_at = datetime('now')
WHERE slug = 'akiya-sushi-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Billboard Barbershop is a barbershop in Brooklyn, Cape Town, offering haircuts and grooming services.',
    description_enriched_at = datetime('now')
WHERE slug = 'billboard-barbershop-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cape Town Fish Market is a seafood restaurant and sushi bar in Canal Walk Shopping Centre, Century City, serving a variety of seafood dishes and grills.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g312659-d3371780-Reviews-Cape_Town_Fish_Market-Cape_Town_Central_Western_Cape.html", "https://canalwalk.co.za/shop/cape-town-fish-market", "https://ctfm.co.za/stores-canal-walk"]'
WHERE slug = 'cape-town-fish-market-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clicks Brooklyn Junction is a pharmacy and health, beauty and homeware store in Brooklyn, Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'clicks-brooklyn-junction-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Col''Cacchio Canal Walk is a pizzeria in Canal Walk Shopping Centre, Century City, serving wood-fired pizza, pasta and other Italian dishes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-21:30, Sat 09:00-22:00, Sun 09:00-21:00'
WHERE slug = 'colcacchio-canal-walk-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Columbit supplies commercial meat-processing equipment and consumables such as corks, screwcaps and capsules to the wine, food and beverage industries, based in Kensington, Cape Town.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://columbit.com/contact-us/", "https://www.yellosa.co.za/company/181272/columbit-pty-ltd", "https://columbit.com/about-us/"]'
WHERE slug = 'columbit-kensington' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Dew Spa is a beauty and wellness spa in Kensington offering massages, facials, eyebrow threading and makeup services.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.fresha.com/lvp/dew-spa-voortrekker-road-cape-town-D7LXER", "https://dewspa.co.za/contact/", "https://dewspa.co.za/about-us/"]'
WHERE slug = 'dew-spa-kensington' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Panarottis Century City is a pizza and pasta restaurant in Canal Walk Shopping Centre, Century City.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-22:00, Fri-Sat 09:00-23:00, Sun 09:00-21:00',
    source_urls = '["https://www.eatout.co.za/venue/panarottis-century-city/", "https://www.yep.co.za/biz/store/panarottis-pizza-pasta/630923", "https://www.panarottis.com/za/restaurants/western-cape/panarottis-century-city/"]'
WHERE slug = 'panarottis-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Punjab Wok is a fusion restaurant in the Bridgeway precinct of Century City, serving Indian, Chinese and Thai dishes.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g4464136-d10496650-Reviews-Punjab_Wok-Century_City_Western_Cape.html", "https://www.facebook.com/PunjabWok/", "https://www.eatout.co.za/venue/punjab-wok/"]'
WHERE slug = 'punjab-wok-century-city' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SPAR Vangate Mall is a supermarket in Vangate Mall, Athlone, offering groceries and everyday essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'spar-vangate-mall-athlone' AND description_enriched_at IS NULL;
