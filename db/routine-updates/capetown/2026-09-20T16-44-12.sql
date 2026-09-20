INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-bayside-mall-table-view', 'Dis-Chem Bayside Mall',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'bayside-mall-table-view'),
  'Shop E31, Bayside Mall, Cnr Blaauwberg Road & Otto du Plessis Drive, Table View, Cape Town, 7441', '021 522 6140', NULL, NULL,
  'Dis-Chem Bayside Mall is a pharmacy and health-and-beauty retailer branch of the Dis-Chem chain in Bayside Mall, Table View.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/table-view/dis-chem/bayside-shopping-centre-cnr-blouberg-west-coast-road", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=272536"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-bayside-mall-table-view'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spec-savers-bayside-mall-table-view', 'Spec-Savers Bayside Mall',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'bayside-mall-table-view'),
  'Shop E30, Bayside Mall, Cnr Blaauwberg Road & West Coast Road, Table View, Cape Town, 7443', '021 557 5587', NULL, NULL,
  'Spec-Savers Bayside Mall is an optometry and audiology branch of the Spec-Savers chain in Bayside Mall, Table View.',
  NULL, NULL,
  '["https://www.specsavers.co.za/store/bayside", "https://za.africabz.com/western-cape/spec-savers-bayside-75586"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spec-savers-bayside-mall-table-view'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'truworths-bayside-mall-table-view', 'Truworths Bayside Mall',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'bayside-mall-table-view'),
  'Bayside Mall, Cnr Blaauwberg Road & West Coast Road, Table View, Cape Town, 7443', '021 887 4659', NULL, NULL,
  'Truworths Bayside Mall is a fashion clothing branch of the Truworths chain in Bayside Mall, Table View.',
  NULL, NULL,
  '["https://baysidemall.co.za/stores/truworths/", "https://www.callupcontact.com/b/Clothing_Stores/Truworths_Table_View/5824"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'truworths-bayside-mall-table-view'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bargain-books-bayside-mall-table-view', 'Bargain Books Bayside Mall',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'bayside-mall-table-view'),
  'Shop 36, Bayside Mall, 169 Blaauwberg Road & Otto Du Plessis Drive, Table View, Cape Town, 7441', '021 557 0594', NULL, NULL,
  'Bargain Books Bayside Mall is a discount bookstore branch of the Bargain Books chain in Bayside Mall, Table View.',
  NULL, NULL,
  '["https://readymap.co.za/106904/23408", "https://www.sa-venues.com/things-to-do/westerncape/bayside-mall/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bargain-books-bayside-mall-table-view'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sportscene-bayside-mall-table-view', 'Sportscene Bayside Mall',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'bayside-mall-table-view'),
  'Shop 15, Bayside Mall, Otto Du Plessis Drive, Table View, Cape Town', '021 556 1068', NULL, NULL,
  'Sportscene Bayside Mall is a sportswear and sneaker branch of the Sportscene chain in Bayside Mall, Table View.',
  NULL, NULL,
  '["https://baysidemall.co.za/store/sportscene/33635", "https://vymaps.com/ZA/Sportscene-Bayside-Mall-T3007960/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sportscene-bayside-mall-table-view'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'edgars-bayside-mall-table-view', 'Edgars Bayside Mall',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'bayside-mall-table-view'),
  'Bayside Mall, Blaauwberg Road at Raats Drive, Table View, Cape Town, 7441', '021 556 1360', NULL, NULL,
  'Edgars Bayside Mall is a department store branch of the Edgars fashion chain in Bayside Mall, Table View.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/milnerton/table-view/clothing-boutiques/edgars", "https://foursquare.com/v/edgars/4d22fb47d7b0b1f7589f299f"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'edgars-bayside-mall-table-view'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-bayside-mall-table-view', 'Checkers Bayside Mall',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'bayside-mall-table-view'),
  'Bayside Centre, Cnr Otto Du Plessis Drive & Blaauwberg Road, Table View, Cape Town', '021 521 3740', NULL, NULL,
  'Checkers Bayside Mall is a supermarket branch of the Checkers chain in Bayside Mall, Table View.',
  NULL, NULL,
  '["https://baysidemall.co.za/stores/checkers/", "https://www.tiendeo.co.za/stores/cape-town/checkers-bayside-centre-cnr-otto-du-plessis-drive-blauwberg-rd/5851"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-bayside-mall-table-view'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'foschini-bayside-mall-table-view', 'Foschini Bayside Mall',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'bayside-mall-table-view'),
  '86, Bayside Centre, Cnr Blaauwberg Road & West Coast Road, Table View, Cape Town, 7441', '021 521 3440', NULL, NULL,
  'Foschini Bayside Mall is a fashion clothing branch of the Foschini chain in Bayside Mall, Table View.',
  NULL, NULL,
  '["https://www.localstore.co.za/map/48215/foschini/cape-town/", "https://table-view-south-africa.bizfax.co.za/foschini-30.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'foschini-bayside-mall-table-view'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
