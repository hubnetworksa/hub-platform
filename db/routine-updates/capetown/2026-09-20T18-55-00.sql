INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'tableview-shopping-centre-table-view', 'Tableview Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  'Cnr Otto du Plessis Rd & Blaauwberg Rd, Table View, Cape Town, 7441', NULL, NULL,
  '["https://www.tableviewcentre.co.za/", "https://www.lekkeslaap.co.za/attractions/tableview-shopping-centre"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-tableview-table-view', 'Pick n Pay Tableview',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'tableview-shopping-centre-table-view'),
  'Tableview Shopping Centre, Cnr Blaauwberg Rd & Otto du Plessis Rd, Table View, Cape Town, 7441', '021 557 6180', NULL, NULL,
  'Pick n Pay Tableview is a supermarket branch of the Pick n Pay chain inside Tableview Shopping Centre in Table View.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/pick-n-pay-tableview-31587", "https://foursquare.com/v/pick-n-pay/4d18862ccc216ea8d89f76d3", "https://www.tableviewcentre.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-tableview-table-view'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pna-table-view-table-view', 'PNA Table View',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'tableview-shopping-centre-table-view'),
  'Shop 6, Tableview Shopping Centre, Cnr Blaauwberg Rd & Otto du Plessis Dr, Table View, Cape Town, 7441', '021 556 5316', NULL, NULL,
  'PNA Table View is a stationery, art and craft supplies store inside Tableview Shopping Centre in Table View.',
  NULL, NULL,
  '["https://za.readymap.info/4/122888", "https://www.tableviewcentre.co.za/shop/pna-table-view/", "https://pna.co.za/store-locator/pna-tableview/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pna-table-view-table-view'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-tableview-table-view', 'Dis-Chem Pharmacy Tableview',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'tableview-shopping-centre-table-view'),
  'Shop 2, Tableview Shopping Centre, Cnr Blaauwberg Rd & Otto du Plessis Rd, Table View, Cape Town, 7441', '021 541 0605', NULL, NULL,
  'Dis-Chem Pharmacy Tableview is a pharmacy branch of the Dis-Chem chain inside Tableview Shopping Centre in Table View, with an in-store clinic.',
  NULL, NULL,
  '["https://www.dischem.co.za/table-view-shopping-centre", "https://www.tableviewcentre.co.za/shop/dis-chem-pharmacies/", "https://www.cylex.net.za/company/dis-chem-tableview-shopping-centre---cape-town-23805372.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-tableview-table-view'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
