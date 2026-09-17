INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rocotta-brick-centre-dalmada', 'Rocotta Brick Centre',
  (SELECT id FROM suburbs WHERE slug = 'dalmada'),
  'Plot 4, R71 Tzaneen Road, Dalmada, Polokwane, 0700', '015 263 6216', 'http://rocottabrick.co.za/', NULL,
  'Rocotta Brick Centre is a building materials supplier on the R71 Tzaneen Road at the Dalmada traffic circle, stocking stock bricks, face bricks, Maxis/Quantum bricks, blocks, pavers and cement, in Dalmada.',
  NULL, NULL,
  '["http://rocottabrick.co.za/", "https://www.polokwane.info/bricks/rocotta-brick-centre/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rocotta-brick-centre-dalmada'),
  (SELECT id FROM categories WHERE slug = 'building-materials-timber-merchants'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'eagles-nest-lodge-dalmada', 'Eagles Nest Lodge',
  (SELECT id FROM suburbs WHERE slug = 'dalmada'),
  'Plot 88, Dalmada, Polokwane, 0699', '015 263 6594', 'http://www.eaglesnestlodge.co.za', NULL,
  'Eagles Nest Lodge is a bushveld-style guest lodge in Dalmada offering furnished rooms and a self-catering unit with air-conditioning, Wi-Fi and tea/coffee facilities, for business and leisure stays.',
  NULL, NULL,
  '["https://www.ananzi.co.za/ads/za/limpopo/polokwane/dalmada/lodges/eagles-nest-lodge", "https://www.brabys.com/za/limpopo/polokwane/dalmada/lodges/eagles-nest-lodge"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'eagles-nest-lodge-dalmada'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
