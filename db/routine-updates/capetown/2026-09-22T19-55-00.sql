INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'eerste-river-city-centre-eerste-river', 'Eerste River City Centre',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  'Corner Forest Drive & Van Riebeeck Road, Eerste River, Cape Town, 7100', NULL, NULL,
  '["https://www.guzzle.co.za/malls/263/", "https://www.mallguide.co.za/malls/view/914/eerste-river-city-centre"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-eerste-river', 'PostNet Eerste River',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'eerste-river-city-centre-eerste-river'),
  'Shop 118B City Centre, 18 Forest Drive, Eerste River, Cape Town, 7100', '068 090 0454', NULL, NULL,
  'PostNet Eerste River is a branch of the printing, courier and business services franchise, in Eerste River City Centre.',
  NULL, NULL,
  '["https://www.postnet.co.za/stores/eersteriver/", "https://www.facebook.com/p/PostNet-Eerste-River-61563997720111/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-eerste-river', 'PEP',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'eerste-river-city-centre-eerste-river'),
  'Shop 22A/B/F, Eerste River City Centre, Forest Drive, Eerste River, Cape Town, 7100', '021 904 1422', NULL, NULL,
  'PEP is a branch of the national value clothing and homeware retailer, in Eerste River City Centre.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-abf-eerste-river-city-centre-forest-drive-eerste-river-cape-town-western-cape/12003", "https://my-catalogue.co.za/stores/cape-town/pep-stores/forest-drive-shop-22abf-eerste-river-city-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'e-kem-pharmacy-eerste-river', 'E-Kem Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  'Shop 10, Rose Centre, Corner Norman and Plein Street, Eerste River, Cape Town, 7100', '065 888 1986', NULL, NULL,
  'E-Kem Pharmacy is a retail pharmacy in Eerste River.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/e-kem-pharmacy-264210", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=396417"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'e-kem-pharmacy-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'medirite-grand-central-eerste-river', 'Medirite Grand Central',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'grand-central-shopping-centre-eerste-river'),
  'Grand Central Shopping Centre, Corner Main & Plein Street, Eerste River, Cape Town, 7100', '021 904 5710', NULL, NULL,
  'Medirite Grand Central is a pharmacy inside a Shoprite/Checkers store at Grand Central Shopping Centre.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=244757", "https://www.tiendeo.co.za/stores/eerste-river/medirite-cnr-hindle-and-eersterivier-roads/6033"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'medirite-grand-central-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
