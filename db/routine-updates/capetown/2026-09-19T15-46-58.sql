INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ok-minimark-eversdal', 'OK Minimark Eversdal',
  (SELECT id FROM suburbs WHERE slug = 'eversdal'),
  '12 Sondal Road, Eversdal, Cape Town, 7530', '074 143 6253', NULL, NULL,
  'OK Minimark Eversdal is a neighbourhood convenience store in Eversdal.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/ok-minimark-eversdal-16899", "https://nearbyza.com/place/ok-minimark-eversdal"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ok-minimark-eversdal'),
  (SELECT id FROM categories WHERE slug = 'convenience-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'eversdal-dental-eversdal', 'Eversdal Dental',
  (SELECT id FROM suburbs WHERE slug = 'eversdal'),
  '51 Chantecler Avenue, Eversdal, Cape Town, 7550', '021 300 5162', 'https://www.eversdaldental.co.za', NULL,
  'Eversdal Dental is a general and aesthetic dental practice in Eversdal.',
  NULL, NULL,
  '["https://www.eversdaldental.co.za/", "https://www.facebook.com/p/Eversdal-Dental-100095530265864/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'eversdal-dental-eversdal'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);
