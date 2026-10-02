INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'northern-aquatics-bothasig', 'Northern Aquatics',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  '52 Vryburger Avenue, Bothasig, Cape Town, 7441', '021 559 2286', NULL, NULL,
  'Northern Aquatics is a pet and aquatics shop on Vryburger Avenue, in Bothasig.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/northern-aquatics_1k", "https://za.africabz.com/western-cape/northern-aquatics-144202"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'northern-aquatics-bothasig'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'auto-world-midas-bothasig-bothasig', 'Auto World Midas Bothasig',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  (SELECT id FROM shopping_centers WHERE slug = 'bothasig-square-bothasig'),
  'Shop 41, Bothasig Mall, 41 Vryburger Avenue, Bothasig, Cape Town', '021 558 6895', NULL, NULL,
  'Auto World Midas Bothasig is an automotive spare parts and accessories store in Bothasig.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/auto-world-midas-bothasig", "https://za.africabz.com/western-cape/auto-world-midas-bothasig-52995"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'auto-world-midas-bothasig-bothasig'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);
