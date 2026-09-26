INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zone-fitness-westgate-mall-westgate', 'Zone Fitness Westgate Mall',
  (SELECT id FROM suburbs WHERE slug = 'westgate'),
  (SELECT id FROM shopping_centers WHERE slug = 'westgate-mall-westgate'),
  'Westgate Mall, Corner Weltevreden Parkway & Morgenster Road, Westgate, Mitchells Plain, Cape Town, 7785', '021 815 9660', NULL, NULL,
  'Zone Fitness Westgate Mall is a gym in Westgate Mall, Mitchells Plain, Cape Town, with a cardio and weights section and an aerobics studio.',
  NULL, NULL,
  '["https://zonefitness.co.za/westgate/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1976690"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zone-fitness-westgate-mall-westgate'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
