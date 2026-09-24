INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'sitari-village-centre-croydon', 'Sitari Village Centre',
  (SELECT id FROM suburbs WHERE slug = 'croydon'),
  'Cnr Sundarbans Drive & Old Main Rd, Croydon, Cape Town, 7130', NULL, NULL,
  '["https://isipani.co.za/project/sitari-village-shopping-centre/", "https://www.africa2trust.com/B2BAfrica/south-africa/business-legal-financial-services/shopping-centre/sitari-village-centre-za/Profile/AboutUs/1/8/57519/3"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-sitari-croydon', 'Checkers Sitari',
  (SELECT id FROM suburbs WHERE slug = 'croydon'),
  (SELECT id FROM shopping_centers WHERE slug = 'sitari-village-centre-croydon'),
  'Cnr Old Main Rd & Sundarbans Drive, Sitari Village Centre, Croydon, Cape Town, 7130', '021 843 0000', NULL, NULL,
  'Checkers Sitari is a supermarket at Sitari Village Centre, Croydon.',
  NULL, NULL,
  '["https://www.checkers.co.za/Western-Cape/Somerset-West/store-details/83549", "https://www.tiendeo.co.za/stores/somerset-west/checkers-cnr-old-main-rd-and-sunarbans-drive-sitari-estate/54170"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-sitari-croydon'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-sitari-fields-croydon', 'Dis-Chem Sitari Fields',
  (SELECT id FROM suburbs WHERE slug = 'croydon'),
  (SELECT id FROM shopping_centers WHERE slug = 'sitari-village-centre-croydon'),
  'Shop 15, Sitari Village Centre, Cnr Old Main Rd & Sundarbans Drive, Croydon, Cape Town, 7130', '021 541 0062', NULL, NULL,
  'Dis-Chem Sitari Fields is a pharmacy at Sitari Village Centre, Croydon.',
  NULL, NULL,
  '["https://www.dischem.co.za/sitari-fields-somerset-west", "https://www.cylex.net.za/company/dis-chem-pharmacy-sitari-fields-23699385.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-sitari-fields-croydon'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vida-e-caffe-sitari-croydon', 'Vida e Caffè Sitari',
  (SELECT id FROM suburbs WHERE slug = 'croydon'),
  (SELECT id FROM shopping_centers WHERE slug = 'sitari-village-centre-croydon'),
  'Shop 25, Sitari Village Centre, Old Main Road, Croydon, Cape Town, 7130', '021 461 0424', NULL, NULL,
  'Vida e Caffè Sitari is a coffee shop at Sitari Village Centre, Croydon.',
  NULL, NULL,
  '["https://vymaps.com/ZA/vida-e-caffe-111449913676684/", "https://wanderlog.com/place/details/3407905/vida-e-caff%C3%A8-sitari"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vida-e-caffe-sitari-croydon'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
