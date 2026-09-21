UPDATE businesses
SET description = 'Beleza is a Portuguese- and Italian-influenced restaurant and bar at the corner of Kloof Nek and Burnside Roads, known for its peri-peri chicken and a broad menu spanning seafood, meat, pasta and vegetarian dishes, with daily happy-hour specials.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.capetownmagazine.com/cafes/beleza-restaurant-and-bar-in-cape-town/93_22_18757", "https://www.sa-venues.com/things-to-do/westerncape/beleza-restaurant/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d1216109-Reviews-Beleza_Restaurant-Cape_Town_Central_Western_Cape.html"]'
WHERE slug = 'beleza-tamboerskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'El Burro Taqueria is a Mexican taqueria on Kloof Nek Road serving individually plated tacos with beef, chicken, pork, fish and vegetarian fillings alongside quesadillas, fresh ceviche and hand-pressed tortillas, though it does not hold a liquor licence.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 12:00-23:30, Sat 10:00-23:30',
    source_urls = '["https://southafricafirm.com/western-cape/el-burro-taqueria-kloof-nek-43", "https://za.africabz.com/western-cape/el-burro-taqueria-kloof-nek-457", "https://www.capetownmagazine.com/mexican/authentic-tacos-at-el-burro-taqueria-in-cape-town/151_22_19798"]'
WHERE slug = 'el-burro-taqueria-tamboerskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Melissa''s The Food Shop is a deli and gourmet food store on Kloof Street offering breakfast, lunch and early dinners with an international flavour, plus handmade baked goods, quiches and by-the-kilo deli fare.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:00-19:00, Sat 08:00-19:00, Sun 08:00-18:00',
    source_urls = '["https://www.capetownmagazine.com/melissas-the-food-shop", "https://www.eatout.co.za/venue/melissas-kloof-street-2/", "https://menufacts.co.za/restaurant-melissas-the-food-shop-cape-town/"]'
WHERE slug = 'melissas-the-food-shop-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Blue Cafe has traded as a neighbourhood general dealer and sidewalk cafe on this Brownlow Road corner since the early 1900s, known through the decades as "The Bubby" and "Die Blou Kafee" before reopening as a deli and cafe in 2014.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.capetownmagazine.com/blue-cafe", "https://www.chrisvonulmenstein.com/blog/cape-town/neighbourhood-treasure-the-blue-cafe-opens-in-tamboerskloof-as-deli-and-general-dealer/", "https://www.eatout.co.za/venue/blue-cafe/"]'
WHERE slug = 'the-blue-cafe-tamboerskloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tiger''s Milk on Long Street is a pizza, grill and burger restaurant known for dishes like bacon-and-avocado pizza and pulled pork tacos, alongside local beers, cocktails and its own Tiger''s Milk Lager.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 11:00-00:00',
    source_urls = '["https://www.tigersmilk.co.za/location/long-street/", "https://www.capetownccid.org/explore/eat/tigers-milk", "https://www.tripadvisor.com/Restaurant_Review-g312659-d8451418-Reviews-Tiger_s_Milk_Long_Street-Cape_Town_Central_Western_Cape.html"]'
WHERE slug = 'tigers-milk-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Truth Coffee is a steampunk-themed cafe and roastery on Buitenkant Street housed in a converted Victorian warehouse, roasting its beans on a vintage Probat roaster and running barista training classes.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 06:30-18:00, Tue-Fri 06:30-22:00, Sat 08:00-22:00, Sun 08:00-16:00',
    source_urls = '["https://truth.coffee/pages/contact-us", "https://www.eatout.co.za/venue/truth-coffee-roasting-hq/", "https://thecoffeevine.com/reviews/cafes/southafrica/cape-town/truth-coffee-roasting-cape-town-za/"]'
WHERE slug = 'truth-coffee-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Wellness Warehouse is a health and wellness retailer stocking supplements, natural skincare and wholefoods, trading from its store on the first floor of Lifestyle on Kloof.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-18:30, Sat 09:00-17:00, Sun 09:00-16:00',
    source_urls = '["https://za.near-place.com/wellness-warehouse-kloof-lifestyle-on-kloof-50-kloof-street-gardens-cape-town", "https://www.fresha.com/lvp/wellness-warehouse-lifestyle-on-kloof-kloof-street-cape-town-581GQZ", "https://my-catalogue.co.za/stores/cape-town/wellness-warehouse/lifestyle-on-kloof-shop-1-8-50-kloof-street-gardens"]'
WHERE slug = 'wellness-warehouse-lifestyle-on-kloof-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'elevenpast is a furniture, lighting and homeware store trading from Lifestyle on Kloof, part of a South African home decor and furniture retail brand.',
    description_enriched_at = datetime('now')
WHERE slug = 'elevenpast-lifestyle-on-kloof-gardens' AND description_enriched_at IS NULL;
