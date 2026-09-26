INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-montague-gardens-montague-gardens', 'PostNet Montague Gardens',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  (SELECT id FROM shopping_centers WHERE slug = 'john-montague-centre-montague-gardens'),
  'Shop 14, John Montague Centre, Montague Drive, Montague Gardens, Cape Town, 7441', '021 551 9275', NULL, NULL,
  'PostNet Montague Gardens is a courier, mailbox and printing services outlet, in John Montague Centre, Montague Gardens.',
  NULL, NULL,
  '["https://www.postnet.co.za/stores/montague-gardens", "https://www.tiendeo.co.za/stores/milnerton/postnet-shop-john-montague-centre-montague-drive-montague-gardens/26252"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-montague-gardens-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ces-forklift-montague-gardens', 'CES Forklift',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  '5-4th Road, Montague Gardens, Cape Town, 7441', '021 510 0466', NULL, NULL,
  'CES Forklift is the South African importer and distributor of LiuGong forklifts and material handling equipment, offering sales, rentals and servicing, in Montague Gardens.',
  NULL, NULL,
  '["https://cesforklift.co.za/", "https://vymaps.com/ZA/CES-Forklift-642697659174218/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ces-forklift-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'intellisec-montague-gardens', 'Intellisec',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  '19 Prosperity Park, Computer Road, Montague Gardens, Cape Town, 7441', '086 046 8377', NULL, NULL,
  'Intellisec supplies and installs CCTV, access control, fire detection and electric fencing systems, in Montague Gardens.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/962670/intellisec", "https://www.bestdirectory.co.za/intellisec-cape-town-installation-and-service-fire-and-security-in-montague-gardens-cape-town-western-cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'intellisec-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'fencing-security-installations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'monster-plumbing-montague-gardens', 'Monster Plumbing',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  'Unit 5, Gamib Park, 41 Stella Road, Montague Gardens, Cape Town, 7441', '0861 666 783', NULL, NULL,
  'Monster Plumbing is a plumbing services company operating from Montague Gardens.',
  NULL, NULL,
  '["https://monsterplumbing.co.za/contact/", "https://nearbyza.com/place/monster-plumbing"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'monster-plumbing-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'plumbers'),
  1
);
