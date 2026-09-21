INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lazari-vredehoek', 'Lazari',
  (SELECT id FROM suburbs WHERE slug = 'vredehoek'),
  '221 Upper Maynard Street, Vredehoek, Cape Town', '021 461 9865', NULL, NULL,
  'Lazari is a neighbourhood cafe on Upper Maynard Street serving a Cape Mediterranean-influenced breakfast and lunch menu, in Vredehoek.',
  NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/coffee-and-lunch-at-lazari/", "https://www.eatout.co.za/venue/lazari-food-gallery/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lazari-vredehoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'villa-portuguese-restaurant-vredehoek', 'Villa Portuguese Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'vredehoek'),
  '176 Buitenkant Street, Vredehoek, Cape Town', '021 465 4100', NULL, NULL,
  'Villa Portuguese Restaurant is a Portuguese restaurant and pizzeria on Buitenkant Street serving seafood, grills, pizzas and pastas, in Vredehoek.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/villa-portuguese/", "https://www.tripadvisor.com/Restaurant_Review-g1778144-d5821591-Reviews-Villa_Portuguese_Restaurant-Vredehoek_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'villa-portuguese-restaurant-vredehoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
