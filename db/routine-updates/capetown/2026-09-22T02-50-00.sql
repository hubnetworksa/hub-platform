-- Job 4: Description enrichment sweep, batch 2 of 2
UPDATE businesses
SET description = 'The International School of Cape Town is a Cambridge-curriculum school in Bishopscourt, teaching from Nursery through to High School and A Levels, with qualifications recognised by universities worldwide.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.isct.co.za/", "https://www.isasaschoolfinder.co.za/listing/international-school-of-cape-town/", "https://www.childmag.co.za/directory/international-school-of-cape-town/", "https://www.goodschoolsguide.co.uk/international/review/international-school-of-cape-town"]'
WHERE slug = 'international-school-of-cape-town-bishopscourt' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jack Black''s Brewing Co. is an independently owned craft brewery in Diep River, with a year-round taproom offering tastings, a food menu, live music, brewery tours and a small retail shop.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://constantiavalley.com/jack-black-brewing-company/", "https://www.eatout.co.za/venue/jack-blacks-brewing-co/", "https://jackblackbeer.com/pages/taproom"]'
WHERE slug = 'jack-black-brewing-company-diep-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jakes in the Village is a restaurant at Steenberg Village Centre in Tokai serving global and Asian-influenced contemporary dishes, salads and burgers, with an extensive wine list and weekday lunchtime specials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 11:30-22:30',
    source_urls = '["https://www.jakes.co.za/contact/", "https://www.tripadvisor.com/Restaurant_Review-g1770549-d967411-Reviews-Jakes_in_the_Village-Tokai_Western_Cape.html", "https://www.dineplan.com/restaurants/jakes-tokai"]'
WHERE slug = 'jakes-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jason Bakery is an artisan bakery and cafe in Green Point known for its sourdough breads, croissants and Saturday-only "doughssant" pastry, with everything baked fresh on-site daily.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sat 07:00-14:00, Sun 08:00-14:00',
    source_urls = '["https://www.eatout.co.za/venue/jason-bakery-green-point/", "https://jasonbakery.com/pages/contact-us", "https://insideguide.co.za/cape-town/restaurants/jason-bakery-green-point/"]'
WHERE slug = 'jason-bakery-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kauai at Constantia Village is a healthy-eating cafe serving wraps, salad bowls, smoothies, raw juices, organic coffee and all-day breakfast, with vegetarian and vegan options available.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.eatout.co.za/venue/kauai-constantia-village/", "https://www.facebook.com/KAUAIConstantiaVillage/", "https://locations.kauai.co.za/FoodDrink-CapeTown-KAUAIConstantia"]'
WHERE slug = 'kauai-constantia-village-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kiki is a dinner-only Greek restaurant on Regent Road in Sea Point, serving contemporary mezze-style sharing plates, salads and skewers in a whitewashed, taverna-inspired setting.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sun 18:00-22:00'
WHERE slug = 'kiki-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Klein Constantia is a historic wine estate dating to 1685, later divided off from Groot Constantia in 1716, renowned for its Vin de Constance dessert wine, once favoured by 18th and 19th-century European royalty and revived through replantings from 1982.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.kleinconstantia.com/contact-us/", "https://constantiawineroute.com/klein-constantia/", "https://www.kleinconstantia.com/", "https://www.kleinconstantia.com/our-story/"]'
WHERE slug = 'klein-constantia-constantia' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Knead Dean Street is an artisan bakery cafe in Dean Street Arcade, Newlands, serving oven-fresh bread, pastries, pizza, salads and burgers alongside its own roasted coffee; it was the first halaal-certified branch of the Knead Bakery chain.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.dining-out.co.za/md/Knead-Dean-Street/7415", "https://www.wininganddining.co.za/western-cape/cape-town/newlands/knead-dean-street", "https://www.kneadbakery.co.za/knead-dean-street"]'
WHERE slug = 'knead-dean-street-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kromboom Dental Centre is a Rondebosch East dental practice offering general and cosmetic dentistry -- including fillings, root canals, crowns, implants, veneers and teeth whitening -- plus paediatric dentistry and 24-hour emergency on-call treatment.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-13:00',
    source_urls = '["https://www.kromboomdental.co.za/contact/", "https://www.whatclinic.com/dentists/south-africa/cape-town/kromboom-dental-centre", "https://www.kromboomdental.co.za/services/"]'
WHERE slug = 'kromboom-dental-centre-rondebosch-east' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KwikSpar Kromboom is a supermarket at Kromboom Gardens in Rondebosch East, offering in-store shopping, in-store pickup and curbside pickup with wheelchair-accessible facilities.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:30-21:00',
    source_urls = '["https://za.africabz.com/western-cape/kwikspar-40807", "https://www.callupcontact.com/b/Supermarkets/Kromboom_KwikSpar/41059", "https://kimbino.co.za/stores/kwikspar-cnr-kromboom-street-rondebosh"]'
WHERE slug = 'kwikspar-kromboom-rondebosch-east' AND description_enriched_at IS NULL;
