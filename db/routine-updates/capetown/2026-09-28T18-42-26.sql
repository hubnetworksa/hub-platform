INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'excellent-meat-market-ottery', 'Excellent Meat Market',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  '145 Wetton Road, Ottery, Cape Town, 7808', '021 703 2780', NULL, NULL,
  'Excellent Meat Market is a butchery on Wetton Road in Ottery, part of a small Cape Town chain.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/excellent-meat-market-45152", "https://www.cybo.com/ZA-biz/excellent-meat-market", "https://excellentmeat.co.za/find-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'excellent-meat-market-ottery'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cell-c-westgate-mall-westgate', 'Cell C',
  (SELECT id FROM suburbs WHERE slug = 'westgate'),
  (SELECT id FROM shopping_centers WHERE slug = 'westgate-mall-westgate'),
  'Shop 34-35, Westgate Mall, Cnr Morgenster Road & Vanguard Drive, Mitchells Plain, Cape Town, 7785',
  '084 770 0031', 'https://www.cellc.co.za', NULL,
  'Cell C is a mobile network operator''s retail store in Westgate Mall, Mitchells Plain.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/mitchells-plain/cell-c-shop--westgate-mall-corner-morgenster-road-and-vanguard-drive/39671", "https://za.africabz.com/western-cape/cell-c-westgate-mall-mitchells-plain-179735"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cell-c-westgate-mall-westgate'),
  (SELECT id FROM categories WHERE slug = 'mobile-phones'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'miladys-westgate-mall-westgate', 'Miladys',
  (SELECT id FROM suburbs WHERE slug = 'westgate'),
  (SELECT id FROM shopping_centers WHERE slug = 'westgate-mall-westgate'),
  'Shop 76, Westgate Mall, Cnr Jakes Gerwel Drive & Morgenster Road, Mitchells Plain, Cape Town, 7785',
  '087 750 1868', 'https://www.miladys.com', NULL,
  'Miladys is a women''s fashion clothing store in Westgate Mall, Mitchells Plain.',
  NULL, NULL,
  '["https://www.miladys.com/miladys-mitchells-plain-40570", "https://www.miladys.com/storelocator"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'miladys-westgate-mall-westgate'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
