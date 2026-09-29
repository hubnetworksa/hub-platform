INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'capital-craft-beer-academy-menlo-park', 'Capital Craft Beer Academy',
  (SELECT id FROM suburbs WHERE slug = 'menlo-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'greenlyn-village-centre-menlo-park'),
  'Shop 20, Greenlyn Village Centre, Cnr Thomas Edison & 12th Street East, Menlo Park, Pretoria', '012 424 8601', NULL, NULL,
  'Capital Craft Beer Academy is a craft-beer-focused restaurant and bar with an industrial-Bavarian-styled interior and an outdoor deck, stocking well over 100 South African and imported craft beers alongside a menu of burgers, sandwiches, ribs, wings and platters, in Menlo Park.',
  NULL, NULL,
  '["https://debeernecessities.com/tag/greenlyn/", "https://www.inyourpocket.com/144615v"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'capital-craft-beer-academy-menlo-park'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'carlton-cafe-delicious-menlo-park', 'Carlton Cafe Delicious',
  (SELECT id FROM suburbs WHERE slug = 'menlo-park'),
  '71 13th Street, Menlo Park, Pretoria, 0102', '+27 12 460 7996', NULL, NULL,
  'Carlton Cafe Delicious is a daytime cafe and delicatessen in Menlo Park with indoor and outdoor seating, serving breakfast, brunch and lunch made from fresh, seasonal ingredients; its attached deli sells confectionery, take-home meals and locally-sourced products, and it also offers catering. Trading since 2002.',
  NULL, NULL,
  '["https://inyourpocket.com/pretoria/carlton-cafe-delicious_144608v", "https://afktravel.com/restaurant/carlton-cafe-delicious/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'carlton-cafe-delicious-menlo-park'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
