INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zone-fitness-willowbridge-bellville', 'Zone Fitness Willowbridge',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  (SELECT id FROM shopping_centers WHERE slug = 'willowbridge-shopping-centre-bellville'),
  'Willowbridge Shopping Centre, 39 Carl Cronje Drive, Bellville, 7530', '021 914 4433', NULL, NULL,
  'Zone Fitness Willowbridge is a gym with a free weights area and group classes, in Willowbridge Shopping Centre, Bellville.',
  NULL, NULL,
  '["https://www.willowbridge.co.za/zone-fitness/", "https://www.igym.co.za/zone-fitness-willowbridge/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zone-fitness-willowbridge-bellville'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
