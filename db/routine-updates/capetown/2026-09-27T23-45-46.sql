INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'gusto-urban-italian-century-city', 'Gusto Urban Italian',
  (SELECT id FROM suburbs WHERE slug = 'century-city'),
  '4 Conference Lane, Bridgewater, Bridgeways Precinct, Century City, Cape Town', '021 202 9142', 'https://www.gustourbanitalian.co.za/', NULL,
  'Gusto Urban Italian is a wood-fired Italian restaurant in the Bridgewater precinct of Century City, overlooking Ratanga Park and the canal.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/restaurants/gusto-urban-italian/", "https://www.gustourbanitalian.co.za/contact"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'gusto-urban-italian-century-city'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'brick-lane-eatery-century-city', 'Brick Lane Eatery',
  (SELECT id FROM suburbs WHERE slug = 'century-city'),
  '142 The Quays, Park Lane, Century City, Cape Town', '021 202 1191', 'http://blect.co.za', NULL,
  'Brick Lane Eatery is a dog-friendly restaurant in Century City with outdoor seating overlooking the Waterstone waterways.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/brick-lane-eatery/", "http://blect.co.za/contact.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'brick-lane-eatery-century-city'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bootlegger-coffee-company-century-city', 'Bootlegger Coffee Company',
  (SELECT id FROM suburbs WHERE slug = 'century-city'),
  'Shop 5, 5 Esplanade Road, Century City, Cape Town, 7441', '021 201 6811', NULL, NULL,
  'Bootlegger Coffee Company is a specialty coffee shop in Century City serving breakfast, lunch and brunch.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g4464136-d13235450-Reviews-Bootlegger_Coffee_Company_Century_City-Century_City_Western_Cape.html", "https://www.sluurpy.co.za/century-city/restaurant/5032310/bootlegger-coffee-company-century-city"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bootlegger-coffee-company-century-city'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
