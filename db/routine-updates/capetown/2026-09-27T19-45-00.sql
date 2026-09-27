INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'edgemead-motors-edgemead', 'Edgemead Motors',
  (SELECT id FROM suburbs WHERE slug = 'edgemead'),
  '7 Edgemead Drive, Edgemead, Cape Town, 7441', '021 559 3450', NULL, NULL,
  'Edgemead Motors is an Engen fuel station and convenience centre on Edgemead Drive in Edgemead.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/engen-edgemead-motors-convenience-centre-83982", "https://capetown.yalwa.co.za/ID_106874452/EDGEMEAD-MOTORS-Service-Station-7-EDGEMEAD-DRIVE.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'edgemead-motors-edgemead'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'impressions-hair-design-edgemead', 'Impressions Hair Design',
  (SELECT id FROM suburbs WHERE slug = 'edgemead'),
  (SELECT id FROM shopping_centers WHERE slug = 'edgemead-shopping-centre-edgemead'),
  'Edgemead Shopping Centre, Louis Thibault Drive, Edgemead, Cape Town, 7441', '021 558 1535', NULL, NULL,
  'Impressions Hair Design is a hair salon in Edgemead Shopping Centre, Edgemead.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/impressions-hair-design-louis-thibault-drive-cape-town-gn38LW", "https://za.africabz.com/western-cape/impressions-hair-design-190584"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'impressions-hair-design-edgemead'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'harcourts-maynard-burgoyne-edgemead-edgemead', 'Harcourts Maynard Burgoyne Edgemead',
  (SELECT id FROM suburbs WHERE slug = 'edgemead'),
  '5 Letchworth Mews, Letchworth Drive, Edgemead, Cape Town, 7441', '021 558 0000', NULL, NULL,
  'Harcourts Maynard Burgoyne Edgemead is an estate agency branch on Letchworth Drive in Edgemead.',
  NULL, NULL,
  '["https://www.harcourts.co.za/branches/harcourts-maynard-burgoyne-edgemead/36/", "https://www.privateproperty.co.za/estate-agency/harcourts-maynard-burgoyne-edgemead/8997"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'harcourts-maynard-burgoyne-edgemead-edgemead'),
  (SELECT id FROM categories WHERE slug = 'estate-agents'),
  1
);
