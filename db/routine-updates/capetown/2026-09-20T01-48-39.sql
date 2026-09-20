INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'delft-mall-delft', 'Delft Mall',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  'Corner Hindle Road & Delft Main Road, Delft, Cape Town', NULL, NULL,
  '["https://delft-mall.co.za/store-directory/", "https://capecolouredculture.co.za/community/delft-cape-town/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-delft-mall-delft', 'Clicks Delft Mall',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  (SELECT id FROM shopping_centers WHERE slug = 'delft-mall-delft'),
  'Shop 7, Delft Mall, Hindle Road, Delft, Cape Town, 7100',
  '021 955 0031', NULL, NULL,
  'Clicks Delft Mall is a branch of the Clicks pharmacy and health-and-beauty retail chain, in Delft Mall, Delft.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/clicks-delft-mall-shop-delft-mall-hindle-road/55798", "https://clicks.co.za/store/Delft/1859"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-delft-mall-delft'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-delft-mall-delft', 'PEP Delft Mall',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  (SELECT id FROM shopping_centers WHERE slug = 'delft-mall-delft'),
  'Shop 32, Delft Mall, Corner Hindle & Delft Main Road, Delft, Cape Town',
  '021 955 0095', NULL, NULL,
  'PEP Delft Mall is a branch of the PEP clothing and general merchandise chain, in Delft Mall, Delft.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-delft-mall-cnr-hindle-delft-main-road-delft-cape-town-western-cape/69682", "https://www.facebook.com/PepDelftMall/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-delft-mall-delft'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ackermans-delft-mall-delft', 'Ackermans Delft Mall',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  (SELECT id FROM shopping_centers WHERE slug = 'delft-mall-delft'),
  'Shop 33, Delft Mall, Corner Hindle & Delft Main Road, Delft, Cape Town',
  '021 955 0165', NULL, NULL,
  'Ackermans Delft Mall is a branch of the Ackermans clothing chain, in Delft Mall, Delft.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/mfuleni/ackermans-delft-mallcnr-hindle-delft-main-rd/45343", "https://my-catalogue.co.za/stores/cape-town/ackermans/cnr-hindle-road-and-delft-main-road-delft"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ackermans-delft-mall-delft'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-delft-mall-delft', 'Shoprite Delft Mall',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  (SELECT id FROM shopping_centers WHERE slug = 'delft-mall-delft'),
  'Delft Mall, Corner Hindle Road & Delft Main Road, Delft, Cape Town',
  '021 953 7975', NULL, NULL,
  'Shoprite Delft Mall is a supermarket in Delft Mall, Delft.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Cape-Town/Shoprite-Delft/store-details/34817", "https://my-catalogue.co.za/stores/cape-town/shoprite/cnr-of-hindle-delft-main-road"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-delft-mall-delft'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
