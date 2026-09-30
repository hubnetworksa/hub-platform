INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'moove-motion-fitness-club-silverton-salieshoek', 'Moove Motion Fitness Club - Silverton',
  (SELECT id FROM suburbs WHERE slug = 'salieshoek'),
  '537 Pretoria Rd, Silverton, Pretoria, 0184', '010 595 2262', 'https://moovemfc.co.za/silverton/', NULL,
  'Moove Motion Fitness Club Silverton is a gym on Pretoria Road in Silverton offering group fitness classes plus strength and cardio equipment, and is one of the clubs in the Discovery Vitality wellness network of gyms.',
  NULL, NULL,
  '["https://moovemfc.co.za/silverton/", "https://za.africabz.com/gauteng/moove-motion-fitness-club-72452"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'moove-motion-fitness-club-silverton-salieshoek'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
