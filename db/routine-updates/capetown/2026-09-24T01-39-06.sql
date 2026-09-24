UPDATE businesses
SET description = 'Krystal Restaurant is a waterfront dining venue at the Krystal Beach Hotel on Harbour Island in Gordon''s Bay, serving breakfast, lunch and dinner from a seasonal menu of French-style sandwiches, salads and seafood dishes.',
    description_enriched_at = datetime('now')
WHERE slug = 'krystal-restaurant-gordons-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KwikSpar Somerset@Lion''s Square is a supermarket in Lion''s Square on Main Road, Somerset West, stocking groceries and everyday essentials.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-19:30',
    source_urls = '["https://za.africabz.com/western-cape/kwikspar-somersetlions-square-190153", "https://kookaloney.com/stores/kwikspar-somersetlions-square/", "https://www.tiendeo.co.za/stores/langa/kwikspar-main-road-lion-square-somerset-west/45759"]'
WHERE slug = 'kwikspar-somerset-lions-square-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pomodoro is an Italian restaurant in Lion''s Square, Somerset West, specialising in authentic Italian pizza.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g469396-d2655710-Reviews-Pomodoro_Authentic_Italian-Somerset_West_Western_Cape.html", "https://za.2pos.info/84/7404", "http://pomodoropizza.co.za/"]'
WHERE slug = 'pomodoro-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Thirsty Oyster Tavern is a seafood-focused tavern on the Old Harbour beachfront in Gordon''s Bay, with a sun deck overlooking False Bay, serving linefish, seafood platters and pub fare, with live music on Fridays and Sundays.',
    description_enriched_at = datetime('now')
WHERE slug = 'thirsty-oyster-tavern-gordons-bay' AND description_enriched_at IS NULL;
