-- Table View: 4 new businesses (Woodlands general search turned up nothing verifiable)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'de-abreu-cohen-attorneys-table-view', 'De Abreu & Cohen Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  'Unit 2, 42 Blaauwberg Road, Table View, Cape Town, 7441', '021 557 6578', 'https://deabreuandcohen.co.za', NULL,
  'De Abreu & Cohen Attorneys is a law firm in Table View offering conveyancing, commercial law, family law and general litigation services.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/de-abreu-cohen-attorneys", "https://zaf.soopage.com/company/DE-ABREU-COHEN-INC_4qn.html", "https://www.southafricanlawyer.co.za/law-firm/de-abreu-cohen/table-view/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'de-abreu-cohen-attorneys-table-view'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tah-animal-hospital-table-view', 'TAH The Animal Hospital and Vetshop Table View',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  '67 Blaauwberg Road, Table View, Cape Town, 7441', '021 557 1101', NULL, 'tableview@tah.co.za',
  'TAH The Animal Hospital and Vetshop Table View is a veterinary hospital and pet shop in Table View offering consultations, surgery and grooming.',
  NULL, NULL,
  '["https://savet.co.za/vet/tah-the-animal-hospital-and-vetshop-table-view", "https://za.polomap.com/cape-town/25460"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tah-animal-hospital-table-view'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vet-clin-table-view', 'Vet-Clin',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  '210 Blaauwberg Road, Table View, Cape Town, 7441', '021 557 8877', 'https://vetclin.co.za', 'vetclin@gonet.co.za',
  'Vet-Clin is a veterinary clinic and animal hospital in Table View offering walk-in consultations, vaccinations, surgery and pet food.',
  NULL, NULL,
  '["https://www.brabys.com/business/4993418/south-africa/western-cape/milnerton/table-view/blaauberg-rd/veterinary-clinics-hospitals/vet-clin", "https://2pos.co.za/53452/10118"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vet-clin-table-view'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'news-cafe-table-view', 'News Cafe Table View',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  '1 Beach Boulevard, Table View, Cape Town, 7439', '021 557 6336', 'https://www.newscafe.co.za/stores/south-africa/tableview/', 'tableview@newscafe.co.za',
  'News Cafe Table View is a high street cafe, cocktail bar and entertainment venue on the Table View beachfront serving breakfast, lunch and dinner.',
  NULL, NULL,
  '["https://www.newscafe.co.za/stores/south-africa/tableview/", "https://www.findmy.co.za/food/category-detail/News-Cafe-Table-View/22890"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'news-cafe-table-view'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
