INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-plattekloof-shopping-centre-plattekloof', 'Clicks',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'plattekloof-shopping-centre-plattekloof'),
  'Plattekloof Shopping Centre, Olienhout Ave, Plattekloof, Cape Town, 7500', '021 930 3257', NULL, NULL,
  'Clicks is a pharmacy, health and beauty retailer, this branch in Plattekloof Shopping Centre, Plattekloof.',
  NULL, NULL,
  '["https://clicks.co.za/store/Plattekloof/154", "https://www.africabizinfo.com/ZA/clicks-plattekloof-021-930-3257"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-plattekloof-shopping-centre-plattekloof'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-plattekloof-shopping-centre-plattekloof', 'PostNet',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'plattekloof-shopping-centre-plattekloof'),
  'Shop 10, Plattekloof Shopping Centre, Olienhout Street, Plattekloof, Cape Town, 7500', '021 911 1104', NULL, NULL,
  'PostNet is a courier, printing and mailbox services retailer, this branch in Plattekloof Shopping Centre, Plattekloof.',
  NULL, NULL,
  '["https://www.postnet.co.za/stores/plattekloof", "https://www.yellowpages.net/phone_27-219111104_courier-service_Cape-Town_ZA13168.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-plattekloof-shopping-centre-plattekloof'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wellness-warehouse-plattekloof-village-plattekloof', 'Wellness Warehouse',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'plattekloof-village-shopping-centre-plattekloof'),
  'Shop 26, Plattekloof Village Shopping Centre, Cnr Plattekloof Road & Baronetcy Boulevard, Plattekloof, Cape Town, 7500', '021 558 7106', NULL, NULL,
  'Wellness Warehouse is a health and wellness retailer selling supplements, natural remedies and health foods, this branch in Plattekloof Village Shopping Centre.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/wellness-warehouse-plattekloof-village-baronetcy-boulevard-cape-town-EvzNWW", "https://www.plattekloofvillageshoppingcentre.co.za/shop/wellness-warehouse/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wellness-warehouse-plattekloof-village-plattekloof'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pna-plattekloof-village-plattekloof', 'PNA',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'plattekloof-village-shopping-centre-plattekloof'),
  'Plattekloof Village Shopping Centre, Plattekloof Road, Plattekloof, Cape Town, 7500', '021 558 0406', NULL, NULL,
  'PNA is a stationery, art and craft materials and book retailer, this branch in Plattekloof Village Shopping Centre.',
  NULL, NULL,
  '["https://southafricafirm.com/western-cape/pna-plattekloof-30888", "https://za.africabz.com/western-cape/pna-plattekloof-173547"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pna-plattekloof-village-plattekloof'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);
