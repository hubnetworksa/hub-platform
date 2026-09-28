INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'protea-chemicals-killarney-gardens', 'Protea Chemicals',
  (SELECT id FROM suburbs WHERE slug = 'killarney-gardens'),
  '54 Killarney Avenue, Killarney Gardens, Cape Town, 7441', '021 550 8100', 'https://www.proteachemicals.co.za', 'info@proteachemicals.co.za',
  'Protea Chemicals is a distributor and manufacturer of speciality and functional chemicals, in Killarney Gardens.',
  NULL, NULL,
  '["https://www.proteachemicals.co.za/contact-us/contact-details", "https://www.cybo.com/ZA-biz/protea-chemicals-pty-ltd_1g"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'protea-chemicals-killarney-gardens'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'all-road-tyres-killarney-gardens', 'All Road Tyres',
  (SELECT id FROM suburbs WHERE slug = 'killarney-gardens'),
  '55 Killarney Avenue, Killarney Gardens, Cape Town, 7441', '021 556 0001', NULL, NULL,
  'All Road Tyres is a tyre supplier and retreader based in Killarney Gardens.',
  NULL, NULL,
  '["https://africa.michelin.com/en/auto/dealer-locator/cape-town/all-road-tyres-1148125078", "https://www.brabys.com/za/western-cape/milnerton/killarney-gardens/tyre-dealers/allroad-tyres"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'all-road-tyres-killarney-gardens'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'morris-material-handling-killarney-gardens', 'Morris Material Handling (Crane Aid)',
  (SELECT id FROM suburbs WHERE slug = 'killarney-gardens'),
  'Unit 5, Kyalami Plaza 2, 36b Silverstone Street, Killarney Gardens, Cape Town', '021 556 4102', NULL, 'CraneAid-WC@morris.co.za',
  'Morris Material Handling (Crane Aid) provides crane maintenance, servicing, modernisation and spare parts, in Killarney Gardens.',
  NULL, NULL,
  '["https://morris.africa/branches/", "https://www.sayellow.com/view/south-africa/crane-aid-cape-town-in-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'morris-material-handling-killarney-gardens'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
