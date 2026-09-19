INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'harfield-village-centre-harfield-village', 'Harfield Village Centre',
  (SELECT id FROM suburbs WHERE slug = 'harfield-village'),
  '48 2nd Avenue, Claremont, Cape Town, 7708', NULL, NULL,
  '["https://harfieldcentre.co.za/about-us", "https://www.anvilproperty.co.za/commercial-property/office-space/to-rent/claremont/harfield-village-centre-48-2nd-avenue-claremont-cape-town-14175"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zapata-harfield-village', 'Zapata',
  (SELECT id FROM suburbs WHERE slug = 'harfield-village'),
  (SELECT id FROM shopping_centers WHERE slug = 'harfield-village-centre-harfield-village'),
  'Shop 1, Harfield Village Centre, 2nd Avenue, Harfield Village, Claremont, Cape Town', '021 671 2393', NULL, NULL,
  'Zapata is a Mexican restaurant at Harfield Village Centre on Second Avenue, known locally for its chilli poppers and Mexican-style dishes.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/zapata-mexican-restaurant/", "https://harfield-village.co.za/business/zapata-mexican-restaurant/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zapata-harfield-village'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-village-bicycle-harfield-village', 'The Village Bicycle',
  (SELECT id FROM suburbs WHERE slug = 'harfield-village'),
  '37 Second Avenue, Harfield Village, Claremont, Cape Town, 7708', '021 683 5453', NULL, NULL,
  'The Village Bicycle is a pizzeria and grill on Second Avenue in Harfield Village, serving woodfired pizzas, pastas and grass-fed beef burgers.',
  NULL, NULL,
  '["https://harfield-village.co.za/business/the-village-bicycle/", "https://www.thevillageb.co.za/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-village-bicycle-harfield-village'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rare-grill-harfield-village', 'Rare Grill',
  (SELECT id FROM suburbs WHERE slug = 'harfield-village'),
  'Shop 3, 166 2nd Avenue, Harfield Village, Kenilworth, Cape Town', '076 460 0423', NULL, NULL,
  'Rare Grill is a small steakhouse on Second Avenue in Harfield Village, specialising in perfectly grilled steaks.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/rare-grill/", "https://www.raregrill.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rare-grill-harfield-village'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
