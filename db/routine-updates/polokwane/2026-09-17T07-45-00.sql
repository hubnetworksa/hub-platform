INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rgr-services-ladanna', 'RGR Services',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '135 Blaauwberg Street, Ladanna, Polokwane, 0699', '015 297 6711', NULL, NULL,
  'RGR Services is a construction equipment, welding and plant services supplier in Ladanna, trading under the Babcock brand.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/1339312838463488", "https://www.sayellow.com/view/south-africa/rgr-services-in-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rgr-services-ladanna'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bosveld-scrap-metal-ladanna', 'Bosveld Scrap Metal',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '23 Staal Street, Ladanna, Polokwane, 0699', '015 297 4745', NULL, NULL,
  'Bosveld Scrap Metal is a scrap metal merchant in Ladanna, buying and processing scrap metal.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/12866588_2", "https://www.brabys.com/za/limpopo/polokwane/ladine/scrap-metal-merchants/bosveld-scrap-metal", "https://www.facebook.com/LimpopoLEDET/posts/today-bosveld-scrap-metal-in-ladanna-polokwane-is-hosting-our-joint-operation-wi/925392476289186/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bosveld-scrap-metal-ladanna'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'reclam-polokwane-ladanna', 'Reclam Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '24B Chroom Street, Ladanna, Polokwane', '015 293 1575', NULL, NULL,
  'Reclam Polokwane is the local branch of the national Reclam scrap metal recycling network, in Ladanna.',
  NULL, NULL,
  '["https://mra.co.za/member-locator/listing/reclam-polokwane/", "https://www.sayellow.com/view/south-africa/reclam-polokwane-in-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'reclam-polokwane-ladanna'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'polokwane-scrap-metals-ladanna', 'Polokwane Scrap Metals',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '105 River Street, Ladanna, Polokwane, 0699', '015 293 0975', NULL, NULL,
  'Polokwane Scrap Metals is a scrap metal dealer in Ladanna, buying and processing scrap metal.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/10211711_3", "https://www.brabys.com/za/limpopo/polokwane/ladine/scrap-metals/polokwane-scrap-metals"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'polokwane-scrap-metals-ladanna'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kalahari-slaghuis-ladanna', 'Kalahari Slaghuis',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  (SELECT id FROM shopping_centers WHERE slug = 'tropicana-centre-ladanna'),
  '21 Witklip Street, Tropicana Centre, Ladanna, Polokwane, 0699', '015 293 1199', NULL, NULL,
  'Kalahari Slaghuis is a butchery in Tropicana Centre, Ladanna.',
  NULL, NULL,
  '["https://www.worldofmeats.co.za/view/kalahari-slaghuis", "https://www.thinklocal.co.za/biz/kalahari-slaghuis-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kalahari-slaghuis-ladanna'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);
