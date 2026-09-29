INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'la-vida-beautyful-meyerspark', 'La Vida Beautyful',
  (SELECT id FROM suburbs WHERE slug = 'meyerspark'),
  '236 Roos Street, Meyerspark, Pretoria, 0184', '+27 82 928 2353', NULL, NULL,
  'La Vida Beautyful is a slimming and health and beauty clinic in Meyerspark offering laser slimming treatments, slimming injections, faradic body sculpting, far-infrared sauna sessions, massages, facials, waxing, tinting and nail services, and it also retails skincare products.',
  NULL, NULL,
  '["https://www.beautynailhairsalons.com/ZA/Pretoria/1553555574875602/La-Vida-Beautyful--slimming---health-and-beauty-clinic", "https://fresha.com/lp/en/bt/spas/in/za-pretoria/meyerspark"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'la-vida-beautyful-meyerspark'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'meljoux-accounting-meyerspark', 'Meljoux Accounting',
  (SELECT id FROM suburbs WHERE slug = 'meyerspark'),
  '298 Poligoon Street, Meyerspark, Pretoria, Gauteng, 0184', '+27 72 127 9339', NULL, NULL,
  'Meljoux Accounting is a Pretoria-based accounting practice in Meyerspark offering bookkeeping, financial statement preparation, tax returns and small-business accounting services to companies, sole proprietorships, trusts, and non-profit organisations such as schools, religious bodies and sports clubs.',
  NULL, NULL,
  '["https://www.bizcommunity.com/Company/MeljouxAccounting", "https://www.procompare.co.za/providers/meljoux-accounting"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'meljoux-accounting-meyerspark'),
  (SELECT id FROM categories WHERE slug = 'accountants'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'constantia-guest-lodge-meyerspark', 'Constantia Guest Lodge',
  (SELECT id FROM suburbs WHERE slug = 'meyerspark'),
  '133 Emmarentia Street, Meyerspark, Pretoria, 0184', '+27 73 226 4754', 'https://www.constantialodge.co.za', NULL,
  'Constantia Guest Lodge is a wine-farm-themed guest house in Meyerspark with seven Cape Dutch-styled en-suite rooms each named after a wine varietal, an outdoor pool, free WiFi, complimentary breakfast and a veranda seating area, catering to business travellers and tourists.',
  NULL, NULL,
  '["https://www.constantialodge.co.za", "https://www.sa-venues.com/visit/constantiaguestlodge/map.php"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'constantia-guest-lodge-meyerspark'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
