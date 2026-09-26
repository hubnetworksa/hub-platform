-- Hout Bay: 2 new businesses, both standalone
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cheynes-restaurant-hout-bay', 'Cheyne''s Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'hout-bay'),
  '35 Main Road, Hout Bay, Cape Town, 7806', '064 661 4415', NULL, NULL,
  'Cheyne''s Restaurant is a family-friendly Italian restaurant on Main Road, Hout Bay, serving home-cooked Italian dishes.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g469392-d4737813-Reviews-Cheyne_s-Hout_Bay_Western_Cape.html", "https://www.eatout.co.za/venue/cheynes1/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cheynes-restaurant-hout-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'massimos-hout-bay', 'Massimo''s',
  (SELECT id FROM suburbs WHERE slug = 'hout-bay'),
  'Oakhurst Farm Park, Main Road, Hout Bay, Cape Town, 7806', '021 790 5648', NULL, NULL,
  'Massimo''s is an Italian restaurant and pizzeria at Oakhurst Farm Park in Hout Bay.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g469392-d2100905-Reviews-Massimo_s-Hout_Bay_Western_Cape.html", "https://www.houtbaytourism.com/index.php/catalogue/eat/massimos-1-detail"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'massimos-hout-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
