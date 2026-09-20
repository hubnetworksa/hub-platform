-- Killarney Gardens: 4 new businesses (jobs 1-2), no shopping centre in this suburb
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'belting-edge-killarney-gardens', 'Belting Edge',
  (SELECT id FROM suburbs WHERE slug = 'killarney-gardens'),
  '14 Lauda Road, Killarney Gardens, Cape Town, 7440', '021 557 0129', NULL, NULL,
  'Belting Edge is a conveyor belt supplier and manufacturer of transmission and plastic modular belting, in Killarney Gardens.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/1226035544018944", "https://www.brabys.com/business/4815476/south-africa/western-cape/milnerton/killarney-gardens/lauda-rd/belting-transmission-conveyor/belting-edge-pty-ltd"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'belting-edge-killarney-gardens'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rhog-engineering-killarney-gardens', 'RHOG Engineering',
  (SELECT id FROM suburbs WHERE slug = 'killarney-gardens'),
  'Unit 9, 11 Donnington Rd, Killarney Gardens, 7441', '078 388 0190', NULL, NULL,
  'RHOG Engineering is a machining and engineering workshop servicing and maintaining factory machinery and equipment, in Killarney Gardens.',
  NULL, NULL,
  '["https://rhogengineering.wordpress.com/", "https://www.biznizdirectory.co.za/businesses-in-western-cape/cape-town/killarney-gardens.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rhog-engineering-killarney-gardens'),
  (SELECT id FROM categories WHERE slug = 'engineering-surveying'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wilcote-cape-town-killarney-gardens', 'Wilcote Cape Town',
  (SELECT id FROM suburbs WHERE slug = 'killarney-gardens'),
  'Unit 3, Gilead Park, 94 Killarney Avenue, Killarney Gardens, Cape Town, 7441', '072 617 2731', NULL, NULL,
  'Wilcote Cape Town is a waterproofing, roofing and painting contractor, in Killarney Gardens.',
  NULL, NULL,
  '["https://wilcotecapetown.co.za/contact/", "https://www.snupit.co.za/milnerton/killarney-gardens/wilcote-cape-town/548665"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wilcote-cape-town-killarney-gardens'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-cheap-transport-killarney-gardens', 'Mr Cheap Transport',
  (SELECT id FROM suburbs WHERE slug = 'killarney-gardens'),
  '41B Mansell Road, Killarney Gardens, Cape Town, 7441', '021 592 5970', NULL, NULL,
  'Mr Cheap Transport is a furniture removals and transport company, in Killarney Gardens.',
  NULL, NULL,
  '["https://mrcheaptransport.co.za/about/", "https://za.africabz.com/western-cape/mr-cheap-transport-166346"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mr-cheap-transport-killarney-gardens'),
  (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'),
  1
);
