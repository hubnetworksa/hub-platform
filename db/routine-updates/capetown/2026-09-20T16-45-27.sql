INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'tableview-shopping-centre-table-view', 'Tableview Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  'Cnr Otto du Plessis Drive & Blaauwberg Road, Table View, Cape Town, 7441', NULL, NULL,
  '["https://www.tableviewcentre.co.za/", "https://www.facebook.com/TableviewShoppingCentre/", "https://my-catalogue.co.za/stores/cape-town/baby-city/shop-1-tableview-centre-cnr-otto-du-plessis-and-blaauwberg-road-tableview"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-tableview-shopping-centre-table-view', 'Pick n Pay Tableview Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'tableview-shopping-centre-table-view'),
  'Tableview Shopping Centre, Cnr Blaauwberg Road & Otto Du Plessis Road, Table View, Cape Town, 7441', '021 557 6180', NULL, NULL,
  'Pick n Pay Tableview Shopping Centre is a supermarket branch of the Pick n Pay chain and one of the anchor tenants of Tableview Shopping Centre, Table View.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/pick-n-pay-tableview", "https://za.africabz.com/western-cape/pick-n-pay-tableview-31587"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-tableview-shopping-centre-table-view'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pna-tableview-shopping-centre-table-view', 'PNA Tableview Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'tableview-shopping-centre-table-view'),
  'Shop 6, Tableview Shopping Centre, Cnr Blaauwberg Road & Otto Du Plessis Drive, Table View, Cape Town, 7441', '021 556 5316', NULL, NULL,
  'PNA Tableview Shopping Centre is a stationery, art and craft supplies branch of the PNA chain in Tableview Shopping Centre, Table View.',
  NULL, NULL,
  '["https://za.readymap.info/4/122888", "https://homeappliancerepairs.co.za/2649226967168364147/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pna-tableview-shopping-centre-table-view'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'baby-city-tableview-shopping-centre-table-view', 'Baby City Tableview Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'tableview-shopping-centre-table-view'),
  'Shop 1, Tableview Shopping Centre, Cnr Otto Du Plessis Drive & Blaauwberg Road, Table View, Cape Town, 7441', '021 557 7532', NULL, NULL,
  'Baby City Tableview Shopping Centre is a baby products and equipment retailer branch of the Baby City chain in Tableview Shopping Centre, Table View.',
  NULL, NULL,
  '["https://www.babycity.co.za/tableview-2/", "https://my-catalogue.co.za/stores/cape-town/baby-city/shop-1-tableview-centre-cnr-otto-du-plessis-and-blaauwberg-road-tableview"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'baby-city-tableview-shopping-centre-table-view'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'blaauwberg-dental-and-ortho-table-view', 'Blaauwberg Dental & Ortho',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  '4 Blaauwberg Road, Table View, Cape Town, 7441', '021 556 7531', NULL, NULL,
  'Blaauwberg Dental & Ortho is a dental and orthodontic clinic in Table View, offering general dentistry and brace fitting.',
  NULL, NULL,
  '["https://dentalandortho.co.za/Find-A-Dentist/Dental-Ortho-Blaauwberg/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=417836"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'blaauwberg-dental-and-ortho-table-view'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'capelli-hair-and-beauty-table-view', 'Capelli Hair and Beauty Blouberg',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  'Shop G03, Horizon Bay, 4 Blaauwberg Road, Table View, Cape Town, 7441', '021 556 5194', NULL, NULL,
  'Capelli Hair and Beauty Blouberg is a hair and beauty salon in Table View, established in 2006.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/capelli-hair-and-beauty-blouberg-23744999.html", "https://za.africabz.com/western-cape/capelli-hair-beauty-166880"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'capelli-hair-and-beauty-table-view'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
