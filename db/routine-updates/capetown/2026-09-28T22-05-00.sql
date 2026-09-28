INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'boxer-dunoon', 'Boxer Dunoon',
  (SELECT id FROM suburbs WHERE slug = 'dunoon'),
  'Cnr Potsdam Road (M5) & Winning Way, Dunoon, Cape Town, 7441', '072 795 6916', NULL, NULL,
  'Boxer Dunoon is a discount supermarket at the corner of Potsdam Road and Winning Way, in Dunoon.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/dunoon/boxer/corner-of-potsdam-road-m5-winning-way", "https://promotheus.co.za/dunoon/boxer/corner-of-potsdam-road-m5-winning-way"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'boxer-dunoon'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
