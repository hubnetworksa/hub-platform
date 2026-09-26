INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pizzayiro-sitari-croydon', 'Pizzayiro',
  (SELECT id FROM suburbs WHERE slug = 'croydon'),
  (SELECT id FROM shopping_centers WHERE slug = 'sitari-village-centre-croydon'),
  'Shop 39, Sitari Village Centre, Sundarbans Drive, Croydon, 7130', '021 879 2390', NULL, NULL,
  'Pizzayiro is a restaurant serving wood-fired pizzas and Greek yiros at Sitari Village Centre in Croydon.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/pizzayiro-267935", "https://www.sluurpy.co.za/somerset-west/restaurant/8449616/pizzayiro"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pizzayiro-sitari-croydon'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
