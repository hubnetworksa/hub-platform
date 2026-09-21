INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sabrias-restaurant-wynberg', 'Sabria''s Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  '119 Ottery Road, Wynberg, Cape Town', '021 761 5247', 'https://www.sabrias.co.za/', NULL,
  'Sabria''s Restaurant is a halaal Cape Malay restaurant in Wynberg, serving grills, curries, seafood and pasta dishes.',
  NULL, NULL,
  '["https://www.capetown.travel/listing/sabrias-restaurant/", "https://hungryforhalaal.co.za/listing/sabrias-wynberg/", "https://www.sabrias.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sabrias-restaurant-wynberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'aneesas-take-aways-wynberg', 'Aneesa''s Take-Aways',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  '86 Ottery Road, Wynberg, Cape Town', '021 797 5682', 'https://www.aneesas.co.za/', NULL,
  'Aneesa''s Take-Aways is a takeaway shop in Wynberg known for its gatsby sandwiches and viennas and chips.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/aneesas-take-aways-wynberg/", "https://za.africabz.com/western-cape/aneesas-take-aways-17216"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'aneesas-take-aways-wynberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'chart-farm-wynberg', 'Chart Farm',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  '1A Klaasens Road, Wynberg, Cape Town', '021 761 0434', 'https://chartfarm.co.za/', NULL,
  'Chart Farm is a rose farm and farmstall in Wynberg where visitors can pick their own roses, with an on-site coffee shop.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/things-to-do/chart-farm/", "https://www.sa-venues.com/attractionswc/chart-farm.php", "https://chartfarm.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'chart-farm-wynberg'),
  (SELECT id FROM categories WHERE slug = 'nurseries-garden-centres'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'four-and-twenty-cafe-and-pantry-wynberg', 'Four & Twenty Café & Pantry',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  '23 Wolfe Street, Chelsea Village, Wynberg, Cape Town', '021 762 0975', NULL, NULL,
  'Four & Twenty Café & Pantry is a café and deli in Wynberg serving a weekly-changing lunch menu alongside homemade pastries and pantry goods.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/four-and-twenty-cafe", "https://www.tripadvisor.com/Restaurant_Review-g2426991-d4262933-Reviews-Four_Twenty-Wynberg_Western_Cape.html", "https://www.eatout.co.za/venue/four-twenty/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'four-and-twenty-cafe-and-pantry-wynberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
