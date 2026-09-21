INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'antonios-pizza-place-gordons-bay', 'Antonio''s Pizza Place',
  (SELECT id FROM suburbs WHERE slug = 'gordons-bay'),
  'The Boardwalk, Breakwater Lane, Harbour Island, Gordon''s Bay, 7140', '021 856 3361', 'https://www.antoniospizza.co.za', NULL,
  'Antonio''s Pizza Place is a pizza and grill restaurant on the boardwalk at Harbour Island in Gordon''s Bay, with outside seating overlooking the marina.',
  NULL, NULL,
  '["https://www.antoniospizza.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g1020231-d3615770-Reviews-Antonios_Pizza_Place-Gordon_s_Bay_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'antonios-pizza-place-gordons-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'helderberg-restaurant-gordons-bay', 'Helderberg Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'gordons-bay'),
  'Beach Road, Gordon''s Bay Harbour, Gordon''s Bay, 7140', '021 856 3263', NULL, NULL,
  'Helderberg Restaurant is a restaurant at Gordon''s Bay Harbour serving traditional South African fare, housed in the former L''Auberge du Paysan building.',
  NULL, NULL,
  '["https://www.sa-venues.com/restaurants/westerncape/bysuburb/gordons-bay/", "https://www.summerplace-gordonsbay.co.za/knowledgebase.php?article=19"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'helderberg-restaurant-gordons-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
