INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'grand-central-shopping-centre-eerste-river', 'Grand Central Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  'Corner Main & Plein Street, Eerste River, Cape Town, 7100', NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Cape-Town/Eersterivier/Shoprite-Eerste-River/store-details/1789", "https://za.africabz.com/western-cape/grand-central-shopping-centre-75973"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-eerste-river-grand-central-eerste-river', 'Shoprite Eerste River',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'grand-central-shopping-centre-eerste-river'),
  'Grand Central Shopping Centre, Corner of Main & Plain Street, Eersterivier, Cape Town, 7100', '021 902 8160', NULL, NULL,
  'Shoprite Eerste River is a supermarket inside Grand Central Shopping Centre, Eerste River.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Cape-Town/Eersterivier/Shoprite-Eerste-River/store-details/1789", "https://mydorpie.com/m/?page=chain_shoprite_grand_central_shopping_centre_eersterivier"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-eerste-river-grand-central-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'capitec-bank-grand-central-eerste-river', 'Capitec Bank Grand Central',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'grand-central-shopping-centre-eerste-river'),
  'Shop 17-19, Grand Central Shopping Centre, 50 Plein St, Eerste River, Cape Town, 7100', '0860 102 043', NULL, NULL,
  'Capitec Bank Grand Central is a bank branch inside Grand Central Shopping Centre, Eerste River.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/eerste-river/capitec-bank-shop--grand-central-centre-r/62839", "https://www.cybo.com/ZA-biz/capitec-bank-eerste-river-grand-central"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'capitec-bank-grand-central-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-eerste-river-mall-eerste-river', 'Clicks Eerste River Mall',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'eerste-rivier-mall-eerste-river'),
  'Shop M14-17, Eerste River Mall, Plein St, Eerste River, Cape Town, 7100', '021 488 8290', NULL, NULL,
  'Clicks Eerste River Mall is a pharmacy and health, beauty and homeware retailer inside Eerste Rivier Mall, Eerste River.',
  NULL, NULL,
  '["https://clicks.co.za/store/Eerste-River-Mall/2232", "https://www.tiendeo.co.za/stores/eerste-river/clicks"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-eerste-river-mall-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
