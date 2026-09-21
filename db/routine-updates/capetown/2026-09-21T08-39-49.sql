UPDATE businesses
SET description = 'Antonio''s Pizza Place is a pizza and grill restaurant on the water''s edge at Harbour Island in Gordon''s Bay, serving pizza, steaks, seafood, schnitzel, eisbein, burgers and pastas alongside draught beer and a wine list, with outdoor seating overlooking the marina.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.antoniospizza.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g1020231-d3615770-Reviews-Antonios_Pizza_Place-Gordon_s_Bay_Western_Cape.html", "https://www.eatout.co.za/venue/antonios/"]'
WHERE slug = 'antonios-pizza-place-gordons-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Helderberg Restaurant is a restaurant in Gordon''s Bay, Cape Town, offering a dining spot near the harbour for locals and visitors to the area.',
    description_enriched_at = datetime('now')
WHERE slug = 'helderberg-restaurant-gordons-bay' AND description_enriched_at IS NULL;
