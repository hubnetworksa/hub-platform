-- Jobs 1-2: Kraaifontein
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'bloch-shopping-centre-kraaifontein', 'Bloch Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  '18 Van Riebeeck Road, Kraaifontein, Cape Town, 7570', NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Kraaifontein/Shoprite-Van-Riebeeck-Street/store-details/46294", "https://my-catalogue.co.za/stores/kraaifontein/shoprite/18-van-riebeeck-road"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-kraaifontein', 'Shoprite Kraaifontein',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  (SELECT id FROM shopping_centers WHERE slug = 'bloch-shopping-centre-kraaifontein'),
  'Bloch Shopping Centre, 18 Van Riebeeck Road, Kraaifontein, Cape Town, 7570', '021 986 8460', NULL, NULL,
  'Shoprite Kraaifontein is a supermarket at Bloch Shopping Centre on Van Riebeeck Road, offering groceries and everyday household essentials.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Kraaifontein/Shoprite-Van-Riebeeck-Street/store-details/46294", "https://za.africabz.com/western-cape/shoprite-checkers-74233"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-kraaifontein', 'KFC Kraaifontein',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  'Corner of Van Riebeeck & Old Paarl Road, Kraaifontein, Cape Town, 7570', '021 987 3937', NULL, NULL,
  'KFC Kraaifontein is a fast-food restaurant serving fried chicken, burgers and wings on the corner of Van Riebeeck and Old Paarl Road.',
  NULL, NULL,
  '["https://locations.kfc.co.za/western-cape/kraaifontein-cape-town/corner-of-van-riebeeck-&-old-paarl-road", "https://za.africabz.com/western-cape/kfc-kraaifontein-60132"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-okavango-crossing-kraaifontein', 'Checkers Okavango Crossing',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  (SELECT id FROM shopping_centers WHERE slug = 'okavango-crossing-kraaifontein'),
  'Okavango Crossing, Corner Okavango & Langeberg Road, Kraaifontein, Cape Town, 7570', '021 986 5200', NULL, NULL,
  'Checkers Okavango Crossing is an anchor supermarket at Okavango Crossing, offering groceries and everyday household essentials.',
  NULL, NULL,
  '["https://locations.checkers.co.za/western-cape/kraaifontein/66868/", "https://za.africabz.com/western-cape/checkers-okavango-crossing-26940"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-okavango-crossing-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
