UPDATE businesses
SET description = 'Cannings is a long-established auto body repair and spray-painting specialist in Salt River, operating since 1973 as one of Cape Town''s longest-running panel beaters. It is a VW-approved repairer and a member of SAMBRA and the RMI, handling accident damage repairs, dent repair and vehicle refinishing.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.cannings.co.za/about/", "https://www.brabys.com/za/western-cape/cape-town/salt-river/panelbeaters-spraypainters/cannings", "https://panelbeatersdirectory.co.za/listing.php?listings_id=1377"]'
WHERE slug = 'cannings-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'De Waterkant Place is a boutique guesthouse on Dixon Street in De Waterkant, close to the V&A Waterfront and city centre. Air-conditioned rooms include flat-screen TVs and private bathrooms, with a bar, a shared lounge, and some rooms offering balconies, mountain views or kitchen facilities for longer stays.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://dewaterkantplace.co.za/contact/", "https://wanderlog.com/place/details/10403264/de-waterkant-place", "https://www.tripadvisor.com/Hotel_Review-g312659-d4544383-Reviews-De_Waterkant_Place-Cape_Town_Central_Western_Cape.html"]'
WHERE slug = 'de-waterkant-place-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Loaves by Madame Baker is an artisanal bakery in Salt River known for its scratch-made bread, bagels and croissants, plus a signature spicy chicken aioli sandwich. It opened on Long Street in 2015 before relocating to Salt River''s Salt Orchard in 2018.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.eatout.co.za/venue/loaves-on-long/", "https://www.loaves.co.za/contact.html", "https://yourneighbourhood.co.za/loaves-by-madame-baker/"]'
WHERE slug = 'loaves-by-madame-baker-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Origin Coffee Roasting is a specialty coffee roaster and cafe in De Waterkant, roasting and brewing coffee since 2006 using methods including espresso, V60, Chemex, siphon and Aeropress. It also supplies coffee, barista training and ongoing support to other cafes around the country.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 07:30-16:00, Sat 08:00-15:00, Sun 08:00-14:00',
    source_urls = '["https://originroasting.co.za/pages/contact", "https://www.eatout.co.za/venue/origin-coffee-roasting/", "https://originroasting.co.za/pages/about-us"]'
WHERE slug = 'origin-coffee-roasting-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pahari African Restaurant is an African-cuisine restaurant in Salt River, open since 2017, serving pan-African dishes built around sadza/pap and relish alongside dishes such as West African jollof rice, South African potjiekos and Ethiopian injera platters. It offers communal, family-style dining with vegetarian, vegan and gluten-free options.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 11:00-21:00, Sun 11:00-18:00',
    source_urls = '["https://www.eatout.co.za/venue/pahari-african-restaurant/", "https://pahari.co.za/", "https://www.mrdfood.com/food-delivery/restaurant/pahari-african-restaurant-salt-river/2448"]'
WHERE slug = 'pahari-african-restaurant-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Table Seven is a private-dining restaurant in Salt River''s Salt Orchard, set around a single long communal table that seats about twenty guests. It offers daily blackboard lunches and a multi-course Chef''s Table experience, with furniture, art and ingredients sourced from artisans across the continent.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://insideguide.co.za/cape-town/restaurants/table-seven/", "https://www.eatout.co.za/venue/table-seven/", "https://www.dailymaverick.co.za/article/2019-02-01-table-seven-just-one-table-20-guests-and-food/"]'
WHERE slug = 'table-seven-salt-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Urban Men is a men''s grooming salon and barbershop in De Waterkant offering haircuts, hot towel shaves, hair treatments, waxing and threading, manicures and pedicures, and facials in a modern, welcoming setting.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-19:00, Sun 09:00-17:00',
    source_urls = '["https://za.africabz.com/western-cape/urban-men-19718", "https://ourvanitylist.com/listing/urban-men/", "https://www.fresha.com/lvp/urban-men-de-waterkant-jarvis-street-cape-town-bx679D"]'
WHERE slug = 'urban-men-de-waterkant' AND description_enriched_at IS NULL;
