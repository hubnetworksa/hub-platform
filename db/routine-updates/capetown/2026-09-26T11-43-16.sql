-- Fish Hoek: 2 new businesses, both shopping-centre tenants
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mantellis-direct-fish-hoek', 'Mantelli''s Direct',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'valyland-centre-fish-hoek'),
  'Shop 24B, Valyland Centre, Ivanhoe Road, Fish Hoek, Cape Town, 7974', '083 395 1447', NULL, NULL,
  'Mantelli''s Direct is a factory-direct bakery outlet selling Mantelli''s bread and baked goods, in Valyland Centre, Fish Hoek.',
  NULL, NULL,
  '["https://mantellisdirect.com/fish-hoek", "https://www.southpeninsulamoms.co.za/business-directory/mantellis-direct-fish-hoek/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mantellis-direct-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'asserum-electronics-fish-hoek', 'Asserum Electronics',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'fish-hoek-town-square-fish-hoek'),
  '13B Town Square, 13 Main Road, Fish Hoek, Cape Town, 7974', '021 782 8882', NULL, NULL,
  'Asserum Electronics sells and repairs cellphones, tablets and computers, in Fish Hoek Town Square.',
  NULL, NULL,
  '["https://textmap.co.za/3/43650", "https://www.thinklocal.co.za/biz/asserum-iphones-computers-fish-hoek"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'asserum-electronics-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'electronics-appliances'),
  1
);
