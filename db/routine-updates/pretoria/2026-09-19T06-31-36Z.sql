INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ergo-designer-kitchens-cabinetry-koedoespoort', 'Ergo Designer Kitchens & Cabinetry',
  (SELECT id FROM suburbs WHERE slug = 'koedoespoort'),
  'Unit 11, 49 Eland Street, Koedoespoort Industrial, Pretoria, 0186', '072 204 4837', 'https://www.ergodesigns.co.za', NULL,
  'Ergo Designer Kitchens & Cabinetry is a kitchen and cabinetry design and manufacturing studio in Koedoespoort, Pretoria.',
  NULL, NULL,
  '["https://www.ksa.co.za/members/detail/ergo-designer-kitchens", "https://www.tuugo.co.za/Companies/ergo-designer-kitchens/0260003600189"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ergo-designer-kitchens-cabinetry-koedoespoort'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dela-plast-koedoespoort', 'Dela Plast',
  (SELECT id FROM suburbs WHERE slug = 'koedoespoort'),
  '33 Eland Street, Koedoespoort Industrial, Pretoria, 0186', '012 391 7002', 'https://delaplast.co.za', NULL,
  'Dela Plast is a family-owned plastic injection moulding manufacturer in Koedoespoort, Pretoria, producing products for the food packaging, agricultural, security, warehousing and engineering industries.',
  NULL, NULL,
  '["https://delaplast.co.za/", "https://www.sayellow.com/view/south-africa/delaplast-plastic-injection-moulding-factory-in-pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dela-plast-koedoespoort'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lesira-manufacturing-koedoespoort', 'Lesira Manufacturing (Pty) Ltd',
  (SELECT id FROM suburbs WHERE slug = 'koedoespoort'),
  '34 Gemsbok Street, Koedoespoort, Pretoria, 0186', '012 333 3707', 'https://lesira.co.za', NULL,
  'Lesira Manufacturing (trading as Lesira-Teq) is an original equipment manufacturer in Koedoespoort, Pretoria, designing and manufacturing smart water meters.',
  NULL, NULL,
  '["https://lesira.co.za/", "https://www.yep.co.za/biz/store/iyp/17209462_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lesira-manufacturing-koedoespoort'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'transnet-engineering-koedoespoort', 'Transnet Engineering',
  (SELECT id FROM suburbs WHERE slug = 'koedoespoort'),
  'Corner of Lynette Street and Koedoespoort Road, Koedoespoort, Pretoria, 0186', '012 842 6010', 'https://www.transnetengineering.net', NULL,
  'Transnet Engineering is a rail rolling-stock manufacturing and maintenance facility in Koedoespoort, Pretoria.',
  NULL, NULL,
  '["https://www.transnetengineering.net/contact-us/koedoespoort", "https://www.waze.com/live-map/directions/transnet-engineering-koedoespoort-lynette-st-koedoespoort,-pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'transnet-engineering-koedoespoort'),
  (SELECT id FROM categories WHERE slug = 'engineering-surveying'),
  1
);
