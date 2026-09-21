UPDATE businesses
SET description = 'Antonio''s Pizza Place is a pizza and grill restaurant in the Boardwalk building at Harbour Island, serving pizzas, pastas, seafood, burgers, poultry, steaks, schnitzel and eisbein, with vegetarian and gluten-free options and outdoor deck seating overlooking the harbour.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.antoniospizza.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g1020231-d3615770-Reviews-Antonios_Pizza_Place-Gordon_s_Bay_Western_Cape.html", "https://www.mrdfood.com/food-delivery/restaurant/antonios-pizza-place_harbour-island/288"]'
WHERE slug = 'antonios-pizza-place-gordons-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Helderberg Restaurant occupies the former L''Auberge du Paysan building on Beach Road at Gordon''s Bay Harbour, serving traditional South African fare.',
    description_enriched_at = datetime('now')
WHERE slug = 'helderberg-restaurant-gordons-bay' AND description_enriched_at IS NULL;
