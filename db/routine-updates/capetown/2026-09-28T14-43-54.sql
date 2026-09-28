INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'auto-panel-repair-centre-ottery', 'Auto Panel Repair Centre',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  '9 Shawcamp Road, Ottery, Cape Town, 7800', '021 703 3117', NULL, NULL,
  'Auto Panel Repair Centre is a panelbeating and spray-painting workshop in Ottery, Cape Town.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/99187_2", "https://za.africabz.com/western-cape/auto-panel-repair-centre-110766"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'auto-panel-repair-centre-ottery'),
  (SELECT id FROM categories WHERE slug = 'panel-beaters-spray-painters'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ronwic-motors-panelbeaters-ottery', 'Ronwic Motors Panelbeaters',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  '22 Basil Crescent, Ottery East, Cape Town', '021 704 4475', 'https://www.ronwic.co.za/', NULL,
  'Ronwic Motors Panelbeaters is a factory-approved panelbeating and spray-painting workshop in Ottery, Cape Town.',
  NULL, NULL,
  '["https://www.ronwic.co.za/", "https://za.africabz.com/western-cape/ronwic-panelbeaters-130298"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ronwic-motors-panelbeaters-ottery'),
  (SELECT id FROM categories WHERE slug = 'panel-beaters-spray-painters'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kingdom-kidz-educare-academy-ottery', 'Kingdom Kidz Educare Academy',
  (SELECT id FROM suburbs WHERE slug = 'ottery'),
  '6 Topsham Road, Ottery East, Cape Town, 7800', '079 095 5569', NULL, NULL,
  'Kingdom Kidz Educare Academy is a daycare and educare centre for young children in Ottery, Cape Town.',
  NULL, NULL,
  '["https://www.holakids.co.za/centre/kingdom-kidz-educare-academy-daycarecreche-nursery-ottery/", "https://www.facebook.com/kingdomkidzeduacademy/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kingdom-kidz-educare-academy-ottery'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
