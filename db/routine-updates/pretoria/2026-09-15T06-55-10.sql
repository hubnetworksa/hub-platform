INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'eco-boulevard-eco-park', 'Eco Boulevard',
  (SELECT id FROM suburbs WHERE slug = 'eco-park'),
  '270 Witch-Hazel Ave, Eco Park, Centurion', NULL, NULL,
  '["https://ecoboulevard.co.za/", "https://m-t.co.za/property-type/retail/eco-boulevard-centurion/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'beyond-bowling-eco-park', 'Beyond Bowling',
  (SELECT id FROM suburbs WHERE slug = 'eco-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'eco-boulevard-eco-park'),
  'Eco Boulevard Mall, 270 Witch-Hazel Ave, Eco-Park Estate, Centurion, 0157', '081 434 5737', 'https://www.beyondbowling.co.za', NULL,
  'Beyond Bowling is a bowling and party-games entertainment venue inside Eco Boulevard, Eco Park, Centurion.',
  NULL, NULL,
  '["https://za.africabz.com/gauteng/beyond-bowling-12984", "https://foursquare.com/v/beyond-bowling/63cf8f76b947bb76145f9dbe"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'beyond-bowling-eco-park'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-eco-boulevard-eco-park', 'Checkers Eco Boulevard',
  (SELECT id FROM suburbs WHERE slug = 'eco-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'eco-boulevard-eco-park'),
  'Eco Boulevard, Witch-Hazel Ave, Eco-Park Estate, Centurion', '012 621 9440', 'https://www.checkers.co.za', NULL,
  'Checkers Eco Boulevard is a supermarket branch inside Eco Boulevard, Eco Park, Centurion.',
  NULL, NULL,
  '["https://za.africabz.com/gauteng/checkers-eco-boulevard-15851", "https://www.ananzi.co.za/ads/za/gauteng/centurion/highveld-technopark/supermarkets/checkers-eco-boulevard"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-eco-boulevard-eco-park'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'virgin-active-eco-park-eco-park', 'Virgin Active Eco Park',
  (SELECT id FROM suburbs WHERE slug = 'eco-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'eco-boulevard-eco-park'),
  'Shop 1, Extension 68, 270 Witch-Hazel Ave, Eco Park, Centurion', '012 661 3810', 'https://www.virginactive.co.za/gyms/eco-park', NULL,
  'Virgin Active Eco Park is a health and fitness gym club inside Eco Boulevard, Eco Park, Centurion.',
  NULL, NULL,
  '["https://southafricafirm.com/gauteng/virgin-active-eco-park-9167", "https://za.africabz.com/gauteng/virgin-active-eco-park-20369"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'virgin-active-eco-park-eco-park'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
