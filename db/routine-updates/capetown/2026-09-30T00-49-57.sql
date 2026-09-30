-- Job 1/2: Harfield Village suburb research (2 new businesses)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'twigs-nursery-coffee-shop-harfield-village', 'Twigs Nursery & Coffee Shop',
  (SELECT id FROM suburbs WHERE slug = 'harfield-village'),
  'Second Avenue, Harfield Village, Cape Town, 7708', '021 674 1193', NULL, NULL,
  'Twigs Nursery & Coffee Shop is a garden nursery with an attached coffee shop on Second Avenue, in Harfield Village.',
  NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/twigs-nursery/", "https://www.eatout.co.za/venue/twigs-nursery/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'twigs-nursery-coffee-shop-harfield-village'),
  (SELECT id FROM categories WHERE slug = 'nurseries-garden-centres'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'oblivion-bar-kitchen-harfield-village', 'Oblivion Bar & Kitchen',
  (SELECT id FROM suburbs WHERE slug = 'harfield-village'),
  '22 Chichester Road, Corner 3rd Avenue and Chichester Road, Harfield Village, Cape Town, 7708', '064 983 4045', 'https://www.oblivion.co.za/', NULL,
  'Oblivion Bar & Kitchen is a wine bar and restaurant on Chichester Road, in Harfield Village.',
  NULL, NULL,
  '["https://harfield-village.co.za/business/oblivion-bar-kitchen/", "https://www.oblivion.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'oblivion-bar-kitchen-harfield-village'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
