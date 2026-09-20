UPDATE businesses
SET description = 'The Greek Club Restaurant is a Greek restaurant in Mouille Point serving traditional dishes such as moussaka, souvlaki, spanakopita and lamb pita, with dine-in, takeout and delivery options.',
    description_enriched_at = datetime('now'),
    hours = 'Fri Dinner only, Sat-Sun Lunch only',
    source_urls = '["https://nearbyza.com/place/the-greek-club-restaurant-1", "https://za.africabz.com/western-cape/the-greek-club-restaurant-278341", "https://www.eatout.co.za/venue/greek-club-restaurant-cape-town/"]'
WHERE slug = 'greek-club-restaurant-mouille-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Hussar Grill in Waterstone Village is a steakhouse serving prime cuts and a comprehensive wine list, open in Somerset West since 2014 with views of the Helderberg mountains.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 12:00-23:00',
    source_urls = '["https://www.waterstonevillage.co.za", "https://getoccupi.com/malls/waterstone-village", "https://www.dineplan.com/restaurants/the-hussar-grill-somerset-west"]'
WHERE slug = 'the-hussar-grill-waterstone-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Hussar Grill in Durbanville is a steakhouse in the Village Square shopping centre serving prime cuts and a wine list.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-22:00, Sun 12:00-16:00'
WHERE slug = 'hussar-grill-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Labia is South Africa''s oldest independent art-repertory cinema, in Gardens, Cape Town, opened in 1949 as a live-performance theatre before it began screening films, and now runs four screens including a 167-seat main auditorium, upgraded to digital projection.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.sa-venues.com/things-to-do/westerncape/the-labia/", "https://thelabia.co.za", "https://en.wikipedia.org/wiki/Labia_Theatre", "https://sahistory.org.za/place/labia-theatre-cape-town"]'
WHERE slug = 'the-labia-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Live Edge at The Old Biscuit Mill is a furniture studio in Woodstock making bespoke live-edge tables and décor from sustainably sourced wood, with customisable leg and base options.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-live-edge-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Lookout Hout Bay is a harbourside restaurant and bar at Hout Bay Harbour''s Quayside, open for lunch and dinner on Friday and Saturday and lunch only on Sunday.',
    description_enriched_at = datetime('now'),
    hours = 'Fri-Sat 11:00-20:30, Sun 11:00-18:30, Mon-Thu Closed',
    source_urls = '["https://www.lookouthoutbay.co.za", "https://www.capetownetc.com/things-to-do-cape-town/hout-bay-restaurants/", "https://www.dineplan.com/restaurants/the-lookout-hout-bay"]'
WHERE slug = 'the-lookout-hout-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Luxe Beauté Co. is a beauty salon in Brooklyn, Cape Town, offering nail treatments such as gel tips, polygel and overlays, along with brow waxing and tinting, hair treatments and braiding services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-18:00, Sun 09:00-16:00'
WHERE slug = 'the-luxe-beaute-co-brooklyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Neighbourgood at Cape Quarter is a co-living and co-working space in De Waterkant offering furnished studio to two-bedroom apartments alongside a co-working office and rooftop pool, with access to Cape Quarter Lifestyle Village''s shops and cafés.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-neighbourgood-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Palms Restaurant is a pub and grill on Bottelary Road in Brackenfell serving meals from breakfast through to dinner, with a bar trading into the early hours.',
    description_enriched_at = datetime('now'),
    hours = 'Kitchen: Mon-Thu 09:00-22:00, Fri-Sat 09:00-23:00, Sun 09:00-20:00'
WHERE slug = 'the-palms-restaurant-brackenfell' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Pole Yard in Paarden Eiland is a timber and pole supplier specialising in outdoor timber products such as fencing, wooden decking, rustic garden furniture and jungle gyms, alongside a range of pine, cylindrical and eucalyptus poles.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-pole-yard-paarden-eiland' AND description_enriched_at IS NULL;
