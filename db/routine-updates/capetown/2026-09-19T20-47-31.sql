INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'brooklyn-junction-brooklyn', 'Brooklyn Junction',
  (SELECT id FROM suburbs WHERE slug = 'brooklyn'),
  '1 Koeberg Road, Brooklyn, Cape Town, 7405', NULL, NULL,
  '["https://mapcarta.com/W1304606641", "https://clicks.co.za/store/Brooklyn-Junction/2183"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ok-minimark-brooklyn-junction-brooklyn', 'OK MiniMark Brooklyn Junction',
  (SELECT id FROM suburbs WHERE slug = 'brooklyn'),
  (SELECT id FROM shopping_centers WHERE slug = 'brooklyn-junction-brooklyn'),
  '1 Koeberg Road, Brooklyn Junction, Brooklyn, Cape Town, 7405', '021 100 6061', 'https://www.okfoods.co.za', NULL,
  'OK MiniMark Brooklyn Junction is a convenience store and grocery shop in Brooklyn Junction, Brooklyn.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/ok-minimark-brooklyn-junction-444315", "https://www.cybo.com/ZA-biz/ok-minimark-brooklyn-junction"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ok-minimark-brooklyn-junction-brooklyn'),
  (SELECT id FROM categories WHERE slug = 'convenience-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'formula-1-fitment-centre-brooklyn', 'Formula 1 Fitment Centre',
  (SELECT id FROM suburbs WHERE slug = 'brooklyn'),
  '229 Koeberg Road, Brooklyn, Cape Town', '021 511 1333', NULL, NULL,
  'Formula 1 Fitment Centre is a tyre, battery and exhaust fitment centre in Brooklyn, Cape Town.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/formula-1-fitment-centre-milnerton", "https://www.findglocal.com/ZA/Cape-Town/1566435113609683/Formula-1-Fitment-Centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'formula-1-fitment-centre-brooklyn'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);
