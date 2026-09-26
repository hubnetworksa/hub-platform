INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-sitari-croydon', 'Woolworths Food',
  (SELECT id FROM suburbs WHERE slug = 'croydon'),
  (SELECT id FROM shopping_centers WHERE slug = 'sitari-village-centre-croydon'),
  'Shop 4, Sitari Village Centre, Cnr Sundarbans Drive & Old Main Rd, Croydon, 7130', '021 843 6000', NULL, NULL,
  'Woolworths Food is a supermarket at Sitari Village Centre in Croydon.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/woolworths-sitari-286510", "https://www.findglocal.com/ZA/Stellenbosch/109236277210316/WOOLWORTHS"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-sitari-croydon'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'agrimark-sitari-croydon', 'Agrimark Sitari',
  (SELECT id FROM suburbs WHERE slug = 'croydon'),
  (SELECT id FROM shopping_centers WHERE slug = 'sitari-village-centre-croydon'),
  'Sitari Village Centre, Cnr R102 & Sundarbans Drive, Croydon, 7130', '021 842 0410', NULL, NULL,
  'Agrimark Sitari is an agricultural and farming supplies store at Sitari Village Centre in Croydon.',
  NULL, NULL,
  '["https://www.agrimark.co.za/store/agrimark-sitari", "https://www.africabizinfo.com/ZA/agrimark-sitari-021-842-0410"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'agrimark-sitari-croydon'),
  (SELECT id FROM categories WHERE slug = 'agricultural-farming-supplies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sitari-medical-centre-croydon', 'Sitari Medical Centre',
  (SELECT id FROM suburbs WHERE slug = 'croydon'),
  (SELECT id FROM shopping_centers WHERE slug = 'sitari-village-centre-croydon'),
  'Shop 38, Sitari Village Centre, 2 Sundarbans Drive, Croydon, 7130', '021 842 0177', NULL, NULL,
  'Sitari Medical Centre is a general medical practice at Sitari Village Centre in Croydon.',
  NULL, NULL,
  '["https://www.sitarimedicalcentre.co.za/contact", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=243016"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sitari-medical-centre-croydon'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sitari-health-shop-croydon', 'Sitari Health Shop',
  (SELECT id FROM suburbs WHERE slug = 'croydon'),
  (SELECT id FROM shopping_centers WHERE slug = 'sitari-village-centre-croydon'),
  '2 Sundarbans Drive, Sitari Village Centre, Croydon, 7130', '021 202 5904', NULL, NULL,
  'Sitari Health Shop is a health and wellness supplement store at Sitari Village Centre in Croydon.',
  NULL, NULL,
  '["https://www.willowwellness.co.za/store-locator/1012/sitari-health-shop", "https://waterstonehealthshop.co.za/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sitari-health-shop-croydon'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
