UPDATE businesses
SET description = 'JAC Motors Polokwane is the official JAC vehicle dealership in the city, specialising in JAC''s range of double-cab bakkies and light commercial vehicles, including the T8 pickup.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://jacpolokwane.co.za/", "owner-submitted: JAC Motors Polokwane Workshop marketing flyer", "https://www.facebook.com/JACPolokwane/"]'
WHERE slug = 'jac-motors-polokwane-central' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Makro Polokwane is a large-format wholesale and retail warehouse store in Magna Via, stocking general merchandise across categories including home entertainment, computers and office equipment, furniture, stationery, food and liquor.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://dir.alltrack.org/view/274458-1-makro", "https://www.waze.com/live-map/directions/makro-store-polokwane-marmer-st-1-magna-via,-polokwane?to=place.w.19334681.193150205.1885229", "https://www.facebook.com/MakroPolokwane/"]'
WHERE slug = 'makro-polokwane-magna-via' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Phologo Health Care is a private clinic in Lebowakgomo Zone B offering general medical and dental services to the local community.',
    description_enriched_at = datetime('now')
WHERE slug = 'phologo-health-care-lebowakgomo' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Place Food Eatery is a restaurant at Zone A Caravan Park in Lebowakgomo, serving an a la carte menu of seafood, meat, poultry and vegetarian dishes alongside daily specials, hot and cold platters, and desserts, and was established with support from a small-business empowerment programme for women entrepreneurs.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://restaurantguru.com/The-Place-Food-Eatery-Lebowakgomo", "https://wanderlog.com/place/details/13595362/the-place-food-eatery", "https://www.facebook.com/ThePlaceFoodEatery3/"]'
WHERE slug = 'the-place-food-eatery-lebowakgomo' AND description_enriched_at IS NULL;
