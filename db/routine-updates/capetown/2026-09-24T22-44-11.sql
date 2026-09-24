INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-okavango-crossing-kraaifontein', 'Checkers', (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  (SELECT id FROM shopping_centers WHERE slug = 'okavango-crossing-kraaifontein'),
  'Corner of Langeberg Road and Okavango Road, Okavango Crossing, Kraaifontein, Cape Town, 7570', '021 986 5200', NULL, NULL,
  'Checkers is a supermarket inside Okavango Crossing shopping centre in Kraaifontein.',
  NULL, NULL,
  '["https://www.checkers.co.za/Western-Cape/Kraaifontein/store-details/66868", "https://za.africabz.com/western-cape/checkers-okavango-crossing-26940"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-okavango-crossing-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-food-okavango-crossing-kraaifontein', 'Woolworths Food', (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  (SELECT id FROM shopping_centers WHERE slug = 'okavango-crossing-kraaifontein'),
  'Shop 16, Okavango Crossing, Cnr Okavango & Langeberg Roads, Kraaifontein, Cape Town, 7569', '021 986 5260', NULL, NULL,
  'Woolworths Food is a grocery store inside Okavango Crossing shopping centre in Kraaifontein.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/woolworths-okavango-crossing-55136", "https://wanderlog.com/place/details/12429512/woolworths-food-okavango-crossing"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-food-okavango-crossing-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'virgin-active-okavango-crossing-kraaifontein', 'Virgin Active Okavango', (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  (SELECT id FROM shopping_centers WHERE slug = 'okavango-crossing-kraaifontein'),
  'Shop 17, Okavango Crossing, Cnr Langeberg Road & Okavango Road, Kraaifontein, Cape Town', '021 987 1260', NULL, NULL,
  'Virgin Active Okavango is a gym inside Okavango Crossing shopping centre in Kraaifontein.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/virgin-active-okavango-81824", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=394765"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'virgin-active-okavango-crossing-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
