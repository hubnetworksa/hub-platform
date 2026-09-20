INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'the-stables-shopping-centre-dunoon', 'The Stables Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'dunoon'),
  'Potsdam Road, Dunoon, Cape Town, 7441', NULL, NULL,
  '["https://www.annenberg.co.za/news/the-stables-shopping-centre-dunoon/", "https://www.tiendeo.co.za/stores/milnerton/shoprite-potsdam-road/6754"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-dunoon-dunoon', 'Shoprite Dunoon',
  (SELECT id FROM suburbs WHERE slug = 'dunoon'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-stables-shopping-centre-dunoon'),
  'The Stables Shopping Centre, Potsdam Road, Dunoon, Cape Town, 7441', '021 521 3600', NULL, NULL,
  'Shoprite Dunoon is a supermarket branch of the Shoprite chain inside The Stables Shopping Centre on Potsdam Road in Dunoon.',
  NULL, NULL,
  '["https://www.shopshours.co.za/shoprite/cape-town/c-57f3cabc47d677c3b27e3eae", "https://www.tiendeo.co.za/stores/milnerton/shoprite-potsdam-road/6754"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-dunoon-dunoon'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
