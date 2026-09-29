UPDATE businesses
SET description = 'Fresnaye Sports Club is a members'' sports club established in 1928, offering six hard tennis courts (one floodlit for evening play), lawn bowls, a licensed bar, a restaurant, and outdoor braai areas with views over the Atlantic, in Fresnaye.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.fresnayesportsclub.co.za/contact.html", "https://www.waze.com/live-map/directions/za/wc/cape-town/fresnaye-sports-club", "https://www.fresnayesportsclub.co.za/", "https://www.fresnayesportsclub.co.za/tennis.html"]'
WHERE slug = 'fresnaye-sports-club-fresnaye' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lello''s Trattoria is a family-run Roman-style trattoria and deli in Three Anchor Bay serving 72-hour fermented pizza al taglio by the slice, handmade pasta, and artisanal deli produce, with an aperitivo-style evening offering from Thursday to Saturday.',
    description_enriched_at = datetime('now'),
    hours = 'Tue-Sat 08:30-21:00, Sun 08:30-14:00, Mon Closed',
    source_urls = '["https://wanderlog.com/place/details/7837478/lellos-trattoria", "https://mindtrip.ai/attraction/cape-town-western/lellos-trattoria/at-SDTG4BzI", "https://www.wantedonline.co.za/food-and-drink/2026-06-12-sea-points-hottest-new-dining-destination/"]'
WHERE slug = 'lellos-trattoria-three-anchor-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Sunshine Food Sprouting Co African Vegan Cafe is a small, plant-based eatery in Three Anchor Bay with a compact menu of vegan burgers served in wraps or buns with sprouts and fresh vegetables, alongside juices and smoothies.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g15555242-d17659802-Reviews-The_Sunshine_Food_Co-Three_Anchor_Bay_Western_Cape.html", "https://www.ubereats.com/za/store/the-sunshine-food-sprouting-co-vegan-cafe/pcVHOJx0STKc3UWf1uwbGw", "https://www.happycow.net/reviews/the-sunshine-food-co-cape-town-122156"]'
WHERE slug = 'the-sunshine-food-sprouting-co-african-vegan-cafe-three-anchor-bay' AND description_enriched_at IS NULL;
