UPDATE businesses
SET description = 'Krystal Restaurant is the in-house dining room at Krystal Beach Hotel on Harbour Island, Gordon''s Bay, offering gourmet dishes with a strong seafood focus, French-style sandwiches and salads, with views over the marina.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 07:00-22:00'
WHERE slug = 'krystal-restaurant-gordons-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KwikSpar Somerset@Lion''s Square is a supermarket and grocery store at Lion''s Square on Main Road, Somerset West.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 07:00-19:30',
    source_urls = '["https://za.africabz.com/western-cape/kwikspar-somersetlions-square-190153", "https://kookaloney.com/stores/kwikspar-somersetlions-square/", "https://www.tiendeo.co.za/stores/somerset-west/kwikspar-main-road-lion-square-somerset-west/45759"]'
WHERE slug = 'kwikspar-somerset-lions-square-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pomodoro is an Italian restaurant at Lion''s Square, Somerset West, serving wood-fired pizza, pasta and home-made gelato, with sit-down, takeaway and free local delivery options.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 17:00-21:00',
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g469396-d2655710-Reviews-Pomodoro_Authentic_Italian-Somerset_West_Western_Cape.html", "https://za.2pos.info/84/7404", "https://za.polomap.com/somerset-west/18510"]'
WHERE slug = 'pomodoro-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Thirsty Oyster Tavern is a seafood-focused tavern in Old Harbour, Gordon''s Bay, with a sun deck overlooking False Bay and Table Mountain, serving linefish, oysters and other seafood alongside peri-peri chicken and burgers.',
    description_enriched_at = datetime('now'),
    source_urls = '["http://www.thethirstyoyster.co.za/", "https://www.eatout.co.za/venue/thirsty-oyster-tavern-gordons-bay/", "https://gordonsbay.travel/places/restaurant/the-thirsty-oyster-tavern/"]'
WHERE slug = 'thirsty-oyster-tavern-gordons-bay' AND description_enriched_at IS NULL;
