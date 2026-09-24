UPDATE businesses
SET description = 'Bihari is a North Indian restaurant at the Southern Sun Newlands hotel, cooking tandoori chicken, kebabs and a well-known prawn korma in traditional tandoor ovens, alongside a wide range of vegetarian curries, open for lunch and dinner daily.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 12:00-15:00 & 17:00-21:00',
    source_urls = '["https://www.southernsun.com/southern-sun-newlands/dining/bihari-indian-restaurant", "https://za.africabz.com/western-cape/bihari-11238", "https://www.eatout.co.za/venue/bihari-newlands/"]'
WHERE slug = 'bihari-newlands' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Cafe Nood is a breakfast-and-lunch cafe in Claremont''s Quadrant Square, serving an all-day breakfast menu alongside salads, gourmet open sandwiches, ciabattas, wraps and pasta, plus a Saturday brunch menu.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 07:00-18:00, Fri 07:00-17:30, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://cafenood.co.za/contact/", "https://www.tripadvisor.com/ShowUserReviews-g2144715-d5264370-r374607405-Cafe_Nood-Claremont_Western_Cape.html", "https://www.eatout.co.za/venue/cafe-nood/"]'
WHERE slug = 'cafe-nood-claremont' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Copper Club Eatery is a casual eatery in Newlands'' Dean Street Arcade known for wood-fired pizzas and homemade burgers, also pouring craft beers and running a half-price burger special on Wednesday evenings.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-22:00, Sun 08:00-17:00',
    source_urls = '["https://www.eatout.co.za/venue/copper-club-eatery-newlands/", "https://za.africabz.com/western-cape/copper-club-eatery-17164", "https://restaurantguru.com/Copper-Club-Eatery-Cape-Town-5"]'
WHERE slug = 'copper-club-eatery-newlands' AND description_enriched_at IS NULL;
