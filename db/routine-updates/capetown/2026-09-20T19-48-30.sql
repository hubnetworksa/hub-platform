INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'emporium-centre-parklands', 'The Emporium Centre',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  'Cnr Sandown & Braselton Roads, Parklands, Cape Town, 7441', NULL, NULL,
  '["https://emporiumcentre.co.za/", "https://www.rennieproperty.co.za/buildings/the-emporium.html"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'food-lovers-market-parklands', 'Food Lover''s Market Parklands',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  (SELECT id FROM shopping_centers WHERE slug = 'emporium-centre-parklands'),
  'Shop 33, Emporium Centre, Sandown Road, Parklands, Cape Town, 7441', '021 250 0007', NULL, NULL,
  'Food Lover''s Market Parklands is a fresh-produce supermarket inside the Emporium Centre on Sandown Road in Parklands.',
  NULL, NULL,
  '["https://foodloversmarket.co.za/stores/parklands/", "https://emporiumcentre.co.za/directory/food-lovers-market/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'food-lovers-market-parklands'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'parklands-shopping-centre-parklands', 'Parklands Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  'Link Road, Parklands, Cape Town, 7441', NULL, NULL,
  '["https://za.africabz.com/western-cape/parklands-shopping-centre-169426", "https://www.sunningdalepharm.co.za/amp/sunningdale-pharmacy-hsaer5"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sunningdale-pharmacy-parklands', 'Sunningdale Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  (SELECT id FROM shopping_centers WHERE slug = 'parklands-shopping-centre-parklands'),
  'Shop 14, Parklands Shopping Centre, Link Road, Parklands, Cape Town, 7441', '021 556 8152', NULL, NULL,
  'Sunningdale Pharmacy is a pharmacy in Shop 14 of Parklands Shopping Centre on Link Road in Parklands.',
  NULL, NULL,
  '["https://www.sunningdalepharm.co.za/amp/sunningdale-pharmacy-hsaer5", "https://www.brabys.com/za/western-cape/milnerton/parklands/pharmacies/sunningdale-pharmacy"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sunningdale-pharmacy-parklands'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'parklands-piazza-pharmacy-parklands', 'Parklands Piazza Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  '3 Piazza Centre, Parklands Main Road, Parklands, Cape Town, 7441', '021 556 1197', NULL, NULL,
  'Parklands Piazza Pharmacy is a pharmacy in the Piazza Centre on Parklands Main Road in Parklands.',
  NULL, NULL,
  '["https://www.yellowpages.co.za/business/7258720_2", "https://www.thinklocal.co.za/biz/parklands-piazza-pharmacy-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'parklands-piazza-pharmacy-parklands'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
