INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zone-fitness-tokai-tokai', 'Zone Fitness Tokai',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'blue-route-mall-tokai'),
  'Blue Route Mall, Tokai Road, Tokai, Cape Town', '021 493 3257', 'https://zonefitness.co.za/tokai/', NULL,
  'Zone Fitness Tokai is a branch of the 24-hour gym chain, in Blue Route Mall, Tokai.',
  NULL, NULL,
  '["https://blueroutemall.co.za/stores/pick/zone-fitness/", "https://zonefitness.co.za/tokai/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zone-fitness-tokai-tokai'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
