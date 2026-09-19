INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'boston-coffee-boston', 'Boston Coffee',
  (SELECT id FROM suburbs WHERE slug = 'boston'),
  'Corner Cleveland Street & 12th Avenue, Boston, Bellville, Cape Town, 7530', '066 374 2420', 'https://www.bostoncoffee.co.za', NULL,
  'Boston Coffee is a freshly-roasted coffee cafe and roastery in Boston, Bellville.',
  NULL, NULL,
  '["https://www.bostoncoffee.co.za/location/", "https://nearbyza.com/place/boston-coffee"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'boston-coffee-boston'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
