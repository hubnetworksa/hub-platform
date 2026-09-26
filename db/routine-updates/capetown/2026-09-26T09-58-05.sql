INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fair-cape-factory-shop-killarney-gardens', 'Fair Cape Factory Shop',
  (SELECT id FROM suburbs WHERE slug = 'killarney-gardens'),
  '11 Hunt Road, Killarney Gardens, Cape Town, 7441', '021 521 2659', NULL, NULL,
  'Fair Cape Factory Shop is the dairy factory outlet of Fair Cape Dairies, selling milk, custard and other dairy and dessert products direct to the public in Killarney Gardens.',
  NULL, NULL,
  '["https://www.facebook.com/faircape/photos/a.156631697721913/1005977366120671/?type=3", "https://za.africabz.com/western-cape/fair-cape-factory-shop-215584"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fair-cape-factory-shop-killarney-gardens'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'printech-engineering-killarney-gardens', 'Printech Engineering',
  (SELECT id FROM suburbs WHERE slug = 'killarney-gardens'),
  '43/45 Mansell Road, Killarney Gardens, Cape Town, 7441', '021 556 0980', NULL, NULL,
  'Printech Engineering is an engineering company specialising in printing machinery and equipment repairs and installation, headquartered in Killarney Gardens.',
  NULL, NULL,
  '["https://www.printech.co.za/home/", "http://inkillarneygardens.co.za/listing/printech-engineering/", "https://www.brabys.com/za/western-cape/cape-town/killarney-gardens/printers-engineers/printech-engineering"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'printech-engineering-killarney-gardens'),
  (SELECT id FROM categories WHERE slug = 'engineering-surveying'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tableview-coachworks-killarney-gardens', 'Tableview Coachworks',
  (SELECT id FROM suburbs WHERE slug = 'killarney-gardens'),
  '39 Killarney Avenue, Killarney Gardens, Cape Town, 7441', '021 557 4714', NULL, NULL,
  'Tableview Coachworks is a panel beating and spray painting workshop in Killarney Gardens.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/milnerton/killarney-gardens/panelling/tableview-coachworks", "https://panelbeatersdirectory.co.za/listing-contact.php?listings_id=1332", "https://za.africabz.com/western-cape/tableview-coachworks-82666"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tableview-coachworks-killarney-gardens'),
  (SELECT id FROM categories WHERE slug = 'panel-beaters-spray-painters'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'millennium-foods-killarney-gardens', 'Millennium Foods',
  (SELECT id FROM suburbs WHERE slug = 'killarney-gardens'),
  '19 Scheckter Road, Killarney Gardens, Cape Town, 7441', '021 556 1603', NULL, NULL,
  'Millennium Foods is a food manufacturing company based in Killarney Gardens.',
  NULL, NULL,
  '["http://inkillarneygardens.co.za/listing/millennium-foods/", "https://www.brabys.com/za/western-cape/milnerton/killarney-gardens/food-manufacturers-distributors/millennium-foods-pty-ltd", "https://nearfinderza.com/business/western-cape/cape-town/millennium-foods-pty-ltd_591561+2.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'millennium-foods-killarney-gardens'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
