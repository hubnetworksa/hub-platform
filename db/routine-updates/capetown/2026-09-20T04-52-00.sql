-- Job 4: description enrichment sweep, batch 2 of 2 (10 businesses)
UPDATE businesses
SET description = 'Surfshack is a laid-back seaside diner on Camps Bay beachfront, serving wood-fired pizzas, burgers and shareable plates with ocean views.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 12:00-23:00',
    source_urls = '["https://www.kovecollection.co.za/surfshack/", "https://www.tripadvisor.com/Restaurant_Review-g312658-d19254567-Reviews-Surfshack-Camps_Bay_Western_Cape.html", "https://insideguide.co.za/cape-town/restaurants/surfshack/"]'
WHERE slug = 'surfshack-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Sushi Box Cape Quarter is a sushi restaurant inside the Cape Quarter precinct in De Waterkant, serving rainbow rolls, poke bowls and other Japanese-inspired dishes with counter and outdoor seating.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 11:30-22:00',
    source_urls = '["https://capequarter.co.za/shops/", "https://www.sushibox.co.za/sushibox-de-waterkant", "https://www.eatout.co.za/venue/sushi-box-de-waterkant/"]'
WHERE slug = 'sushi-box-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Swatch is a watch store inside Victoria Wharf Shopping Centre at the V&A Waterfront.',
    description_enriched_at = datetime('now')
WHERE slug = 'swatch-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TOPS at SPAR Cape Quarter is a liquor store inside the Cape Quarter precinct in De Waterkant, stocking wine, spirits, beer and ready-to-drink beverages.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-20:00, Sun 11:00-18:30',
    source_urls = '["https://capequarter.co.za/shops/", "https://www.cataloguespecials.co.za/stores/spar-tops/locations/cape-town"]'
WHERE slug = 'tops-at-spar-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'TOPS at SPAR Stellenberg is a liquor store inside the Stellenberg Spar Centre, stocking wine, spirits, beer and ready-to-drink beverages.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-20:00, Sun 11:00-18:00',
    source_urls = '["https://www.thinklocal.co.za/biz/tops-at-spar-stellenberg-stellenberg", "https://za.africabz.com/western-cape/tops-at-spar-stellenberg-115771", "https://my-catalogue.co.za/stores/stellenberg/tops-at-spar/40-haarlem-street"]'
WHERE slug = 'tops-at-spar-stellenberg-stellenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Taaz Tours is a travel agency based in Kenwyn, Cape Town.',
    description_enriched_at = datetime('now')
WHERE slug = 'taaz-tours-kenwyn' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The 41 is a restaurant and bar on Camps Bay beachfront, serving South African-inspired dishes with international flair, weekend breakfasts and a daily happy hour.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 12:00-22:00, Sat-Sun 09:00-22:00',
    source_urls = '["https://www.tripadvisor.co.za/Restaurant_Review-g312658-d11892943-Reviews-or45-The_41-Camps_Bay_Western_Cape.html", "https://www.eatout.co.za/venue/the-41-restaurant-and-bar/", "https://insideguide.co.za/cape-town/restaurants/the-41/"]'
WHERE slug = 'the-41-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Alma Cafe is a homestyle cafe in Rosebank known for its coffee, brunch and home-baked goods by day, with live-music evenings by advance booking.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.almacafe.co.za/contact/", "https://za.africabz.com/western-cape/the-alma-cafe-64478", "https://www.capetownetc.com/cape-town/restaurants/live-music-home-style-food-and-history-this-is-the-alma-cafe/"]'
WHERE slug = 'the-alma-cafe-rosebank' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Avenue Restaurant and Grill is a family-run steakhouse and grill in Harfield Village, Claremont, also offering a dedicated vegan and vegetarian menu and live music.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 17:30-22:00, Sun Closed'
WHERE slug = 'the-avenue-restaurant-and-grill-harfield-village' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Bantry Aparthotel is a serviced-apartment hotel in Bantry Bay with self-catering suites, an outdoor pool and views over the Atlantic Ocean and Lion''s Head.',
    description_enriched_at = datetime('now')
WHERE slug = 'the-bantry-aparthotel-bantry-bay' AND description_enriched_at IS NULL;
