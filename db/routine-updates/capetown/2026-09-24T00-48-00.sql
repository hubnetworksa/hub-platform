-- Jobs 1-2: Gordon's Bay suburb research
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'krystal-restaurant-gordons-bay', 'Krystal Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'gordons-bay'),
  'Krystal Beach Hotel, Breakwater Lane, Harbour Island, Gordon''s Bay, 7140', '021 840 7500', NULL, NULL,
  'Krystal Restaurant is the in-house restaurant at Krystal Beach Hotel on Harbour Island, Gordon''s Bay, serving meals with sea views.',
  NULL, NULL,
  '["https://www.krystalbeach.co.za/dining/krystal-restaurant/", "https://www.tripadvisor.com/Restaurant_Review-g1020231-d9819813-Reviews-Krystal_Restaurant-Gordon_s_Bay_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'krystal-restaurant-gordons-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'thirsty-oyster-tavern-gordons-bay', 'The Thirsty Oyster Tavern',
  (SELECT id FROM suburbs WHERE slug = 'gordons-bay'),
  '156 Beach Road, Old Harbour, Gordon''s Bay, 7140', '021 856 4457', NULL, NULL,
  'The Thirsty Oyster Tavern is a seafood-focused tavern and takeaway at Old Harbour in Gordon''s Bay.',
  NULL, NULL,
  '["http://www.thethirstyoyster.co.za/", "https://www.eatout.co.za/venue/thirsty-oyster-tavern-gordons-bay/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'thirsty-oyster-tavern-gordons-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
