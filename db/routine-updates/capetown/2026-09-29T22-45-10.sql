INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tryn-at-steenberg-tokai', 'Tryn at Steenberg',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  'Steenberg Road, Steenberg Estate, Tokai, Cape Town, 7945', '+27 21 713 7178', 'https://steenbergfarm.com/tryn-cape-town-contemporary-restaurant/', 'info@tryn.co.za',
  'Tryn at Steenberg is a contemporary restaurant on the Steenberg Wine Estate in Tokai, occupying the farm''s original wine cellar and serving breakfast, lunch and dinner indoors or in a garden setting.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g1770549-d18953937-Reviews-Tryn-Tokai_Western_Cape.html", "https://steenbergfarm.com/tryn-cape-town-contemporary-restaurant/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tryn-at-steenberg-tokai'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bistro-sixteen82-tokai', 'Bistro Sixteen82',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  'Steenberg Road, Steenberg Estate, Tokai, Cape Town, 7945', '+27 21 205 3866', 'https://steenbergfarm.com/bistro1682-cape-town-contemporary-restaurant/', 'reservations@bistro1682.co.za',
  'Bistro Sixteen82 is a tapas and bistro-style restaurant on the Steenberg Wine Estate in Tokai, serving breakfast, lunch, an all-day menu and tapas alongside estate wines.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/bistro-sixteen82/", "https://steenbergfarm.com/bistro1682-cape-town-contemporary-restaurant/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bistro-sixteen82-tokai'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
