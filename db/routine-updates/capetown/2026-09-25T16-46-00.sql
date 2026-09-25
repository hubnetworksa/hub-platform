INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ak-knit-elsies-river', 'AK Knit',
  (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  '9 Consani Road, Elsies River, Cape Town, 7490', '021 591 6536', 'https://akknit.co.za', NULL,
  'AK Knit is a knitwear and textile factory shop in Elsies River, selling fabric, jerseys and baby wear including cotton, fleece and interlock materials directly to the public.',
  NULL, NULL,
  '["https://www.factoryshopssa.co.za/directory/ak-knit/", "https://www.yep.co.za/biz/store/a-k-knit/17071"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ak-knit-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'buco-hardware-elsies-river', 'BUCO Hardware',
  (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  '314 Voortrekker Road, Elsies River Industrial, Cape Town, 7480', '021 592 4119', NULL, NULL,
  'BUCO Hardware is a hardware and building materials store in Elsies River Industrial, part of the national BUCO buildware chain.',
  NULL, NULL,
  '["https://textmap.co.za/3/26880", "https://2pos.co.za/2/17920"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'buco-hardware-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'economical-moslem-butchery-elsies-river', 'Economical Moslem Butchery',
  (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  '38 Halt Road, Elsies River, Cape Town, 7490', '021 592 2811', NULL, NULL,
  'Economical Moslem Butchery is a halal butchery on Halt Road in Elsies River.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/10611298_2", "https://cape-town.infoisinfo.co.za/card/economical-moslem-butchery/249178"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'economical-moslem-butchery-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);
