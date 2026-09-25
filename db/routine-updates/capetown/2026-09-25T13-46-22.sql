-- Jobs 1-2: suburb research for beacon-valley, belhar, bishop-lavis

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bassier-medical-belhar', 'Bassier Medical',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  (SELECT id FROM shopping_centers WHERE slug = 'erica-square-belhar'),
  'Unit 4b, Erica Square, Erica Drive, Belhar, Cape Town, 7493', '021 952 0133', NULL, NULL,
  'Bassier Medical is a family medicine general practice with consulting rooms in Erica Square, Belhar.',
  NULL, NULL,
  '["https://bassiermedical.co.za/erica-square-rooms/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=406072"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bassier-medical-belhar'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lavis-hardware-bishop-lavis', 'Lavis Hardware',
  (SELECT id FROM suburbs WHERE slug = 'bishop-lavis'),
  (SELECT id FROM shopping_centers WHERE slug = 'shoprite-wing-bishop-lavis'),
  'Shop 6, Shoprite Wing, Lavis Drive, Bishop Lavis, Cape Town, 7490', '021 934 0714', NULL, NULL,
  'Lavis Hardware is a hardware and building materials store in the Shoprite Wing centre, Bishop Lavis.',
  NULL, NULL,
  '["https://za.polomap.com/cape-town/44860", "https://www.thinklocal.co.za/biz/lavis-hardware-bishop-lavis"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lavis-hardware-bishop-lavis'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-bishop-lavis', 'PEP',
  (SELECT id FROM suburbs WHERE slug = 'bishop-lavis'),
  'Shops 13-15, The Business Centre, League Road, Bishop Lavis, Cape Town, 7490', '021 927 1075', NULL, NULL,
  'PEP Bishop Lavis is a clothing and general merchandise store in The Business Centre on League Road, Bishop Lavis.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop--the-business-centre-league-road-bishop-lavis-cape-town-western-cape/12332", "https://my-catalogue.co.za/stores/cape-town/pep-stores/the-bussness-centre-league-road-bishop-lavis"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-bishop-lavis'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
