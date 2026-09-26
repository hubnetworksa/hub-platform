INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'joon-restaurant-muizenberg', 'Joon Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  '40 Palmer Road, Muizenberg Village Centre, Muizenberg, Cape Town, 7945', '083 336 8305', NULL, NULL,
  'Joon Restaurant is a Mediterranean restaurant in Muizenberg Village Centre, Muizenberg.',
  NULL, NULL,
  '["https://www.joonrestaurant.com/", "https://za.africabz.com/western-cape/joon-67449"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'joon-restaurant-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-commons-muizenberg', 'The Commons',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  'Surfers Corner, Beach Road, Muizenberg, Cape Town, 7945', '083 799 8294', NULL, NULL,
  'The Commons is a cafe and creative community space at Surfers Corner, offering food, live music and a vinyl and bookstore, in Muizenberg.',
  NULL, NULL,
  '["https://thecommons.co.za/", "https://za.africabz.com/western-cape/the-commons-310909"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-commons-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
